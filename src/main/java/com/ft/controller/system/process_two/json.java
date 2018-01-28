package com.ft.controller.system.process_two;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;


import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.google.gson.annotations.JsonAdapter;

public class json {
public static void main(String[] args) {
	String j  = "{\"1\":[\"111\",\"222\",\"333\"],\"2\":\"3\"}";
	Map<String ,List<String>> m = new HashMap<String,List<String>>();
	List<String > list =  new LinkedList<String>();
	list.add("sss");
	list.add("jjj");
	m.put("1",list);
	list.add("dsaasd");
	m.put("333",list );

    String l = JSON.toJSONString(m);

		System.out.println(l);

		Map o =(Map) JSON.parse(l);
		
		for(Object s :o.keySet()){
			List  l2 =(List)o.get(s);
			for (Object ssss : l2) {
				System.out.println(":::"+ssss.toString());
			}
		}
	
}
	
}
