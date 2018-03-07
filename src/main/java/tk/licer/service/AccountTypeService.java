package tk.licer.service;

import java.util.List;

import net.sf.json.JSONObject;
import tk.licer.DTO.AccountTypeDTO;
import tk.licer.model.page.PageEasyui;

/**
 * 账户类型逻辑处理接口
 * @author Administrator
 *
 */
public interface AccountTypeService {

	
	/**
	 * 查找所有
	 * @return
	 */
	public List<AccountTypeDTO> getAllAccountType(AccountTypeDTO dto);
	
	/**
	 * 分页查找
	 * @return
	 */
	public List<AccountTypeDTO> getPageAllAccountType(PageEasyui page, AccountTypeDTO dto);
	
	/**
	 * 查找一个账户类型
	 * @return
	 */
	public AccountTypeDTO getAccountTypeById(Integer accountTypeId);
	
	
	/**
	 * 新增一个账户类型
	 * @param accountType
	 * @return 
	 */
	public JSONObject addAccountType(AccountTypeDTO accountType);
	
	/**
	 * 批量添加账户类型
	 * @param AccountType
	 */
	public JSONObject batchAddAccountType(List<AccountTypeDTO> accountTypes);
	
	/**
	 * 修改一个账户类型
	 * @param accountType
	 */
	public JSONObject editAccountType(AccountTypeDTO accountType);
	
	/**
	 * 批量修改账户类型
	 * @param accountType
	 */
	public JSONObject batchEditAccountType(List<AccountTypeDTO> accountTypes);
	
	
	/**
	 * 删除一个账户类型
	 * @param accountType
	 */
	public JSONObject deleteAccountType(Integer accountTypeId);
	
	/**
	 * 删除一个账户类型
	 * @param accountType
	 */
	public JSONObject deleteAccountType(AccountTypeDTO accountType);
	
	/**
	 * 批量删除账户类型
	 * @param AccountType
	 */
	public JSONObject batchDeleteAccountType(List<Integer> accountTypeIds);
	
	/**
	 * 获取账户类型总数
	 * @return
	 */
	public long getAllAccountTypeNum();

}
