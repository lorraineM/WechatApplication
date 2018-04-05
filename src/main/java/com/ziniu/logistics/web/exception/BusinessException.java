package com.ziniu.logistics.web.exception;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 业务exception，支持将多个参数传递到前层，构造成用户方便追踪原因的message。
 * @author bl00348
 *
 */
public class BusinessException extends RuntimeException{
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 错误信息代码，用做与i18n关联
	 */
	private String errorCode;
	
	/**
	 * 错误消息.
	 */
	private String message;
	
	/**
	 * 字段错误信息列表
	 */
	private Map<String, String> fieldErrors;
	
	/**
	 * 错误信息列表
	 */
	private List<String> errors;
	
	/**
	 * 错误信息对象 
	 */
    private Object contentObject;
	
	public BusinessException(){
		super();
	}
	public BusinessException(String errorCode){
		super();
		this.errorCode = errorCode;
	}
	public BusinessException(String errorCode, String message){
		super(message);
		this.errorCode = errorCode;
		this.message = message;
	}
	public BusinessException(String errorCode, Throwable cause){
		super(cause);
		this.errorCode = errorCode;
	}
	public BusinessException(String errorCode, String message, Throwable cause){
		super(cause);
		this.errorCode = errorCode;
		this.message = message;
	}
	
	/**
	 * 是否有字段校验不通过的错误
	 * @return
	 */
	public boolean hasFieldError(){
		if(fieldErrors != null && fieldErrors.size() > 0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 添加字段错误信息
	 * @param fieldName 字段名
	 * @param errorMsg 错误信息
	 */
	public void addFieldError(String fieldName, String errorMsg){
		if(fieldErrors == null){
			fieldErrors = new LinkedHashMap<String, String>();
		}
		fieldErrors.put(fieldName, errorMsg);
	}
	/**
	 * 删除字段错误信息
	 * @param fieldName 字段名
	 */
	public boolean removeFieldError(String fieldName){
		if(fieldErrors == null){
			return false;
		}
		fieldErrors.remove(fieldName);
		return true;
	}
	
	/**
	 * 是否有错误信息
	 * @return
	 */
	public boolean hasError(){
		if(errors != null && errors.size() > 0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 添加错误信息
	 * @param errorMsg 错误信息
	 */
	public void addError(String errorMsg){
		if(errors == null){
			errors = new ArrayList<String>();
		}
		errors.add(errorMsg);
	}
	/**
	 * 删除所有错误信息
	 */
	public boolean clearErrors(){
		if(errors == null){
			return false;
		}
		errors.clear();
		return true;
	}
	
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, String> getFieldErrors() {
		return fieldErrors;
	}
	public void setFieldErrors(Map<String, String> fieldErrors) {
		this.fieldErrors = fieldErrors;
	}
	public List<String> getErrors() {
		return errors;
	}
	public void setErrors(List<String> errors) {
		this.errors = errors;
	}
	public Object getContentObject() {
		return contentObject;
	}
	public void setContentObject(Object contentObject) {
		this.contentObject = contentObject;
	}
	
}
