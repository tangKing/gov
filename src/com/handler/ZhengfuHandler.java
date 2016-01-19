package com.handler;

import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.service.ZhengfuServiceImpl;
import com.util.KeyUtil;
import com.util.PageModel;
import com.zank.zcf.util.StringUtils;

public class ZhengfuHandler extends MultiCommandHandlerCg {
	private static Logger logger = Logger.getLogger(ZhengfuHandler.class);
	private ZhengfuServiceImpl fwService = new ZhengfuServiceImpl();

	/**
	 * 添加
	 */
	public void add(CommandCg cmd) {
		try {
			logger.info("---add-----Zhengfu---cmd:" + cmd);
			Map<String, Object> paramsMap=cmd.getParams();
			logger.info("-add-----Zhengfu---paramsMap----"+paramsMap);
			paramsMap.remove("token");
			paramsMap.remove("callback");
			if(StringUtils.isEmpty(cmd.getStringParam("id"))){
				paramsMap.put("id", UUID.randomUUID().toString());
				paramsMap.put("createtime", System.currentTimeMillis());
			}
	    	
			fwService.save(paramsMap);
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
			String status=cmd.getStringParam("status");
			fwService.updateStatus(id, status);
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
			logger.info("---queryAll-----param---cmd:" + cmd);
			PageModel<Map<String, Object>> result = fwService.queryAll(page==0?1:page, pageSize);
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
			Map<String, Object> result = fwService.findById(id);
			System.out.println(result+"---");
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
