package tk.licer.service;

import java.util.List;

import net.sf.json.JSONObject;

import tk.licer.DTO.RoleDTO;
import tk.licer.model.Role;
import tk.licer.model.page.PageEasyui;

/**
 * 角色逻辑处理接口
 * @author Administrator
 *
 */
public interface RoleService {

	
	/**
	 * 查找所有角色
	 * @return
	 */
	public List<Role> getRoleList();
	
	/**
	 * 分页查找所有角色
	 * @return
	 */
	public List<Role> getPageRoleList(PageEasyui page, RoleDTO dto);
	
	/**
	 * 查找一个角色
	 * @return
	 */
	public Role getRoleById(Integer roleId);
	
	/**
	 * 查找一个角色
	 * @return
	 */
	public Role getRoleById(String roleId);
	
	/**
	 * 新增一个角色
	 * @param role
	 * @return 
	 */
	public JSONObject addRole(Role role);
	
	/**
	 * 批量添加角色
	 * @param Role
	 */
	public JSONObject batchAddRole(List<Role> roles);
	
	/**
	 * 修改一个角色
	 * @param role
	 */
	public JSONObject editRole(Role role);
	
	/**
	 * 批量修改角色
	 * @param role
	 */
	public JSONObject batchEditRole(List<Role> roles);
	
	
	/**
	 * 删除一个角色
	 * @param role
	 */
	public JSONObject deleteRole(Integer roleId);
	
	/**
	 * 删除一个角色
	 * @param role
	 */
	public JSONObject deleteRole(Role role);
	
	/**
	 * 批量删除角色
	 * @param Role
	 */
	public JSONObject batchDeleteRole(List<Integer> roleIds);
	
	/**
	 * 获取角色总数
	 * @return
	 */
	public long getRoleTotalNum();

	
}
