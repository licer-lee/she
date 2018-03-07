package tk.licer.util;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;

import tk.licer.model.BaseEntity;

/**
 * BeanUtil
 * 
 * @author Administrator
 * 
 */
public final class BeanUtil {

	/**
	 * 
	 * @param bean
	 * @param propertyName
	 * @param propertyValue
	 */
	public static void setBeanProperty(Object bean, String propertyName,
			String propertyValue) {

		String errorInfo = "class=" + bean.getClass().getName() + "，name="
				+ propertyName;

		PropertyDescriptor descriptor;
		try {
			descriptor = new PropertyDescriptor(propertyName, bean.getClass());
		} catch (IntrospectionException e) {
			throw new RuntimeException("没有此Bean属性：" + errorInfo, e);
		}

		Method setter = descriptor.getWriteMethod();
		Class paramClazz = setter.getParameterTypes()[0];
		Object paramValue;
		try {
			Constructor paramCtor = paramClazz
					.getConstructor(new Class[] { String.class });
			paramValue = paramCtor.newInstance(new Object[] { propertyValue });
		} catch (Exception e) {
			throw new RuntimeException("无法将String转换成Bean属性类型：" + errorInfo, e);
		}

		try {
			setter.invoke(bean, new Object[] { paramValue });
		} catch (Exception e) {
			throw new RuntimeException("无法将属性值赋入Bean：" + errorInfo, e);
		}
	}

	/**
	 * 
	 * @param bean
	 * @param propertyName
	 * @param propertyValue
	 */
	public static void setMapProperty(Map bean, String propertyName,
			String[] propertyValue) {

		if (propertyValue.length == 1)
			bean.put(propertyName, propertyValue[0]);
		else
			bean.put(propertyName, propertyValue);
	}


	public static void copyList(List source, List target) {
		for (int i = 0, len = source.size(); i < len; i++) {

			BeanUtils.copyProperties(source.get(i), target.get(i));
		}
	}
	
	
	// FIXME
//	public <T> void copyBeanList(List< ? extends BaseEntity> sourceList, List< ? extends BaseEntity> targetList){
//		T t1 = null;
//		if(!sourceList.isEmpty() && targetList != null){
//			for(BaseEntity e: sourceList){
//				BeanUtils.copyProperties(e, t1);
//				targetList.add(t1);
//			}
//		}
//		
//		
//	}

}
