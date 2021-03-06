package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ServerConfig;
import com.mongodb.ReadPreference;
import com.util.PageModel;
import com.zank.zcf.dao.mongo.IMongoDao;
import com.zank.zcf.dao.mongo.factory.MongoDaoFactory;
import com.zank.zcf.util.StringUtils;

public class DubanCreateServiceImpl {

	private final IMongoDao mongoDao;

	private ServerConfig config = ServerConfig.getServerConfig();
	public DubanCreateServiceImpl() {
		mongoDao = MongoDaoFactory.getMongoDao(config.getMongoHost(), config.getMongoDbName(), "t_duban_create", ReadPreference.PRIMARY);
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
	public boolean updateStatus(String id,String status) throws Exception {
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
	 * 查询列表
	 */
	public PageModel<Map<String,Object>> queryAll(int page, int pageSize,String id) throws Exception {
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("createtime", -1);// 最大的时间在最前面
		int start = (page - 1) * pageSize;
		
		Map<String, Object> cond = new HashMap<String, Object>();
		if(!StringUtils.isEmpty(id)){
			cond.put("ssmk", id);
		}
		List<Map<String, Object>> list = mongoDao.findList(cond,order, start, pageSize);
		PageModel<Map<String,Object>> model = new PageModel<Map<String,Object>>();
		model.setList(list);
		model.setPageNo(page);
		model.setPageSize(pageSize);
		
		int count = mongoDao.getCount(null);
		model.setTotalRecords(count);
		
		return model;
	}
	
	public List<Map<String, Object>> query(int start, String t) throws Exception{
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("createtime", -1);
		
		Map<String,Object> cond = new HashMap<String, Object>();
		cond.put("ssmk", t);
		
		return mongoDao.findList(cond, null,order, start, -1);
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
}
