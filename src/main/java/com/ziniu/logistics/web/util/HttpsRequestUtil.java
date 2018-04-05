package com.ziniu.logistics.web.util;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.ziniu.logistics.web.model.TrustManager;
import net.sf.json.JSONObject;

public class HttpsRequestUtil {
	private static final Log logger = LogFactory.getLog(HttpsRequestUtil.class);
	
	public static JSONObject httpsRequest(String requestUrl,String requestMethod, String outstr) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException{
		JSONObject jsonobj = null;
		
		URL url = new URL(requestUrl);
		HttpsURLConnection connection = (HttpsURLConnection)url.openConnection();
		TrustManager[] trustmanager = {new TrustManager()};
		SSLContext sslcontext = SSLContext.getInstance("SSL", "SunJSSE");
		sslcontext.init(null, trustmanager, new java.security.SecureRandom());
		SSLSocketFactory sslsocket = sslcontext.getSocketFactory();
		connection.setSSLSocketFactory(sslsocket);
		connection.setDoOutput(true);
		connection.setDoInput(true);
		connection.setUseCaches(false);
		connection.setRequestMethod(requestMethod);
			
		if(outstr != null){
			//connection.setRequestProperty("Content-Type", "application/json");
			OutputStream out = connection.getOutputStream();
			out.write(outstr.getBytes("UTF-8"));
			out.close();
		}
			
		InputStream in = connection.getInputStream();
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
		in = null;
		connection.disconnect();
		jsonobj = JSONObject.fromObject(buffs.toString());
		return jsonobj;
	}
}
