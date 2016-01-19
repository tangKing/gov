package com.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.service.ParamServiceImpl;
import com.util.KeyUtil;
import com.util.PageModel;
import com.zank.zcf.util.StringUtils;

public class ParamHandler extends MultiCommandHandlerCg {
	private static Logger logger = Logger.getLogger(ParamHandler.class);
	private ParamServiceImpl service = new ParamServiceImpl();

	/**
	 * 添加
	 */
	public void add(CommandCg cmd) {
		try {
			logger.info("---add-----dept---cmd:" + cmd);
			Map<String, Object> param = new HashMap<String, Object>();
			if(!StringUtils.isEmpty(cmd.getStringParam("id"))){
				param.put("id", cmd.getStringParam("id"));
			}else{
				param.put("id", UUID.randomUUID().toString());
				param.put("createtime", System.currentTimeMillis());
			}
			
			param.put("paramName", cmd.getStringParam("paramName"));
			param.put("order", cmd.getStringParam("order"));
			param.put("type", cmd.getStringParam("type"));
			param.put("endtime", cmd.getStringParam("endtime"));
			service.save(param);
			
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
			final String ids = cmd.getStringParam("ids");
			logger.info("---del-----param---cmd:" + cmd);
			service.del(ids);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("msg", "删除成功");
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
			Map<String, Object> result = service.findById(id);
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
			System.out.println(cmd+"----");
			logger.info("---queryAll-----param---cmd:" + cmd);
			PageModel<Map<String, Object>> result = service.queryAll(page==0?1:page, pageSize,cmd.getStringParam("type"));
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("result", result);
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
