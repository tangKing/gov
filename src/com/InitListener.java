package com;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.BootstrapServer;

public class InitListener implements ServletContextListener {  
	  
    @Override  
    public void contextDestroyed(ServletContextEvent context) {  
          
    }  
  
    @Override  
    public void contextInitialized(ServletContextEvent context) {  
    	BootstrapServer.startHttp();
        System.out.println("================>[ServletContextListener]自动加载启动开始.");  
    }  
  
}  
