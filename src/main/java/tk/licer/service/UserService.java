package tk.licer.service;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import tk.licer.DTO.UserDTO;
import tk.licer.model.Resource;
import tk.licer.model.User;
import tk.licer.model.page.PageEasyui;




public interface UserService {

	
	public UserDTO findById(String id);
	
	public User findUserByName(String userName);

	public List<User> findUsers(Map<String, Object> params);
	
	public List<User> updateStatus(String[] ids, Integer status);
	
	public List<Resource> findResourcesByUserId(String userId);
	
	public Map<String, Object> findResourceMap(String userId);

	
	public List<UserDTO> getPageAll(PageEasyui pe, UserDTO dto);

	
	public JSONObject saveUser(UserDTO dto);
	
	/**
	 * 根据用户信息查询分页信息
	 * @param userQueryDTO
	 * @return
	 */
//	public PageModel<User> queryUserPage(UserQueryDTO userQueryDTO);
	
}
