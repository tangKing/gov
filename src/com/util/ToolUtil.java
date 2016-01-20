package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
/**
 * 工具类
 * @author tangyong
 */
public class ToolUtil {
	/**
	 * 获取token
	 */
	public static String getToken() {
		String s = UUID.randomUUID().toString();
		return s.replace("-", "");
	}
	 
	 public static String transferLongToDate(Long millSec) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(millSec);
		return sdf.format(date);
	}
}
