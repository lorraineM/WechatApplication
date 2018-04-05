package com.ziniu.logistics.web.util;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

//import org.codehaus.jackson.map.ObjectMapper;

public class HttpPostUtil {

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
        byte[] responseBody = method1.getResponseBodyAsString().getBytes(method1.getResponseCharSet());
        // 在返回响应消息使用编码(utf-8或gb2312)
        String response = new String(responseBody, "utf-8");
        System.out.println("------------------response:" + response);
        // 释放连接
        method1.releaseConnection();
        return response;
    }

    public static String getDoGetURL2(String url, String charset) throws Exception {
        /*
         * 使用 GetMethod 来访问一个 URL 对应的网页,实现步骤: 1:生成一个 HttpClinet 对象并设置相应的参数。
         * 2:生成一个 GetMethod 对象并设置响应的参数。 3:用 HttpClinet 生成的对象来执行 GetMethod 生成的Get
         * 方法。 4:处理响应状态码。 5:若响应正常，处理 HTTP 响应内容。 6:释放连接。
         */

        /* 1 生成 HttpClinet 对象并设置参数 */
        HttpClient httpClient = new HttpClient();
        // 设置 Http 连接超时为5秒
        httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(5000);

        /* 2 生成 GetMethod 对象并设置参数 */
        GetMethod getMethod = new GetMethod(url);
        // 设置 get 请求超时为 5 秒
        getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
        // 设置请求重试处理，用的是默认的重试处理：请求三次
        getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler());

        String response = "";
        /* 3 执行 HTTP GET 请求 */
        try {
            int statusCode = httpClient.executeMethod(getMethod);
            /* 4 判断访问的状态码 */
            if (statusCode != HttpStatus.SC_OK) {
                System.err.println("Method failed: " + getMethod.getStatusLine());
            }

            /* 5 处理 HTTP 响应内容 */
            // HTTP响应头部信息，这里简单打印
            Header[] headers = getMethod.getResponseHeaders();
            for (Header h : headers)
                System.out.println(h.getName() + "------------ " + h.getValue());

            // 读取 HTTP 响应内容，这里简单打印网页内容
            byte[] responseBody = getMethod.getResponseBody(); // 读取为字节数组
            response = new String(responseBody, charset);
            System.out.println("----------response:" + response);

            // 读取为 InputStream，在网页内容数据量大时候推荐使用
            // InputStream response = getMethod.getResponseBodyAsStream();

        } catch (HttpException e) {
            // 发生致命的异常，可能是协议不对或者返回的内容有问题
            System.out.println("Please check your provided http address!");
            e.printStackTrace();
        } catch (IOException e) {
            // 发生网络异常
            e.printStackTrace();
        } finally {
            /* 6 .释放连接 */
            getMethod.releaseConnection();
        }
        return response;
    }
}

class UTF8PostMethod extends PostMethod {

    public UTF8PostMethod(String url) {
        super(url);
    }

    public String getRequestCharSet() {
        return "UTF-8";
    }

    public String getResponseCharSet() {
        return "UTF-8";
    }
}
