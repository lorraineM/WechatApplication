package com.ziniu.logistics.web.service;

import java.util.List;
import java.util.Map;

import com.ziniu.logistics.web.so.PageList;
import com.ziniu.logistics.web.so.ShippingRequestSO;
import com.ziniu.logistics.web.vo.ShippingRequestVo;


public interface ShippingRequestService {
		
	public ShippingRequestVo create(ShippingRequestVo vo);
	
	public void update(ShippingRequestVo vo);
	
	public void delete(Long id);
	
	public ShippingRequestVo get(Long id);
	
	public List<ShippingRequestVo> getAllOrder(String username);
	
	public PageList<ShippingRequestVo> getPageList(ShippingRequestSO so);
	
	public Map<String, String> fetchEshippingOrder(ShippingRequestVo requestOrder);

	public void registToEdi(Long id);
	
}
