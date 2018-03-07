package tk.licer.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 账户类型
 * @author liwc
 *
 */
@Entity
@SequenceGenerator(name="id_seq", sequenceName="PK_ID_SEQUENCE", allocationSize=1 )
@Table(name="account_type")
public class AccountType implements java.io.Serializable {

	private static final long serialVersionUID = -4206307829987340971L;
	
	private Integer accountTypeId;
	private String accountTypeCode;
	private String accountTypeName;
//	private Set<Account> accounts = new HashSet<Account>(0);
	
	/** default constructor */
	public AccountType() {
	}
	/** full constructor */
	public AccountType(String accountTypeCode, String accountTypeName) {
		this.accountTypeCode = accountTypeCode;
		this.accountTypeName = accountTypeName;
	}

	@Id
//	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="id_seq")
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ACCOUNT_TYPE_ID", unique = true, nullable = false)
	public Integer getAccountTypeId() {
		return this.accountTypeId;
	}
	public void setAccountTypeId(Integer accountTypeId) {
		this.accountTypeId = accountTypeId;
	}

	@Column(name = "ACCOUNT_TYPE_CODE", nullable = false, length = 20)
	public String getAccountTypeCode() {
		return this.accountTypeCode;
	}
	public void setAccountTypeCode(String accountTypeCode) {
		this.accountTypeCode = accountTypeCode;
	}

	@Column(name = "ACCOUNT_TYPE_NAME", nullable = false, length = 100)
	public String getAccountTypeName() {
		return this.accountTypeName;
	}
	public void setAccountTypeName(String accountTypeName) {
		this.accountTypeName = accountTypeName;
	}

//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "accountType")
//	public Set<Account> getAccounts() {
//		return this.accounts;
//	}
//	public void setAccounts(Set<Account> accounts) {
//		this.accounts = accounts;
//	}
}