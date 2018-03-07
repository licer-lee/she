package tk.licer.DAO;


import java.util.List;

import tk.licer.DTO.MenuDto;
import tk.licer.model.Resource;
import tk.licer.model.page.Page;


public interface MenuDao {

	List<Resource> findUserByName(String name);
	
	public List<Resource> findResourcesByUserId(String userId);

	List<Resource> findPageAll(Page page, MenuDto dto);

	List<Resource> findAll(MenuDto dto);

	Resource findById(String id);

	void save(Resource user);

	List<Resource> findRoot();
	
}
