package tk.licer.DAO;

import java.util.List;

import tk.licer.DTO.RoleDTO;
import tk.licer.model.Role;
import tk.licer.model.page.Page;

/**
 * 角色数据访问接口
 * @author Administrator
 *
 */
public interface RoleDAO {

	
	/**
	 * 查找所有角色
	 * @return
	 */
	public List<Role> findAll();
	
	/**
	 * 分页查找所有角色
	 * @return
	 */
	public List<Role> findPageAll(final Page page, final RoleDTO dto);
	
	/**
	 * 按PK查找角色
	 * @return
	 */
	public Role findById(Integer roleId);
	
	/**
	 * 保存一个角色
	 * @param Role
	 */
	public void save(Role role);
	
	/**
	 * 批量保存角色
	 * @param Role
	 */
	public void batchSave(List<Role> roles);
	
	/**
	 * 删除一个角色
	 * @param Role
	 */
	public void delete(Role role);
	
	/**
	 * 批量删除角色
	 * @param Role
	 */
	public void batchDelete(List<Role> roles);
	
	/**
	 * 获取角色总数
	 * @return
	 */
	public long getTotalNum();
	
}
