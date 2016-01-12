package com.handler;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.service.TestServiceImpl;
import com.util.KeyUtil;
import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.zank.zcf.command.Command;
import com.zank.zcf.command.Response;
import com.zank.zcf.command.handler.MultiCommandHandler;

/**
 * 用例
 * 
 * @author tangyong
 */
public class TestHandler extends MultiCommandHandlerCg {
	private static Logger logger = Logger.getLogger(TestHandler.class);
	private TestServiceImpl testService = new TestServiceImpl();

	/**
	 * 添加
	 */
	public void add(CommandCg cmd) {
		try {
			final String id = cmd.getStringParam("id");
			logger.info("---add-----param---cmd:" + cmd);
			testService.add(id);
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
			logger.info("---del-----param---cmd:" + cmd);
			testService.del(id);
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
			final String id = cmd.getStringParam("id");
			final String newId = cmd.getStringParam("newId");
			logger.info("---del-----param---cmd:" + cmd);
			testService.update(id, newId);
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
			Map<String, Object> result = testService.getOne(id);
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
			final String id = cmd.getStringParam("id");
			int page = cmd.getIntParam("page");
			int pageSize = 20;
			logger.info("---queryAll-----param---cmd:" + cmd);
			List<Map<String, Object>> result = testService.queryAll(id, page==0?1:page, pageSize);
			ResponseCg response = new ResponseCg();
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("result", result);
			cmd.setResponseCg(response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
