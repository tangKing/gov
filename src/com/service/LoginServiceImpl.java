package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ServerConfig;
import com.mongodb.ReadPreference;
import com.util.KeyUtil;
import com.zank.zcf.dao.mongo.IMongoDao;
import com.zank.zcf.dao.mongo.factory.MongoDaoFactory;

/**
 * 登陆服务类
 * 
 * @author tangyong
 */
public class LoginServiceImpl {
	private static Logger logger = Logger.getLogger(TestServiceImpl.class);
	private final IMongoDao mongoDao;
	private RedisServiceImpl redisService = new RedisServiceImpl();

	private ServerConfig config = ServerConfig.getServerConfig();
	static List<String> fields=new ArrayList<String>();//只返回需要的字段
	public LoginServiceImpl() {
		fields.add("username");
		fields.add("pwd");
		fields.add("role");
		fields.add("realname");
		fields.add("dep_id");
		mongoDao = MongoDaoFactory.getMongoDao(config.getMongoHost(), config.getMongoDbName(), "t_user", ReadPreference.PRIMARY);
	}
	/**
	 * 查询单条数据
	 */
	public Map<String, Object> getOne(String username) throws Exception {
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("username", username);
		Map<String, Object> result = mongoDao.findOne(cond,fields);
		return result;
	}
	/**
	 * 查询单条数据
	 */
	public Map<String, Object> getOne(String username,String pwd) throws Exception {
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("username", username);
		cond.put("password", pwd);
		Map<String, Object> result = mongoDao.findOne(cond,fields);
		return result;
	}

	/**
	 * 查询列表
	 */
	public List<Map<String, Object>> queryAll(int page, int pageSize) throws Exception {
		Map<String, Object> order = new HashMap<String, Object>();
		order.put("username", -1);// 最大的时间在最前面
		int start = (page - 1) * pageSize;
		return mongoDao.findList(null, fields,order, start, pageSize);
	}

	/**
	 * 添加
	 */
	public boolean add(String username,String pwd) throws Exception {
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("username", username);
		record.put("pwd", pwd);
		mongoDao.insert(record);
		return true;
	}

	/**
	 * 修改
	 */
	public boolean update(String username, String pwd) throws Exception {
		Map<String, Object> cond = new HashMap<String, Object>();
		cond.put("username", username);
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("pwd", pwd);
		// 第一个false代表不插入，如果是true那么就是说如果不存在的话就插入
		// 第二个false代表修改一条数据即可，如果是true那么就是说修改多条
		mongoDao.update(cond, record, false, false);
		return true;
	}

	/**
	 * 删除
	 */
	public boolean del(String username) throws Exception {
		Map<String, Object> cond = new LinkedHashMap<String, Object>();
		cond.put("username", username);
		mongoDao.delete(cond);
		return true;
	}
	/**
	 * 延迟token生命周期
	 */
	public void setTokenToRedis(String username,String pwd,String token){
		redisService.setRedisValue(KeyUtil.TOKEN_KEY+username, token, KeyUtil.TOKEN_EXPIRE);
		redisService.hset(KeyUtil.USER_INFO_KEY+token,"username", username,KeyUtil.TOKEN_EXPIRE);
		redisService.hset(KeyUtil.USER_INFO_KEY+token, "pwd",pwd,KeyUtil.TOKEN_EXPIRE);
		redisService.hset(KeyUtil.USER_INFO_KEY+token, "token",token,KeyUtil.TOKEN_EXPIRE);
	}
	/**
	 * 获取用户的token
	 * @return token
	 */
	public Object getTokenToRedis(String username){
		Object token=redisService.getRedisObj(KeyUtil.TOKEN_KEY+username);
		return token;
	}
	/**
	 * 是否登陆
	 * @return true登陆了，false未登陆
	 */
	public  boolean isLogin(String token){
		String username=redisService.hget(KeyUtil.USER_INFO_KEY+token, "username");
		return username!=null?true:false;
	}
}
