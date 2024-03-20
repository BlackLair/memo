package com.kuwon.memo.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	// md5 암호화 기능
	// 암호화할 문자열을 전달받고, 암호화된 결과 문자열을 돌려준다.
	public static String md5(String message) {
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			byte[] bytes = message.getBytes();
			md.update(bytes); // 암호화 수행
			byte[] digest = md.digest();       // 암호화 결과를 byte 배열로 반환
			
			// byte 배열을 16진수 형태의 문자열 변환
			for(int i = 0; i < digest.length; i++) {
				result += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return result;
	}
}
