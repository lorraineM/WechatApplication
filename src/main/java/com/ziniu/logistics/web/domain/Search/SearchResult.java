package com.ziniu.logistics.web.domain.Search;

public class SearchResult {
	private String success;
	private SearchResponse[] trackingResponses;
	private int size;
	
	public void setSuccess(String success){
		this.success = success;
	}
	public String getSuccess(){
		return success;
	}
	public void setTrackingResponses(SearchResponse[] trackingResponses){
		this.trackingResponses = trackingResponses;
	}
	public SearchResponse[] getTrackingResponses(){
		return trackingResponses;
	}
	public void setSize(int size){
		this.size = size;
	}
	public int getSize(){
		return size;
	}
}
