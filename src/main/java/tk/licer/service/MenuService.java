package tk.licer.service;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import tk.licer.DTO.MenuDto;
import tk.licer.model.Resource;
import tk.licer.model.page.PageEasyui;




public interface MenuService {

	
	public MenuDto findById(String id);
	
	public Resource findUserByName(String userName);

	public List<Resource> findUsers(Map<String, Object> params);
	
	public List<Resource> updateStatus(String[] ids, Integer status);
	
	public List<Resource> findResourcesByUserId(String userId);
	
	public Map<String, Object> findResourceMap(String userId);

	
	public List<MenuDto> getPageAll(PageEasyui pe, MenuDto dto);

	
	public JSONObject saveUser(MenuDto dto);

	public List<MenuDto> getRootMenu();
	
	/**
	 * 根据用户信息查询分页信息
	 * @param userQueryDTO
	 * @return
	 */
//	public PageModel<Resource> queryUserPage(UserQueryDTO userQueryDTO);
	
}
