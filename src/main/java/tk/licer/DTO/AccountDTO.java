package tk.licer.DTO;

import tk.licer.model.AccountType;

/**
 * 数据传输对象,用户逻辑处理数据传输
 * 
 * @author Administrator
 * 
 */
public class AccountDTO {

	// ------------------------查询条件----------------------

	private Integer search_account_type_id;
	private String search_account_code;
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

	// ------------------------model----------------------
	private String account_info_page_flag; 
	private Integer accountId;
	private AccountType accountType;
	private String account;
	private String password;
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
