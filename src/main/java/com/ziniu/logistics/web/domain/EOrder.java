package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class EOrder implements Serializable{
	private String bizData;
	private String parternID;
	private String digest;
	private String msgId;
	
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
	public void setMsgId(String msgId){
		this.msgId = msgId;
	}
	public String getMsgId(){
		return msgId;
	}
}
