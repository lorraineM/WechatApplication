package com.ziniu.logistics.web.domain.Search;

import com.ziniu.logistics.web.vo.SearchRequestVo;

public class SearchItem {
	private String logisticsProviderCode;
	private String mailNo;
	
	public void setLogisticsProviderCode(String logisticsProviderCode){
		this.logisticsProviderCode = logisticsProviderCode;
	}
	public String getLogisticsProviderCode(){
		return logisticsProviderCode;
	}
	public void setMailNo(String mailNo){
		this.mailNo = mailNo;
	}
	public String getMailNo(){
		return mailNo;
	}
	public static SearchItem fromVo(SearchRequestVo vo){
		SearchItem s = new SearchItem();
		s.setLogisticsProviderCode(vo.getLogisticsProviderCode());
		s.setMailNo(vo.getOrderId());
		return s;
	}
}
