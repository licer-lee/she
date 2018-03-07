package tk.licer.DAO.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tk.licer.DAO.ResourceDao;
import tk.licer.model.Account;
import tk.licer.model.Resource;
import tk.licer.util.ObjectUtil;

@Repository
public class ResourceDaoImpl implements ResourceDao{

	
	// log
	private static final Log log = LogFactory.getLog(ResourceDaoImpl.class);
	
	
	// hibernate模板对象
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	@Override
	public List<Resource> findMenuResource(Map<String, Object> params) {
		
		//离线查询器对象(创建不依赖session)
		DetachedCriteria dcrit = DetachedCriteria.forClass(Resource.class);

		dcrit.add(Restrictions.in("type", new String[]{"module", "page"}) );
		
		Object deleteFlag = params.get("deleteFlag");
		if(deleteFlag != null){
			dcrit.add(Restrictions.eq("deleteFlag", deleteFlag));
		}
		
		Object name = params.get("name");
		if(name != null){
			dcrit.add(Restrictions.like("name", "%"+ name +"%"));
		}
		
		dcrit.addOrder(Order.asc("orderNo"));

		List<Resource> resources = (List<Resource>) hibernateTemplate.findByCriteria(dcrit);
		return resources;
				
		
//		StringBuilder sb = new StringBuilder();
//		sb.append("select r from Resource r where r.type in('module', 'page') ");
//		
//		Object deleteFlag = params.get("deleteFlag");
//		if(deleteFlag != null){
//			sb.append(" and r.deleteFlag = :deleteFlag ");
//		}
//
//		Object name = params.get("name");
//		if(name != null){
//			sb.append(" and r.name like :name ");
//		}
//		
//		sb.append(" order by r.orderNo ");
//		
//		return this.queryByMapParams(sb.toString(), params, null, null);
	
	}
	

	@Override
	public List<Resource> getRootResourceList() {
		// TODO Auto-generated method stub
		
//		@Query("select r from Resource r where r.deleteFlag = 0 and r.parent.id = null ")
		
		return null;
	}

	@Override
	public List<Resource> getSystemResourceList() {
		
//		@Query("select r from Resource r where r.deleteFlag = 0 order by r.orderNo")
		
		// TODO Auto-generated method stub
		return null;
	}

}
