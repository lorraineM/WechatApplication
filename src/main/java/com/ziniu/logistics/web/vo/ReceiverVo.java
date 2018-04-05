package com.ziniu.logistics.web.vo;

import java.io.Serializable;

public class ReceiverVo extends BaseVo  {
	private String username;//openid
	// 收件人信息
	private String receiverMan;
	private String receiverManPhone;
	private String receiverManAddress;
	private String receiverPostcode = null;
	private String receiverProvince;
	private String receiverCity;
	private String receiverCounty;
	
	public String getReceiverMan() {
		return receiverMan;
	}
	
	public void setReceiverMan(String receiverMan) {
		this.receiverMan = receiverMan;
	}
	
	public String getReceiverManPhone() {
		return receiverManPhone;
	}
	
	public void setReceiverManPhone(String receiverManPhone) {
		this.receiverManPhone = receiverManPhone;
	}
	
	public String getReceiverManAddress() {
		return receiverManAddress;
	}
	
	public void setReceiverManAddress(String receiverManAddress) {
		this.receiverManAddress = receiverManAddress;
	}
	
	public String getReceiverPostcode() {
		return receiverPostcode;
	}
	
	public void setReceiverPostcode(String receiverPostcode) {
		this.receiverPostcode = receiverPostcode;
	}
	
	public String getReceiverProvince() {
		return receiverProvince;
	}
	
	public void setReceiverProvince(String receiverProvince) {
		this.receiverProvince = receiverProvince;
	}
	
	public String getReceiverCity() {
		return receiverCity;
	}
	
	public void setReceiverCity(String receiverCity) {
		this.receiverCity = receiverCity;
	}
	
	public String getReceiverCounty() {
		return receiverCounty;
	}
	
	public void setReceiverCounty(String receiverCounty) {
		this.receiverCounty = receiverCounty;
	}
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

}
