package tk.licer.service;

import java.util.List;
import java.util.Map;

import tk.licer.model.Resource;



public interface ResourceService {

	
	public List<Resource> getRootResourceList();
	
	/**
	 * 根据类型取所有资源
	 * @param type
	 * @return
	 */
	public List<Resource> getSystemResourceList();
	
	public List<Map<String, Object>> getMap();
	
	public List<Resource> findAllMenu();
	
	public void updateDeleteFlag(String[] ids, String deleteFlag);
	
	public void saveResource(Resource resource);
	
	public List<Resource> findMenuResource(Map<String, Object> params) ;
	
}
