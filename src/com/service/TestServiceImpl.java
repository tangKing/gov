package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ServerConfig;
import com.mongodb.ReadPreference;
import com.zank.zcf.dao.mongo.IMongoDao;
import com.zank.zcf.dao.mongo.factory.MongoDaoFactory;

/**
 * 反垃圾服务类
 * 
 * @author tangyong
 */
public class TestServiceImpl {
	private static Logger logger = Logger.getLogger(TestServiceImpl.class);
	private final IMongoDao mongoDao;

	private ServerConfig config = ServerConfig.getServerConfig();
	static List<String> fields=new ArrayList<String>();//只返回需要的字段
	public TestServiceImpl() {
		fields.add("id");
		mongoDao = MongoDaoFactory.getMongoDao(config.getMongoHost(), config.getMongoDbName(), "test", ReadPreference.PRIMARY);
	}
	/**
	 * 查询单条数据
	 */
	public Map<String, Object> getOne(String id) throws Exception {
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("id", id);
		Map<String, Object> result = mongoDao.findOne(cond);
		result.remove("_id");//删除mongo自带的id字段
		return result;
	}

	/**
	 * 查询列表
	 */
	public List<Map<String, Object>> queryAll(String id, int page, int pageSize) throws Exception {
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("id", id);
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("id", -1);// 最大的时间在最前面
		int start = (page - 1) * pageSize;
		return mongoDao.findList(cond, fields,order, start, pageSize);
	}

	/**
	 * 添加
	 */
	public boolean add(String id) throws Exception {
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("id", id);
		mongoDao.insert(record);
		return true;
	}

	/**
	 * 修改
	 */
	public boolean update(String id, String updateId) throws Exception {
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("id", id);
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("id", updateId);
		// 第一个false代表不插入，如果是true那么就是说如果不存在的话就插入
		// 第二个false代表修改一条数据即可，如果是true那么就是说修改多条
		mongoDao.update(cond, record, false, false);
		return true;
	}

	/**
	 * 删除
	 */
	public boolean del(String uid) throws Exception {
		Map<String, Object> cond = new LinkedHashMap<String, Object>();
		cond.put("id", uid);
		mongoDao.delete(cond);
		return true;
	}
}
