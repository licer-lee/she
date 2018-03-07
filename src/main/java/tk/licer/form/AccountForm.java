package tk.licer.form;

import java.io.Serializable;

import tk.licer.model.AccountType;

/**
 * RoleForm 负责接收页面参数,处理结束返回页面.
 * 
 * @author Administrator
 * 
 */
public class AccountForm implements Serializable{
	
	
	//--------------------search---------------------------
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 检索:账户类别id
	 */
	private Integer search_account_type_id;
	
	/**
	 * 检索:账户
	 */
	private String search_account_code;
	/**
	 * 检索:备注
	 */
	private String search_account_note;
	
	public Integer getSearch_account_type_id() {
		return search_account_type_id;
	}

	public void setSearch_account_type_id(Integer search_account_type_id) {
		this.search_account_type_id = search_account_type_id;
	}

	public String getSearch_account_code() {
		return search_account_code;
	}

	public void setSearch_account_code(String search_account_code) {
		this.search_account_code = search_account_code;
	}

	public String getSearch_account_note() {
		return search_account_note;
	}

	public void setSearch_account_note(String search_account_note) {
		this.search_account_note = search_account_note;
	}

	//-------------------------model-----------------------
	
	/**
	 * 页面flag
	 */
	private String account_info_page_flag;
	
	/**
	 * 账户id
	 */
	private Integer accountId;
	
	/**
	 * 账户类别
	 */
	private AccountType accountType;
	
	/**
	 * 账户
	 */
	private String account;
	
	/**
	 * pwd
	 */
	private String password;
	
	/**
	 * 备注
	 */
	private String note;

	public String getAccount_info_page_flag() {
		return account_info_page_flag;
	}

	public void setAccount_info_page_flag(String account_info_page_flag) {
		this.account_info_page_flag = account_info_page_flag;
	}

	public Integer getAccountId() {
		return this.accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public AccountType getAccountType() {
		return this.accountType;
	}

	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
