package com.ft.util;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

/**
 * 字符串相关方法
 *
 */
public class StringUtil {

	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr){
	    int i = 0;
	    String TempStr = valStr;
	    String[] returnStr = new String[valStr.length() + 1 - TempStr.replace(",", "").length()];
	    valStr = valStr + ",";
	    while (valStr.indexOf(',') > 0)
	    {
	        returnStr[i] = valStr.substring(0, valStr.indexOf(','));
	        valStr = valStr.substring(valStr.indexOf(',')+1 , valStr.length());
	        
	        i++;
	    }
	    return returnStr;
	}
	
	public static String StringFilter(String str) throws PatternSyntaxException { 
		// 只允许字母和数字 // String regEx ="[^a-zA-Z0-9]"; 
		// 清除掉所有特殊字符 
		Map<String, Object> map=new HashMap<String, Object>();
	  
		
		String regEx="[^TMD]"; 
		Pattern p = Pattern.compile(regEx); 
		Matcher m = p.matcher(str);
		return m.replaceAll("*").trim();
		} 
	
	public static void main(String[] args) {
		String str=	StringUtil.StringFilter("TMD你好吗?TMYD");
		System.out.println(str);
	}
	 
}


