package com.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;

import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.service.DepartmentServiceImpl;
import com.service.DubanCreateServiceImpl;
import com.service.ParamServiceImpl;
import com.util.KeyUtil;
import com.util.ToolUtil;

public class WebIndexHandler extends MultiCommandHandlerCg{

	private static Logger logger = Logger.getLogger(UserHandler.class);
	private ParamServiceImpl paramService = new ParamServiceImpl();
	private DubanCreateServiceImpl dubanCreateService = new DubanCreateServiceImpl();
	private DepartmentServiceImpl deptService = new DepartmentServiceImpl();
	
	public void show(CommandCg cmd){
		try {
			ResponseCg response = new ResponseCg();
			
			logger.info("---add-----WebIndexHandler---cmd:" + cmd);
			List<Map<String, Object>> paramList = paramService.query(cmd.getIntParam("start"), cmd.getIntParam("end"),"index");// 查询首页模块
			
			Map<String, String> deptMap = deptService.queryAll();// 查询全部的部门数据
			for(Map<String, Object> paramMap:paramList){
				Map<String, String> noMap = new HashMap<String, String>();//被退回的
				noMap.putAll(deptMap);
				String id = (String)paramMap.get("id");// 模块ID
				
				List<Map<String,Object>> contentMap = dubanCreateService.query(1, id);// 查询所属模块的数据
				
				// 获取每个模块展示的前三条
				List<Map<String,Object>> showMap = new ArrayList<Map<String,Object>>();
				int size = contentMap.size();
				showMap.addAll(contentMap.subList(0, size>3?3:size));
				for(Map<String,Object> map:showMap){
					map.put("depName", deptMap.get(map.get("cbdw")));
					map.put("time", ToolUtil.transferLongToDate((Long)map.get("createtime")));
				}
				
				Map<String,String> backMap = new HashMap<String,String>();//被退回的
				Set<String> addSet = new HashSet<String>();
				for(Map<String,Object> content:contentMap){
					String state = (String)content.get("spqk");
					String deptId = (String)content.get("cbdw");
					
					addSet.add(deptId);//已经上报的部门ID
					if(state.equals("3")||state.equals("5")){//被退回
						backMap.put(deptId,deptMap.get(deptId));
					}
					
					noMap.remove(deptId);
				}
				
				paramMap.put("back", backMap);
				paramMap.put("noMap", noMap);
				paramMap.put("content", showMap);
			}
			response.addValue("code", KeyUtil.CODE_SUCCESS);
			response.addValue("result", paramList);
			cmd.setResponseCg(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
