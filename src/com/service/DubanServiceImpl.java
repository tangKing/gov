package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.ServerConfig;
import com.mongodb.ReadPreference;
import com.util.KeyUtil;
import com.util.PageModel;
import com.zank.zcf.dao.mongo.IMongoDao;
import com.zank.zcf.dao.mongo.factory.MongoDaoFactory;

public class DubanServiceImpl {

	private final IMongoDao mongoDao;

	private ServerConfig config = ServerConfig.getServerConfig();
	public DubanServiceImpl() {
		mongoDao = MongoDaoFactory.getMongoDao(config.getMongoHost(), config.getMongoDbName(), "t_duban", ReadPreference.PRIMARY);
	}
	/**
	 * 添加数据
	 * @param record
	 */
	public boolean save(Map<String, Object> record){
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("id", record.get("id").toString());
		// 第一个false代表不插入，如果是true那么就是说如果不存在的话就插入
		// 第二个false代表修改一条数据即可，如果是true那么就是说修改多条
		mongoDao.update(cond, record, true, false);
		return true;
	}
	/**
	 * 修改状态
	 */
	public boolean updateStatus(String id,int status) throws Exception {
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("id", id);
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("status", status);
		// 第一个false代表不插入，如果是true那么就是说如果不存在的话就插入
		// 第二个false代表修改一条数据即可，如果是true那么就是说修改多条
		mongoDao.update(cond, record, false, false);
		return true;
	}
	
	/**
	 * 查询单条数据
	 */
	public Map<String, Object> findById(String id) throws Exception {
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("id", id);
		Map<String, Object> result = mongoDao.findOne(cond);
		return result;
	}
	
	public List<Map<String, Object>> query(int start, String t) throws Exception{
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("createtime", -1);
		
		Map<String,Object> cond = new HashMap<String, Object>();
		cond.put("type", t);
		
		return mongoDao.findList(cond, null,order, start, -1);
	}

	/**
	 * 查询列表
	 */
	public PageModel<Map<String,Object>> queryAll(Map<String,Object> condition,int page, int pageSize) throws Exception {
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("createtime", -1);// 最大的时间在最前面
		int start = (page==0?1:page - 1) * pageSize;
		
		List<Map<String, Object>> list = mongoDao.findList(condition,order, start, pageSize);
		
		for(Map<String, Object> map:list){
			String str = "未知部门";
			if(map.containsKey("takeDepart") && !((String)map.get("takeDepart")).equals("-1")){
				str = KeyUtil.deptMap.get(map.get("takeDepart"));
			}
			map.put("depName", str);
			
			str = "未知类别";
			if(map.containsKey("type")){
				str = (String)(KeyUtil.paramMap.get(map.get("type"))).get("paramName");
			}
			map.put("typeName", str);
			
			str = "未知部门";
			if(map.containsKey("sendDepart") && !((String)map.get("sendDepart")).equals("-1")){
				str = KeyUtil.deptMap.get(map.get("sendDepart"));
			}
			map.put("sendDepName",str);
		}
		PageModel<Map<String,Object>> model = new PageModel<Map<String,Object>>();
		model.setList(list);
		model.setPageNo(page);
		model.setPageSize(pageSize);
		
		int count = mongoDao.getCount(condition);
		model.setTotalRecords(count);
		
		return model;
	}

}
