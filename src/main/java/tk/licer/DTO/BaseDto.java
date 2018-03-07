package tk.licer.DTO;

import java.io.Serializable;
import java.util.Date;

/**
 * 定义实体的基础公共属性，所有实体都会继承.
 * @author Jeff Xu
 * @since 2015-12-09
 */
public class BaseDto implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//逻辑删除标识位—已删除状态
	public static final String DELETE_FLAG_DELETED = "1";
	
	//逻辑删除标识位—未删除状态
	public static final String DELETE_FLAG_NORMAL = "0";
	
	//审核状态标识位—未审核
	public static final String AUDIT_FLAG_NOT = "0";
	
	//审核状态标识位—审核通过
	public static final String AUDIT_FLAG_PASS = "1";
	
	//审核状态标识位—审核通不过
	public static final String AUDIT_FLAG_FAIL = "2";
	
	
	protected String id;

	/**
	 * 创建日期
	 */
	protected Date createDate;
	/**
	 * 修改日期
	 */
	protected Date updateDate;
	
	/**
	 * 删除标志(0-正常，1-删除)
	 */
	protected String deleteFlag;
	
	/**
	 * 审核状态(0-未审核，1-审核通过，2-审核不通过)
	 */
	protected String auditFlag;
	
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getUpdateDate() {
		return updateDate;
	}
	
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public String getDeleteFlag() {
		return deleteFlag;
	}
	
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getAuditFlag() {
		return auditFlag;
	}

	public void setAuditFlag(String auditFlag) {
		this.auditFlag = auditFlag;
	}

 
	
}
