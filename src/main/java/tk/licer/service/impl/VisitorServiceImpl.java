package tk.licer.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.licer.DAO.VisitorDAO;
import tk.licer.DTO.VisitorDTO;
import tk.licer.model.Visitor;
import tk.licer.model.page.Page;
import tk.licer.model.page.PageEasyui;
import tk.licer.service.VisitorService;
import tk.licer.util.ObjectUtil;
import tk.licer.util.PageUtil;

/**
 * 访问者逻辑实现类 功能:处理访问者业务逻辑
 * 
 * @author liwc
 * 
 */
@Service
public class VisitorServiceImpl implements VisitorService {

	// log
	private static final Log log = LogFactory.getLog(VisitorServiceImpl.class);

	// 访问者DAO
	@Autowired
	private VisitorDAO visitorDAO;

	/**
	 * 获取所有访问者
	 */
	@Override
	public List<Visitor> getVisitorList() {

		return visitorDAO.findAll();
	}

	/**
	 * 
	 */
	@Override
	public Visitor getVisitorById(String visitorId) {

		return visitorDAO.findById(visitorId);
	}

	/**
	 * 新增访问者
	 */
	@Override
	public JSONObject addVisitor(Visitor visitor) {

		log.info("新增访问者");
		try {
			// 新增前检查
			JSONObject msg = new JSONObject();
			msg = this.checkBeforAdd(visitor);
			if (ObjectUtil.isEmpty(msg)) {

				visitorDAO.save(visitor);

				msg.put("flag", true);
				msg.put("respCode", 100);
				msg.put("msg", "新增成功");
			}
			return msg;
		} catch (Exception e) {
			// TODO: handle exception
			log.warn(e);
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 业务检查
	 * 
	 * @param visitor
	 * @return
	 */
	private JSONObject checkBeforAdd(Visitor visitor) {
		// TODO
		return new JSONObject();
	}

	@Override
	public JSONObject batchAddVisitor(List<Visitor> visitors) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject editVisitor(Visitor visitor) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject batchEditVisitor(List<Visitor> visitors) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject deleteVisitor(String visitorId) {
		return null;
		// TODO Auto-generated method stub

	}

	@Override
	public JSONObject batchDeleteVisitor(List<String> visitorIds) {
		return null;
		// TODO Auto-generated method stub

	}

	/**
	 * 获取访问者总数
	 */
	@Override
	public long getVisitorTotalNum() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 删除访问者
	 */
	@Override
	public JSONObject deleteVisitor(Visitor visitor) {

		JSONObject msg = new JSONObject();
		msg = checkBeforDelete(visitor);

		if (ObjectUtil.isEmpty(msg)) {

			visitorDAO.delete(visitor);
			msg.put("flag", true);
			msg.put("respCode", 100);
			msg.put("msg", "删除成功");
		}

		return msg;
	}

	/**
	 * 删除操作业务检查
	 * 
	 * @param visitor
	 * @return
	 */
	private JSONObject checkBeforDelete(Visitor visitor) {

		// TODO
		return new JSONObject();
	}

	@Override
	public List<Visitor> getPageVisitorList(PageEasyui pe, VisitorDTO dto) {

		// 获取总记录数
		pe.setTotalCount(getVisitorList().size());
		// 创建分页对象
		Page page = PageUtil.createPage(pe);

		return visitorDAO.findPageAll(page, dto);
	}

}
