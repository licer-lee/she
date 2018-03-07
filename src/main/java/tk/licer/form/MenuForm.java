package tk.licer.form;

import java.util.List;

import tk.licer.DTO.BaseDto;
import tk.licer.model.Resource;

/**
 * RoleForm
 * 
 * 负责接收页面参数,或将结果返回页面 字段应与画面属性保持一致
 * 
 * @author liwc
 * 
 */
public class MenuForm extends BaseDto {

	private static final long serialVersionUID = 8805431035637831211L;

	// --------------检索条件-------------------------------

	/**
	 * 检索:类别编号
	 */
	private String search_account_type_code;

	/**
	 * 检索:类别名称
	 */
	private String search_account_type_name;

	public String getSearch_account_type_code() {
		return search_account_type_code;
	}

	public void setSearch_account_type_code(String search_account_type_code) {
		this.search_account_type_code = search_account_type_code;
	}

	public String getSearch_account_type_name() {
		return search_account_type_name;
	}

	public void setSearch_account_type_name(String search_account_type_name) {
		this.search_account_type_name = search_account_type_name;
	}

	// -------------------------实体数据-----------------------


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
