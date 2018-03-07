package tk.licer.service;

import java.util.List;

import net.sf.json.JSONObject;
import tk.licer.DTO.AccountDTO;
import tk.licer.model.page.PageEasyui;

/**
 * 账户逻辑处理接口
 * 
 * @author Administrator
 * 
 */
public interface AccountService {

	
	/**
	 * 查找所有
	 * 
	 * @return
	 */
	public List<AccountDTO> getAllAccount(AccountDTO dto);

	/**
	 * 分页查找
	 * 
	 * @return
	 */
	public List<AccountDTO> getPageAllAccount(PageEasyui pe, AccountDTO dto);

	/**
	 * 查找一个账户
	 * 
	 * @return
	 */
	public AccountDTO getAccountById(Integer accountId);
	
	/**
	 * 查找一个账户load
	 * 
	 * @return
	 */
	public AccountDTO loadAccountById(Integer accountId);

	/**
	 * 新增一个账户
	 * 
	 * @param account
	 * @return
	 */
	public JSONObject addAccount(AccountDTO account);

	/**
	 * 批量添加账户
	 * 
	 * @param AccountDTO
	 */
	public JSONObject batchAddAccount(List<AccountDTO> accounts);

	/**
	 * 修改一个账户
	 * 
	 * @param account
	 */
	public JSONObject editAccount(AccountDTO account);

	/**
	 * 批量修改账户
	 * 
	 * @param account
	 */
	public JSONObject batchEditAccount(List<AccountDTO> accounts);

	/**
	 * 删除一个账户
	 * 
	 * @param account
	 */
	public JSONObject deleteAccount(Integer accountId);

	/**
	 * 删除一个账户
	 * 
	 * @param account
	 */
	public JSONObject deleteAccount(AccountDTO account);

	/**
	 * 批量删除账户
	 * 
	 * @param AccountDTO
	 */
	public JSONObject batchDeleteAccount(List<Integer> accountIds);

	/**
	 * 获取账户总数
	 * 
	 * @return
	 */
	public long getAllAccountNum(AccountDTO dto);

}
