package com.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.service.DepartmentServiceImpl;
import com.util.KeyUtil;
import com.util.PageModel;
import com.zank.zcf.util.StringUtils;

public class DepartmentHandler extends MultiCommandHandlerCg {
	private static Logger logger = Logger.getLogger(DepartmentHandler.class);
	private DepartmentServiceImpl deptService = new DepartmentServiceImpl();

	/**
	 * 添加
	 */
	public void add(CommandCg cmd) {
		try {
			logger.info("---add-----dept---cmd:" + cmd);
			Map<String, Object> dept = new HashMap<String, Object>();
			if(!StringUtils.isEmpty(cmd.getStringParam("id"))){
				dept.put("id", cmd.getStringParam("id"));
			}else{
				dept.put("id", UUID.randomUUID().toString());
				dept.put("createtime", System.currentTimeMillis());
			}
			
			dept.put("depName", cmd.getStringParam("depName"));
			dept.put("pId", cmd.getStringParam("pName"));
			deptService.save(dept);
			
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
			logger.info("---del-----user---cmd:" + cmd);
			deptService.del(ids);
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
			Map<String, Object> result = deptService.findById(id);
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
			logger.info("---queryAll-----param---cmd:" + cmd);
			PageModel<Map<String, Object>> result = deptService.queryAll(page==0?1:page, pageSize);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("result", result);
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
