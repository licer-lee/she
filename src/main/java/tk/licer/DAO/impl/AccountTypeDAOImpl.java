package tk.licer.DAO.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tk.licer.DAO.AccountTypeDAO;
import tk.licer.DTO.AccountTypeDTO;
import tk.licer.constant.Constant;
import tk.licer.model.AccountType;
import tk.licer.model.page.Page;
import tk.licer.util.ObjectUtil;

/**
 * 账户类型数据访问实现类
 * 
 * @author Administrator
 * 
 */
@Repository
public class AccountTypeDAOImpl implements AccountTypeDAO {

	// log
	private static final Log log = LogFactory.getLog(AccountTypeDAOImpl.class);

	// hibernate模板对象
	@Autowired
	private HibernateTemplate hibernateTemplate;

	/**
	 * 查询所有账户类型
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AccountType> findAll(AccountTypeDTO dto) {

		DetachedCriteria dcrit = DetachedCriteria.forClass(AccountType.class,
				"at");
		if (!ObjectUtil.isEmpty(dto)) {
			// 查询条件
			if (!ObjectUtil.isEmpty(dto.getSearch_account_type_code())) {
				dcrit.add(Restrictions.eq("at.accountTypeCode",
						dto.getSearch_account_type_code()));
			}
			if (!ObjectUtil.isEmpty(dto.getSearch_account_type_name())) {
				dcrit.add(Restrictions.like("at.accountTypeName",
						"%" + dto.getSearch_account_type_name() + "%"));
			}
		}
		List<AccountType> accountTypes = (List<tk.licer.model.AccountType>) hibernateTemplate
				.findByCriteria(dcrit);

		return accountTypes;
	}

	/**
	 * 分页查询
	 * 
	 * @param page
	 * @param dto
	 * @return
	 */
	@Override
	public List<AccountType> findPageAll(final Page page,
			final AccountTypeDTO dto) {

		List<AccountType> accountTypes = new ArrayList<AccountType>();

		try {
			accountTypes = hibernateTemplate
					.executeWithNativeSession(new HibernateCallback<List<AccountType>>() {

						@SuppressWarnings("unchecked")
						@Override
						public List<AccountType> doInHibernate(Session session)
								throws HibernateException {

							// 创建查询对象
							Criteria crit = session
									.createCriteria(AccountType.class);

							// 查询条件
							if (!ObjectUtil.isEmpty(dto
									.getSearch_account_type_code())) {
								crit.add(Restrictions.eq("accountTypeCode",
										dto.getSearch_account_type_code()));
							}
							if (!ObjectUtil.isEmpty(dto
									.getSearch_account_type_name())) {
								crit.add(Restrictions.like("accountTypeName",
										"%" + dto.getSearch_account_type_name()
												+ "%"));
							}
							// 排序( TODO)
							if ("asc".equals(page.getOrder())) {
								crit.addOrder(Order.asc(page.getSort()));
							} else {
								crit.addOrder(Order.desc(page.getSort()));
							}
							crit.setFirstResult(page.getBeginIndex());
							crit.setMaxResults(page.getPageSize());
							return crit.list();
						}
					});
		} catch (Exception e) {
			log.warn(e);
		}
		return accountTypes;
	}

	/**
	 * 按账户类型Id查询账户类型信息
	 */
	@Override
	public AccountType loadById(int accountTypeId) {

		// load方法可以实现延迟加载
		AccountType accountType = hibernateTemplate.load(AccountType.class,
				accountTypeId);
		return accountType;
	}

	/**
	 * 按账户类型Id查询账户类型信息
	 */
	@Override
	public AccountType getById(int accountTypeId) {

		AccountType accountType = hibernateTemplate.get(AccountType.class,
				accountTypeId);
		return accountType;
	}

	/**
	 * 
	 */
	@Override
	public void save(AccountType accountType) {

		log.info("保存账户类型开始!");
		try {
			hibernateTemplate.saveOrUpdate(accountType);

		} catch (HibernateException ex) {

			log.warn("保存账户类型失败!");
		}
	}

	@Override
	public void batchSave(List<AccountType> accountTypes) {

		log.info("批量保存账户类型开始!");
		try {

			for (AccountType accountType : accountTypes) {
				hibernateTemplate.saveOrUpdate(accountType);
			}
		} catch (HibernateException ex) {

			log.warn("保存账户类型失败!", ex);
		}
	}

	@Override
	public void delete(AccountType accountType) {

		try {
			hibernateTemplate.delete(accountType);
		} catch (Exception e) {
			log.warn(e);
		}
	}

	@Override
	public void batchDelete(List<AccountType> accountTypes) {
		log.info("批量删除账户类型开始!");
		try {
			for (AccountType accountType : accountTypes) {
				hibernateTemplate.delete(accountType);
			}
		} catch (HibernateException ex) {

			log.warn("删除账户类型失败!", ex);
		}
	}

	/**
	 * 查询总数
	 */
	@Override
	public long getTotalNum(AccountTypeDTO dto) {

		return findAll(dto).size();
	}


}
