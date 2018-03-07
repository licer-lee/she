package tk.licer.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tk.licer.DTO.AccountDTO;
import tk.licer.DTO.AccountTypeDTO;
import tk.licer.form.AccountForm;
import tk.licer.model.AccountType;
import tk.licer.model.page.EasyuiPageModel;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.AccountService;
import tk.licer.service.AccountTypeService;
import tk.licer.util.JsonUtil;
import tk.licer.util.MapUtil;
import tk.licer.util.PageUtil;
import tk.licer.util.ResponseUtil;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

/**
 * 账户控制器
 * 
 * 功能:负责接收请求,调度相关逻辑处理
 * 
 * @author liwc
 * 
 */
@Controller
@RequestMapping(value = "/business/account")
//@RequestMapping(value={"a","b"})
public class AccountController {

	// log
	private static final Log log = LogFactory.getLog(AccountController.class);

	// 账户service
	@Autowired
	private AccountService service;

	// typeService
	@Autowired
	private AccountTypeService typeService;

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

		return new ModelAndView("/business/account/index");
	}

	/**
	 * 获取列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/getAccountList")
	public void getAccountList(PageEasyui pe, AccountForm form,
			HttpServletResponse response) throws IOException {

		AccountDTO dto = new AccountDTO();
		BeanUtils.copyProperties(form, dto);

		List<AccountDTO> dtos = service.getPageAllAccount(pe, dto);
		long total = pe.getTotalCount();

		// 为gson注册一个转换器,解决外键关联延迟加载问题(问题:http://www.cnblogs.com/shizhongtao/p/3680216.html)
		Gson gson = new GsonBuilder().registerTypeAdapter(AccountType.class,
				new JsonSerializer<AccountType>() {
					
					@Override
					public JsonElement serialize(AccountType src,
							Type typeOfSrc, JsonSerializationContext context) {
						
						JsonObject accounttypeObj = new JsonObject();
						accounttypeObj.addProperty("accountTypeId",
								src.getAccountTypeId());
						accounttypeObj.addProperty("accountTypeName",
								src.getAccountTypeName());
						return accounttypeObj;
					}
				}).create();

		// 封装数据
		EasyuiPageModel easyuiPageModel = PageUtil.convert(total, dtos);
		
		log.info(JsonUtil.bean2JsonStr(easyuiPageModel, gson));
		
		ResponseUtil.render(JsonUtil.bean2JsonStr(easyuiPageModel, gson),
				response);
	}

	/**
	 * 打开账户画面:新增/编辑
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/accountInfo")
	public ModelAndView accountInfo(Integer accountId) throws IOException {

		ModelAndView mv = new ModelAndView("/business/account/accountInfo");
		AccountDTO dto = service.getAccountById(accountId);
		log.info(MapUtil.beanToMap(dto));
		mv.addAllObjects(MapUtil.beanToMap(dto));
		return mv;
	}

	/**
	 * 保存账户
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/addAccount", method= RequestMethod.POST)
	public void addAccount( AccountForm form, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		AccountDTO dto = new AccountDTO();
		BeanUtils.copyProperties(form, dto);

		JSONObject message = service.addAccount(dto);
		
		ResponseUtil.render(message.toString(), response);
	}

	/**
	 * 删除账户
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/delAccount")
	public void delAccount(AccountForm form, HttpServletResponse response) throws IOException {

		AccountDTO dto = new AccountDTO();
		BeanUtils.copyProperties(form, dto);

		JSONObject message = service.deleteAccount(dto);
		ResponseUtil.render(JsonUtil.bean2JsonStr(message), response);
	}

	/**
	 * 获取类别下拉数据
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/getAccountTypeList")
	public void getAccountTypeList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		List<AccountTypeDTO> dtos = typeService.getAllAccountType(null);
		// 封装数据
		log.info(JsonUtil.bean2JsonStr(dtos));
		ResponseUtil.render(JsonUtil.bean2JsonStr(dtos), response);
	}

}
