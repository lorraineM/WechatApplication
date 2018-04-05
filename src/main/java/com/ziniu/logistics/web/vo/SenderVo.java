package com.ziniu.logistics.web.vo;

import java.io.Serializable;

public class SenderVo extends BaseVo {
	private String username;//openid
	// 发件人信息
	private String senderMan;
	private String senderManPhone;
	private String senderManAddress;
	private String senderPostcode = null;
	private String senderCity;
	private String senderProvince;
	private String senderCounty; 
	
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
}
