package tk.licer;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import tk.licer.service.UserService;

public class TestUser extends TestBase{

	@Autowired
//	@Resource
	UserService us;
	
	// FIXME 单元测试失败！！！
	
	
	@Test
	@Transactional
	@Rollback(true)
	public void TestGetUserReource(){
		
		String userId = "4028821e5b7a6947015b7a6ebacf0000";
		
//		((UserServiceImpl)applicationContext.getBean("UserServiceImpl")).findResourcesByUserId(userId);
		
//		us.findResourcesByUserId(userId);
		
		
	}
	
	
}
