/**
 * 
 */
package com;


import java.beans.PropertyDescriptor;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.configuration.PropertiesConfiguration;

/**
 * @author yan.liu
 *
 */
public class ServerConfig {

    private static final ServerConfig serverConfig = new ServerConfig();

    public static ServerConfig getServerConfig() {
        return serverConfig;
    }

    private ServerConfig() {
        try {
            PropertiesConfiguration configuration = new PropertiesConfiguration("resources/server.properties");
            PropertyDescriptor[] propertiesArray = PropertyUtils.getPropertyDescriptors(ServerConfig.class);
            for (PropertyDescriptor propertyDescriptor : propertiesArray) {
                Class<?> type = propertyDescriptor.getPropertyType();
                String name = propertyDescriptor.getName();

                if (type == int.class) {
                    PropertyUtils.setProperty(this, name, configuration.getInt(name));
                } else if (type == String.class) {
                    PropertyUtils.setProperty(this, name, configuration.getString(name));
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private String mongoHost;
    private String mongoDbName;
    
    private int httpServerPort;
    
    
    private String httpServerHost;

	@Override
    public String toString() {
        return "ServerConfig{" +
                "mongoHost='" + mongoHost + '\'' +
                ", mongoDbName='" + mongoDbName + '\'' +
                ", httpServerPort=" + httpServerPort +
                '}';
    }

	public String getMongoHost() {
		return mongoHost;
	}

	public void setMongoHost(String mongoHost) {
		this.mongoHost = mongoHost;
	}

	public String getMongoDbName() {
		return mongoDbName;
	}

	public void setMongoDbName(String mongoDbName) {
		this.mongoDbName = mongoDbName;
	}

	public int getHttpServerPort() {
		return httpServerPort;
	}

	public void setHttpServerPort(int httpServerPort) {
		this.httpServerPort = httpServerPort;
	}

	public String getHttpServerHost() {
		return httpServerHost;
	}

	public void setHttpServerHost(String httpServerHost) {
		this.httpServerHost = httpServerHost;
	}

	public static ServerConfig getServerconfig() {
		return serverConfig;
	}
}
