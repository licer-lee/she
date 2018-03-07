package tk.licer.util.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import tk.licer.model.Visitor;
import tk.licer.service.VisitorService;
import tk.licer.util.DateUtil;
import tk.licer.util.ObjectUtil;
import tk.licer.util.RequestUtil;

/**
 * 记录器 功能: 记录访问者信息
 * 
 * @author liwc
 * 
 */
@Aspect
@Component
public class Recorder {

	private static final Logger log = LoggerFactory.getLogger(Recorder.class);

	
	@Autowired
	private VisitorService service;
	
	
	/**
	 * 定义切入点 (aspectj语法)
	 */
	@Pointcut("execution(public * tk.licer.controller..*.login(..))")
	public void loginMethod() {
	}

	/**
	 * 环绕原型方法
	 * 
	 * @param pdj
	 * @return
	 * @throws Throwable
	 */
	@Around("loginMethod()")
	public Object around(ProceedingJoinPoint pdj) throws Throwable{
		
		//取得原型方法参数
		Object[] args = pdj.getArgs();
		
		log.info("开始记录访问者信息");
		//记录访问者信息
		recorderVisitor((HttpServletRequest)args[0]);
		
		//执行并获取返回值
		Object obj = pdj.proceed(args);
		log.info("记录访问者信息结束");
		
		return obj;
	}

	/**
	 * 获取访问者信息并保存
	 * @param httpServletRequest
	 */
	private void recorderVisitor(HttpServletRequest request) {
		
		Visitor visitor = new Visitor();
		visitor.setIp(RequestUtil.getIpAddr(request));
		visitor.setUserAgent(request.getHeader("USER-AGENT").toLowerCase());
		visitor.setHost(request.getHeader("HOST").toLowerCase());
		visitor.setAccept(request.getHeader("ACCEPT").toLowerCase());
		visitor.setAcceptEncoding(request.getHeader("ACCEPT-ENCODING").toLowerCase());
		visitor.setAcceptLanguage(request.getHeader("ACCEPT-LANGUAGE").toLowerCase());
		visitor.setCookie(ObjectUtil.isEmpty(request.getHeader("COOKIE"))? "":request.getHeader("COOKIE").toLowerCase());
		visitor.setTime(DateUtil.getSysDate());
		
		service.addVisitor(visitor);
	}

}
