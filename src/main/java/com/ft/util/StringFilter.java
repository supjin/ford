package com.ft.util;

import java.util.HashMap;

import alex.zhrenjie04.wordfilter.WordFilterUtil;
import alex.zhrenjie04.wordfilter.result.FilteredResult;

public class StringFilter {
	
	/**

	 * maxLength-需要过滤最长字符串的长度

	 * filterStrs<string,string>-需要过滤字符串的集合，key为需要过滤字符串，value为过滤成的字符串如"*"

	 * @author Administrator

	 *

	 */
		private static int maxLength;

		 private static HashMap<String,String> filterStrs=new HashMap<String,String>();

		 /**

		 * 初始化需要过滤掉*的数量

		 */
		
		 private String initStr(int n){

		 StringBuffer sb=new StringBuffer();

		 for(int i=0;i<n;i++){

		 sb.append('*');

		 }

		 return sb.toString();

		 }

		 /**

		 * str-被过滤得字符串

		 * s-需要过滤得字符串

		 * 获得剩下未过滤的字符串

		 */

		 private static String getNextStr(String str,int start,int slength){

		 if(start==0){

		 str=str.substring(slength);

		 }else if(start+slength<str.length()){

		 str=str.substring(start+slength);

		 }

		 return str;

		 }

		 /**

		 * str-被过滤得字符串

		 * s-需要过滤得字符串

		 * 获得过滤后的字符串

		 */

		 private static StringBuffer getFilterStr(StringBuffer sb,String str,int start,String s){

		 if(start!=0){

		 sb.append(str.substring(0,start));

		 }

		 sb.append(filterStrs.get(s));

		 return sb;

		 }

		 /**

		 * str-被过滤的字符串

		 * 过滤，并组合过滤后的字符串

		 */

		 public static String filter(String str) {

		 StringBuffer resultStr=new StringBuffer();

		 for(int start=0;start<str.length();start++){

		 for(int end=start+1;end<=str.length()&&end<=start+maxLength;end++){

		 String s=str.substring(start, end);

		 int slength=s.length();

		 if(filterStrs.containsKey(s)){

		 resultStr=getFilterStr(resultStr,str,start,s);

		 str=getNextStr(str,start,slength);

		 start=0;

		 end=start;

		 }

		 }

		 }

		 resultStr.append(str);

		 return resultStr.toString();

		 }

		 public void put(String key) {

		 int keyLength=key.length();

		filterStrs.put(key, initStr(keyLength));

		if(keyLength>StringFilter.maxLength)

		maxLength=keyLength;

		 }
		 public static void main(String[] agrs){

		 /*StringFilter t=new StringFilter();

			 t.put("TMD");
			 t.put("TNND");
			 t.put("操");
			 t.put("NND");
			 t.put("打倒共产党");

			 System.out.println(StringFilter.filter("TMD,操，打倒共产党 共产党TNND.操..TMDTMDTMDTMD.tTNND.操TMDTNNDTNNDTNND操"));
*/
			 
			 FilteredResult fl= WordFilterUtil.filterHtml("TMD黄小说中国共产党",'*');
			
			String str=  fl.getFilteredContent();
			System.out.println(str);
			
			 }
		
		 

}
