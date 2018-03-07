package tk.licer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tk.licer.DTO.AccountTypeDTO;
import tk.licer.form.AccountTypeForm;
import tk.licer.model.page.EasyuiPageModel;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.AccountTypeService;
import tk.licer.util.PageUtil;

/**
 * test
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping(value = "/test")
public class TestController {

	// log
	Log logger = LogFactory.getLog(TestController.class);

	// 账户类型service
	@Autowired
	private AccountTypeService service;

	/**
	 * 打开首页
	 * 
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping(value = "/testmenu")
	public ModelAndView testmenu(HttpServletRequest req,
			HttpServletResponse resp) {

		return new ModelAndView("test/testmenu");
	}

	@RequestMapping(value = "/getMenuList")
	@ResponseBody
	public EasyuiPageModel getMenuList(PageEasyui pe, AccountTypeForm form, HttpServletRequest request,
			HttpServletResponse response) {

		AccountTypeDTO dto = new AccountTypeDTO();
		BeanUtils.copyProperties(form, dto);
		
		List<AccountTypeDTO> dtos = service.getPageAllAccountType(pe, dto);
		long total = pe.getTotalCount();
		
		// 封装数据
		EasyuiPageModel easyuiPageModel = PageUtil.convert(total, dtos);
		
		
		return easyuiPageModel;
		
		
//		List<Menu> menus = new TestDaoImpl().findAll();

//		return menus;
	}

}
