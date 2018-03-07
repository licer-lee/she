package tk.licer.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.licer.DAO.ResourceDao;
import tk.licer.model.Resource;
import tk.licer.service.ResourceService;



@Service
public class ResourceServiceImpl implements ResourceService{
	
	
	// log
	private static final Log log = LogFactory.getLog(ResourceServiceImpl.class);

	@Autowired
	private ResourceDao resourceDao;
	
	
	
	@Override
	public List<Resource> getRootResourceList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Resource> getSystemResourceList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getMap() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Resource> findAllMenu() {
		
		List<Resource> resources = new ArrayList<Resource>();
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("deleteFlag", Resource.DELETE_FLAG_NORMAL);
		
		List<Resource> list = resourceDao.findMenuResource(params);
		
		if(list != null && !list.isEmpty()){
			Map<String, Resource> map = new HashMap<String, Resource>(); 
			for(Resource r : list){
				map.put(r.getId(), r);
			}
			
			for(Resource r : list){
				if(r.getParent() == null){
					resources.add(r);
				}else{
					Resource parentResource = map.get(r.getParent().getId());
					if(parentResource == null){
						resources.add(r);
					}else{
						if(parentResource.getChildren() == null){
							parentResource.setChildren(new ArrayList<Resource>());
						}
						parentResource.getChildren().add(r);
					}
				}
			}
			
		}
		
		return resources;
	}

	@Override
	public void updateDeleteFlag(String[] ids, String deleteFlag) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveResource(Resource resource) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Resource> findMenuResource(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}
		
}