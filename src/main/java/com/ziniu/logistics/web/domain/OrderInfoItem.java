package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class OrderInfoItem implements Serializable {
	private String orderId;
	private boolean success;
	private String errorCode;
	private String errorDesc;
	private String logisticsProviderCode;
	private String logisticsMailNo;
	
	public String getOrderId() {
		return orderId;
	}
	
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public void setSuccess(boolean success){
		this.success = success;
	}
	public boolean getSuccess(){
		return success;
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
	public void setLogisticsProviderCode(String logisticsProviderCode){
		this.logisticsProviderCode = logisticsProviderCode;
	}
	public String getLogisticsProviderCode(){
		return logisticsProviderCode;
	}
	public void setLogisticsMailNo(String logisticsMailNo){
		this.logisticsMailNo = logisticsMailNo;
	}
	public String getLogisticsMailNo(){
		return logisticsMailNo;
	}
}
