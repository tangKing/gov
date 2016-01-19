package com.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.junit.Test;

import com.service.UserServiceImpl;
import com.util.PageModel;

public class UserTest {

	@Test
	public void testAdd(){
		UserServiceImpl userService = new UserServiceImpl();
		
		Map<String, Object> user = new HashMap<String, Object>();
		user.put("id", UUID.randomUUID().toString());
		user.put("username", "admin");
		user.put("password", "123456");
		user.put("realname", "张三");
		user.put("role", "3");//普通员工
		user.put("dep_id", "-1");
		
		userService.save(user);
	}
	
	@Test
	public void queryAll() throws Exception{
		UserServiceImpl userService = new UserServiceImpl();
		
		PageModel<Map<String, Object>> list = userService.queryAll(1, 20);
	}
}
