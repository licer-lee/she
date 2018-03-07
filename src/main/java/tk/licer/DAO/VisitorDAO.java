package tk.licer.DAO;

import java.util.List;

import tk.licer.DTO.VisitorDTO;
import tk.licer.model.Visitor;
import tk.licer.model.page.Page;

/**
 * 访问者数据访问接口
 * 
 * @author Administrator
 * 
 */
public interface VisitorDAO {

	/**
	 * 查找所有访问者
	 * 
	 * @return
	 */
	public List<Visitor> findAll();

	/**
	 * 分页查找所有访问者
	 * 
	 * @return
	 */
	public List<Visitor> findPageAll(final Page page,
			final VisitorDTO dto);

	/**
	 * 按PK查找访问者
	 * 
	 * @return
	 */
	public Visitor findById(String visitorId);

	/**
	 * 保存一个访问者
	 * 
	 * @param Visitor
	 */
	public void save(Visitor visitor);

	/**
	 * 批量保存访问者
	 * 
	 * @param Visitor
	 */
	public void batchSave(List<Visitor> visitors);

	/**
	 * 删除一个访问者
	 * 
	 * @param Visitor
	 */
	public void delete(Visitor visitor);

	/**
	 * 批量删除访问者
	 * 
	 * @param Visitor
	 */
	public void batchDelete(List<Visitor> visitors);

	/**
	 * 获取访问者总数
	 * 
	 * @return
	 */
	public long getTotalNum();

}
