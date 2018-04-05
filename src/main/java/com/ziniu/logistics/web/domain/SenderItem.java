package com.ziniu.logistics.web.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import com.ziniu.logistics.web.vo.SenderVo;
import com.ziniu.logistics.web.vo.ShippingRequestVo;

public class SenderItem implements Serializable {
	private String username;//openid
	// 发件人信息
	private String senderMan;
	private String senderManPhone;
	private String senderManAddress;
	private String senderPostcode = null;
	private String senderCity;
	private String senderProvince;
	private String senderCounty;
	
	private Long id;
	private Timestamp createTime;
	private Timestamp lastUpdateTime;
	
	public String getSenderMan() {
		return senderMan;
	}
	
	public void setSenderMan(String senderMan) {
		this.senderMan = senderMan;
	}
	
	public String getSenderManPhone() {
		return senderManPhone;
	}
	
	public void setSenderManPhone(String senderManPhone) {
		this.senderManPhone = senderManPhone;
	}
	
	public String getSenderManAddress() {
		return senderManAddress;
	}
	
	public void setSenderManAddress(String senderManAddress) {
		this.senderManAddress = senderManAddress;
	}
	
	public String getSenderPostcode() {
		return senderPostcode;
	}
	
	public void setSenderPostcode(String senderPostcode) {
		this.senderPostcode = senderPostcode;
	}
	
	public String getSenderCity() {
		return senderCity;
	}
	
	public void setSenderCity(String senderCity) {
		this.senderCity = senderCity;
	}
	
	public String getSenderProvince() {
		return senderProvince;
	}
	
	public void setSenderProvince(String senderProvince) {
		this.senderProvince = senderProvince;
	}
	
	public String getSenderCounty() {
		return senderCounty;
	}
	
	public void setSenderCounty(String senderCounty) {
		this.senderCounty = senderCounty;
	}
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public Timestamp getCreateTime(){
			return this.createTime;
	}

	public void setCreateTime(Timestamp createTime){
			this.createTime = createTime;
	}
	

	public Timestamp getLastUpdateTime(){
		return this.lastUpdateTime;
	}
	
	public void setLastUpdateTime(Timestamp lastUpdateTime){
		this.lastUpdateTime = lastUpdateTime;
	}

	public static SenderItem fromVo(SenderVo vo){
		SenderItem s = new SenderItem();
		s.setSenderCity(vo.getSenderCity());
		s.setSenderCounty(vo.getSenderCounty());
		s.setSenderMan(vo.getSenderMan());
		s.setSenderManAddress(vo.getSenderManAddress());
		s.setSenderManPhone(vo.getSenderManPhone());
		s.setSenderPostcode(vo.getSenderPostcode());
		s.setSenderProvince(vo.getSenderProvince());
		s.setUsername(vo.getUsername());
		s.setId(vo.getId());
		s.setCreateTime(vo.getCreateTime());
		s.setLastUpdateTime(vo.getLastUpdateTime());
		return s;
	}
	
	public void setId(Long id){
		this.id = id;
	}
	public Long getId(){
		return id;
	}
}
