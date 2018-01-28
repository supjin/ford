package com.ft.springqtz;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.util.DateUtil;
import com.ft.util.PageData;
import com.ft.util.QuestionDateUtil;
import com.ft.util.SpringContext;
import com.ft.util.Tools;
import com.ft.util.mail.SendMail;

public class SpringQtzJob {
		@Autowired
		private DaoSupport dao;
	
		PageData pd = new PageData();
	    //0公里问题
		private void jobHand() {
			System.out.println("1111111111");
	    	try {
	    		dao = (DaoSupport) SpringContext.getBean("daoSupport");
	    		List<PageData> varList = (List<PageData>) dao.findForList("Client_problem_collectionMapper.listAll", pd);
	    		List<PageData> dicList = (List<PageData>) dao.findForList("DictMapper.getList", "processType");
	    		// 判断时间是否超期
	    		String time = DateUtil.getTime();
	    		Date times = Tools.str2Date(time);
	    		List<String> emList = new ArrayList<String>();//超期的email列表
	    		List<String> jmList = new ArrayList<String>();//即将超期的email列表
	    		for (PageData pageData : varList) {
		    		PageData pds = new PageData();
		    		pageData.put("USTATE",Integer.parseInt(pageData.getString("PROCESSTATE")) + 1);
		    		pd.put("CLIENT_PROBLEM_COLLECTION_ID",pageData.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		    		pds.put("DANGQ", "");
		    		pds.put("DANTYPE","1");
		    		// 查询计划表
		    		List<PageData> planList;
		    			planList = (List<PageData>) dao.findForList("PlanMapper.listAllByClientS", pd);
		    			if (planList != null) {//循环计划表，判断是否超期
		    				for (PageData _pageData : planList) {
		    					// 当前步骤
		    					int USTEP = Integer.parseInt(_pageData.getString("STEP").substring(1));
		    					
		    					
		    					_pageData.put("USTEP", _pageData.getString("STEP").substring(1));//得到当前需要判断的步骤 00 - 08 获取最后一位
		    					
		    					if(pds.get("DANGQ").equals("")){//只判断当前的时间状态
		    						if(Integer.parseInt(_pageData.get("ISFINISH").toString()) == 0){
		    							pageData.put("DANGQ", _pageData.getString("USTEP"));//当前步棸的数字  0-8中的一个
		    							pageData.put("ISFINISH", _pageData.get("ISFINISH").toString());//完成状态
		    							pageData.put("CHUNAME", _pageData.get("NAME").toString());//处理人
		    							pds.put("DANGQ", _pageData.get("USTEP").toString());//用于判断是否还需要插值
		    							//获取D几的名字
		    							for (PageData pageData2 : dicList) {//循环基础表获取D的LABEL
		    								if(Integer.parseInt(pageData2.get("VALUE").toString())==Integer.parseInt((pageData.get("DANGQ").toString()))){//当前===value的那个的LABEL值
		    									if(pageData.getString("LABEL") == null){
		    									pageData.put("LABEL", pageData2.getString("REMARKS"));
		    									pageData.put("PID", pageData2.getString("PID"));
		    									}
		    								}
		    							}
		    							//判断时间状态
		    							if (null != _pageData.get("PLANTIME")&& !"".equals(_pageData.get("PLANTIME"))) {
		    								//计划时间
		    								Date date = Tools.str2Date(_pageData.get("PLANTIME").toString());
		    								if (times.after(date)) {
		    									pds.put("SHIJIT", "已超期");
		    									pds.put("TITLE", pageData.getString("TITLE"));
		    									pageData.put("ISOUTIME", 1);  //超期未完成
		    									SendMail sendMail = new SendMail();
		    								if(sendMail.checkEmail(_pageData.getString("EMAIL")))
		    									//sendMail.sinkMail(_pageData.getString("EMAIL"), pds);
		    									System.out.println(_pageData.getString("EMAIL"));
		    								} 
		    								//是否即将过期
		    								boolean flog = QuestionDateUtil.getisBeyond(_pageData.get("PLANTIME").toString(), QuestionDateUtil.getBeyond(Integer.parseInt((pageData.get("DANGQ").toString()))));
		    								if(!times.after(date)&&flog){
		    									pageData.put("ISOUTIME", 2);// 即将超期（计划时间与完成时间对比）
		    									pds.put("SHIJIT", "即将超期");
		    									pds.put("TITLE", pageData.getString("TITLE"));
		    									SendMail sendMail = new SendMail();
			    								if(sendMail.checkEmail(_pageData.getString("EMAIL")))
			    									//sendMail.sinkMail(_pageData.getString("EMAIL"), pds);
			    									System.out.println(_pageData.getString("EMAIL"));
			    								} 
		    								}
		    						}
		    					}	
		    				}
	    		
		    			}
		    			
	    		
	    	}
		
	    	}catch (Exception e) {
			}
		
		
		/*private void jobCard() {
			System.out.println("+++++++++++++++");
			// TODO Auto-generated method stub
			
		}  */
		}
}
