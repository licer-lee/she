package tk.licer.DTO;

/**
 * RoleDTO
 * 负责从form取得数据,进行业务逻辑计算,进而传递给model
 * @author Administrator
 *
 */
public class VisitorDTO {

	/**
	 * 角色ID
	 */
	private Integer roleId;

	/**
	 * 角色编号
	 */
	private String roleCode;

	/**
	 * 角色名称
	 */
	private String roleName;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
}
