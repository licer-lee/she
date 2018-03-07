package tk.licer.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * ResponseUtil
 * @author liwc
 *
 */
public class ResponseUtil {
	
	
	/**
	 * 写入响应数据
	 * @param str
	 * @param response
	 * @throws IOException
	 */
	public static void render(String str, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		out.write(str);
	}
}
