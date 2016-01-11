package com.cg;

import com.zank.zcf.command.Response;
import com.zank.zcf.dispatcher.IExecutor;
import com.zank.zcf.filter.IFilter;
import com.zank.zcf.handler.IHandler;

public interface ICommandExecutorCg extends IExecutor<CommandCg>{

	public abstract ResponseCg executeWithResponse(CommandCg cmd);
	
	public ICommandExecutorCg registerHandler(String action, IHandler<CommandCg> handler);
	
	public ICommandExecutorCg registerRegexHandler(String action, IHandler<CommandCg> handler);
	
	public ICommandExecutorCg addFilter(IFilter<CommandCg> filter);

}