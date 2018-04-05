package com.ziniu.logistics.web.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;

public class HttpRequestUtil {
	public static String getDoGetURL(String url, String charset) throws Exception {

        HttpClient client = new HttpClient();
        GetMethod method1 = new GetMethod(url);

        if (null == url || !url.startsWith("http")) {
            throw new Exception("请求地址格式不对");
        }

        // 设置请求的编码方式
        if (null != charset) {
            method1.addRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=" + charset);
        } else {
            method1.addRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=" + "utf-8");
        }
        int statusCode = client.executeMethod(method1);

        if (statusCode != HttpStatus.SC_OK) { // 打印服务器返回的状态
            System.out.println("Method failed: " + method1.getStatusLine());
        }
        // 返回响应消息
        InputStream in = method1.getResponseBodyAsStream();
        InputStreamReader inReader = new InputStreamReader(in,"utf-8");
		BufferedReader buff = new BufferedReader(inReader);
		StringBuffer buffs = new StringBuffer();
		String str = "";
		while((str=buff.readLine())!=null){
			buffs.append(str);
		}
		buff.close();
		inReader.close();
		in.close();
        String response = buffs.toString();
        // 释放连接
        method1.releaseConnection();
        return response;
    }
	
	/*利用input stream post*/
	public static String doHttpPost(String postUrl, Map<String, String> params) {

        HttpClient client = new HttpClient();
        UTF8PostMethod mPost = new UTF8PostMethod(postUrl);
        client.getParams().setParameter("http.socket.timeout", new Integer(600000));
        String[] keys = params.keySet().toArray(new String[0]);
        for (String key : keys) {
            mPost.addParameter(key, params.get(key));
        }
        String responseTxt = "";
        mPost.getResponseCharSet();
        try {
            int responseCode = client.executeMethod(mPost);
            if (responseCode != HttpStatus.SC_OK) {
                responseTxt = "";
            } else {
                responseTxt = mPost.getResponseBodyAsString();
            }
        } catch (Exception e) {
        } finally {
            try {
                mPost.releaseConnection();
                client.getHttpConnectionManager().closeIdleConnections(0);
            } catch (Exception e) {
            }
        }
        return responseTxt;
    }
	
	/*利用data stream post*/
	public static String PostData(String url, String content) throws Exception {
		String response = "";  
		
		HttpURLConnection uRLConnection = (HttpURLConnection)new URL(url).openConnection();
		uRLConnection.setConnectTimeout(30000);
		uRLConnection.setReadTimeout(30000);
		uRLConnection.setDoInput(true);  
        uRLConnection.setDoOutput(true);  
        uRLConnection.setRequestMethod("POST");  
        uRLConnection.setUseCaches(false); 
        
        uRLConnection.setInstanceFollowRedirects(false);
        uRLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");  
		uRLConnection.connect();
		try {
			 DataOutputStream out = new DataOutputStream(uRLConnection.getOutputStream());
			 try {
				 out.writeBytes(content);  
				 out.flush();
			 }finally {
	            out.close();
			 }
			 InputStream is = uRLConnection.getInputStream();
			 BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			 try {
	            String readLine = null;  
	            while((readLine =br.readLine()) != null){  
	                //response = br.readLine();  
	                response = response + readLine;  
	            }
			 }finally {
	            is.close();  
	            br.close(); 
			 }
		}finally {
			uRLConnection.disconnect();
		}
		return response;
	}

	/*
	 * url UTF 8
	 * */
	public static String urlEncodeUTF8(String url){
		String result = url;
		try {
			result = java.net.URLEncoder.encode(url, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
}
