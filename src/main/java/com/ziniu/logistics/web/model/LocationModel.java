package com.ziniu.logistics.web.model;

import com.ziniu.logistics.web.domain.Location;

public class LocationModel{
	private int size;
	private Location[] location;
	public void setSize(int size){
		this.size = size;
	}
	public int getSize(){
		return size;
	}
	public void setLocation(Location[] location){
		this.location = location;
	}
	public Location[] getLocation(){
		return location;
	}
}
