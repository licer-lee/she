package tk.licer.DAO.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tk.licer.DAO.AccountDAO;
import tk.licer.DTO.AccountDTO;
import tk.licer.model.Account;
import tk.licer.model.page.Page;
import tk.licer.util.ObjectUtil;

/**
 * 账户数据访问实现类
 * 
 * @author Administrator
 * 
 */
@Repository
public class AccountDAOImpl implements AccountDAO {

	// log
	private static final Log log = LogFactory.getLog(AccountDAOImpl.class);

	// hibernate模板对象
	@Autowired
	private HibernateTemplate hibernateTemplate;

	/**
	 * 查询所有
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Account> findAll(AccountDTO dto) {

		//离线查询器对象(创建不依赖session)
		DetachedCriteria dcrit = DetachedCriteria.forClass(Account.class);

		// 查询条件
		if (!ObjectUtil.isEmpty(dto.getSearch_account_type_id())) {
			// 关联外键查询
			dcrit.createAlias("accountType", "at");
			dcrit.add(Restrictions.eq("at.accountTypeId",
					dto.getSearch_account_type_id()));
		}
		if (!ObjectUtil.isEmpty(dto.getSearch_account_code())) {
			dcrit.add(Restrictions.like("account",
					"%" +dto.getSearch_account_code()+ "%"));
		}
		if (!ObjectUtil.isEmpty(dto.getSearch_account_note())) {
			dcrit.add(Restrictions.like("note",
					"%" + dto.getSearch_account_note() + "%"));
		}

		List<Account> accounts = (List<Account>) hibernateTemplate
				.findByCriteria(dcrit);
		return accounts;
	}

	/**
	 * 分页查询
	 */
	@Override
	public List<Account> findPageAll(final Page page, final AccountDTO dto) {

		List<Account> accounts = new ArrayList<Account>();
		try {
			accounts = hibernateTemplate
					.executeWithNativeSession(new HibernateCallback<List<Account>>() {

						@SuppressWarnings("unchecked")
						@Override
						public List<Account> doInHibernate(Session session)
								throws HibernateException {

							//查询器(创建依赖session)
							Criteria crit = session
									.createCriteria(Account.class);

							// 查询条件
							if (!ObjectUtil.isEmpty(dto
									.getSearch_account_type_id())) {
								// 关联外键查询
								crit.createAlias("accountType", "at");
								crit.add(Restrictions.eq("at.accountTypeId",
										dto.getSearch_account_type_id()));
							}
							if (!ObjectUtil.isEmpty(dto
									.getSearch_account_code())) {
								crit.add(Restrictions.like("account",
										"%" +dto.getSearch_account_code()+ "%"));
							}
							if (!ObjectUtil.isEmpty(dto
									.getSearch_account_note())) {
								crit.add(Restrictions.like("note",
										"%" + dto.getSearch_account_note()
												+ "%"));
							}
							// 排序
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
			log.error(e);
		}
		return accounts;
	}

	/**
	 * get BY id
	 */
	@Override
	public Account getById(Integer accountId) {

		Account account = (Account) hibernateTemplate.get(Account.class,
				accountId);
		return account;
	}

	/**
	 * 按账户Id查询账户信息
	 */
	@Override
	public Account loadById(Integer accountId) {

		// lazy_load load方法可以实现延迟加载
		Account account = hibernateTemplate.load(Account.class, accountId);
		return account;
	}

	/**
	 * 
	 */
	@Override
	public void save(Account account) {

		log.info("保存账户开始!");
		try {
			hibernateTemplate.saveOrUpdate(account);

		} catch (HibernateException ex) {

			log.error("保存账户失败!");
		}
	}

	@Override
	public void batchSave(List<Account> accounts) {

		log.info("批量保存账户开始!");
		try {

			for (Account account : accounts) {
				hibernateTemplate.saveOrUpdate(account);
			}
		} catch (HibernateException ex) {

			log.error("保存账户失败!", ex);
		}
	}

	@Override
	public void delete(Account account) {

		try {
			hibernateTemplate.delete(account);
		} catch (Exception e) {
			log.error(e);
		}
	}

	@Override
	public void batchDelete(List<Account> accounts) {
		log.info("批量删除账户开始!");
		try {

			for (Account account : accounts) {
				hibernateTemplate.delete(account);
			}
		} catch (HibernateException ex) {

			log.error("删除账户失败!", ex);
		}
	}

	/**
	 * 查询总数
	 */
	@Override
	public long getTotalNum(AccountDTO dto) {

		return findAll(dto).size();
	}

}
