package tk.licer.util;

import java.beans.PropertyDescriptor;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.PropertyUtilsBean;

/**
 * Map工具类
 * 
 * @author liwc
 * 
 */
public class MapUtil {

	static Map m = null;

	
	/**
	 * TODO
	 * @param map
	 * @param entity
	 */
	public static void toEntity(Map map, Class<?> entity) {
		m = map;
		Set set = m.entrySet();
		Iterator it = set.iterator();
		while (it.hasNext()) {
			Object key = (String) it.next();
			String val = (String) m.get(key);
			System.out.println(key + "--" + val);
		}

	}

	/**
	 * TODO
	 * @param entity
	 * @return
	 */
	public Map fromEntity(Class<?> entity) {

		return null;
	}

	
	/**
	 * javabean转换map
	 * @param obj
	 * @return
	 */
	public static Map<String, Object> beanToMap(Object obj) {
		
		Map<String, Object> params = new HashMap<String, Object>(0);
		try {
			PropertyUtilsBean propertyUtilsBean = new PropertyUtilsBean();
			PropertyDescriptor[] descriptors = propertyUtilsBean
					.getPropertyDescriptors(obj);
			for (int i = 0; i < descriptors.length; i++) {
				String name = descriptors[i].getName();
				if (!"class".equals(name)) {
					params.put(name,
							propertyUtilsBean.getNestedProperty(obj, name));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return params;
	}
	
	
}
