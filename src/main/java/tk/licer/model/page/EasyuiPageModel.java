package tk.licer.model.page;

/**
 * easyui分页对象
 * 
 * easyui 指定字段
 * 
 * @author Administrator
 * 
 */
public class EasyuiPageModel {

	/**
	 * 总数
	 */
	private long total;

	/**
	 * 分页行数据
	 */
	private Object rows;

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

}
