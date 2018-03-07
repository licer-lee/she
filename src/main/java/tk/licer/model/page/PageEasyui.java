package tk.licer.model.page;

import java.io.Serializable;

/**
 * 分页属性封装类 TODO 是否需要实现序列化接口?
 * 
 * @author Administrator
 * 
 */
public class PageEasyui implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 当前页数
	private Integer totalCount;

	// 当前页数
	private Integer page;

	// 页大小
	private Integer rows;

	// 排序字段
	private String sort;

	// 排序方式(asc/desc)
	private String order;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

}
