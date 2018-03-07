package tk.licer.DTO;

import tk.licer.model.Resource;

public class MenuDto extends BaseDto {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private String name;

	private Resource parent;

	private String type;

	private String url;

	private String icon; // 菜单按钮

	private Integer orderNo; // 排序


	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Resource getParent() {
		return parent;
	}

	public void setParent(Resource parent) {
		this.parent = parent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}


}
