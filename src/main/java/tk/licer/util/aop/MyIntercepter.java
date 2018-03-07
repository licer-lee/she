package tk.licer.util.aop;

import org.aspectj.lang.JoinPoint.StaticPart;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.SourceLocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 需要织入的逻辑类(使用annotation方式)
 * 功能: 统计执行的方法及执行耗时
 * @author liwc
 *
 */
@Aspect
@Component
public class MyIntercepter {
	
	private static final Logger log = LoggerFactory.getLogger(MyIntercepter.class);
	
	
	/**
	 * 定义切点 ()
	 */
	@Pointcut("execution(public * tk.licer..*.*(..))")
	public void myMethod(){}
	
	/**
	 *  TODO 在切点方法前执行
	 */
//	@Before("myMethod()")
	public void befor(){
		
		System.out.println("method befor...");
	}
	
	
	/**
	 * 环绕原型方法
	 * @param pdj
	 * @return
	 * @throws Throwable
	 */
	@Around("myMethod()")
	public Object around(ProceedingJoinPoint pdj) throws Throwable{
		
		//取得参数
		Object[] args = pdj.getArgs();
		String s = pdj.getKind();
		Signature sig = pdj.getSignature();
		String methodName = sig.getName();
		
		SourceLocation sl = pdj.getSourceLocation();
		StaticPart sp = pdj.getStaticPart();
		Object obj1 = pdj.getTarget();
		Object obj2 = pdj.getThis();
		String className = pdj.getClass().getName();
		
		log.info("方法:"+sig+"开始执行...");
		long start = System.currentTimeMillis();
		
		//执行并获取返回值
		Object obj = pdj.proceed(args);
		
		long time = System.currentTimeMillis() - start;
		log.info("方法:"+sig+"执行结束! 耗时--> "+ time +" ms");
		
		return obj;
	}
	
}
