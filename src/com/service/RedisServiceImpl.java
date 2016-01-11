package com.service;

import org.apache.log4j.Logger;

import com.ServerConfig;
import com.zank.zcf.dao.redis.IRedisDao;
import com.zank.zcf.dao.redis.factory.RedisDaoFactory;

/**
 * 评论服务类
 * 
 * @author tangyong
 * 
 */
public class RedisServiceImpl  {
	private static Logger logger = Logger.getLogger(RedisServiceImpl.class);
	private ServerConfig config = ServerConfig.getServerConfig();
	IRedisDao redisDao = RedisDaoFactory.getRedisDao(config.getRedisHost(),
			config.getRedisPort(), "");
 
	public boolean setRedisValue(String key, String value, int expire) {
		try {
			redisDao.set(key, value);
			redisDao.expire(key, expire);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("---setRedisValue--key:" + key + ",value:" + value
					+ ",exception" + e);
		}
		return true;
	}

	public String getRedisObj(String key) {
		try {
			return  redisDao.get(key);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("---getRedisObj--key:" + key + ",exception" + e);
			return null;
		}
	}
	
	
	public void delObj(String key) {
		try {
			redisDao.del(key);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("---delObj--key:" + key);
		}
	}

	public void hset(String key, String field, String val, int expire) {
		try {
			redisDao.hset(key, field, val);
			redisDao.expire(key, expire);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("---hset--key:" + key + ",exception:" + e);
		}
	}

	public String hget(String key, String field) {
		try {
			return redisDao.hget(key, field);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("---hget--key:" + key + ",exception" + e);
		}
		return null;
	}
}
