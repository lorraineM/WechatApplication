package com.ziniu.logistics.web.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ziniu.logistics.web.domain.EOrder;
import com.ziniu.logistics.web.domain.Location;
import com.ziniu.logistics.web.domain.OrderInfo;
import com.ziniu.logistics.web.domain.OrderInfoItem;
import com.ziniu.logistics.web.domain.EOrderItem;
import com.ziniu.logistics.web.domain.ShippingRequest;
import com.ziniu.logistics.web.util.EUtil;
import com.ziniu.logistics.web.util.HttpRequestUtil;
import com.ziniu.logistics.web.vo.ShippingRequestVo;

public class EOrderModel {
	private EOrder eorder = new EOrder();
	private OrderInfo oi = new OrderInfo();
	
	/*
	 * 获取bizData 业务数据json
	 * */
	private String createBizData(ShippingRequestVo vo){
		//单张订单
		EOrderItem[] orderItem = new EOrderItem[]{ EOrderItem.fromVo(vo)};
		ShippingRequest srequest = new ShippingRequest();
		srequest.setMachineCode("184392352036240");
		srequest.setIsPrint(false);
		srequest.setOrderList(orderItem);
		
		//转成json
		JSONObject jsonobj = JSONObject.fromObject(srequest);
		//转成字符串
		String bizData = jsonobj.toString();
		
		System.out.println("bizData: " + bizData);
		return bizData;
	}
	
	private void createEOrder(ShippingRequestVo vo) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		/*获取bizData*/
		String bizData = createBizData(vo);
		/*获取digest*/
		String partnerKey = "unittest";
		String digest = EUtil.makeSign(bizData, partnerKey);
		digest = URLEncoder.encode(digest, "UTF-8");
		bizData = URLEncoder.encode(bizData, "UTF-8");
		eorder.setBizData(bizData);
		eorder.setDigest(digest);
		eorder.setMsgId(UUID.randomUUID().toString());
		eorder.setParternID("unittest");
	}
	
	private EOrder getEorder(){
		return eorder;
	}
	private OrderInfo getOI(){
		return oi;
	}
	
	public OrderInfo eOrderManager(ShippingRequestVo vo) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		createEOrder(vo);
		EOrder e = this.getEorder();
		OrderInfo o = this.getOI();
		
		System.out.println("bdata:"+e.getBizData());
		System.out.println("pid:"+e.getParternID());
		System.out.println("digest:"+e.getDigest());
		
		String URL = "http://121.40.82.1/services/fetchExpressOrders";
		String content = "bizData=" + e.getBizData() + "&partnerID=" +e.getParternID() + "&digest=" + e.getDigest()
				+ "&msgId=" + e.getMsgId();
		String result = null;

		try {
			result = HttpRequestUtil.PostData(URL, content);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(result != null){
			System.out.println("接口调用结果:"+result);
			JSONObject jobject = JSONObject.fromObject(result);
			o.setSuccess(Boolean.getBoolean(jobject.get("success").toString()));
			o.setErrorCode(jobject.get("errorCode").toString());
			o.setErrorDesc(jobject.get("errorDesc").toString());
			
			String other = jobject.get("orderInfoList").toString();
			JSONArray jarray = JSONArray.fromObject(other);
			int size = jarray.size();
			
			Object[] obj = new Object[jarray.size()];
			OrderInfoItem[] oit = new OrderInfoItem[size];
			jarray.toArray(obj);
			
			for(int i=0;i<size;i++){
				String json = obj[i].toString();
				JSONObject j = JSONObject.fromObject(json);
				oit[i] = (OrderInfoItem) JSONObject.toBean(j, OrderInfoItem.class);	
			}
			o.setOrderInfoList(oit);
			o.setSize(size);
			return o;
		}else{
			return null;
		}
	}
}
