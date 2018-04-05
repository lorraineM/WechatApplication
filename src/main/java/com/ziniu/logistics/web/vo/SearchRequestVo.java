package com.ziniu.logistics.web.vo;

import com.ziniu.logistics.web.vo.BaseVo;
public class SearchRequestVo extends BaseVo{
	
	private String logisticsProviderCode; //快递公司编码
	private String orderId;				  //查询订单号
	private String username;			  //openid

	public String getLogisticsProviderCode(){
		return logisticsProviderCode;
	}
	public void setLogisticsProviderCode(String logisticsProviderCode){
		this.logisticsProviderCode = logisticsProviderCode;
	}
	public String getOrderId(){
		return orderId;
	}
	public void setOrderId(String orderId){
		this.orderId = orderId;
	}
	public String getUsername(){
		return username;
	}
	public void serUsername(String username){
		this.username = username;
	}

}