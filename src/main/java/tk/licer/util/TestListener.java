package tk.licer.util;

import java.text.SimpleDateFormat;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestListener implements ServletContextListener{
	
	public final static Logger logger = LoggerFactory.getLogger(TestListener.class);
	Long start;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		start = System.currentTimeMillis();
		logger.info("监听器start....");
		System.out.println(" 监听器start....当前时间："+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date(System.currentTimeMillis())));
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		logger.info(" 监听器stop....");
		System.out.println("监听器stop....当前时间："+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date(System.currentTimeMillis())));
		System.out.println(" 运行时间:"+ (System.currentTimeMillis() - start) +" ms");
	}

}
