package tk.licer.DAO;

import java.util.List;

import tk.licer.DTO.AccountDTO;
import tk.licer.model.Account;
import tk.licer.model.page.Page;

/**
 * 账户数据访问接口
 * 
 * @author Administrator
 * 
 */
public interface AccountDAO {

	/**
	 * 查找所有
	 * 
	 * @return
	 */
	public List<Account> findAll(AccountDTO dto);

	/**
	 * 分页查找
	 * 
	 * @return
	 */
	public List<Account> findPageAll(final Page page, final AccountDTO dto);

	/**
	 * 查找get
	 * 
	 * @return
	 */
	public Account getById(Integer accountId);
	
	/**
	 * 查找load
	 * 
	 * @return
	 */
	public Account loadById(Integer accountId);

	/**
	 * 保存一个账户
	 * 
	 * @param Account
	 */
	public void save(Account account);

	/**
	 * 批量保存账户
	 * 
	 * @param Account
	 */
	public void batchSave(List<Account> accounts);

	/**
	 * 删除一个账户
	 * 
	 * @param Account
	 */
	public void delete(Account account);

	/**
	 * 批量删除账户
	 * 
	 * @param Account
	 */
	public void batchDelete(List<Account> accounts);

	/**
	 * 获取账户总数
	 * 
	 * @return
	 */
	public long getTotalNum(AccountDTO dto);

}
