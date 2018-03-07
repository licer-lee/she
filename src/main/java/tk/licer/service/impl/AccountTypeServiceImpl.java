package tk.licer.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.licer.DAO.AccountTypeDAO;
import tk.licer.DTO.AccountTypeDTO;
import tk.licer.model.AccountType;
import tk.licer.model.page.Page;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.AccountTypeService;
import tk.licer.util.BeanUtil;
import tk.licer.util.ObjectUtil;
import tk.licer.util.PageUtil;

/**
 * 账户类型逻辑实现类 
 * 
 * 功能:处理账户类型业务逻辑
 *		统一返回dto类型数据
 * 
 * @author liwc
 * 
 */
@Service
public class AccountTypeServiceImpl implements AccountTypeService {

	// log
	private static final Log log = LogFactory
			.getLog(AccountTypeServiceImpl.class);

	// 账户类型DAO
	@Autowired
	private AccountTypeDAO DAO;

	/**
	 * 获取所有
	 */
	@Override
	public List<AccountTypeDTO> getAllAccountType(AccountTypeDTO dto) {

		List<AccountTypeDTO> dtos = new ArrayList<AccountTypeDTO>();
		List<AccountType> model_list = DAO.findAll(dto);
		
		AccountTypeDTO tempdto = null;
		for (int i=0,len=model_list.size(); i<len; i++) {
			tempdto = new AccountTypeDTO();
			BeanUtils.copyProperties((AccountType)model_list.get(i), tempdto);
			dtos.add(tempdto);
		}
		return dtos;
	}

	/**
	 * 分页查询
	 */
	@Override
	public List<AccountTypeDTO> getPageAllAccountType(PageEasyui pe,
			AccountTypeDTO dto) {

		// 获取总记录数
		pe.setTotalCount(getAllAccountType(dto).size());
		// 创建分页对象
		Page page = PageUtil.createPage(pe);

		List<AccountType> list = DAO.findPageAll(page, dto);
		List<AccountTypeDTO> dtos = new ArrayList<AccountTypeDTO>();
		
		AccountTypeDTO tempdto = null;
		for (int i=0,len=list.size(); i<len; i++) {
			tempdto = new AccountTypeDTO();
			BeanUtils.copyProperties((AccountType)list.get(i), tempdto);
			dtos.add(tempdto);
		}
		return dtos;
	}
	
	/**
	 * id查询
	 */
	@Override
	public AccountTypeDTO getAccountTypeById(Integer accountTypeId) {
		
		AccountTypeDTO dto = new AccountTypeDTO();
		if(!ObjectUtil.isEmpty(accountTypeId)){
			BeanUtils.copyProperties(DAO.getById(accountTypeId), dto);
		}else{
			dto.setAccountTypeId(null);
		}
		return dto;
	}
	
	/**
	 * id查询load
	 */
	public AccountTypeDTO loadAccountTypeById(Integer accountTypeId) {

		AccountTypeDTO dto = new AccountTypeDTO();
		BeanUtils.copyProperties(DAO.loadById(accountTypeId), dto);
		return dto;
	}

	/**
	 * 保存
	 */
	@Override
	public JSONObject addAccountType(AccountTypeDTO dto) {

		log.info("新增账户类型");
		
		try {
			
			//dto -->model
			AccountType accountType = new AccountType();
			BeanUtils.copyProperties(dto, accountType);
			
			// 新增前检查
			JSONObject msg = new JSONObject();
			msg = this.checkBeforAdd(dto);
			if (ObjectUtil.isEmpty(msg)) {

				DAO.save(accountType);

				msg.put("flag", true);
				msg.put("respCode", 100);
				if(dto.getAccountInfoPageFlag().trim().equals("add"))
					msg.put("msg", "新增成功");
				else if(dto.getAccountInfoPageFlag().trim().equals("edit"))
					msg.put("msg", "修改成功");
			}
			return msg;
		} catch (Exception e) {
			log.warn(e);
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 业务检查
	 * 
	 * @param accountType
	 * @return
	 */
	private JSONObject checkBeforAdd(AccountTypeDTO accountType) {
		// TODO
		
		return new JSONObject();
	}

	@Override
	public JSONObject batchAddAccountType(List<AccountTypeDTO> accountTypes) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject editAccountType(AccountTypeDTO accountType) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject batchEditAccountType(List<AccountTypeDTO> accountTypes) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject deleteAccountType(Integer accountTypeId) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject batchDeleteAccountType(List<Integer> accountTypeIds) {
		return null;
		// TODO Auto-generated method stub

	}

	/**
	 * 获取总数
	 */
	@Override
	public long getAllAccountTypeNum() {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	

	/**
	 * 删除账户类型
	 */
	@Override
	public JSONObject deleteAccountType(AccountTypeDTO dto) {

		JSONObject msg = new JSONObject();
		msg = checkBeforDelete(dto);

		if (ObjectUtil.isEmpty(msg)) {
			AccountType accountType = new AccountType();
			BeanUtils.copyProperties(dto, accountType);
			
			DAO.delete(accountType);
			msg.put("flag", true);
			msg.put("respCode", 100);
			msg.put("msg", "删除成功");
		}
		return msg;
	}

	/**
	 * 删除操作业务检查
	 * 
	 * @param accountType
	 * @return
	 */
	private JSONObject checkBeforDelete(AccountTypeDTO dto) {

		// TODO
		return new JSONObject();
	}

	
}
