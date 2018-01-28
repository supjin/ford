package com.ft.util.cache;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.ft.entity.Dict;
import com.ft.service.system.dict.DictService;
import com.ft.util.PageData;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;


public class DictUtils {
	private static DictService dictService = (DictService) SpringContextHolder.getBean(DictService.class);
	public static final String CACHE_DICT_MAP = "dictMap";
	public static final String CACHE_DICT="alldict";

	public static String getDictLabel(String value, String type, String defaultValue) throws Exception {
		if ((StringUtils.isNotBlank(type)) && (StringUtils.isNotBlank(value))) {
			for (Dict dict : getDictList(type)) {
				if ((type.equals(dict.getType())) && (value.equals(dict.getValue()))) {
					return dict.getLabel();
				}
			}
		}
		return defaultValue;
	}

	

	public static String getDictValue(String label, String type, String defaultLabel) throws Exception {
		if ((StringUtils.isNotBlank(type)) && (StringUtils.isNotBlank(label))) {
			for (Dict dict : getDictList(type)) {
				if ((type.equals(dict.getType())) && (label.equals(dict.getLabel()))) {
					return dict.getValue();
				}
			}
		}
		return defaultLabel;
	}

	public static List<Dict> getDictList(String type){
		Map<String, List<Dict>> dictMap = (Map) CacheUtils.get("dictMap");
		if (dictMap == null) {
			dictMap = Maps.newHashMap();
			try {
				for (Dict dict : dictService.findAllList()) {
					List<Dict> dictList = (List) dictMap.get(dict.getType());
					if (dictList != null) {
						dictList.add(dict);
					} else {
						dictMap.put(dict.getType(), Lists.newArrayList(new Dict[] { dict }));
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			CacheUtils.put("dictMap", dictMap);
		}
		List<Dict> dictList = (List) dictMap.get(type);
		if (dictList == null) {
			dictList = Lists.newArrayList();
		}
		return dictList;
	}

	@SuppressWarnings("unchecked")
	public static List<Dict> getDictList4Special(String type) throws Exception {
		Map<String, List<Dict>> dictMap = (Map) CacheUtils.get("dictMap");
		if (dictMap == null) {
			dictMap = Maps.newHashMap();
			for (Dict dict : dictService.findAllList()) {
				List<Dict> dictList = (List) dictMap.get(dict.getType());
				if (dictList != null) {
					dictList.add(dict);
				} else {
					dictMap.put(dict.getType(), Lists.newArrayList(new Dict[] { dict }));
				}
			}
			CacheUtils.put("dictMap", dictMap);
		}
		List<Dict> dictList = (List<Dict>) dictMap.get(type);
		Object resultList = Lists.newArrayList();
		if ((dictList != null) && (dictList.size() > 0)) {
			for (Dict dict : dictList) {
				if (dict.getSpecial() == Dict.SPECIAL4ESPECIALLY) {
					((List) resultList).add(dict);
				}
			}
		}
		return (List<Dict>) resultList;
	}

	public static List<Dict> getDictList4General(String type) throws Exception {
		Map<String, List<Dict>> dictMap = (Map) CacheUtils.get("dictMap");
		if (dictMap == null) {
			dictMap = Maps.newHashMap();
			for (Dict dict : dictService.findAllList()) {
				List<Dict> dictList = (List) dictMap.get(dict.getType());
				if (dictList != null) {
					dictList.add(dict);
				} else {
					dictMap.put(dict.getType(), Lists.newArrayList(new Dict[] { dict }));
				}
			}
			CacheUtils.put("dictMap", dictMap);
		}
		List<Dict> dictList = (List) dictMap.get(type);
		Object resultList = Lists.newArrayList();
		if ((dictList != null) && (dictList.size() > 0)) {
			for (Dict dict : dictList) {
				if (dict.getSpecial() == Dict.SPECIAL4COMMON) {
					((List) resultList).add(dict);
				}
			}
		}
		return (List<Dict>) resultList;
	}
	
	public static String getLabel(String type,int id){
		Map<String, List<Dict>> dictMap = (Map) CacheUtils.get("dictMap");
		if (dictMap == null) {
			dictMap = Maps.newHashMap();
			List<Dict> dictlist = new ArrayList<Dict>();
			try {
				dictlist = dictService.findAllList();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for (Dict dict : dictlist) {
				List<Dict> dictList = (List) dictMap.get(dict.getType());
				if (dictList != null) {
					dictList.add(dict);
				} else {
					dictMap.put(dict.getType(), Lists.newArrayList(new Dict[] { dict }));
				}
			}
			CacheUtils.put("dictMap", dictMap);
		}
		List<Dict> dictList = (List) dictMap.get(type);
		
		if ((dictList != null) && (dictList.size() > 0)) {
			for (Dict dict : dictList) {
				if (Integer.valueOf(dict.getValue())== id) {
					return dict.getLabel();
				}
			}
		}
		return "";
	}
	
	/**
	 * 根据type获取所有dict,返回pagedata
	 * @param type
	 * @return
	 */
	public static List<PageData> getAllDict(String type){
		List<PageData> alldicts = (List<PageData>)CacheUtils.get(CACHE_DICT);
	    if(alldicts == null) {
	    	try {
				alldicts = dictService.getAll(new PageData());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        CacheUtils.put(CACHE_DICT, alldicts);
	    }
	    List<PageData> resultList = Lists.newArrayList();
	    for(int i=0;i<alldicts.size();i++){
	    	if(alldicts.get(i).getString("TYPE").equals(type)){
	    		resultList.add(alldicts.get(i));
	    	}
	    }
	    return resultList;
	}
	
	/**
	 * 根据pid获取dict
	 * @param cid
	 * @return
	 */
	public static List<PageData> getDictByPid(int dictid){
	    List<PageData> allCounties = (List<PageData>)CacheUtils.get(CACHE_DICT);
	    if(allCounties == null){
	        try {
				allCounties = dictService.getAll(new PageData());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        CacheUtils.put(CACHE_DICT, allCounties);
	    }
	    List<PageData> resultList = Lists.newArrayList();
	    for(int i=0;i<allCounties.size();i++){
	    	if((int)allCounties.get(i).get("PID")==dictid){
	    		resultList.add(allCounties.get(i));
	    	}
	    }
	    return resultList;
	}
	
	/**
	 * 根据dictid获取label
	 * @param dictId
	 * @return
	 */
	public static String getLabelByDictID(int dictId){
		List<PageData> allCounties = (List<PageData>)CacheUtils.get(CACHE_DICT);
	    if(allCounties == null){
	        try {
				allCounties = dictService.getAll(new PageData());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        CacheUtils.put(CACHE_DICT, allCounties);
	    }
	    for(int i=0;i<allCounties.size();i++){
	    	if((int)allCounties.get(i).get("DICT_ID")==dictId){
	    		return allCounties.get(i).getString("LABEL");
	    	}
	    }
		return "";
	}
}
