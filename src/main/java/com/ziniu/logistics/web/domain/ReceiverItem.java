package com.ziniu.logistics.web.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import com.ziniu.logistics.web.vo.ReceiverVo;
import com.ziniu.logistics.web.vo.ShippingRequestVo;

public class ReceiverItem implements Serializable {
	private String username;//openid
	// 发件人信息
	private String receiverMan;
	private String receiverManPhone;
	private String receiverManAddress;
	private String receiverPostcode = null;
	private String receiverCity;
	private String receiverProvince;
	private String receiverCounty;
	

	private Long id;
	private Timestamp createTime;
	private Timestamp lastUpdateTime;
	
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
	
	public String getReceiverCity() {
		return receiverCity;
	}
	
	public void setReceiverCity(String receiverCity) {
		this.receiverCity = receiverCity;
	}
	
	public String getReceiverProvince() {
		return receiverProvince;
	}
	
	public void setReceiverProvince(String receiverProvince) {
		this.receiverProvince = receiverProvince;
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
	

	public static ReceiverItem fromVo(ReceiverVo vo){
		ReceiverItem r = new ReceiverItem();
		r.setReceiverCity(vo.getReceiverCity());
		r.setReceiverCounty(vo.getReceiverCounty());
		r.setReceiverMan(vo.getReceiverMan());
		r.setReceiverManAddress(vo.getReceiverManAddress());
		r.setReceiverManPhone(vo.getReceiverManPhone());
		r.setReceiverPostcode(vo.getReceiverPostcode());
		r.setReceiverProvince(vo.getReceiverProvince());
		r.setUsername(vo.getUsername());
		r.setId(vo.getId());
		r.setCreateTime(vo.getCreateTime());
		r.setLastUpdateTime(vo.getLastUpdateTime());
		return r;
	}
	public void setId(Long id){
		this.id = id;
	}
	public Long getId(){
		return id;
	}
}
