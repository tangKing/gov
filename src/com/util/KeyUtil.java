package com.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.InitListener;
import com.service.DepartmentServiceImpl;
import com.service.ParamServiceImpl;

/**
 * key管理
 * @author tangyong
 *
 */
public class KeyUtil {
	
	private static Logger logger = Logger.getLogger(KeyUtil.class);
	
	// 获取所有部门信息
	public static Map<String,String> deptMap = new HashMap<String,String>();
	
	public static void updateDeptCache(){
		try {
			DepartmentServiceImpl deptService = new DepartmentServiceImpl();
			KeyUtil.deptMap = deptService.queryAll();
		} catch (Exception e) {
			logger.info("-------部门缓存更新异常-------");
		}
	}
	
	public static void updateParamCache(){
		try {
			ParamServiceImpl paramService = new ParamServiceImpl();
    		KeyUtil.paramMap = paramService.queryAll();
		} catch (Exception e) {
			logger.info("-------参数缓存更新异常-------");
		}
	}
	
	// 所有参数
	public static Map<String, Map<String,Object>> paramMap = new HashMap<String, Map<String,Object>>();
      public final static String TOKEN_KEY="gov_tokens_";//token
      public final static String USER_INFO_KEY="gov_users_";//用户信息
      public final static int TOKEN_EXPIRE=60*30*1;//30分钟
      public final static int CODE_SUCCESS=200;//获取数据成功
      public final static int CODE_USERNAME_PWD_ERROR=201;//用户名或者密码错误
      public final static int CODE_USERNAME_EXITX=202;//用户名已经存在
      public final static int CODE_NOT_LOGIN=400;//未登陆
}
