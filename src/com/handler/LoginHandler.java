package com.handler;

import java.util.Map;

import org.apache.log4j.Logger;

import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.service.LoginServiceImpl;
import com.service.RedisServiceImpl;
import com.util.KeyUtil;
import com.util.ToolUtil;

/**
 * 登陆
 * 
 * @author tangyong
 */
public class LoginHandler extends MultiCommandHandlerCg {
	private static Logger logger = Logger.getLogger(TestHandler.class);
	private  LoginServiceImpl loginService = new LoginServiceImpl();

	/**
	 * 登陆
	 */
	public void login(CommandCg cmd) {
		try {
			final String username = cmd.getStringParam("username");
			final String pwd = cmd.getStringParam("pwd");
			String code="200";
			Map<String, Object> one=loginService.getOne(username,pwd);
			String token="";
			if(one!=null&&!one.isEmpty()){
				Object redisToken=loginService.getTokenToRedis(username);
				if(redisToken!=null){//延迟token的生命周期
					token=redisToken.toString();
					loginService.setTokenToRedis(username, pwd,token);
				}else{//token已经失效则生成新的token
					token=ToolUtil.getToken();
					loginService.setTokenToRedis(username, pwd,token);
				}
			}else{
				code="201";
			}
			ResponseCg response = new ResponseCg();
			response.addValue("code", code);
			response.addValue("token", token);
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	/**
	 * 注册
	 */
	public void regdit(CommandCg cmd) {
		try {
			final String username = cmd.getStringParam("username");
			final String pwd = cmd.getStringParam("pwd");
			Map<String, Object> one=loginService.getOne(username,pwd);
			String code="200";
			String token="";
			String msg="注册成功";
			ResponseCg response = new ResponseCg();
			if(one!=null&&!one.isEmpty()){
				code="201";
				msg="用户名已经存在,请换一个";
			}else{
				loginService.add(username, pwd);		
//				token=ToolUtil.getToken();
//				setTokenToRedis(username, pwd,token);
			}
			response.addValue("code", code);
//			response.addValue("token", token);
			response.addValue("msg",msg);
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
