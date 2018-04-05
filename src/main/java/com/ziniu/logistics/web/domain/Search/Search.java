package com.ziniu.logistics.web.domain.Search;


public class Search {
	private SearchItem[] trackingItems;
	
	public void setTrackingItems(SearchItem[] trackingItems){
		this.trackingItems = trackingItems;
	}
	public SearchItem[] getTrackingItems(){
		return trackingItems;
	}
}
