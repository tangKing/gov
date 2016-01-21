package com;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.BootstrapServer;
import com.handler.DepartmentHandler;
import com.service.DepartmentServiceImpl;
import com.service.ParamServiceImpl;
import com.util.KeyUtil;

public class InitListener implements ServletContextListener {  
	  
	private static Logger logger = Logger.getLogger(InitListener.class);
	
    @Override  
    public void contextDestroyed(ServletContextEvent context) {  
          
    }  
  
    @Override  
    public void contextInitialized(ServletContextEvent context){  
    	try {
			DepartmentServiceImpl deptService = new DepartmentServiceImpl();
			KeyUtil.deptMap = deptService.queryAll();
		} catch (Exception e) {
			logger.info("-------部门数据初始化异常-------");
		}
    	
    	try{
    		ParamServiceImpl paramService = new ParamServiceImpl();
    		KeyUtil.paramMap = paramService.queryAll();
    	}catch(Exception e){
    		logger.info("-------参数获取异常-------");
    	}
    	
    	BootstrapServer.startHttp();
        System.out.println("================自动加载启动开始.");  
    }  
  
}  
