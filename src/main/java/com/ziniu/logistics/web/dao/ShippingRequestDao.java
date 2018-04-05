package com.ziniu.logistics.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ziniu.logistics.web.so.PageList;
import com.ziniu.logistics.web.so.ShippingRequestSO;
import com.ziniu.logistics.web.vo.ShippingRequestVo;

public interface ShippingRequestDao extends BaseDao  {
	public ShippingRequestVo findByOrderId(String orderId,String orderSource);
	
	public ShippingRequestVo findByMailNo(String mailNo,String logistProviderCode);
	
	public PageList<ShippingRequestVo> getPageList(ShippingRequestSO so);
	
	public int getCount(ShippingRequestSO so);
	
	public List<ShippingRequestVo> getAllOrder(@Param("username") String username);
}
