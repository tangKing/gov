package com.cg;

import static org.jboss.netty.handler.codec.http.HttpHeaders.Names.CONTENT_TYPE;
import static org.jboss.netty.handler.codec.http.HttpResponseStatus.BAD_REQUEST;
import static org.jboss.netty.handler.codec.http.HttpResponseStatus.INTERNAL_SERVER_ERROR;
import static org.jboss.netty.handler.codec.http.HttpResponseStatus.OK;
import static org.jboss.netty.handler.codec.http.HttpVersion.HTTP_1_1;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.channels.ClosedChannelException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.ChannelBuffers;
import org.jboss.netty.buffer.DynamicChannelBuffer;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelFuture;
import org.jboss.netty.channel.ChannelFutureListener;
import org.jboss.netty.channel.ChannelHandlerContext;
import org.jboss.netty.channel.ExceptionEvent;
import org.jboss.netty.channel.MessageEvent;
import org.jboss.netty.channel.SimpleChannelUpstreamHandler;
import org.jboss.netty.handler.codec.frame.TooLongFrameException;
import org.jboss.netty.handler.codec.http.DefaultHttpResponse;
import org.jboss.netty.handler.codec.http.HttpMethod;
import org.jboss.netty.handler.codec.http.HttpRequest;
import org.jboss.netty.handler.codec.http.HttpResponse;
import org.jboss.netty.handler.codec.http.HttpResponseStatus;
import org.jboss.netty.util.CharsetUtil;

import com.service.LoginServiceImpl;
import com.util.KeyUtil;
import com.zank.zcf.command.McfConst;
import com.zank.zcf.handler.MonitorHandler;
import com.zank.zcf.monitor.ZMonitor;
import com.zank.zcf.server.AbstractNettyServer;
import com.zank.zcf.util.JsonUtils;
import com.zank.zcf.util.LogUtils;
import com.zank.zcf.util.ParamUtils;
import com.zank.zcf.util.StringUtils;

/**
 * @author tangyong
 */
public class HttpServerCg extends AbstractNettyServer {

    private static final Logger LOG = Logger.getLogger(HttpServerCg.class);
	private ICommandExecutorCg commandExecutor;
	private  LoginServiceImpl loginService = new LoginServiceImpl();

    public HttpServerCg(String host, int port, ICommandExecutorCg commandExecutor) {
        super(host, port);
        this.commandExecutor = commandExecutor;
        commandExecutor.registerHandler("monitor", new MonitorHandlerCg());
        this.addChannelHandler(new HttpCommandCgHandler());

        try {
            ZMonitor.start();
        } catch (Throwable e) {
            LogUtils.error(LOG, "zmonitor start error");
        }
    }

    public HttpServerCg(int port, ICommandExecutorCg commandExecutor) {
		super(port);
		this.commandExecutor = commandExecutor;
        commandExecutor.registerHandler("monitor", new MonitorHandlerCg());
		this.addChannelHandler(new HttpCommandCgHandler());

        try {
            ZMonitor.start();
        } catch (Throwable e) {
            LogUtils.error(LOG, "zmonitor start error");
        }
    }
	
	private class HttpCommandCgHandler extends SimpleChannelUpstreamHandler {
		
		protected CommandCg doGet(HttpRequest request, ChannelBuffer output) {
			String uri = request.getUri(); // abc.com/admin/print?name=tangyong&age=1 -> uri: /print?name=tangyong&age=1
            try {
                uri = URLDecoder.decode(uri, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            int indexOf = uri.indexOf("?");
			if (indexOf == -1) {
				indexOf = uri.length();
			}

			String actionParams[] = uri.substring(1, indexOf).split("/");
			String action = actionParams[actionParams.length - 1];
			if ("favicon.ico".equalsIgnoreCase(action)) {
				return null;
			}
			
			Map<String, String> params = null;
			if (indexOf == uri.length()) {
				params = new HashMap<String, String>();
			} else {
				params = ParamUtils.extractParams(uri);
			}
			
			CommandCg cmd = new CommandCg();
			cmd.setAction(action);
			cmd.setSource(params.remove(McfConst.PARAM_CMD_SOURCE));
			cmd.setThread(params.remove(McfConst.PARAM_CMD_THREAD));
			cmd.setParams(params);
			return cmd;
		}
		
		protected CommandCg doPost(HttpRequest request, ChannelBuffer output) {
			String content = new String(request.getContent().array());
//            try {
//                cmd = JsonUtils.toT(content, CommandCg.class);
//            } catch (Exception e) {
//
//            }

//            if (cmd == null) {
                request.setUri(request.getUri() + "&" + content);
                return doGet(request, output);
//				write(output, "parse json to CommandCg error: " + content);
//			}
//			return cmd;
		}
		
		@Override
		public void messageReceived(ChannelHandlerContext ctx, MessageEvent e) throws Exception {
            long start = System.currentTimeMillis();

			HttpRequest request = (HttpRequest) e.getMessage();
			ChannelBuffer output = new DynamicChannelBuffer(2048);
			
			Channel chanel = e.getChannel();

            try {
				CommandCg cmd = null;
				if (HttpMethod.GET.equals(request.getMethod())) {
					cmd = doGet(request, output);
				} else if (HttpMethod.POST.equals(request.getMethod())) {
					cmd = doPost(request, output);
				}

                HttpResponseStatus status = HttpResponseStatus.OK;
            	
            	 if (cmd != null) {
					String  token = cmd.getStringParam("token");
					String  callback = cmd.getStringParam("callback");
					boolean isLogin=true;//loginService.isLogin(token);
					String method=cmd.getMethod();
					System.out.println("isLogin-----token："+token+",isLogin:"+isLogin+",method:"+method);
					if(!method.equals("login")&!method.equals("regdit")&&!isLogin){//未登陆了
						String callbackResult=callback + "({\"code\":"+KeyUtil.CODE_NOT_LOGIN+"});";
						write(output,callbackResult);
					}else{
						ResponseCg resp = null;
						if (!"true".equalsIgnoreCase(cmd.getStringParam(McfConst.PARAM_COMMAND_ASYNC))) { //sync (default)
							resp = commandExecutor.executeWithResponse(cmd);
						} else { // async
							boolean success = commandExecutor.execute(cmd);
							resp = new ResponseCg().addValue(McfConst.PARAM_SUCCESS, success);
						}
						if(callback!=null){
							 String callbackResult=callback + "("+ JsonUtils.toJSON(resp.getResponse())+");";
							write(output,callbackResult);
						}else{
							write(output, JsonUtils.toJSON(resp.getResponse()));
						}
	                    if (!MonitorHandler.flag.get() && StringUtils.equalsIgnoreCase("monitor", cmd.getAction())) {
	                        status = HttpResponseStatus.NOT_FOUND;
	                    }
					}
				}

                handleResponse(chanel, output, status);

                if (cmd != null) {
                    ZMonitor.recordOne(cmd.getAction() + "_" + cmd.getMethod(), System.currentTimeMillis() - start);
                }
			} catch (Exception e2) {
			    LOG.error("httpserver process error",e2);
                write(output, "httpserver process error " + ArrayUtils.toString(e2.getStackTrace()));
				handleResponse(chanel, output, HttpResponseStatus.INTERNAL_SERVER_ERROR);
                ZMonitor.recordOne("Exception", System.currentTimeMillis() - start);
			} finally {
				//TODO: should close or not?
//				chanel.disconnect();
//				chanel.close();
			}

		}
		
		private void write(ChannelBuffer output, String message) {
			output.writeBytes(message.getBytes());
		}
		
		private void handleResponse(Channel chanel, ChannelBuffer output, HttpResponseStatus status) throws Exception {
			HttpResponse response = new DefaultHttpResponse(HTTP_1_1, OK);
			response.setContent(output);
//			response.setHeader("Content-Type", "text/plain; charset=gbk");
			response.setHeader("Content-Type", "text/plain; charset=UTF-8");
			response.setHeader("Content-Length", response.getContent().writerIndex());
            response.setStatus(status);
            if (chanel.isConnected()) {
                ChannelFuture future = chanel.write(response);
                future.addListener(ChannelFutureListener.CLOSE);
            }

		}

		@Override
		public void exceptionCaught(ChannelHandlerContext ctx, ExceptionEvent e) throws Exception {
			Channel channel = e.getChannel();
			Throwable cause = e.getCause();

            if (cause instanceof TooLongFrameException) {
                sendError(ctx, BAD_REQUEST);
                return;
            }

            if (channel.isConnected()) {
                sendError(ctx, INTERNAL_SERVER_ERROR);
//				channel.close();
            }


            if ((cause instanceof ClosedChannelException)) {
                return;
            }

            if (StringUtils.equalsIgnoreCase("Connection reset by peer", cause.getMessage())) {
                return;
            }

            if (StringUtils.equalsIgnoreCase("Broken pipe", cause.getMessage())) {
                return;
            }

            cause.printStackTrace();
        }

		private void sendError(ChannelHandlerContext ctx, HttpResponseStatus status) throws Exception {
			HttpResponse response = new DefaultHttpResponse(HTTP_1_1, status);
			response.setHeader(CONTENT_TYPE, "text/plain; charset=UTF-8");
			response.setContent(ChannelBuffers.copiedBuffer("Failure: " + status.toString() + "\r\n", CharsetUtil.UTF_8));

            if (ctx.getChannel().isConnected()) {
                try {
                    // Close the connection as soon as the error message is sent.
                    ctx.getChannel().write(response).addListener(ChannelFutureListener.CLOSE);
                } catch (Exception e) {
                    if (e instanceof ClosedChannelException) {
                        //IGNOR
                    } else {
                        throw e;
                    }
                }

            }
		}

    }
}
