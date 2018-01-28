package com.ft.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class JsonUtil
{

	/**
	 * 数组装换json 字符串
	 * 
	 * @param str
	 * @return
	 */
	public static  String setListToJson(String[] DEPT, String[] PERSONNEL_NAME , String[] PHONE)
	{
		if (null != DEPT)
		{

			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			for (int i = 0; i < DEPT.length; i++)
			{

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("DEPT", DEPT[i]);
				map.put("PERSONNEL_NAME", PERSONNEL_NAME[i]);
				map.put("PHONE", PHONE[i]);
				
				list.add(map);
			}

			String strjson = JSON.toJSONString(list);

			return strjson;
		} else
		{

			return "";

		}
	}
	

	


	/**
	 * json 字符串转换
	 * 
	 * @param str
	 * @returnList<Map<String, Object>>
	 */
	public static List<Map<String, Object>> getJsonToList(String str)
	{

		// 将json转 jaon数组

		if (str.length() > 0)
		{

			JSONArray jsonarry = JSONArray.parseArray(str);
			// jaon数组转list
			List<Map<String, Object>> listjson = (List<Map<String, Object>>) JSONArray
					.toJavaObject(jsonarry, List.class);

			return listjson;
		} else
		{

			return null;
		}
	}
	/**
	 * isnot
	 * jsons转list<map>
	 * @param str
	 * @return
	 */
	public static List<LinkedHashMap<String, Object>> getJsonToList2(String str)
	{

		// 将json转 jaon数组
		List<LinkedHashMap<String, Object>> list=new ArrayList<LinkedHashMap<String,Object>>();

		if (str.length() > 0)
		{

			List<LinkedHashMap<String, Object>> jsonobj=(List<LinkedHashMap<String, Object>>) JSON.parseObject(str);
			
			return list;
		} else
		{

			return null;
		}
	}


}
