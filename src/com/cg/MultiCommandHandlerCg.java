package com.cg;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.zank.zcf.handler.IHandler;
import com.zank.zcf.util.LogUtils;
import com.zank.zcf.util.ReflectionUtils;

public class MultiCommandHandlerCg implements IHandler<CommandCg> {
    private static Logger logger = Logger.getLogger(MultiCommandHandlerCg.class);

    public long executeTimeThreshold = 100;

    @Override
    public final boolean handle(CommandCg cmd) {
        String methodName = cmd.getMethod();
        if (StringUtils.isEmpty(methodName)) {
            LogUtils.error(logger, "method is empty, cmd: {0}", cmd.toJSON());
            return false;
        }

        try {
            Object object = ReflectionUtils.invokeMethod(this, methodName, cmd);
            if (object != null && object instanceof Boolean) {
                return (Boolean) object;
            }

            return true;
        } catch (NoSuchMethodException e) {
            LogUtils.error(logger, "Can't find method {0}(CommandCg) in {1}", methodName, this.getClass().getName());
            return false;
        }
    }

    public MultiCommandHandlerCg setExecuteTimeThreshold(long executeTimeThreshold) {
        this.executeTimeThreshold = executeTimeThreshold;
        return this;
    }

}