package tk.licer.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import net.sf.json.JSONObject;
import tk.licer.DAO.UserDao;
import tk.licer.DTO.UserDTO;
import tk.licer.model.Account;
import tk.licer.model.Resource;
import tk.licer.model.User;
import tk.licer.model.page.Page;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.UserService;
import tk.licer.util.BeanUtil;
import tk.licer.util.ObjectUtil;
import tk.licer.util.PageUtil;



@Service
public class UserServiceImpl implements UserService{
	
	
	// log
	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);
		
	@Autowired
	private UserDao dao;
	

	@Override
	public User findUserByName(String userName) {
		
		List<User> users = dao.findUserByName(userName);
		if(!users.isEmpty()) return users.get(0);
		else return null;
	}

	@Override
	public List<User> findUsers(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> updateStatus(String[] ids, Integer status) {
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
	public List<UserDTO> getPageAll(PageEasyui pe, UserDTO dto) {
		
		// 获取总记录数
		pe.setTotalCount(getAll(dto).size());
		// 创建分页对象
		Page page = PageUtil.createPage(pe);

		List<User> list = dao.findPageAll(page, dto);
		List<UserDTO> dtos = new ArrayList<UserDTO>();
		
		UserDTO tempdto = null;
		for (int i=0,len=list.size(); i<len; i++) {
			tempdto = new UserDTO();
			BeanUtils.copyProperties((User)list.get(i), tempdto);
			dtos.add(tempdto);
		}
		return dtos;
	}

	private List<UserDTO> getAll(UserDTO dto) {
			
		List<UserDTO> dtos = new ArrayList<UserDTO>();
		List<User> model_list = dao.findAll(dto);
		
		UserDTO tempdto = null;
		for (int i=0,len=model_list.size(); i<len; i++) {
			tempdto = new UserDTO();
			BeanUtils.copyProperties((User)model_list.get(i), tempdto);
			dtos.add(tempdto);
		}
		return dtos;
	}

	@Override
	public UserDTO findById(String id) {
		
		if(StringUtils.isNotBlank(id)){
			
			UserDTO dto = new UserDTO();
			BeanUtils.copyProperties(dao.findById(id), dto);
			
			return dto;
		}else{
			return new UserDTO();
		}
		
	}

	
	@Override
	public JSONObject saveUser(UserDTO dto) {

		User model = new User();
		BeanUtils.copyProperties(dto, model);

		log.info("save:");
		try {
			// 新增前检查
			JSONObject chkmsg = new JSONObject();
			chkmsg = this.checkBeforSave(dto);
			if (ObjectUtil.isEmpty(chkmsg)) {

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

	private JSONObject checkBeforSave(UserDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
