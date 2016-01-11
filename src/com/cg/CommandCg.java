package com.cg;


import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.codehaus.jackson.annotate.JsonIgnore;

import com.zank.zcf.command.McfConst;
import com.zank.zcf.util.IpUtils;
import com.zank.zcf.util.JsonUtils;
import com.zank.zcf.util.MapUtils;
import com.zank.zcf.util.RandomUtils;

public class CommandCg {
	private String id = "";
	private String action = "";
	private String source = IpUtils.IP_LAN;
	// same hash-code of 'thread' will keep this kind of CommandCg executed in sequence
	private String thread = "";
	private Map<String, Object> params = new HashMap<String, Object>();
	
	private ResponseCg response;
	
	public CommandCg() {} 
	
	public CommandCg(String action) {
		this.action = action;
	}
	
	public CommandCg(String action, String method) {
		this.action = action;
		this.params.put(McfConst.PARAM_CMD_METHOD, method);
	}
	
	@JsonIgnore
	public CommandCg sync() {
		this.params.put(McfConst.PARAM_COMMAND_SYNC, "true");
		return this;
	}
	@JsonIgnore
	public boolean isSync() {
		return "true".equalsIgnoreCase(getStringParam(McfConst.PARAM_COMMAND_SYNC));
	}
	@JsonIgnore
	public String getMethod() {
		return getStringParam(McfConst.PARAM_CMD_METHOD);
	}
	
	public boolean hasParam(String key) {
		return params.containsKey(key);
	}
	public CommandCg setParam(String k, Object v) {
		params.put(k, v);
		return this;
	}
	@SuppressWarnings("unchecked")
	public <T> T getParam(String k, Class<T> t) {
		Object obj = params.get(k);
		return obj == null ? null : (T)obj;
	}
	public int getIntParam(String k) {
		return MapUtils.getIntValue(params, k, 0);
	}
	public String getStringParam(String k) {
		return MapUtils.getString(params, k);
	}
	public boolean getBooleanParam(String k) {
		return MapUtils.getBooleanValue(params, k, false);
	}
	public long getLongParam(String k){
		return MapUtils.getLongValue(params, k, 0);
	}
	public double getDoubleParam(String k) {
		return MapUtils.getDoubleValue(params, k, 0);
	}
	
	public String getId() {
		return id;
	}
	public CommandCg setId(String id) {
		this.id = id;
		return this;
	}
	public String getAction() {
		return action;
	}
	public CommandCg setAction(String action) {
		this.action = action;
		return this;
	}
	public String getThread() {
		return thread;
	}
	public CommandCg setThread(String thread) {
		this.thread = thread;
		return this;
	}
	public String getSource() {
		return source;
	}
	public CommandCg setSource(String source) {
		this.source = source;
		return this;
	}
	public Map<String, Object> getParams() {
		return params;
	}
	public void setParams(Map<String, ?> params) {
		this.params.clear();
		for (String key : params.keySet()) {
			this.params.put(key, params.get(key));
		}
	}

//    /**
//     * 获取一个bean,如果有的属性就映射
//     * @param cls
//     * @return
//     * @throws Exception
//     */
//    public <T> T getParams(Class<T> cls) throws Exception {
//        T obj = cls.newInstance();
//        BeanUtils.copyProperties(obj, this.params);
//        return obj;
//    }
//
//    /**
//     * 将一个pojo作为参数
//     * @param pojo
//     * @throws Exception
//     */
//    public void setParams(Object pojo) throws Exception {
//        this.params.clear();
//        BeanUtils.copyProperties(this.params, pojo);
//    }

	@JsonIgnore
	public ResponseCg getResponseCg() {
		return response;
	}
	public void setResponseCg(ResponseCg response) {
		this.response = response;
	}

	@Override
	public String toString() {
		return "CommandCg [id=" + id + ", action=" + action + ", source="
				+ source + ", thread=" + thread + ", params=" + params + "]";
	}

	@Override
	public int hashCode() {
		int hashCode;
		if (StringUtils.isEmpty(thread)) {
			hashCode = StringUtils.isEmpty(id) ? RandomUtils.randomInt() : id.hashCode();
		} else {
			if (NumberUtils.isNumber(thread)) {
				hashCode = Integer.parseInt(thread);
			} else {
				hashCode = thread.hashCode();
			}
		}
		return Math.abs(hashCode);
	}
	
	public String toJSON() {
		return  JsonUtils.toJSON(this);
	}
	
	public static CommandCg parse(String json) {
		return JsonUtils.toT(json, CommandCg.class);
	}
	
}
