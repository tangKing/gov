package com.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.service.UserServiceImpl;
import com.util.KeyUtil;
import com.util.PageModel;
import com.zank.zcf.util.StringUtils;

public class UserHandler extends MultiCommandHandlerCg {
	private static Logger logger = Logger.getLogger(UserHandler.class);
	private UserServiceImpl userService = new UserServiceImpl();

	/**
	 * 添加
	 */
	public void add(CommandCg cmd) {
		try {
			logger.info("---add-----user---cmd:" + cmd);
			Map<String, Object> user = new HashMap<String, Object>();
			if(!StringUtils.isEmpty(cmd.getStringParam("id"))){
				user.put("id", cmd.getStringParam("id"));
			}else{
				user.put("id", UUID.randomUUID().toString());
				user.put("createtime", System.currentTimeMillis());
			}
			user.put("username", cmd.getStringParam("username"));
			user.put("password", cmd.getStringParam("password"));
			user.put("realname", cmd.getStringParam("realname"));
			user.put("role", cmd.getIntParam("role"));//普通员工
			user.put("dep_id", cmd.getStringParam("depId"));
			userService.save(user);
			
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("msg", "添加成功");
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 删除
	 */
	public void del(CommandCg cmd) {
		try {
			final String id = cmd.getStringParam("id");
			logger.info("---del-----user---cmd:" + cmd);
			userService.del(id);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("msg", "删除成功");
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 修改
	 */
	public void update(CommandCg cmd) {
		try {
			logger.info("---update-----user---cmd:" + cmd);
			Map<String, Object> user = new HashMap<String, Object>();
			user.put("id", cmd.getStringParam("id"));
			user.put("username", cmd.getStringParam("username"));
			user.put("password", cmd.getStringParam("password"));
			user.put("realname", cmd.getStringParam("realname"));
			user.put("role", cmd.getIntParam("role"));//普通员工
			user.put("dep_id", cmd.getStringParam("depId"));
			userService.update(user);
			
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("msg", "修改成功");
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	/**
	 * 查询单条
	 */
	public void getOne(CommandCg cmd) {
		try {
			final String id = cmd.getStringParam("id");
			logger.info("---getOne-----param---cmd:" + cmd);
			Map<String, Object> result = userService.findById(id);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("result",result);
			response.addValue("msg", "获取成功");
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	/**
	 * 查询单条
	 */
	public void queryAll(CommandCg cmd) {
		try {
			int page = cmd.getIntParam("page");
			int pageSize = 20;
			if(cmd.hasParam("pageSize")){
				pageSize = cmd.getIntParam("pageSize");
			}
			logger.info("---queryAll-----user---cmd:" + cmd);
			PageModel<Map<String, Object>> result = userService.queryAll(page==0?1:page, pageSize);
			logger.info("---queryAll-----user---result:" + result);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("result", result);
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
