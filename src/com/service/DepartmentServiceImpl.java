package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.ServerConfig;
import com.mongodb.ReadPreference;
import com.util.PageModel;
import com.zank.zcf.dao.mongo.IMongoDao;
import com.zank.zcf.dao.mongo.factory.MongoDaoFactory;

public class DepartmentServiceImpl {

	private final IMongoDao mongoDao;

	private ServerConfig config = ServerConfig.getServerConfig();
	static List<String> fields=new ArrayList<String>();//只返回需要的字段
	public DepartmentServiceImpl() {
		fields.add("id");
		fields.add("depName");
		mongoDao = MongoDaoFactory.getMongoDao(config.getMongoHost(), config.getMongoDbName(), "t_dept", ReadPreference.PRIMARY);
	}
	public static void main(String[] args) {
		Map<String, Object> dept = new HashMap<String, Object>();
		dept.put("id", UUID.randomUUID().toString());
		dept.put("depName", "部门10");
		dept.put("pId", "-1");
		new DepartmentServiceImpl().save(dept);
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
	public PageModel<Map<String,Object>> queryAll(int page, int pageSize) throws Exception {
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
	public boolean del(String idStr) throws Exception {
		String ids[] = idStr.split(",");
		for(String id:ids){
			Map<String, Object> cond = new LinkedHashMap<String, Object>();
			cond.put("id", id);
			mongoDao.delete(cond);
		}
		return true;
	}
}
