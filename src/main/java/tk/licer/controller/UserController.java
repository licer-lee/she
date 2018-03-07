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
import tk.licer.DTO.UserDTO;
import tk.licer.form.UserForm;
import tk.licer.model.page.EasyuiPageModel;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.UserService;
import tk.licer.util.JsonUtil;
import tk.licer.util.MapUtil;
import tk.licer.util.PageUtil;
import tk.licer.util.ResponseUtil;

@Controller
@RequestMapping("system/user")
public class UserController {

	
	// log
	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	
	// 账户类型service
	@Autowired
	private UserService service;
		
		
	
	
	
	@RequestMapping(value="index")
	public String index(){
		
		return "system/user/index";
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
	public EasyuiPageModel list(PageEasyui pe, UserForm form, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		UserDTO dto = new UserDTO();
		BeanUtils.copyProperties(form, dto);
		
		// 执行业务逻辑层
		List<UserDTO> dtos = service.getPageAll(pe, dto);
		long total = pe.getTotalCount();

		// 封装数据
		EasyuiPageModel easyuiPageModel = PageUtil.convert(total, dtos);

		log.info(JsonUtil.bean2JsonStr(easyuiPageModel));

		return easyuiPageModel;
	}
	
	
	
	@RequestMapping(value = "info")
	public ModelAndView info(String id) throws IOException {

		ModelAndView mv = new ModelAndView("system/user/info");
		
		UserDTO dto = service.findById(id);
		
		log.info(""+MapUtil.beanToMap(dto));
		
		mv.addAllObjects(MapUtil.beanToMap(dto));
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "save", method=RequestMethod.POST)
//	@ResponseBody
	public void save( UserForm form, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		UserDTO dto = new UserDTO();
		
		BeanUtils.copyProperties(form, dto);

		JSONObject message = service.saveUser(dto);
		
		ResponseUtil.render(message.toString(), response);
	}
	
	
	
	
}
