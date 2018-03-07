package tk.licer.DAO;


import java.util.List;

import tk.licer.DTO.UserDTO;
import tk.licer.model.Resource;
import tk.licer.model.User;
import tk.licer.model.page.Page;


public interface UserDao {

	List<User> findUserByName(String userName);
	
	public List<Resource> findResourcesByUserId(String userId);

	List<User> findPageAll(Page page, UserDTO dto);

	List<User> findAll(UserDTO dto);

	User findById(String id);

	void save(User user);
	
}
