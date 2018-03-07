package tk.licer.util;

import java.sql.Timestamp;

public class DateUtil {

	
	/**
	 * 获取系统时间戳
	 * @return
	 */
	public static Timestamp getSysDate(){
		
		return new Timestamp(System.currentTimeMillis());
	}
	
	
	
}
