package com.ziniu.logistics.web.vo;

import java.io.Serializable;
import java.util.Date;
import java.sql.Timestamp;

public class BaseVo implements Serializable  {
	
	private static final long serialVersionUID = -1229572053273904313L;
	
	private Long id;
	private Integer version;
    private Timestamp createTime;
    private Timestamp lastUpdateTime;
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

}
