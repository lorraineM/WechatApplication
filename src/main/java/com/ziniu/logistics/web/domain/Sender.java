package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class Sender implements Serializable {
	private SenderItem[] sender;
	private int size;
	
	public SenderItem[] getSender(){
		return sender;
	}
	public void setSender(SenderItem[] sender){
		this.sender = sender;
	}
	public int getSize(){
		return size;
	}
	public void setSize(int size){
		this.size = size;
	}
}
