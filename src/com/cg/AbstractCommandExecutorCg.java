package com.cg;


import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.zank.zcf.command.Command;
import com.zank.zcf.command.executor.AbstractCommandExecutor;
import com.zank.zcf.command.executor.ICommandExecutor;
import com.zank.zcf.filter.IFilter;
import com.zank.zcf.handler.IHandler;
import com.zank.zcf.reflection.TimeLoggerProxy;
import com.zank.zcf.util.LogUtils;
import com.zank.zcf.util.RegexUtils;
import com.zank.zcf.util.counter.McfCounterManager;

/**
 * @author tangyong
 */
public abstract class AbstractCommandExecutorCg  implements ICommandExecutorCg{

	private static Logger logger = Logger.getLogger(AbstractCommandExecutorCg.class);
	
	protected Map<String, IHandler<CommandCg>> registeredHandlers = new LinkedHashMap<String, IHandler<CommandCg>>();
	protected Map<String, IHandler<CommandCg>> registeredRegexHandlers = new LinkedHashMap<String, IHandler<CommandCg>>();
	
	protected List<IFilter<CommandCg>> filters = new ArrayList<IFilter<CommandCg>>();
	
	public AbstractCommandExecutorCg registerHandler(String action, IHandler<CommandCg> handler) {
		return registerHandler(action, handler, 30);
	}
	
	@SuppressWarnings("unchecked")
	public AbstractCommandExecutorCg registerHandler(String action, IHandler<CommandCg> handler, long timeThreshold) {
		registeredHandlers.put(action, new TimeLoggerProxy(timeThreshold, McfCounterManager.handlerTimeCounter).bind(handler, IHandler.class));
		return this;
	}
	
	public AbstractCommandExecutorCg registerRegexHandler(String actionRegex, IHandler<CommandCg> handler) {
		return registerRegexHandler(actionRegex, handler, 30);
	}
	
	@SuppressWarnings("unchecked")
	public AbstractCommandExecutorCg registerRegexHandler(String actionRegex, IHandler<CommandCg> handler, long timeThreshold) {
		registeredRegexHandlers.put(actionRegex, new TimeLoggerProxy(timeThreshold, McfCounterManager.handlerTimeCounter).bind(handler, IHandler.class));
		return this;
	}
	
	public AbstractCommandExecutorCg addFilter(IFilter<CommandCg> filter) {
		filters.add(filter);
		return this;
	}
	
	
	protected IHandler<CommandCg> getHanlder(CommandCg cmd) {
		String action = cmd.getAction();
		
		IHandler<CommandCg> handler = this.registeredHandlers.get(action);
		if (handler == null) {
			for (String regex : registeredRegexHandlers.keySet()) {
				if (RegexUtils.isMatch(regex, action)) {
					handler = registeredRegexHandlers.get(regex);
					break ; 
				}
			}
		}
		
		if (handler == null) {
			LogUtils.warn(logger, "Can't find handler for action: {0}, cmd: {1}", action, cmd.toString());
		}
		
		return handler;
	}
	
}
