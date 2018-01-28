package com.ft.util;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;




import com.ft.entity.system.User;
import com.ft.service.system.user.UserService;

public class PageData extends HashMap  implements Map{
	
	private static final long serialVersionUID = 1L;
	
	 Map map = null;
	 HttpServletRequest request;
	
	
	
	
	public PageData(HttpServletRequest request){
		this.request = request;
		Map properties = request.getParameterMap();
		Map returnMap = new HashMap(); 
		Iterator entries = properties.entrySet().iterator(); 
		Map.Entry entry; 
		String name = "";  
		String value = "";  
		while (entries.hasNext()) {
			entry = (Map.Entry) entries.next(); 
			name = (String) entry.getKey(); 
			Object valueObj = entry.getValue(); 
			if(null == valueObj){ 
				value = ""; 
			}else if(valueObj instanceof String[]){ 
				String[] values = (String[])valueObj;
				for(int i=0;i<values.length;i++){ 
					 value = values[i] + ",";
				}
				value = value.substring(0, value.length()-1); 
			}else{
				value = valueObj.toString(); 
			}
			returnMap.put(name, value); 
		}
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		returnMap = this.getuserComMap(session,returnMap);
		map = returnMap;
	}
	
	public PageData() {
		map = new HashMap();
	}
	
	
	public PageData(Integer obj) {
		map = new HashMap();
		
		request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		/*HttpSession session= request.getSession();*/
		User pduser =(User) session.getAttribute(Const.SESSION_USER);
		
	  if(pduser!=null){
		
		PageData pd2 = new PageData();
		
		pd2.put("USER_ID", pduser.getUSER_ID().toString());
		
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		UserService userService = (UserService) wac.getBean("userService");
		
		
		PageData uxser;
		try
		{
			uxser = userService.findByUiId(pd2);
			
			if(uxser!=null && uxser.size()>0){
				 
				
	    	    map.put("COMPANY_ID", uxser.get("COMPANY_ID").toString());
	    	    map.put("LOGINUSER_ID", uxser.get("USER_ID").toString());
			}else{
				
				map.put("COMPANY_ID", null);
			}
			}
		 catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		

		
	}
	
	
	
	@Override
	public Object get(Object key) {
		Object obj = null;
		if(map.get(key) instanceof Object[]) {
			Object[] arr = (Object[])map.get(key);
			obj = request == null ? arr:(request.getParameter((String)key) == null ? arr:arr[0]);
		} else {
			obj = map.get(key);
		}
		return obj;
	}
	
	public String getString(Object key) {
		return (String)get(key);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Object put(Object key, Object value) {
		return map.put(key, value);
	}
	
	@Override
	public Object remove(Object key) {
		return map.remove(key);
	}

	public void clear() {
		map.clear();
	}

	public boolean containsKey(Object key) {
		// TODO Auto-generated method stub
		return map.containsKey(key);
	}

	public boolean containsValue(Object value) {
		// TODO Auto-generated method stub
		return map.containsValue(value);
	}

	public Set entrySet() {
		// TODO Auto-generated method stub
		return map.entrySet();
	}

	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return map.isEmpty();
	}

	public Set keySet() {
		// TODO Auto-generated method stub
		return map.keySet();
	}

	@SuppressWarnings("unchecked")
	public void putAll(Map t) {
		// TODO Auto-generated method stub
		map.putAll(t);
	}

	public int size() {
		// TODO Auto-generated method stub
		return map.size();
	}

	public Collection values() {
		// TODO Auto-generated method stub
		return map.values();
	}
	/**
	 * 将company id 封装进pageData
	 * @return
	 */
	public Map getuserComMap(Session session,Map returnMap){
		User pduser =(User) session.getAttribute(Const.SESSION_USER);
		
      if(pduser!=null){
		
		PageData pd2 = new PageData();
		
		pd2.put("USER_ID", pduser.getUSER_ID().toString());
		
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		UserService userService = (UserService) wac.getBean("userService");
		
		
		PageData uxser;
		try
		{
			uxser = userService.findByUiId(pd2);
			
			if(uxser!=null && uxser.size()>0){
				
	    	    returnMap.put("COMPANY_ID", uxser.get("COMPANY_ID").toString());
	    	    returnMap.put("LOGINUSER_ID", uxser.get("USER_ID").toString());
			}else{
				
				returnMap.put("COMPANY_ID", null);
			}
			}
		 catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		return returnMap;
	}
	
}
