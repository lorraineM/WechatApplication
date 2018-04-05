package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class Location implements Serializable{
	private int id;
	private String name;
	private String shortName;
	private int parentId;
	private int type;
	
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return id;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return name;
	}
	public void setShortName(String shortName){
		this.shortName = shortName;
	}
	public String getShortName(){
		return shortName;
	}
	public void setParentId(int parentId){
		this.parentId = parentId;
	}
	public int getParentId(){
		return parentId;
	}
	public void setType(int type){
		this.type = type;
	}
	public int getType(){
		return type;
	}
}
