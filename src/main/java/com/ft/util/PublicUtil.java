package com.ft.util;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class PublicUtil {
	
	public static void main(String[] args) {
		System.out.println("本机的ip=" + PublicUtil.getIp());
		 String  str=PublicUtil.getIp().toString();
		String str2= str.replace(".", "");
		 char[] arr = str2.toCharArray();
		 
		for (int i = 0; i < arr.length; i++) {
			
			if(i>=3 && i<=6){
				
				arr[i]='*';
			}
			
		}
	String aa=	String.valueOf(arr);
	System.out.println(aa);
		/*String ss = str.substring(0,str.length()-(str.substring(3)).length())+"****"+str.substring(7); */
	 
	
	}
	
	public static String getPorjectPath(){
		String nowpath = "";
		nowpath=System.getProperty("user.dir")+"/";
		
		return nowpath;
	}
	
	/**
	 * 获取本机ip
	 * @return
	 */
	public static String getIp(){
		String ip = "";
		try {
			InetAddress inet = InetAddress.getLocalHost();
			ip = inet.getHostAddress();
			//System.out.println("本机的ip=" + ip);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		return ip;
	}
	
}