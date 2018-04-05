package com.ziniu.logistics.web.so;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ziniu.logistics.web.so.BasePageSO;

public class ShippingRequestSO extends BasePageSO {
	
	private static final long serialVersionUID = 1402299996232L;
	
	private Long id;
	private String keywords;
	private Date createTimeBegin;
	private Date createTimeEnd;
	private String sendMan;
	private String receiveMan;
	private String machineCode;
	private String orderSource;
	private String orderId;
	private String sendManPhone;
	private String receiveManPhone;
	private String result;
	private String printResult;
	private String mailNo;
	private String logisticsProviderCode;
	
	private Long userId;
	
	private Boolean printResultFlag;
	private List<String> printResults = new ArrayList<String>();
 	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getSendMan() {
		return sendMan;
	}
	
	public void setSendMan(String sendMan) {
		this.sendMan = sendMan;
	}
	
	public String getReceiveMan() {
		return receiveMan;
	}
	
	public void setReceiveMan(String receiveMan) {
		this.receiveMan = receiveMan;
	}
	
	public String getMachineCode() {
		return machineCode;
	}
	
	public void setMachineCode(String machineCode) {
		this.machineCode = machineCode;
	}
	
	public String getOrderSource() {
		return orderSource;
	}
	
	public void setOrderSource(String orderSource) {
		this.orderSource = orderSource;
	}
	
	public String getSendManPhone() {
		return sendManPhone;
	}
	
	public void setSendManPhone(String sendManPhone) {
		this.sendManPhone = sendManPhone;
	}
	
	public String getReceiveManPhone() {
		return receiveManPhone;
	}
	
	public void setReceiveManPhone(String receiveManPhone) {
		this.receiveManPhone = receiveManPhone;
	}
	
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
	
	public String getLogisticsProviderCode() {
		return logisticsProviderCode;
	}
	
	public void setLogisticsProviderCode(String logisticsProviderCode) {
		this.logisticsProviderCode = logisticsProviderCode;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	public String getKeywords() {
		return keywords;
	}
	
	public void setCreateTimeBegin(Date createTimeBegin) {
		this.createTimeBegin = createTimeBegin;
	}
	
	public Date getCreateTimeBegin() {
		return createTimeBegin;
	}
	
	public void setCreateTimeEnd(Date createTimeEnd) {
		this.createTimeEnd = createTimeEnd;
	}
	
	public Date getCreateTimeEnd() {
		return createTimeEnd;
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

    public Boolean getPrintResultFlag() {
        return printResultFlag;
    }

    public void setPrintResultFlag(Boolean printResultFlag) {
        this.printResultFlag = printResultFlag;
    }

    public List<String> getPrintResults() {
        return printResults;
    }

    public void setPrintResults(List<String> printResults) {
        this.printResults = printResults;
    }
	
}
