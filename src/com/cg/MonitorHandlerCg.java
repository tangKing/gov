package com.cg;

import java.util.concurrent.atomic.AtomicBoolean;

import com.zank.zcf.monitor.ZMonitor;

/**
 * Created by tomcat8080 on 14-8-1. search
 */
public class MonitorHandlerCg extends MultiCommandHandlerCg {

    public static AtomicBoolean flag = new AtomicBoolean(true);

	/**
	 * 监控
	 * 
	 * @param cmd
	 */
	public void monitor(CommandCg cmd) {
        ResponseCg response = new ResponseCg();
        response.addValue("result", ZMonitor.getValues());
        cmd.setResponseCg(response);
    }

    /**
     * 启动
     *
     * @param cmd
     */
    public void start(CommandCg cmd) {
        System.out.println(cmd.toJSON());
        ResponseCg response = new ResponseCg();
        flag.set(true);
        response.addValue("result", flag.get());
        cmd.setResponseCg(response);
    }

    /**
     * 停止
     *
     * @param cmd
     */
    public void stop(CommandCg cmd) {
        System.out.println(cmd.toJSON());
        ResponseCg response = new ResponseCg();
        flag.set(false);
        response.addValue("result", flag.get());
        cmd.setResponseCg(response);
    }
}
