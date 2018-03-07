package tk.licer.form;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import tk.licer.model.Role;

/**
 * RoleForm 
 * 
 * 负责接收页面参数,或将结果返回页面
 * 字段应与画面属性保持一致
 * 
 * @author liwc
 * 
 */
public class UserForm implements Serializable{

	
	private static final long serialVersionUID = 8805431035637831211L;
	
	//--------------检索条件-------------------------------
	
	/**
	 * 检索:类别编号
	 */
	private String search_account_type_code;
	
	/**
	 * 检索:类别名称
	 */
	private String search_account_type_name;
	
	public String getSearch_account_type_code() {
		return search_account_type_code;
	}

	public void setSearch_account_type_code(String search_account_type_code) {
		this.search_account_type_code = search_account_type_code;
	}

	public String getSearch_account_type_name() {
		return search_account_type_name;
	}

	public void setSearch_account_type_name(String search_account_type_name) {
		this.search_account_type_name = search_account_type_name;
	}

	//-------------------------实体数据----------------------- 
	
	/**
	 * flag: add/edit
	 */
	private String userPageFlag; 
	


	private String id;
	
	private String username;
	
	private String name;
	
	private String mobile;
	
	private String roleNames;
	
	private Integer status;
	
	private String realName;					//真实姓名
	
	private Set<Role> roles;					//拥有角色
	
	/**
	 * 创建日期
	 */
	protected Date createDate;
	/**
	 * 修改日期
	 */
	protected Date updateDate;
	
	
	
	
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUserPageFlag() {
		return userPageFlag;
	}

	public void setUserPageFlag(String userPageFlag) {
		this.userPageFlag = userPageFlag;
	}
	


}
