package tk.licer.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class RequestUtil {

	private static final Log log = LogFactory.getLog(ResponseUtil.class);

	// 获取当前执行的方法名称
	/*
	 * logger.info("已执行了方法:" + this.getClass().getName() + "." +
	 * Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
	 */

	/**
	 * 获取请求的 body
	 * 
	 * @param req
	 * @return
	 * @throws IOException
	 */
	public static String getRequestBody(HttpServletRequest req)
			throws IOException {
		BufferedReader reader = req.getReader();
		String input = null;
		StringBuffer requestBody = new StringBuffer();
		while ((input = reader.readLine()) != null) {
			requestBody.append(input);
		}
		return requestBody.toString();
	}

	/**
	 * 从request内复制Parameter到相应的实体内
	 * 
	 * @param request
	 * @param bean
	 */
	public static void copyProperties(HttpServletRequest request, Object bean) {

		Map paramMap = request.getParameterMap();
		Set params = paramMap.entrySet();
		for (Iterator it = params.iterator(); it.hasNext();) {
			Entry param = (Entry) it.next();
			String name = (String) param.getKey();
			String[] raw_values = (String[]) param.getValue();
			String value = raw_values[0];
			try {
				if (bean instanceof Map) {
					BeanUtil.setMapProperty((Map) bean, name, raw_values);
				} else {
					BeanUtil.setBeanProperty(bean, name, value);
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 打印request内所有Parameter参数
	 * 
	 * @param request
	 * @param bean
	 */
	public static void printAllParameter(HttpServletRequest request) {

		Map paramMap = request.getParameterMap();
		Set params = paramMap.entrySet();
		for (Iterator it = params.iterator(); it.hasNext();) {
			Entry param = (Entry) it.next();
			String name = (String) param.getKey();
			String[] raw_values = (String[]) param.getValue();
			String value = raw_values[0];
			log.info(name + ":" + value);
		}
	}

	/**
	 * 获取客户端真实IP
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ipAddress = null;
		log.info("ip" + request.getRemoteAddr());
		ipAddress = request.getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0
				|| "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = request.getRemoteAddr();
			if (ipAddress.equals("127.0.0.1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ipAddress = inet.getHostAddress();
			}
		}

		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
															// = 15
			if (ipAddress.indexOf(",") > 0) {
				ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
			}
		}
		log.info("public IP:" + ipAddress);
		return ipAddress;
	}

}
