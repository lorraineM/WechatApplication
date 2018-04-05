package com.ziniu.logistics.web.domain.Search;

public class SearchLog {
	private String acceptTime;
	private String acceptAddress;
	private String remark;
	private String status;
	
	public void setAcceptTime(String acceptTime){
		this.acceptTime = acceptTime;
	}
	public String getAcceptTime(){
		return acceptTime;
	}
	public void setAcceptAddress(String acceptAddress){
		this.acceptAddress = acceptAddress;
	}
	public String getAcceptAddress(){
		return acceptAddress;
	}
	public void setRemark(String remark){
		this.remark = remark;
	}
	public String getRemark(){
		return remark;
	}
	public void setStatus(String status){
		this.status = status;
	}
	public String getStatus(){
		return status;
	}
}
