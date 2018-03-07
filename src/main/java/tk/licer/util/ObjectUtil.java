package tk.licer.util;

import java.util.List;

import net.sf.json.JSONObject;

/**
 * ObjectUtil
 * 
 * @author Administrator
 * 
 */
public class ObjectUtil {

	/**
	 * 判断字符串是否为空
	 * 
	 * @param str
	 * @return
	 */
	public static Boolean isEmpty(String str) {
		if (null == str || "".equals(str))
			return true;
		else
			return false;

	}

	/**
	 * 判断对象是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public static Boolean isEmpty(Object obj) {

		return null == obj;
	}

	/**
	 * 判断数组是否为空
	 * 
	 * @param args
	 * @return
	 */
	public static Boolean isEmpty(Object[] array) {

		return (null == array || 0 == array.length);
	}

	/**
	 * 判断List是否为空
	 * 
	 * @param list
	 * @return
	 */
	public static Boolean isEmpty(List list) {

		return (null == list || 0 == list.size());
	}

	/**
	 * 判断JSONobject是否为空
	 * @param json
	 * @return
	 */
	public static Boolean isEmpty(JSONObject json) {

		return (null == json || json.isEmpty());
	}

}
