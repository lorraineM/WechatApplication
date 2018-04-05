package com.ziniu.logistics.web.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import com.ziniu.logistics.web.vo.ShippingRequestVo;

public class EOrderItem implements Serializable {
	private String orderId;
	
	// 发件人信息
		private String senderMan;
		private String senderManPhone;
		private String senderManAddress;
		private String senderPostcode = null;
		private String senderCity;
		private String senderProvince;
		private String senderCounty;
		
		// 收件人信息
		private String receiverMan;
		private String receiverManPhone;
		private String receiverManAddress;
		private String receiverPostcode = null;
		private String receiverProvince;
		private String receiverCity;
		private String receiverCounty;
		
		// 指定承运商编码，不指定默认汇通
		private String logisticsProviderCode = "HUITONG";
		
		// 备注
		private String remark;
		private String remark1 = null;
		private String remark2 = null;
		private String remark3 = null;
		
		// 货物信息
		private String itemName;
		private String itemWeight = "1kg";
		private String itemCount = "1";
		
		// 扩展字段
		private String udf1 = null;
		private String udf2 = null;
		private String udf3 = null;
		private String udf4 = null;
		private String udf5 = null;
		private String udf6 = null;
		private String udf7 = null;
		private String udf8 = null;

		//base vo 字段
		private Timestamp createTime;
		
		public String getOrderId() {
			return orderId;
		}
		
		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}
		
		public String getSenderMan() {
			return senderMan;
		}
		
		public void setSenderMan(String senderMan) {
			this.senderMan = senderMan;
		}
		
		public String getSenderManPhone() {
			return senderManPhone;
		}
		
		public void setSenderManPhone(String senderManPhone) {
			this.senderManPhone = senderManPhone;
		}
		
		public String getSenderManAddress() {
			return senderManAddress;
		}
		
		public void setSenderManAddress(String senderManAddress) {
			this.senderManAddress = senderManAddress;
		}
		
		public String getSenderPostcode() {
			return senderPostcode;
		}
		
		public void setSenderPostcode(String senderPostcode) {
			this.senderPostcode = senderPostcode;
		}
		
		public String getSenderCity() {
			return senderCity;
		}
		
		public void setSenderCity(String senderCity) {
			this.senderCity = senderCity;
		}
		
		public String getSenderProvince() {
			return senderProvince;
		}
		
		public void setSenderProvince(String senderProvince) {
			this.senderProvince = senderProvince;
		}
		
		public String getSenderCounty() {
			return senderCounty;
		}
		
		public void setSenderCounty(String senderCounty) {
			this.senderCounty = senderCounty;
		}
		
		public String getReceiverMan() {
			return receiverMan;
		}
		
		public void setReceiverMan(String receiverMan) {
			this.receiverMan = receiverMan;
		}
		
		public String getReceiverManPhone() {
			return receiverManPhone;
		}
		
		public void setReceiverManPhone(String receiverManPhone) {
			this.receiverManPhone = receiverManPhone;
		}
		
		public String getReceiverManAddress() {
			return receiverManAddress;
		}
		
		public void setReceiverManAddress(String receiverManAddress) {
			this.receiverManAddress = receiverManAddress;
		}
		
		public String getReceiverPostcode() {
			return receiverPostcode;
		}
		
		public void setReceiverPostcode(String receiverPostcode) {
			this.receiverPostcode = receiverPostcode;
		}
		
		public String getReceiverProvince() {
			return receiverProvince;
		}
		
		public void setReceiverProvince(String receiverProvince) {
			this.receiverProvince = receiverProvince;
		}
		
		public String getReceiverCity() {
			return receiverCity;
		}
		
		public void setReceiverCity(String receiverCity) {
			this.receiverCity = receiverCity;
		}
		
		public String getReceiverCounty() {
			return receiverCounty;
		}
		
		public void setReceiverCounty(String receiverCounty) {
			this.receiverCounty = receiverCounty;
		}
		
		public String getLogisticsProviderCode() {
			return logisticsProviderCode;
		}
		
		public void setLogisticsProviderCode(String logisticsProviderCode) {
			this.logisticsProviderCode = logisticsProviderCode;
		}
		
		public String getRemark() {
			return remark;
		}
		
		public void setRemark(String remark) {
			this.remark = remark;
		}
		
		public String getRemark1() {
			return remark1;
		}
		
		public void setRemark1(String remark1) {
			this.remark1 = remark1;
		}
		
		public String getRemark2() {
			return remark2;
		}
		
		public void setRemark2(String remark2) {
			this.remark2 = remark2;
		}
		
		public String getRemark3() {
			return remark3;
		}
		
		public void setRemark3(String remark3) {
			this.remark3 = remark3;
		}
		
		public String getItemName() {
			return itemName;
		}
		
		public void setItemName(String itemName) {
			this.itemName = itemName;
		}
		
		public String getItemWeight() {
			return itemWeight;
		}
		
		public void setItemWeight(String itemWeight) {
			this.itemWeight = itemWeight;
		}
		
		public String getItemCount() {
			return itemCount;
		}
		
		public void setItemCount(String itemCount) {
			this.itemCount = itemCount;
		}
		
		public String getUdf1() {
			return udf1;
		}
		
		public void setUdf1(String udf1) {
			this.udf1 = udf1;
		}
		
		public String getUdf2() {
			return udf2;
		}
		
		public void setUdf2(String udf2) {
			this.udf2 = udf2;
		}
		
		public String getUdf3() {
			return udf3;
		}
		
		public void setUdf3(String udf3) {
			this.udf3 = udf3;
		}
		
		public String getUdf4() {
			return udf4;
		}
		
		public void setUdf4(String udf4) {
			this.udf4 = udf4;
		}
		
		public String getUdf5() {
			return udf5;
		}
		
		public void setUdf5(String udf5) {
			this.udf5 = udf5;
		}
		
		public String getUdf6() {
			return udf6;
		}
		
		public void setUdf6(String udf6) {
			this.udf6 = udf6;
		}
		
		public String getUdf7() {
			return udf7;
		}
		
		public void setUdf7(String udf7) {
			this.udf7 = udf7;
		}
		
		public String getUdf8() {
			return udf8;
		}
		
		public void setUdf8(String udf8) {
			this.udf8 = udf8;
		}
		
		public Timestamp getCreateTime(){
			return this.createTime;
		}

		public void setCreateTime(Timestamp createTime){
			this.createTime = createTime;
		}
		public static EOrderItem fromVo(ShippingRequestVo vo){
			EOrderItem orderItem = new EOrderItem();
			orderItem.setCreateTime(vo.getCreateTime());
			orderItem.setItemCount(vo.getItemCount());
			orderItem.setItemName(vo.getItemName());
			orderItem.setItemWeight(vo.getItemWeight());
			orderItem.setLogisticsProviderCode(vo.getLogisticsProviderCode());
			orderItem.setOrderId(vo.getOrderId());
			orderItem.setReceiverCity(vo.getReceiverCity());
			orderItem.setReceiverCounty(vo.getReceiverCounty());
			orderItem.setReceiverMan(vo.getReceiverMan());
			orderItem.setReceiverManAddress(vo.getReceiverManAddress());
			orderItem.setReceiverManPhone(vo.getReceiverManPhone());
			orderItem.setReceiverPostcode(vo.getReceiverPostcode());
			orderItem.setReceiverProvince(vo.getReceiverProvince());
			orderItem.setRemark(vo.getRemark());
			orderItem.setRemark1(vo.getRemark1());
			orderItem.setRemark2(vo.getRemark2());
			orderItem.setRemark3(vo.getRemark3());
			orderItem.setSenderCity(vo.getSenderCity());
			orderItem.setSenderCounty(vo.getSenderCounty());
			orderItem.setSenderMan(vo.getSenderMan());
			orderItem.setSenderManAddress(vo.getSenderManAddress());
			orderItem.setSenderManPhone(vo.getSenderManPhone());
			orderItem.setSenderPostcode(vo.getSenderPostcode());
			orderItem.setSenderProvince(vo.getSenderProvince());
			orderItem.setUdf1(vo.getUdf1());
			orderItem.setUdf2(vo.getUdf2());
			orderItem.setUdf3(vo.getUdf3());
			orderItem.setUdf4(vo.getUdf4());
			orderItem.setUdf5(vo.getUdf5());
			orderItem.setUdf6(vo.getUdf6());
			orderItem.setUdf7(vo.getUdf7());
			orderItem.setUdf8(vo.getUdf8());
			
			return orderItem;
		}
}
