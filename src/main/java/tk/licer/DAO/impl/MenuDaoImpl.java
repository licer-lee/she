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

import tk.licer.DAO.MenuDao;
import tk.licer.DTO.MenuDto;
import tk.licer.DTO.UserDTO;
import tk.licer.model.Resource;
import tk.licer.model.page.Page;

@Repository
public class MenuDaoImpl implements MenuDao{
	
	
	// log
	private static final Logger log = LoggerFactory.getLogger(MenuDaoImpl.class);

		
	// hibernate模板对象
	@Autowired
	private HibernateTemplate hibernateTemplate;
	

	@Override
	public List<Resource> findUserByName(String userName) {
		return null;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Resource> findResourcesByUserId(String userId) {
		return null;
		
		
	}

	@Override
	public List<Resource> findPageAll(Page page, MenuDto dto) {
			


		List<Resource> list = new ArrayList<Resource>();

		try {
			list = hibernateTemplate.executeWithNativeSession(new HibernateCallback<List<Resource>>() {

						@SuppressWarnings("unchecked")
						@Override
						public List<Resource> doInHibernate(Session session)
								throws HibernateException {

							// 创建查询对象
							Criteria crit = session.createCriteria(Resource.class);

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
	public List<Resource> findAll(MenuDto dto) {
			


//		Map<String,Object> params = new HashMap<String,Object>();
//		StringBuilder hql = new StringBuilder();
//		hql.append(" select u from Resource u where 1=1 ");
//		if(StringUtils.isNotBlank(userQueryDTO.getUserName())){
//			hql.append(" and u.username like :username ");
//			params.put("username", "%"+userQueryDTO.getUserName()+"%");
//		}
//		hql.append(" order by u.createDate desc ");
//		return this.queryForPageWithParams(hql.toString(), params, userQueryDTO.getCurrentPage(), userQueryDTO.getPageSize());
	
		
		

		DetachedCriteria dcrit = DetachedCriteria.forClass(Resource.class, "at");
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
		List<Resource> list = (List<Resource>) hibernateTemplate.findByCriteria(dcrit);

		return list;
	
	}

	@Override
	public Resource findById(String id) {

		return hibernateTemplate.load(Resource.class, id);
	}

	@Override
	public void save(Resource user) {

		log.info("保存账户开始!");
		
		try {
//			hibernateTemplate.setCheckWriteOperations(false);
			hibernateTemplate.save(user);

		} catch (HibernateException ex) {

			log.error("保存账户失败!");
		}
		
	}

	@Override
	public List<Resource> findRoot() {
		
		return (List<Resource>) hibernateTemplate.find(" from Resource r where r.type = ? ", "module");
	}
	
	
}
