package com.util;

import java.util.UUID;
/**
 * 工具类
 *
 */
public class ToolUtil {
	/**
	 * 获取token
	 */
	public static String getToken() {
		String s = UUID.randomUUID().toString();
		return s.replace("-", "");
	}
}
