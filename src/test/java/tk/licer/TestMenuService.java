package tk.licer;

import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import tk.licer.DTO.MenuDto;
import tk.licer.model.Resource;
import tk.licer.service.MenuService;

public class TestMenuService extends TestBase{

//	@Autowired
//	MenuDao dao ;
	
	
//	@Autowired
	@javax.annotation.Resource
	MenuService service;
	
	@Test
	@Transactional
	@Rollback(true)
	public void TestGetUserReource(){
		
		String userId = "4028821e5b7a6947015b7a6ebacf0000";
		
//		((UserServiceImpl)applicationContext.getBean("UserServiceImpl")).findResourcesByUserId(userId);
		
//		us.findResourcesByUserId(userId);
		
		
		
		MenuDto f = new MenuDto();
		f.setName("1");
		f.setIcon("11");
		f.setUrl("111");
		f.setOrderNo(1111);
		f.setType("page");
		
		Resource r = new Resource();
		r.setId("70");
		f.setParent(r);
		
//		dao.save(user);
		service.saveUser(f);
		
		
		
	}

}
