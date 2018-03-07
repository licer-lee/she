package tk.licer.DTO;

import java.io.Serializable;

/**
 * RoleDTO 
 * 
 * 数据传输对象,负责逻辑处理计算
 * 
 * @author liwc
 * 
 */
public class AccountTypeDTO implements Serializable {

	private static final long serialVersionUID = -2591240001174669331L;

	// --------------检索条件-------------------------------
	private String search_account_type_code;
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

	// -------------------------实体数据-----------------------
	// flag: add/edit
	private String accountInfoPageFlag; 
	private Integer accountTypeId;
	private String accountTypeCode;
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
