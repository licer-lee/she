package tk.licer.model.page;

/**
 * 分页属性封装类 TODO 是否需要实现序列化接口?
 * 
 * @author Administrator
 * 
 */
public class Page {

	// 1.每页显示数量
	private Integer pageSize;

	// 2.总记录数
	private Integer totalCount;

	// 3.总页数
	private Integer totalPage;

	// 4.当前页
	private Integer currPage;

	// 5.起始点
	private Integer beginIndex;

	// 6.是否有上一页
	private boolean hasPrePage;

	// 7.是否有下一页
	private boolean hasNextPage;

	// 排序字段
	private String sort;

	// 排序方式(asc/desc)
	private String order;

	/**
	 * 
	 */
	public Page() {
	}

	/**
	 * 构造分页
	 * 
	 * @param pageSize
	 * @param totalCount
	 * @param totalPage
	 * @param currPage
	 * @param beginIndex
	 * @param hasPrePage
	 * @param hasNextPage
	 */
	public Page(Integer pageSize, Integer totalCount, Integer totalPage,
			Integer currPage, Integer beginIndex, boolean hasPrePage,
			boolean hasNextPage, String sort, String order) {

		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.currPage = currPage;
		this.beginIndex = beginIndex;
		this.hasPrePage = hasPrePage;
		this.hasNextPage = hasNextPage;
		this.sort = sort;
		this.order = order;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public Integer getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(Integer beginIndex) {
		this.beginIndex = beginIndex;
	}

	public boolean isHasPrePage() {
		return hasPrePage;
	}

	public void setHasPrePage(boolean hasPrePage) {
		this.hasPrePage = hasPrePage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
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

}
