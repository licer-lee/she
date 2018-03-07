package tk.licer.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


/**
 * 
 * 类名：Account.java
 * @title:
 * @decription: 
 * 
 * 基于ssh+shiro搭建的权限demo
 * @author: liwc
 * @mail: licerlee@gmail.com
 * @date 2017年11月28日 下午9:20:36
 */

@Entity
@SequenceGenerator(name="id_seq", sequenceName="PK_ID_SEQUENCE", allocationSize=1 )
@Table(name="account")
public class Account implements java.io.Serializable {


	private static final long serialVersionUID = -9142423440508696905L;
	
	private Integer accountId;
	private AccountType accountType;
	private String account;
	private String password;
	private String note;


	/** default constructor */
	public Account() {
	}

	/** minimal constructor */
	public Account(String account, String password) {
		this.account = account;
		this.password = password;
	}

	/** full constructor */
	public Account(AccountType accountType, String account, String password,
			String note) {
		this.accountType = accountType;
		this.account = account;
		this.password = password;
		this.note = note;
	}

	@Id
//	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="id_seq")
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ACCOUNT_ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Integer getAccountId() {
		return this.accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACCOUNT_TYPE_ID")
	public AccountType getAccountType() {
		return this.accountType;
	}
	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}

	@Column(name = "ACCOUNT", nullable = false, length = 1024)
	public String getAccount() {
		return this.account;
	}
	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "PASSWORD", nullable = false, length = 1024)
	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "NOTE", length = 1024)
	public String getNote() {
		return this.note;
	}
	public void setNote(String note) {
		this.note = note;
	}

}