package tk.licer.service;

import java.util.List;

import net.sf.json.JSONObject;

import tk.licer.DTO.VisitorDTO;
import tk.licer.model.Visitor;
import tk.licer.model.page.PageEasyui;

/**
 * 访问者逻辑处理接口
 * @author Administrator
 *
 */
public interface VisitorService {

	
	/**
	 * 查找所有访问者
	 * @return
	 */
	public List<Visitor> getVisitorList();
	
	/**
	 * 分页查找所有访问者
	 * @return
	 */
	public List<Visitor> getPageVisitorList(PageEasyui page, VisitorDTO dto);
	
	/**
	 * 查找一个访问者
	 * @return
	 */
	public Visitor getVisitorById(String visitorId);
	
	/**
	 * 新增一个访问者
	 * @param visitor
	 * @return 
	 */
	public JSONObject addVisitor(Visitor visitor);
	
	/**
	 * 批量添加访问者
	 * @param Visitor
	 */
	public JSONObject batchAddVisitor(List<Visitor> visitors);
	
	/**
	 * 修改一个访问者
	 * @param visitor
	 */
	public JSONObject editVisitor(Visitor visitor);
	
	/**
	 * 批量修改访问者
	 * @param visitor
	 */
	public JSONObject batchEditVisitor(List<Visitor> visitors);
	
	
	/**
	 * 删除一个访问者
	 * @param visitor
	 */
	public JSONObject deleteVisitor(String visitorId);
	
	/**
	 * 删除一个访问者
	 * @param visitor
	 */
	public JSONObject deleteVisitor(Visitor visitor);
	
	/**
	 * 批量删除访问者
	 * @param Visitor
	 */
	public JSONObject batchDeleteVisitor(List<String> visitorIds);
	
	/**
	 * 获取访问者总数
	 * @return
	 */
	public long getVisitorTotalNum();

	
}
