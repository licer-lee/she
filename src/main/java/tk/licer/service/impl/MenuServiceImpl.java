package tk.licer.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;
import tk.licer.DAO.MenuDao;
import tk.licer.DTO.MenuDto;
import tk.licer.model.Resource;
import tk.licer.model.page.Page;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.MenuService;
import tk.licer.util.ObjectUtil;
import tk.licer.util.PageUtil;



@Service
public class MenuServiceImpl implements MenuService{
	
	
	// log
	private static final Logger log = LoggerFactory.getLogger(MenuServiceImpl.class);
		
	@Autowired
	private MenuDao dao;
	

	@Override
	public Resource findUserByName(String userName) {
		
		List<Resource> users = dao.findUserByName(userName);
		if(!users.isEmpty()) return users.get(0);
		else return null;
	}

	@Override
	public List<Resource> findUsers(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Resource> updateStatus(String[] ids, Integer status) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Resource> findResourcesByUserId(String userId) {
		return dao.findResourcesByUserId(userId);
	}

	@Override
	public Map<String, Object> findResourceMap(String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Resource> resources = findResourcesByUserId(userId);
		if(resources != null && !resources.isEmpty()){
			for(Resource r : resources){
				map.put(r.getId(), r.getName());
			}
		}
		
		return map;
	}

	@Override
	public List<MenuDto> getPageAll(PageEasyui pe, MenuDto dto) {
		
		// 获取总记录数
		pe.setTotalCount(getAll(dto).size());
		// 创建分页对象
		Page page = PageUtil.createPage(pe);

		List<Resource> list = dao.findPageAll(page, dto);
		List<MenuDto> dtos = new ArrayList<MenuDto>();
		
		MenuDto tempdto = null;
		for (int i=0,len=list.size(); i<len; i++) {
			tempdto = new MenuDto();
			BeanUtils.copyProperties((Resource)list.get(i), tempdto);
			dtos.add(tempdto);
		}
		return dtos;
	}

	private List<MenuDto> getAll(MenuDto dto) {
			
		List<MenuDto> dtos = new ArrayList<MenuDto>();
		List<Resource> model_list = dao.findAll(dto);
		
		MenuDto tempdto = null;
		for (int i=0,len=model_list.size(); i<len; i++) {
			tempdto = new MenuDto();
			BeanUtils.copyProperties((Resource)model_list.get(i), tempdto);
			dtos.add(tempdto);
		}
		return dtos;
	}

	@Override
	public MenuDto findById(String id) {
		
		if(StringUtils.isNotBlank(id)){
			
			MenuDto dto = new MenuDto();
			BeanUtils.copyProperties(dao.findById(id), dto);
			
			return dto;
		}else{
			return new MenuDto();
		}
		
	}

	
	@Override
	public JSONObject saveUser(MenuDto dto) {

		Resource model = new Resource();
		Resource r = new Resource();
		if(StringUtils.isNotBlank(dto.getParent().getId())){
			r = dao.findById(dto.getParent().getId());
		}
		
		BeanUtils.copyProperties(dto, model);

		model.setParent(r);
		log.info("save:");
		try {
			// 新增前检查
			JSONObject chkmsg = new JSONObject();
			chkmsg = this.checkBeforSave(dto);
			if (ObjectUtil.isEmpty(chkmsg)) {

//				model.setName("123");
//				model.setIcon("11");
//				model.setUrl("11");;
////				form.setDeleteFlag("0");
//				model.setOrderNo(898);
//				model.setType("page");
//				Resource r = new Resource();
//				r.setId("70");
//				model.setParent(r);
				
				model.setDeleteFlag("1");
				model.setCreateDate(new Date());
				model.setUpdateDate(new Date());
				dao.save(model);

				String msg = "";
//				if("edit".equals(dto.getAccount_info_page_flag())){
					msg = "保存成功！";
//				}else{
//					msg = "新增成功";
//				}
				chkmsg.put("flag", true);
				chkmsg.put("respCode", 100);
				chkmsg.put("msg", msg);
			}
		
			return chkmsg;
		
		} catch (Exception e) {
			
			log.warn("save faild");
			
			e.printStackTrace();
			
			return null;
		}
	
	}

	private JSONObject checkBeforSave(MenuDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuDto> getRootMenu() {
		List<MenuDto> list = new ArrayList<MenuDto>();
		
		MenuDto dto ;
		List<Resource> rs = dao.findRoot();
		for(Resource r: rs){
			dto = new MenuDto();
			BeanUtils.copyProperties(r, dto);
			list.add(dto);
		}
		return list;
	}
	
	
}
