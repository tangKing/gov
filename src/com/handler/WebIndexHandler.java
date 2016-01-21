package com.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.MapUtils;
import org.apache.log4j.Logger;

import com.cg.CommandCg;
import com.cg.MultiCommandHandlerCg;
import com.cg.ResponseCg;
import com.service.DepartmentServiceImpl;
import com.service.DubanServiceImpl;
import com.service.ParamServiceImpl;
import com.util.KeyUtil;
import com.util.ToolUtil;

public class WebIndexHandler extends MultiCommandHandlerCg{

	private static Logger logger = Logger.getLogger(UserHandler.class);
	private ParamServiceImpl paramService = new ParamServiceImpl();
	private DubanServiceImpl dubanServiceImpl = new DubanServiceImpl();
	
	public void show(CommandCg cmd){
		try {
			ResponseCg response = new ResponseCg();
			
			logger.info("---add-----WebIndexHandler---cmd:" + cmd);
			List<Map<String, Object>> paramList = paramService.query(cmd.getIntParam("start"), cmd.getIntParam("end"),"index");// 查询首页模块
			
			Map<String, String> deptMap = KeyUtil.deptMap;// 查询全部的部门数据
			for(Map<String, Object> paramMap:paramList){
				Map<String, String> noMap = new HashMap<String, String>();//被退回的
				noMap.putAll(deptMap);
				String id = (String)paramMap.get("id");// 模块ID
				
				List<Map<String,Object>> contentMap = dubanServiceImpl.query(0, id);// 查询所属模块的数据
				
				// 获取每个模块展示的前三条
				List<Map<String,Object>> showMap = new ArrayList<Map<String,Object>>();
				int size = contentMap.size();
				showMap.addAll(contentMap.subList(0, size>3?3:size));
				for(Map<String,Object> map:showMap){
					map.put("depName", deptMap.get(map.get("sendDepart")));
					map.put("time", ToolUtil.transferLongToDate((Long)map.get("createtime")));
				}
				
				Map<String,String> backMap = new HashMap<String,String>();//被退回的
				for(Map<String,Object> content:contentMap){
					String state = MapUtils.getString(content, "status","");
					String deptId = (String)content.get("sendDepart");
					
					if(state.equals("3")||state.equals("5")){//被退回
						backMap.put(deptId,deptMap.get(deptId));
					}
					
					noMap.remove(deptId);//移除已经上报的部门
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
