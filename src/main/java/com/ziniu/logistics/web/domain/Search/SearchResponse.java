package com.ziniu.logistics.web.domain.Search;

public class SearchResponse {
	private String logisticsProviderCode;
	private String mailNo;
	private String status;
	private String result;
	private String failedReason;
	private SearchLog[] trackLog;
	private int size;
	
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
	public void setStatus(String status){
		this.status = status;
	}
	public String getStatus(){
		return status;
	}
	public void setFailedReason(String failedReason){
		this.failedReason = failedReason;
	}
	public String getFailedReason(){
		return failedReason;
	}
	public void setResult(String result){
		this.result = result;
	}
	public String getResult(){
		return result;
	}
	public void setTrackLog(SearchLog[] trackLog){
		this.trackLog = trackLog;
	}
	public SearchLog[] getTrackLog(){
		return trackLog;
	}
	public void setSize(int size){
		this.size = size;
	}
	public int getSize(){
		return size;
	}
}
