package tk.licer.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tk.licer.util.CheckMobile;
import tk.licer.util.Md5Util;

/**
 * 登录控制器
 * 
 * 功能:
 * 
 * @author liwc
 * 
 */
@Controller
public class LoginController {

	// log
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);


	/**
	 * 打开登录入口
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "login")
	public String login(HttpServletRequest request,
			HttpServletResponse response) {

		if (CheckMobile.check(request, response)) {
			return "mobile/login";
		} else {
			return "login";
		}
	}

	/**
	 * 打开登录入口
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/loginSky")
	public ModelAndView loginSky(HttpServletRequest request,
			HttpServletResponse response) {

		if (CheckMobile.check(request, response)) {
			return new ModelAndView("mobile/login");
		} else {
			return new ModelAndView("loginSky");
		}
	}

	/**
	 * 打开登录入口
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/loginMouse")
	public ModelAndView loginMouse(HttpServletRequest request,
			HttpServletResponse response) {

		if (CheckMobile.check(request, response)) {
			return new ModelAndView("mobile/login");
		} else {
			return new ModelAndView("loginMouse");
		}
	}
	
	
	/**
	 * 登陆验证
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="loginVerfiy", method=RequestMethod.POST ) // 
	public String loginVerfiy(HttpServletRequest request, Model model){
		
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		
		boolean rememberMe = false;
		
		String md5Pwd = Md5Util.generatePassword(pwd);
		
		try {
			UsernamePasswordToken token = new UsernamePasswordToken(username, md5Pwd, rememberMe);
			
			Subject subject = SecurityUtils.getSubject();
			
			subject.login(token);
			
			//跳转第一个菜单
//			List<Resource> hasResource = (List<Resource>) request.getSession().getAttribute(WebHelper.SESSION_MENU_RESOURCE);
//			if(hasResource != null && !hasResource.isEmpty()){
//				for(Resource resource : hasResource){
//					
//					List<Resource> chResources = resource.getChildren();
//					if(StringUtils.isNotBlank(resource.getUrl()) && (chResources == null || chResources.isEmpty())){
//						return "redirect:" + resource.getUrl();
//					}
//					if(chResources != null && !chResources.isEmpty()){
//						for(Resource chRes : chResources){
//							if(StringUtils.isNotBlank(chRes.getUrl())){
//								return "redirect:" + chRes.getUrl();
//							}
//						}
//					}
//				}
//			}
			
			return "redirect:/layout/layout";
		} catch (LockedAccountException lae) {
//			lae.printStackTrace();
			model.addAttribute("msg", "账号已被禁用");
		} catch (AuthenticationException ae) {
//			ae.printStackTrace();
			model.addAttribute("msg", "账号或密码错误");
		} catch (Exception e) {
//			e.printStackTrace();
			model.addAttribute("msg", "登录异常");
		}
		
		return "login";
	}
	
	
	@RequestMapping("login_out")
	public String loginOut(HttpServletRequest request){
		
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		
		return "redirect:/login";
	}

}
