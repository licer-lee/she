package tk.licer.DAO;

import java.util.List;
import java.util.Map;

import tk.licer.model.Resource;


public interface ResourceDao {

//	@Query("select r from Resource r where r.deleteFlag = 0 and r.parent.id = null ")
	List<Resource> getRootResourceList();
	
//	@Query("select r from Resource r where r.deleteFlag = 0 order by r.orderNo")
	List<Resource> getSystemResourceList();

	List<Resource> findMenuResource(Map<String, Object> params);
	
}
