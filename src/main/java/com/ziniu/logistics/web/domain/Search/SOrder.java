package com.ziniu.logistics.web.domain.Search;

public class SOrder {
	private String bizData;
	private String parternID;
	private String digest;
	
	public void setBizData(String bizData){
		this.bizData = bizData;
	}
	public String getBizData(){
		return bizData;
	}
	public void setParternID(String parternID){
		this.parternID = parternID;
	}
	public String getParternID(){
		return parternID;
	}
	public void setDigest(String digest){
		this.digest = digest;
	}
	public String getDigest(){
		return digest;
	}
}
