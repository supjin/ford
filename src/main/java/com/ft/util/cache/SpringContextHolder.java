package com.ft.util.cache;

import java.io.IOException;

import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.stereotype.Service;

@Service
@Lazy(false)
public class SpringContextHolder implements ApplicationContextAware, DisposableBean {
	private static ApplicationContext applicationContext;
	private static Logger logger = LoggerFactory.getLogger(SpringContextHolder.class);

	public static ApplicationContext getApplicationContext() {
		assertContextInjected();
		return applicationContext;
	}

	public static String getRootRealPath() {
		String rootRealPath = "";
		try {
			rootRealPath = getApplicationContext().getResource("").getFile().getAbsolutePath();
		} catch (IOException e) {
			logger.warn("获取系统根目录失败");
		}
		return rootRealPath;
	}

	public static String getResourceRootRealPath() {
		String rootRealPath = "";
		try {
			rootRealPath = new DefaultResourceLoader().getResource("").getFile().getAbsolutePath();
		} catch (IOException e) {
			logger.warn("获取资源根目录失败");
		}
		return rootRealPath;
	}

	public static <T> T getBean(String name) {
		assertContextInjected();
		return (T) applicationContext.getBean(name);
	}

	public static <T> T getBean(Class<T> requiredType) {
		assertContextInjected();
		return (T) applicationContext.getBean(requiredType);
	}

	public static void clearHolder() {
		if (logger.isDebugEnabled()) {
			logger.debug("清除SpringContextHolder中的ApplicationContext:" + applicationContext);
		}
		applicationContext = null;
	}

	public void setApplicationContext(ApplicationContext applicationContext) {
		if (applicationContext != null) {
			logger.info("SpringContextHolder中的ApplicationContext被覆盖, 原有ApplicationContext为:" + applicationContext);
		}
		SpringContextHolder.applicationContext = applicationContext;
	}

	public void destroy() throws Exception {
	}

	private static void assertContextInjected() {
		
		Validate.validState(applicationContext != null,
				"applicaitonContext属性未注入, 请在applicationContext.xml中定义SpringContextHolder.", new Object[0]);
	}
}
