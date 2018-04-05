package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class Receiver implements Serializable{
	private ReceiverItem[] receiver;
	private int size;
	
	public ReceiverItem[] getReceiver(){
		return receiver;
	}
	public void setReceiver(ReceiverItem[] receiver){
		this.receiver = receiver;
	}
	public int getSize(){
		return size;
	}
	public void setSize(int size){
		this.size = size;
	}
}
