package com.ziniu.logistics.web.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class EUtil {
	/*获取快递单号*/
	public static final String numbertoken = "1234567890";
	public static String getNumberToken(int size) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(numbertoken.charAt(random.nextInt(10)));
        }
        return sb.toString();
    }
	/*生成SIGN*/
	public static String makeSign(String bizdata, String secretkey)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update((bizdata + secretkey).getBytes("UTF-8"));
		byte[] b = md.digest();
		String sign = (new sun.misc.BASE64Encoder()).encode(b);
		return sign;
	}
}
