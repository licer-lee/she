package tk.licer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tk.licer.DTO.VisitorDTO;
import tk.licer.form.AccountTypeForm;
import tk.licer.model.Visitor;
import tk.licer.model.page.EasyuiPageModel;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.AccountTypeService;
import tk.licer.service.VisitorService;
import tk.licer.util.JsonUtil;
import tk.licer.util.MapUtil;
import tk.licer.util.ObjectUtil;
import tk.licer.util.PageUtil;
import tk.licer.util.ResponseUtil;

/**
 * 访问记录
 * 
 * @author liwc
 * 
 */
@Controller
@RequestMapping(value = "/system/visitor")
public class VisitorController {

	// log
	private static final Log log = LogFactory.getLog(VisitorController.class);

	
	
	@Autowired
	private VisitorService service;

	/**
	 * 打开首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response) {

		return new ModelAndView("/system/visitor/index");
	}

	/**
	 * 获取列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public EasyuiPageModel list(PageEasyui pe,
			AccountTypeForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		VisitorDTO dto = new VisitorDTO();
		BeanUtils.copyProperties(form, dto);
		
		// 执行业务逻辑层
		List<Visitor> dtos = service.getPageVisitorList(pe, dto);
		long total = pe.getTotalCount();

		// 封装数据
		EasyuiPageModel easyuiPageModel = PageUtil.convert(total, dtos);

		log.info(JsonUtil.bean2JsonStr(easyuiPageModel));

		return easyuiPageModel;
	}

	/**
	 * 打开账户类型画面:新增/编辑
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/accountTypeInfo")
	public ModelAndView accountTypeInfo(Integer accountTypeId,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		ModelAndView mv = new ModelAndView(
				"/business/accountType/accountTypeInfo");
//		VisitorDTO dto = service.getAccountTypeById(accountTypeId);
//		mv.addAllObjects(MapUtil.beanToMap(dto));
		return mv;
	}

	/**
	 * 保存账户类型
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
//	@RequestMapping(value = "/addAccountType")
//	@ResponseBody
//	public JSONObject addAccountType(AccountTypeForm form,
//			HttpServletRequest request, HttpServletResponse response)
//			throws IOException {
//
//		VisitorDTO dto = new VisitorDTO();
//		BeanUtils.copyProperties(form, dto);
//
//		JSONObject message = service.addAccountType(dto);
//		return message;
////		ResponseUtil.render(JsonUtil.bean2JsonStr(message), response);
//	}

	/**
	 * 删除账户类型
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
//	@ResponseBody
//	@RequestMapping(value = "/delAccountType")
//	public JSONObject delAccountType(AccountTypeForm form,
//			HttpServletRequest request, HttpServletResponse response)
//			throws IOException {
//
//		VisitorDTO dto = new VisitorDTO();
//		BeanUtils.copyProperties(form, dto);
//
//		JSONObject message = service.deleteAccountType(dto);
//		return message;
////		ResponseUtil.render(JsonUtil.bean2JsonStr(message), response);
//	}

}
