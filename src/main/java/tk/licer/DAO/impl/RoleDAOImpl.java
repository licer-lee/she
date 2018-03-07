package tk.licer.DAO.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tk.licer.DAO.RoleDAO;
import tk.licer.DTO.RoleDTO;
import tk.licer.model.Role;
import tk.licer.model.page.Page;

/**
 * 角色数据访问实现类
 * 
 * @author Administrator
 * 
 */
@Repository
public class RoleDAOImpl implements RoleDAO {

	// log
	private static final Log log = LogFactory.getLog(RoleDAOImpl.class);

	// hibernate模板对象
	@Autowired
	private HibernateTemplate hibernateTemplate;

	
	
	/**
	 * 查询所有角色
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Role> findAll() {
		
		List<Role> roles = (List<Role>) hibernateTemplate.find(" from Role ");
		return roles;
	}

	/**
	 * 按角色Id查询角色信息
	 */
	@Override
	public Role findById(Integer roleId) {
		
//		Role role = (Role) hibernateTemplate.get(Role.class, roleId);
		//lazy_load load方法可以实现延迟加载
		Role role = hibernateTemplate.load(Role.class, roleId);
		return role;
	}

	/**
	 * 
	 */
	@Override
	public void save(Role role) {

		log.info("保存角色开始!");
		try {
			hibernateTemplate.saveOrUpdate(role);

		} catch (HibernateException ex) {

			log.warn("保存角色失败!");
		}
	}

	@Override
	public void batchSave(List<Role> roles) {

		log.info("批量保存角色开始!");
		try {

			for (Role role : roles) {
				hibernateTemplate.saveOrUpdate(role);
			}
		} catch (HibernateException ex) {

			log.warn("保存角色失败!", ex);
		}
	}

	@Override
	public void delete(Role role) {

		try {
			hibernateTemplate.delete(role);
		} catch (Exception e) {
			log.warn(e);
		}
	}

	@Override
	public void batchDelete(List<Role> roles) {
		log.info("批量删除角色开始!");
		try {

			for (Role role : roles) {
				hibernateTemplate.delete(role);
			}
		} catch (HibernateException ex) {

			log.warn("删除角色失败!", ex);
		}
	}

	/**
	 * 查询总数
	 */
	@Override
	public long getTotalNum() {

		return findAll().size();
	}

	
	
	@Override
	public List<Role> findPageAll(final Page page, RoleDTO dto) {
		
		List<Role> roles = new ArrayList<Role>();
		
		try {
			roles = hibernateTemplate
					.executeWithNativeSession(new HibernateCallback<List<Role>>() {

						@SuppressWarnings("unchecked")
						@Override
						public List<Role> doInHibernate(Session session)
								throws HibernateException {
							
							//HQL 实体/表名 区分大小写,必须要一样,否则报错 TODO 如何动态指定asc/desc?
							Query query = session.createQuery(" FROM Role order by ? ");
							
							query.setParameter(0, page.getSort());
//							query.setParameter(1, page.getOrder());
							// 设置每页显示多少个，设置多大结果。
							query.setMaxResults(page.getPageSize());
							// 设置起点
							query.setFirstResult(page.getBeginIndex());
							
							return query.list();
						}
					});

		} catch (Exception e) {
			// TODO: handle exception
			log.warn(e);
		}
		return roles;
	}

}
