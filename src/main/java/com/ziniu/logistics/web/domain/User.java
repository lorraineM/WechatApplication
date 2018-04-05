package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class User implements Serializable {
	private Long userId;	//场景二维码
	private String username;//openid
	private String password;
	
	public void setUserId(Long userId){
		this.userId = userId;
	}
	public Long getUserId(){
		return userId;
	}
	public void setUsername(String username){
		this.username = username;
	}
	public String getEventKey(){
		return username;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return password;
	}
}

