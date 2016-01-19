package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ServerConfig;
import com.mongodb.ReadPreference;
import com.util.PageModel;
import com.zank.zcf.dao.mongo.IMongoDao;
import com.zank.zcf.dao.mongo.factory.MongoDaoFactory;

public class UserServiceImpl {
	private final IMongoDao mongoDao;

	private ServerConfig config = ServerConfig.getServerConfig();
	static List<String> fields=new ArrayList<String>();//只返回需要的字段
	public UserServiceImpl() {
		fields.add("id");
		fields.add("username");
		fields.add("password");
		fields.add("realname");
		fields.add("role");
		fields.add("dep_id");
		mongoDao = MongoDaoFactory.getMongoDao(config.getMongoHost(), config.getMongoDbName(), "t_user", ReadPreference.PRIMARY);
	}
	
	/**
	 * 添加用户数据
	 * @param map
	 */
	public boolean save(Map<String, Object> user){
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("id", user.get("id").toString());
		// 第一个false代表不插入，如果是true那么就是说如果不存在的话就插入
		// 第二个false代表修改一条数据即可，如果是true那么就是说修改多条
		mongoDao.update(cond, user, true, false);
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

	/**
	 * 查询列表
	 */
	public PageModel<Map<String, Object>> queryAll(int page, int pageSize) throws Exception {
		
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("createtime", -1);// 最大的时间在最前面
		int start = (page - 1) * pageSize;
		
		List<Map<String, Object>> list = mongoDao.findList(null, fields,order, start, pageSize);
		PageModel<Map<String,Object>> model = new PageModel<Map<String,Object>>();
		model.setList(list);
		model.setPageNo(page);
		model.setPageSize(pageSize);
		
		int count = mongoDao.getCount(null);
		model.setTotalRecords(count);
		
		return model;
	}

	/**
	 * 修改
	 */
	public boolean update(Map<String, Object> record) throws Exception {
		// 第一个false代表不插入，如果是true那么就是说如果不存在的话就插入
		// 第二个false代表修改一条数据即可，如果是true那么就是说修改多条
		mongoDao.update(record, record, false, false);
		return true;
	}

	/**
	 * 删除
	 */
	public boolean del(String uid) throws Exception {
		String ids[] = uid.split(",");
		for(String id:ids){
			Map<String, Object> cond = new LinkedHashMap<String, Object>();
			cond.put("id", id);
			mongoDao.delete(cond);
		}
		
		return true;
	}
}
