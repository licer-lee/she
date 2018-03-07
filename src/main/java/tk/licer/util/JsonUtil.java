package tk.licer.util;

import java.io.IOException;

import net.sf.json.JSONObject;

import com.google.gson.Gson;

/**
 * JsonUtil
 * 
 * @author liwc
 * 
 */
public class JsonUtil {

	/**
	 * 字符串转换json对象
	 * 
	 * @param jsonStr
	 * @return
	 */
	public static JSONObject str2Json(String jsonStr) {

		JSONObject json = JSONObject.fromObject(jsonStr);
		return json;
	}

	/**
	 * json转换字符串
	 * 
	 * @param json
	 * @return
	 */
	public static String json2str(JSONObject json) {

		return json.toString();
	}

	/**
	 * 字符串转换javaBean
	 * 
	 * @param jsonStr
	 * @param beanCls
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T jsonStr2Bean(String jsonStr, Class<T> beanCls) {

		try {
			Object pojo;
			JSONObject jsonObject = JSONObject.fromObject(jsonStr);
			pojo = JSONObject.toBean(jsonObject, beanCls);
			return (T) pojo;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	/**
	 * 字符串转换javaBean(Gson)
	 * 
	 * @param jsonStr
	 * @param beanCls
	 * @return
	 */
	public static <T> T jsonStr2BeanByGson(String jsonStr, Class<T> beanCls) {

		Gson gson = new Gson();
		return (T) gson.fromJson(jsonStr, beanCls);
	}

	/**
	 * javaBean转换字符串
	 * 
	 * @param bean
	 *            javabean
	 * @return
	 * @throws IOException
	 */
	public static String bean2JsonStr(Object bean) throws IOException {

		return bean2JsonStr(bean, null);
	}

	/**
	 * javaBean转换字符串
	 * 
	 * @param bean
	 *            javabean
	 * @param gson
	 *            可以使用带有自定义转换器的实例
	 * @return
	 * @throws IOException
	 */
	public static String bean2JsonStr(Object bean, Gson gson)
			throws IOException {

		if (null == gson) {
			gson = new Gson();
		}
		return gson.toJson(bean);
	}
	

}
