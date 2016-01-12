package com.cg;


import org.apache.log4j.Logger;

import com.zank.zcf.command.McfConst;
import com.zank.zcf.command.Response;
import com.zank.zcf.filter.IFilter;
import com.zank.zcf.handler.IHandler;
import com.zank.zcf.util.LogUtils;

/**
 * @author tangyong
 */
public class SimpleCommandExecutorCg extends AbstractCommandExecutorCg {

	private static Logger logger = Logger.getLogger(SimpleCommandExecutorCg.class);
	
	private static String EXECUTE_INTERRUPTED_LOG = "execution interrupted by filter: {0}, cmd: {1}";

	public boolean execute(CommandCg cmd) {
		// filter CommandCg action/params
		for (IFilter<CommandCg> filter : filters) {
			if (!filter.filter(cmd)) {
				LogUtils.debug(logger, EXECUTE_INTERRUPTED_LOG, filter.getClass().getName(), cmd);
				return false;
			}
		}
				
		IHandler<CommandCg> handler = getHanlder(cmd);
		if (handler == null) return false;
		return handler.handle(cmd);
	}
	
	public ResponseCg executeWithResponse(CommandCg cmd) {
		boolean success = execute(cmd);
		
		ResponseCg response = null;
		if (cmd.getResponseCg() != null) {
			response = cmd.getResponseCg();
			
			// clear response after every execution
			cmd.setResponseCg(null);
		}
		if (response == null) {
			response = new ResponseCg().addValue(McfConst.PARAM_SUCCESS, success);
		}
		
		return response;
	}
	
}
