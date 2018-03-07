package tk.licer.util.aop;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint.StaticPart;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.SourceLocation;

/**
 * 需要织入的逻辑类(使用xml方式)
 * 功能: 统计执行的方法及执行耗时
 * @author liwc
 *
 */
public class MyIntercepter4XML {
	
	private static final Log log = LogFactory.getLog(MyIntercepter4XML.class);
	
	
	/**
	 * 定义切点 ()
	 */
	public void myMethod(){}
	
	/**
	 *  TODO 在切点方法前执行
	 */
	public void befor(){
		
		System.out.println("method befor...");
	}
	
	
	/**
	 * 环绕原型方法
	 * @param pdj
	 * @return
	 * @throws Throwable
	 */
	public Object around(ProceedingJoinPoint pdj) throws Throwable{
		
		log.info("method start");
		long start = System.currentTimeMillis();
		
		//模拟执行时间
//		Thread.currentThread().sleep(1000);
		
		
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
		
		//获取返回值
		Object obj = pdj.proceed(args);
		
		long time = System.currentTimeMillis() - start;
		log.info("方法:"+sig+"执行耗时-->"+ time +" ms");
		
		log.info("method end");
		return obj;
	}
	
}
