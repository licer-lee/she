package tk.licer.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.licer.DAO.RoleDAO;
import tk.licer.DTO.RoleDTO;
import tk.licer.model.Role;
import tk.licer.model.page.Page;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.RoleService;
import tk.licer.util.ObjectUtil;
import tk.licer.util.PageUtil;

/**
 * 角色逻辑实现类
 * 功能:处理角色业务逻辑
 * @author liwc
 * 
 */
@Service
public class RoleServiceImpl implements RoleService {

	// log
	private static final Log log = LogFactory.getLog(RoleServiceImpl.class);
	
	//角色DAO
	@Autowired
	private RoleDAO roleDAO;

	
	/**
	 * 获取所有角色
	 */
	@Override
	public List<Role> getRoleList() {

		return roleDAO.findAll();
	}

	/**
	 * 
	 */
	@Override
	public Role getRoleById(Integer roleId) {

		return roleDAO.findById(roleId);
	}

	/**
	 * 新增角色
	 */
	@Override
	public JSONObject addRole(Role role) {
		
		log.info("新增角色");
		try {
			// 新增前检查
			JSONObject msg = new JSONObject();
			msg = this.checkBeforAdd(role);
			if (ObjectUtil.isEmpty(msg)) {

				roleDAO.save(role);

				msg.put("flag", true);
				msg.put("respCode", 100);
				msg.put("msg", "新增成功");
			}
			return msg;
		} catch (Exception e) {
			// TODO: handle exception
			log.warn(e);
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 业务检查
	 * 
	 * @param role
	 * @return
	 */
	private JSONObject checkBeforAdd(Role role) {
		// TODO
		return new JSONObject();
	}

	@Override
	public JSONObject batchAddRole(List<Role> roles) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject editRole(Role role) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject batchEditRole(List<Role> roles) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject deleteRole(Integer roleId) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject batchDeleteRole(List<Integer> roleIds) {
		return null;
		// TODO Auto-generated method stub

	}

	/**
	 * 获取角色总数
	 */
	@Override
	public long getRoleTotalNum() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 
	 */
	@Override
	public Role getRoleById(String roleId) {
		
		Role role = new Role();
		try {
			if (!ObjectUtil.isEmpty(roleId)) {
				role = getRoleById(Integer.parseInt(roleId));
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.warn(e);
		}
		return role;
	}

	/**
	 * 删除角色
	 */
	@Override
	public JSONObject deleteRole(Role role) {
		
		JSONObject msg = new JSONObject();
		msg = checkBeforDelete(role);
		
		if(ObjectUtil.isEmpty(msg)){
			
			roleDAO.delete(role);
			msg.put("flag", true);
			msg.put("respCode", 100);
			msg.put("msg", "删除成功");
		}
		
		return msg;
	}
	
	
	/**
	 * 删除操作业务检查
	 * @param role
	 * @return
	 */
	private JSONObject checkBeforDelete(Role role){
		
		//TODO 
		return new JSONObject();
	}

	
	
	@Override
	public List<Role> getPageRoleList(PageEasyui pe, RoleDTO dto) {
		
		//获取总记录数
		pe.setTotalCount(getRoleList().size());
		//创建分页对象
		Page page = PageUtil.createPage(pe);
		
		return roleDAO.findPageAll(page, dto);
	}

}
