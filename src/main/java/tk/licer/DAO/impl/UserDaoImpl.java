package tk.licer.DAO.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tk.licer.DAO.UserDao;
import tk.licer.DTO.UserDTO;
import tk.licer.model.Resource;
import tk.licer.model.User;
import tk.licer.model.page.Page;

@Repository
public class UserDaoImpl implements UserDao{
	
	// log
	private static final Logger log = LoggerFactory.getLogger(UserDaoImpl.class);

		
	// hibernate模板对象
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
//	public List<User> findUsers(Map<String, Object> params) {
//		
//		StringBuilder sb = new StringBuilder();
//		sb.append("select u from User u where u.deleteFlag = 0 and u.type = 0 ");
//		
//		Object realName = params.get("realName");
//		if(realName != null){
//			sb.append(" and u.realName like :realName ");
//		}
//		
//		Object username = params.get("username");
//		if(username != null){
//			sb.append(" and u.username = :username ");
//		}
//		
//		sb.append("order by u.createDate desc");
//		
//		return this.queryByMapParams(sb.toString(), params);
//	}
	
	/**
	 * 根据用户信息查询分页信息
	 * @param userQueryDTO
	 * @return
	 */
//	public PageModel<User> queryUserPage(UserQueryDTO userQueryDTO){
//		Map<String,Object> params = new HashMap<String,Object>();
//		StringBuilder hql = new StringBuilder();
//		hql.append(" select u from User u where 1=1 ");
//		if(StringUtils.isNotBlank(userQueryDTO.getUserName())){
//			hql.append(" and u.username like :username ");
//			params.put("username", "%"+userQueryDTO.getUserName()+"%");
//		}
//		hql.append(" order by u.createDate desc ");
//		return this.queryForPageWithParams(hql.toString(), params, userQueryDTO.getCurrentPage(), userQueryDTO.getPageSize());
//	}

	@Override
	public List<User> findUserByName(String userName) {
		
		User u = new User();
		u.setUsername(userName);
		List<User> users = hibernateTemplate.findByExample(u);
		return users;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Resource> findResourcesByUserId(String userId) {
//		@Query("select DISTINCT re from User u join u.roles r join r.resources re where r.deleteFlag = 0 and re.deleteFlag = 0 and u.id = ?1 ")
		
		
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		
		Query query = session.createQuery(" select DISTINCT re from User u join u.roles r join r.resources re where r.deleteFlag = 0 and re.deleteFlag = 0 and u.id = :id ");
		query.setParameter("id", userId);
		
		
		return (List<Resource>)query.list();
		
//		List<Resource> resources = hibernateTemplate.executeWithNativeSession(new HibernateCallback<List<Resource>>() {
//
//			@SuppressWarnings("unchecked")
//			@Override
//			public List<Resource> doInHibernate(Session session) throws HibernateException {
//				
////				session.createQuery("");
//				
//				
//				Query query = session.createQuery(" select DISTINCT re from User u join u.roles r join r.resources re where r.deleteFlag = 0 and re.deleteFlag = 0 and u.id = :id ");
//				query.setParameter("id", userId);
//				
//				return query.list();
//			}
//		});
		
//		return resources;
	}

	@Override
	public List<User> findPageAll(Page page, UserDTO dto) {
			


		List<User> list = new ArrayList<User>();

		try {
			list = hibernateTemplate.executeWithNativeSession(new HibernateCallback<List<User>>() {

						@SuppressWarnings("unchecked")
						@Override
						public List<User> doInHibernate(Session session)
								throws HibernateException {

							// 创建查询对象
							Criteria crit = session.createCriteria(User.class);

							// 查询条件
//							if (!ObjectUtil.isEmpty(dto.getSearch_account_type_code())) {
//								crit.add(Restrictions.eq("accountTypeCode",
//										dto.getSearch_account_type_code()));
//							}
//							if (!ObjectUtil.isEmpty(dto
//									.getSearch_account_type_name())) {
//								crit.add(Restrictions.like("accountTypeName",
//										"%" + dto.getSearch_account_type_name()
//												+ "%"));
//							}
							// 排序( TODO)
//							if ("asc".equals(page.getOrder())) {
//								crit.addOrder(Order.asc(page.getSort()));
//							} else {
//								crit.addOrder(Order.desc(page.getSort()));
//							}
							crit.setFirstResult(page.getBeginIndex());
							crit.setMaxResults(page.getPageSize());
							return crit.list();
						}
					});
		} catch (Exception e) {
			log.warn(" faild....");
		}
		return list;
	
	}

	@Override
	public List<User> findAll(UserDTO dto) {
			


//		Map<String,Object> params = new HashMap<String,Object>();
//		StringBuilder hql = new StringBuilder();
//		hql.append(" select u from User u where 1=1 ");
//		if(StringUtils.isNotBlank(userQueryDTO.getUserName())){
//			hql.append(" and u.username like :username ");
//			params.put("username", "%"+userQueryDTO.getUserName()+"%");
//		}
//		hql.append(" order by u.createDate desc ");
//		return this.queryForPageWithParams(hql.toString(), params, userQueryDTO.getCurrentPage(), userQueryDTO.getPageSize());
	
		
		

		DetachedCriteria dcrit = DetachedCriteria.forClass(User.class, "at");
//		if (!ObjectUtil.isEmpty(dto)) {
//			// 查询条件
//			if (!ObjectUtil.isEmpty(dto.getSearch_account_type_code())) {
//				dcrit.add(Restrictions.eq("at.accountTypeCode",
//						dto.getSearch_account_type_code()));
//			}
//			if (!ObjectUtil.isEmpty(dto.getSearch_account_type_name())) {
//				dcrit.add(Restrictions.like("at.accountTypeName",
//						"%" + dto.getSearch_account_type_name() + "%"));
//			}
//		}
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) hibernateTemplate.findByCriteria(dcrit);

		return list;
	
	}

	@Override
	public User findById(String id) {

		return hibernateTemplate.load(User.class, id);
	}

	@Override
	public void save(User user) {

		log.info("保存账户开始!");
		
		try {
			hibernateTemplate.saveOrUpdate(user);

		} catch (HibernateException ex) {

			log.error("保存账户失败!");
		}
		
	}
	
	
}
