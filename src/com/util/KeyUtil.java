package com.util;
/**
 * key管理
 * @author tangyong
 *
 */
public class KeyUtil {
      public final static String TOKEN_KEY="gov_tokens_";//token
      public final static String USER_INFO_KEY="gov_users_";//用户信息
      public final static int TOKEN_EXPIRE=60*30*1;//30分钟
      public final static int CODE_SUCCESS=200;//获取数据成功
      public final static int CODE_USERNAME_PWD_ERROR=201;//用户名或者密码错误
      public final static int CODE_USERNAME_EXITX=202;//用户名已经存在
      public final static int CODE_NOT_LOGIN=400;//未登陆
}
