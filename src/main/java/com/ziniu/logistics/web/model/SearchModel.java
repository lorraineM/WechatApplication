package com.ziniu.logistics.web.model;

import java.net.URLEncoder;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ziniu.logistics.web.domain.OrderInfoItem;
import com.ziniu.logistics.web.domain.Search.SOrder;
import com.ziniu.logistics.web.domain.Search.Search;
import com.ziniu.logistics.web.domain.Search.SearchItem;
import com.ziniu.logistics.web.domain.Search.SearchLog;
import com.ziniu.logistics.web.domain.Search.SearchResponse;
import com.ziniu.logistics.web.domain.Search.SearchResult;
import com.ziniu.logistics.web.util.EUtil;
import com.ziniu.logistics.web.util.HttpRequestUtil;
import com.ziniu.logistics.web.vo.SearchRequestVo;

public class SearchModel {
	private SOrder sorder = new SOrder();
	private SearchResult sresult = new SearchResult();
	
	/*
	 * 获取bizData 业务数据json
	 * */
	private String createBizData(SearchRequestVo vo){
		//单张订单
		Search search = new Search();
		SearchItem[] trackingItems = new SearchItem[]{SearchItem.fromVo(vo)};
		search.setTrackingItems(trackingItems);
				
		//转成json
		JSONObject jsonobj = JSONObject.fromObject(search);
		//转成字符串
		String bizData = jsonobj.toString();
		
		System.out.println("bizData: " + bizData);
		return bizData;
	}

	private void createSOrder(SearchRequestVo vo) throws Exception{
		String bizData = createBizData(vo);
		String partnerKey = "unittest";
		String digest = EUtil.makeSign(bizData, partnerKey);
		digest = URLEncoder.encode(digest, "UTF-8");
		bizData = URLEncoder.encode(bizData, "UTF-8");
		sorder.setBizData(bizData);
		sorder.setDigest(digest);
		sorder.setParternID("unittest");
	}
	private SOrder getSorder(){
		return sorder;
	}
	private SearchResult getSresult(){
		return sresult;
	}
	public SearchResult sOrderManager(SearchRequestVo vo) throws Exception{
		createSOrder(vo);
		SOrder s = this.getSorder();
		SearchResult r = this.getSresult();
	
		String URL = "http://121.40.82.1/services/fetchOrderTrackingInfo";
		String content = "bizData=" + s.getBizData() + "&partnerID=" +s.getParternID() + "&digest=" + s.getDigest();
		String result = null;
		
		try{
			result = HttpRequestUtil.PostData(URL, content);
		} catch (Exception e1){
			e1.printStackTrace();
		}
		if(result != null){
			System.out.println("接口调用结果:"+result);
			JSONObject jobject = JSONObject.fromObject(result);
			r.setSuccess(jobject.getString("success").toString());
			String other = jobject.get("trackingResponses").toString();
			JSONArray jarray = JSONArray.fromObject(other);
			int size = jarray.size();
			
			Object[] obj = new Object[size];
			SearchResponse[] trackingResponses = new SearchResponse[size];
			jarray.toArray(obj);
			
			for(int i = 0; i < size; i++){
				trackingResponses[i] = new SearchResponse();
				String json = obj[i].toString();
				JSONObject ti = JSONObject.fromObject(json);
				trackingResponses[i].setLogisticsProviderCode(ti.get("logisticsProviderCode").toString());
				trackingResponses[i].setMailNo(ti.get("mailNo").toString());
				trackingResponses[i].setStatus(ti.get("status").toString());
				trackingResponses[i].setResult(ti.get("result").toString());
				trackingResponses[i].setFailedReason(ti.get("failedReason").toString());
				
				if(trackingResponses[i].getResult().equals("FAIL")){
					trackingResponses[i].setSize(0);
					trackingResponses[i].setTrackLog(null);
				}else{
					String tother = ti.get("traceLog").toString();
					JSONArray tjarray = JSONArray.fromObject(tother);
					int tsize = tjarray.size();
					Object[] tobj = new Object[tsize];
					SearchLog[] trackLog = new SearchLog[tsize];
					tjarray.toArray(tobj);
					for(int j = 0; j < tsize; j++){
						trackLog[j] = new SearchLog();
						String tjson = tobj[j].toString();
						JSONObject tti = JSONObject.fromObject(tjson);
						trackLog[j] = (SearchLog) JSONObject.toBean(tti,SearchLog.class);
					}
					trackingResponses[i].setSize(tsize);
					trackingResponses[i].setTrackLog(trackLog);
				}	
			}
			r.setSize(size);
			r.setTrackingResponses(trackingResponses);
			return r;
		}else
			return null;
	}
	
	/*public static void main(String args[]) throws Exception{
		SearchRequestVo vo = new SearchRequestVo();
		vo.setOrderId("111111111111");
		vo.setLogisticsProviderCode("SF");
		SearchModel m = new SearchModel();
		System.out.print(m.sOrderManager(vo).toString());
	}*/
}
