package tk.licer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import tk.licer.DTO.MenuDto;
import tk.licer.form.MenuForm;
import tk.licer.model.Resource;
import tk.licer.model.page.EasyuiPageModel;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.MenuService;
import tk.licer.util.JsonUtil;
import tk.licer.util.MapUtil;
import tk.licer.util.PageUtil;
import tk.licer.util.ResponseUtil;

/**
 * menu
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="system/menu")
public class MenuController {

	private static Logger log = LoggerFactory.getLogger(MenuController.class);
	

	// 账户类型service
	@Autowired
	private MenuService service;
	
	
	/**
	 * 打开首页
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value="index")
	public ModelAndView index(HttpServletRequest req, HttpServletResponse resp){
		
		return new ModelAndView("system/menu/index");
	}
	
	/**
	 * 获取列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public EasyuiPageModel list(PageEasyui pe, MenuForm form, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		MenuDto dto = new MenuDto();
		BeanUtils.copyProperties(form, dto);
		
		// 执行业务逻辑层
		List<MenuDto> dtos = service.getPageAll(pe, dto);
		long total = pe.getTotalCount();

		// 封装数据
		EasyuiPageModel easyuiPageModel = PageUtil.convert(total, dtos);

		log.info(JsonUtil.bean2JsonStr(easyuiPageModel));

		return easyuiPageModel;
	}
	
	
	
	@RequestMapping(value = "info")
	public ModelAndView info(String id) throws IOException {

		ModelAndView mv = new ModelAndView("system/menu/info");
		
		MenuDto dto = service.findById(id);
		
		log.info(""+MapUtil.beanToMap(dto));
		
		mv.addAllObjects(MapUtil.beanToMap(dto));
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "addMenu", method=RequestMethod.POST)
//	@ResponseBody
	public void save( MenuForm form, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		MenuDto dto = new MenuDto();
		
		
		
		BeanUtils.copyProperties(form, dto);
		
		
		
		JSONObject message = service.saveUser(dto);
		
		ResponseUtil.render(message.toString(), response);
	}
	
	
	
	
	@RequestMapping(value="getRootMenu")
	@ResponseBody
	public List<MenuDto> getRootMenu(){
		
		List<MenuDto> list = service.getRootMenu();
		return list;
		
	}
}
