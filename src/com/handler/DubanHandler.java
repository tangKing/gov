package com.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.service.DubanServiceImpl;
import com.util.KeyUtil;
import com.util.PageModel;
import com.zank.zcf.util.StringUtils;

public class DubanHandler extends MultiCommandHandlerCg {
	private static Logger logger = Logger.getLogger(DubanHandler.class);
	private DubanServiceImpl dubanService = new DubanServiceImpl();

	/**
	 * 添加
	 */
	public void add(CommandCg cmd) {
		try {
			logger.info("---add-----DubanHandler---cmd:" + cmd);
			Map<String, Object> paramsMap=cmd.getParams();
			logger.info("-add-----DubanHandler---paramsMap----"+paramsMap);
			paramsMap.remove("token");
			paramsMap.remove("callback");
			if(StringUtils.isEmpty(cmd.getStringParam("id"))){
				paramsMap.put("id", UUID.randomUUID().toString());
				paramsMap.put("createtime", System.currentTimeMillis());
				paramsMap.put("status", 1);
			}
			
			dubanService.save(paramsMap);
			
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("msg", "添加成功");
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	/**
	 * 修改状态
	 */
	public void updateStatus(CommandCg cmd) {
		try {
			logger.info("---add-----updateStatus---cmd:" + cmd);
			String id=cmd.getStringParam("id");
			int status=cmd.getIntParam("status");
			dubanService.updateStatus(id, status);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("msg", "操作成功");
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
			String depId=cmd.getStringParam("depId");
			String role=cmd.getStringParam("role");
			String paramId = cmd.getStringParam("paramId");
			Map<String,Object> condition=new HashMap<String,Object>();
			if(!StringUtils.isEmpty(depId) && !depId.equals("-1")){
				condition.put("dep_id", depId);
			}
			
			if(!StringUtils.isEmpty(paramId)){
				condition.put("type", paramId);
			}
			
			if(role.equals("2")||role.equals("3")){
				int status = role.equals("2")?1:2;
				condition.put("status", status);
			}
			
			logger.info("---queryAll-----param---cmd:" + cmd);
			PageModel<Map<String, Object>> result = dubanService.queryAll(condition,page==0?1:page, pageSize);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("result", result);
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
			Map<String, Object> result = dubanService.findById(id);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("result",result);
			response.addValue("msg", "获取成功");
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
