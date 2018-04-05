package com.ziniu.logistics.web.domain;

import java.io.Serializable;

public class ShippingRequest implements Serializable {
	private String machineCode;
	private boolean isPrint;
	private EOrderItem[] orderList;
	
	public void setMachineCode(String machineCode){
		this.machineCode = machineCode;
	}
	public String getMachineCode(){
		return machineCode;
	}
	public void setIsPrint(boolean isPrint){
		this.isPrint = isPrint;
	}
	public boolean getIsPrint(){
		return isPrint;
	}
	public void setOrderList(EOrderItem[] orderList){
		this.orderList = orderList;
	}
	public EOrderItem[] getOrderList(){
		return orderList;
	}
}
