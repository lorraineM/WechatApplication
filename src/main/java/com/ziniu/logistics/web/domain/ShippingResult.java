package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class ShippingResult implements Serializable {
	private boolean success;
	private OrderInfoItem[] orderInfoList;
	private String errorCode;
	private String errorDesc;
	
	public void setSuccess(boolean success){
		this.success = success;
	}
	public boolean getSuccess(){
		return success;
	}
	public void setOrderInfoList(OrderInfoItem[] orderInfoList){
		this.orderInfoList = orderInfoList;
	}
	public OrderInfoItem[] getOrderInfoList(){
		return orderInfoList;
	}
	public void setErrorCode(String errorCode){
		this.errorCode = errorCode;
	}
	public String getErrorCode(){
		return errorCode;
	}
	public void setErrorDesc(String errorDesc){
		this.errorDesc = errorDesc;
	}
	public String getErrorDesc(){
		return errorDesc;
	}
	
}
