package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class BaseMessage implements Serializable {
	private String ToUserName;
	private String FromUserName;
	private long CreateTime;
	private String MsgType;
	
	public String getToUserName(){
		return ToUserName;
	}
	public void setToUserName(String ToUserName){
		this.ToUserName = ToUserName;
	}
	public String getFromUserName(){
		return FromUserName;
	}
	public void setFromUserName(String FromUserName){
		this.FromUserName = FromUserName;
	}
	public long getCreateTime(){
		return CreateTime;
	}
	public void setCreateTime(long CreateTime){
		this.CreateTime = CreateTime;
	}
	public String getMsgType(){
		return MsgType;
	}
	public void setMsgType(String MsgType){
		this.MsgType = MsgType;
	}
}
