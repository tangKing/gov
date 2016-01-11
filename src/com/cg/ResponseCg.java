package com.cg;


import java.util.HashMap;
import java.util.Map;

import org.msgpack.annotation.Message;

import com.zank.zcf.util.JsonUtils;
import com.zank.zcf.util.MapUtils;

@Message
public class ResponseCg {
    private String id = "";
    String result="";
    private Map<String, Object> response = new HashMap<String, Object>();

    public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public ResponseCg addValue(String key, String value) {
        response.put(key, value);
        return this;
    }

    public ResponseCg addValue(String key, Object value) {
        response.put(key, value);
        return this;
    }

    public int getIntValue(String k) {
        return MapUtils.getIntValue(response, k, 0);
    }

    public String getStringValue(String k) {
        return MapUtils.getString(response, k);
    }

    public boolean getBooleanValue(String k) {
        return MapUtils.getBooleanValue(response, k, false);
    }

    public long getLongValue(String k) {
        return MapUtils.getLongValue(response, k, 0);
    }

    public double getDoubleValue(String k) {
        return MapUtils.getDoubleValue(response, k, 0);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Map<String, Object> getResponse() {
        return response;
    }

    public void setResponse(Map<String, Object> response) {
        this.response = response;
    }

    @Override
    public String toString() {
        return "Response [id=" + id + ", response=" + result + "]";
    }

    public String toJSON() {
        return  JsonUtils.toJSON(this);
    }

}
