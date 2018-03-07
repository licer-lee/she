package tk.licer.DAO;

import java.util.List;

import tk.licer.DTO.AccountTypeDTO;
import tk.licer.model.AccountType;
import tk.licer.model.page.Page;

/**
 * 账户类型数据访问接口
 * 
 * @author Administrator
 * 
 */
public interface AccountTypeDAO {

	/**
	 * 查找所有账户类型
	 * @param dto 
	 * 
	 * @return
	 */
	public List<AccountType> findAll(AccountTypeDTO dto);
	
	/**
	 * 分页查找所有账户类型
	 * 
	 * @return
	 */
	public List<AccountType> findPageAll(final Page page,
			final AccountTypeDTO dto);

	/**
	 * 按PK查找账户类型
	 * 
	 * @return
	 */
	public AccountType getById(int accountTypeId);
	
	/**
	 * 按PK查找账户类型
	 * 
	 * @return
	 */
	public AccountType loadById(int accountTypeId);

	/**
	 * 保存一个账户类型
	 * 
	 * @param AccountType
	 */
	public void save(AccountType accountType);

	/**
	 * 批量保存账户类型
	 * 
	 * @param AccountType
	 */
	public void batchSave(List<AccountType> accountTypes);

	/**
	 * 删除一个账户类型
	 * 
	 * @param AccountType
	 */
	public void delete(AccountType accountType);

	/**
	 * 批量删除账户类型
	 * 
	 * @param AccountType
	 */
	public void batchDelete(List<AccountType> accountTypes);

	/**
	 * 获取账户类型总数
	 * 
	 * @return
	 */
	public long getTotalNum(AccountTypeDTO dto);
	
}
