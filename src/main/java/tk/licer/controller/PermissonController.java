package tk.licer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * permisson
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/system/permisson")
public class PermissonController {

	Log logger = LogFactory.getLog(PermissonController.class);
	
	
	
	/**
	 * 打开首页
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView index(HttpServletRequest req, HttpServletResponse resp){
		
		return new ModelAndView("/system/permisson/index");
	}
	
	
	/**
	 * top页面
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value="/top")
	public ModelAndView top(HttpServletRequest req, HttpServletResponse resp){
		
		return new ModelAndView("layout/top");
	}
	
	/**
	 * menu页面
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value="/menu")
	public ModelAndView menu(HttpServletRequest req, HttpServletResponse resp){
		
		return new ModelAndView("layout/menu");
	}
	
	/**
	 * center页面
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value="/center")
	public ModelAndView center(HttpServletRequest req, HttpServletResponse resp){
		
		return new ModelAndView("layout/center");
	}
	
	/**
	 * 默认页面
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value="/myDefault")
	public ModelAndView myDefault(HttpServletRequest req, HttpServletResponse resp){
		
		return new ModelAndView("layout/myDefault");
	}
}
