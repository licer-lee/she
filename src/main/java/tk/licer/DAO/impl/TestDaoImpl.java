package tk.licer.DAO.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import tk.licer.DAO.TestDAO;

/**
 * 账户数据访问实现类
 * 
 * @author Administrator
 * 
 */
@Repository
public class TestDaoImpl implements TestDAO {

	// log
	private static final Log log = LogFactory.getLog(TestDaoImpl.class);

	// hibernate模板对象
	@Autowired
	private HibernateTemplate hibernateTemplate;


}
