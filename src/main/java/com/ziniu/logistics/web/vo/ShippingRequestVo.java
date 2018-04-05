package com.ziniu.logistics.web.vo;

import com.ziniu.logistics.web.vo.BaseVo;
import com.ziniu.logistics.web.constants.ShippingStatus;

public class ShippingRequestVo extends BaseVo {
	
	private static final long serialVersionUID = 1402157398236L;
	
	private Long userId;	//场景二维码
	private String username;//openid
	// 订单ID 用户唯一
	private String orderId;
	private String orderSource = "weixin";
	private Boolean isReprint = false;
	
	// 发件人信息
	private String senderMan;
	private String senderManPhone;
	private String senderManAddress;
	private String senderPostcode = "null";
	private String senderCity;
	private String senderProvince;
	private String senderCounty;
	
	// 收件人信息
	private String receiverMan;
	private String receiverManPhone;
	private String receiverManAddress;
	private String receiverPostcode = "null";
	private String receiverProvince;
	private String receiverCity;
	private String receiverCounty;
	
	// 指定承运商编码，不指定默认申通
	private String logisticsProviderCode = "STO";
	
	// 是否需要申请电子面单
	private boolean needFetch = true;
	
	// 备注
	private String remark;
	private String remark1 = null;
	private String remark2 = null;
	private String remark3 = null;
	
	// 货物信息
	private String itemName;
	private String itemWeight = "1.0";
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
	
	private String machineCode;
	//电子面单申请结果
	private String result = "NONE";
	private String printResult = "NONE";
	private String mailNo = null;
	private Long  mainId = null;
	private String errorCode = null;
	private String errorDesc = null;
	private String eShippingOrderString = null ;
	
	private ShippingStatus shippingStatus = ShippingStatus.NOMESSAGE;
	
	public String getResult() {
		return result;
	}
	
	public void setResult(String result) {
		this.result = result;
	}
	
	public String getPrintResult() {
		return printResult;
	}
	
	public void setPrintResult(String printResult) {
		this.printResult = printResult;
	}
	
	public String getMailNo() {
		return mailNo;
	}
	
	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
	}
	
	public String getErrorCode() {
		return errorCode;
	}
	
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	
	public String getErrorDesc() {
		return errorDesc;
	}
	
	public void setErrorDesc(String errorDesc) {
		this.errorDesc = errorDesc;
	}
	
	public String geteShippingOrderString() {
		return eShippingOrderString;
	}
	
	public void seteShippingOrderString(String eShippingOrderString) {
		this.eShippingOrderString = eShippingOrderString;
	}
	
	public Long getUserId() {
		return userId;
	}
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public String getOrderId() {
		return orderId;
	}
	
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getOrderSource() {
		return orderSource;
	}
	
	public void setOrderSource(String orderSource) {
		this.orderSource = orderSource;
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
	
	public boolean isNeedFetch() {
		return needFetch;
	}
	
	public void setNeedFetch(boolean needFetch) {
		this.needFetch = needFetch;
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
	
	public Boolean getIsReprint() {
		return isReprint;
	}
	
	public void setIsReprint(Boolean isReprint) {
		this.isReprint = isReprint;
	}
	
	public String getMachineCode() {
		return machineCode;
	}
	
	public void setMachineCode(String machineCode) {
		this.machineCode = machineCode;
	}
	
	public Long getMainId() {
		return mainId;
	}
	
	public void setMainId(Long mainId) {
		this.mainId = mainId;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public ShippingStatus getShippingStatus() {
		return shippingStatus;
	}
	
	public void setShippingStatus(ShippingStatus shippingStatus) {
		this.shippingStatus = shippingStatus;
	}
	
}
