package tk.licer.DAO.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tk.licer.DAO.VisitorDAO;
import tk.licer.DTO.VisitorDTO;
import tk.licer.model.Visitor;
import tk.licer.model.page.Page;

/**
 * 访问者数据访问实现类
 * 
 * @author Administrator
 * 
 */
@Repository
public class VisitorDAOImpl implements VisitorDAO {

	// log
	private static final Log log = LogFactory.getLog(VisitorDAOImpl.class);

	// hibernate模板对象
	@Autowired
	private HibernateTemplate hibernateTemplate;

	
	
	/**
	 * 查询所有访问者
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Visitor> findAll() {
		
		List<Visitor> visitors = (List<Visitor>) hibernateTemplate.find(" from Visitor ");
		return visitors;
	}

	/**
	 * 按访问者Id查询访问者信息
	 */
	@Override
	public Visitor findById(String visitorId) {
		
		//lazy_load load方法可以实现延迟加载
		Visitor visitor = hibernateTemplate.load(Visitor.class, visitorId);
		return visitor;
	}

	/**
	 * 
	 */
	@Override
	public void save(Visitor visitor) {

		log.info("保存访问者开始!");
		try {
			hibernateTemplate.saveOrUpdate(visitor);

		} catch (HibernateException ex) {

			log.warn("保存访问者失败!");
		}
	}

	@Override
	public void batchSave(List<Visitor> visitors) {

		log.info("批量保存访问者开始!");
		try {

			for (Visitor visitor : visitors) {
				hibernateTemplate.saveOrUpdate(visitor);
			}
		} catch (HibernateException ex) {

			log.warn("保存访问者失败!", ex);
		}
	}

	@Override
	public void delete(Visitor visitor) {

		try {
			hibernateTemplate.delete(visitor);
		} catch (Exception e) {
			log.warn(e);
		}
	}

	@Override
	public void batchDelete(List<Visitor> visitors) {
		log.info("批量删除访问者开始!");
		try {

			for (Visitor visitor : visitors) {
				hibernateTemplate.delete(visitor);
			}
		} catch (HibernateException ex) {

			log.warn("删除访问者失败!", ex);
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
	public List<Visitor> findPageAll(final Page page, VisitorDTO dto) {
		
		List<Visitor> visitors = new ArrayList<Visitor>();
		
		try {
			visitors = hibernateTemplate
					.executeWithNativeSession(new HibernateCallback<List<Visitor>>() {

						@SuppressWarnings("unchecked")
						@Override
						public List<Visitor> doInHibernate(Session session)
								throws HibernateException {
							
							//HQL 实体/表名 区分大小写,必须要一样,否则报错 TODO 如何动态指定asc/desc?
							Query query = session.createQuery(" FROM Visitor order by ? ");
							
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
			log.warn(e);
		}
		return visitors;
	}

}
