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
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import tk.licer.DTO.RoleDTO;
import tk.licer.form.RoleForm;
import tk.licer.model.Role;
import tk.licer.model.page.EasyuiPageModel;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.RoleService;
import tk.licer.util.JsonUtil;
import tk.licer.util.MapUtil;
import tk.licer.util.PageUtil;
import tk.licer.util.RequestUtil;
import tk.licer.util.ResponseUtil;

/**
 * 角色控制器
 * 功能:负责接收请求,调度相关逻辑处理
 * @author liwc
 * 
 */
@Controller
@RequestMapping(value = "system/role")
public class RoleController {

	//log
	private static final Logger log = LoggerFactory.getLogger(RoleController.class);

	//角色service
	@Autowired
	private RoleService roleService;

	
	/**
	 * 打开首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {

		
		//获取ip地址
		RequestUtil.getIpAddr(request);
		
		return new ModelAndView("system/role/index");
	}

	/**
	 * 获取角色列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "list")
	public void list(PageEasyui pe, RoleForm form, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		RequestUtil.printAllParameter(request);
		
		RoleDTO dto = new RoleDTO();
		BeanUtils.copyProperties(form, dto);
		
		List<Role> roles = roleService.getPageRoleList(pe, dto);
		long count = roles.size();
		// 封装数据
		EasyuiPageModel easyuiPageModel = PageUtil.convert(count, roles);
		log.info(JsonUtil.bean2JsonStr(easyuiPageModel));
		ResponseUtil.render(JsonUtil.bean2JsonStr(easyuiPageModel), response);
	}
	
	
	
	/**
	 * 打开角色画面:新增/编辑
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "info")
	public ModelAndView info(String roleId, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		ModelAndView mv = new ModelAndView("system/role/info");
		
		Role role = roleService.getRoleById(roleId);
		
		mv.addAllObjects(MapUtil.beanToMap(role));
		
		return mv;
	}
	
	/**
	 * 添加一个角色
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "save")
	public void save(Role role, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		JSONObject message = roleService.addRole(role);
		
		ResponseUtil.render(JsonUtil.bean2JsonStr(message), response);
	}
	

	
	
	/**
	 * 删除角色
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "delete")
	public void delete(Role role, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		JSONObject message = roleService.deleteRole(role);
		
		ResponseUtil.render(JsonUtil.bean2JsonStr(message), response);
	}
	
	

}
