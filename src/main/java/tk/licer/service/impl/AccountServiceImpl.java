package tk.licer.service.impl;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.licer.DAO.AccountDAO;
import tk.licer.DAO.AccountTypeDAO;
import tk.licer.DTO.AccountDTO;
import tk.licer.model.Account;
import tk.licer.model.page.Page;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.AccountService;
import tk.licer.util.ObjectUtil;
import tk.licer.util.PageUtil;

/**
 * 账户逻辑实现类 功能:处理账户业务逻辑
 * 
 * @author liwc
 * 
 */
@Service
public class AccountServiceImpl implements AccountService {

	// log
	private static final Log log = LogFactory.getLog(AccountServiceImpl.class);

	// 账户DAO
	@Autowired
	private AccountDAO DAO;

	@Autowired
	private AccountTypeDAO typeDAO;

	/**
	 * 获取所有
	 */
	@Override
	public List<AccountDTO> getAllAccount(AccountDTO dto) {

		List<AccountDTO> dtos = new ArrayList<AccountDTO>();

		List<Account> accounts = DAO.findAll(dto);
		AccountDTO tempdto = null;
		for (int i = 0, len = accounts.size(); i < len; i++) {
			tempdto = new AccountDTO();
			BeanUtils.copyProperties((Account) accounts.get(i), tempdto);
			dtos.add(tempdto);
		}
		return dtos;
	}

	/**
	 * 分页查询
	 */
	@Override
	public List<AccountDTO> getPageAllAccount(PageEasyui pe, AccountDTO dto) {

		//获取总数
		pe.setTotalCount(getAllAccount(dto).size());
		List<Account> accounts = DAO.findPageAll(PageUtil.createPage(pe), dto);

		List<AccountDTO> DTOs = new ArrayList<AccountDTO>();
		AccountDTO temp = null;
		for (Account account : accounts) {

			temp = new AccountDTO();
			BeanUtils.copyProperties(account, temp);
			DTOs.add(temp);
		}
		return DTOs;
	}

	/**
	 * get by id
	 */
	@Override
	public AccountDTO getAccountById(Integer accountId) {

		AccountDTO dto = new AccountDTO();
		if (!ObjectUtil.isEmpty(accountId)) {
			BeanUtils.copyProperties(DAO.getById(accountId), dto);
		}
		return dto;
	}

	@Override
	public AccountDTO loadAccountById(Integer accountId) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 新增账户
	 */
	@Override
	public JSONObject addAccount(AccountDTO dto) {

		Account model = new Account();
		BeanUtils.copyProperties(dto, model);

		log.info("新增账户");
		try {
			// 新增前检查
			JSONObject chkmsg = new JSONObject();
			chkmsg = this.checkBeforAdd(dto);
			if (ObjectUtil.isEmpty(chkmsg)) {

				DAO.save(model);

				String msg = "";
				if("edit".equals(dto.getAccount_info_page_flag())){
					msg = "修改成功";
				}else{
					msg = "新增成功";
				}
				chkmsg.put("flag", true);
				chkmsg.put("respCode", 100);
				chkmsg.put("msg", msg);
			}
			return chkmsg;
		} catch (Exception e) {
			log.warn(e);
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 业务检查
	 * 
	 * @param account
	 * @return
	 */
	private JSONObject checkBeforAdd(AccountDTO account) {
		// TODO
		return new JSONObject();
	}

	@Override
	public JSONObject batchAddAccount(List<AccountDTO> accounts) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject editAccount(AccountDTO account) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject batchEditAccount(List<AccountDTO> accounts) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject deleteAccount(Integer accountId) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject batchDeleteAccount(List<Integer> accountIds) {
		return null;
		// TODO Auto-generated method stub

	}

	/**
	 * 获取账户总数
	 */
	@Override
	public long getAllAccountNum(AccountDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 删除账户
	 */
	@Override
	public JSONObject deleteAccount(AccountDTO dto) {

		Account account = new Account();
		BeanUtils.copyProperties(dto, account);
		

		JSONObject msg = new JSONObject();
		msg = checkBeforDelete(dto);

		if (ObjectUtil.isEmpty(msg)) {

			DAO.delete(account);
			msg.put("flag", true);
			msg.put("respCode", 100);
			msg.put("msg", "删除成功");
		}
		return msg;
	}

	/**
	 * 删除操作业务检查
	 * 
	 * @param account
	 * @return
	 */
	private JSONObject checkBeforDelete(AccountDTO account) {

		// TODO
		return new JSONObject();
	}

}
