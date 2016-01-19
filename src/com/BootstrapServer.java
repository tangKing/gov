package com;

import org.apache.log4j.Logger;

import com.cg.HttpServerCg;
import com.cg.SimpleCommandExecutorCg;
import com.handler.DepartmentHandler;
import com.handler.DubanCreateHandler;
import com.handler.DubanHandler;
import com.handler.LoginHandler;
import com.handler.ParamHandler;
import com.handler.TestHandler;
import com.handler.UserHandler;
import com.handler.ZhengfuHandler;

/**
 * BootstrapServer
 */
public class BootstrapServer {
	private static Logger logger = Logger.getLogger(BootstrapServer.class);
	private static ServerConfig config = ServerConfig.getServerConfig();

	private static BootstrapServer instance=BootstrapServer.getInstance();;
	private BootstrapServer() {
	}

	public static BootstrapServer getInstance() {
		if (instance == null) {
			instance = new BootstrapServer();
		}
		return instance;
	}
	public static void main(String[] args) throws Exception {
		startHttp();
	}
	public static void startHttp(){
		SimpleCommandExecutorCg httpExecutor = new SimpleCommandExecutorCg();
		// 注册handler
		httpExecutor.registerRegexHandler("test", new TestHandler());
		httpExecutor.registerRegexHandler("login", new LoginHandler());
		httpExecutor.registerRegexHandler("user", new UserHandler());
		httpExecutor.registerRegexHandler("dept", new DepartmentHandler());
		httpExecutor.registerRegexHandler("param", new ParamHandler());
		httpExecutor.registerRegexHandler("duban", new DubanHandler());
		httpExecutor.registerRegexHandler("zhengfu", new ZhengfuHandler());
		httpExecutor.registerRegexHandler("dbcreate", new DubanCreateHandler());

		// 启动一个HTTP服务器，默认是netty
//		try{
//		new HttpServer( config.getHttpServerPort(), httpExecutor).stop();
//		}catch(Exception ex){}
		new HttpServerCg( config.getHttpServerHost(),config.getHttpServerPort(), httpExecutor).start();
		System.out.println("service started!!!");
	}
	// 添加：http://127.0.0.1:7081/test?m=add&id=1
	// 删除：http://127.0.0.1:7081/test?m=del&id=1
	// 修改：http://127.0.0.1:7081/test?m=update&id=1&newId=2
	// 查询单条：http://127.0.0.1:7081/test?m=getOne&id=1
	// 查询多条：http://127.0.0.1:7081/test?m=queryAll&id=1&page=1
}
