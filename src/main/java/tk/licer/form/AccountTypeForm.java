package tk.licer.form;

import java.io.Serializable;

/**
 * RoleForm 
 * 
 * 负责接收页面参数,或将结果返回页面
 * 字段应与画面属性保持一致
 * 
 * @author liwc
 * 
 */
public class AccountTypeForm implements Serializable{

	
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
	private String accountInfoPageFlag; 
	
	/**
	 * 类别id
	 */
	private Integer accountTypeId;
	
	/**
	 * 类别编号
	 */
	private String accountTypeCode;
	
	/**
	 * 类别名称
	 */
	private String accountTypeName;

	
	public String getAccountInfoPageFlag() {
		return accountInfoPageFlag;
	}

	public void setAccountInfoPageFlag(String accountInfoPageFlag) {
		this.accountInfoPageFlag = accountInfoPageFlag;
	}

	public Integer getAccountTypeId() {
		return this.accountTypeId;
	}

	public void setAccountTypeId(Integer accountTypeId) {
		this.accountTypeId = accountTypeId;
	}

	public String getAccountTypeCode() {
		return this.accountTypeCode;
	}

	public void setAccountTypeCode(String accountTypeCode) {
		this.accountTypeCode = accountTypeCode;
	}

	public String getAccountTypeName() {
		return this.accountTypeName;
	}

	public void setAccountTypeName(String accountTypeName) {
		this.accountTypeName = accountTypeName;
	}

}
