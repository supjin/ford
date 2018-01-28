package com.ft.service.system.client_problem_collection;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.entity.system.User;
import com.ft.util.Const;
import com.ft.util.DateUtil;
import com.ft.util.PageData;
import com.ft.util.QuestionDateUtil;
import com.ft.util.Tools;
import com.ft.util.UuidUtil;


@Service("client_problem_collectionService")
public class Client_problem_collectionService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Client_problem_collectionMapper.save", pd);
	}
	/*新增问题+计划*/
	public void saveAll(PageData pd, PageData pds)  throws Exception{
		// TODO Auto-generated method stub
		PageData pdp = new PageData();
		save(pd);
		if (null != pds) {
			// 向plan表插入9条各个阶段的基本数据
			for (int i = 0; i < 9; i++) {
				PageData _plan = new PageData();
				_plan.put("USERID", pds.getString("USER_ID"));
				_plan.put("STEP", ("0" + i));
				_plan.put("CLIENT_PROBLEM_COLLECTION_ID",pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
				_plan.put("ADDTIME", DateUtil.getDay());
				_plan.put("ISFINISH", 0);
				// 当前步骤
				_plan.put("PLANTIME", QuestionDateUtil.getHourBefors(QuestionDateUtil.getPlanDate(i)));  //添加计划时间
				dao.save("PlanMapper.save", _plan);
			}
			for (int i = 1; i < 3; i++) {
				String PROCESS_ONE_ID = UuidUtil.get32UUID().toString();
				pdp.put("PROCESS_ONE_ID", PROCESS_ONE_ID); // 主键
				pdp.put("TYPE", i);// 类型
				// 向D1表插入1条默认的责任人 和一条领导
				pdp.put("CLIENT_PROBLEM_COLLECTION_ID",pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
				pdp.put("RESPONSIBILITY", pds.getString("USER_ID"));// 默认负责人
				pdp.put("DEPT", pds.getString("DEPARTMENT_ID"));// 部门
				dao.save("Process_oneMapper.save", pdp);
			}
		}
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Client_problem_collectionMapper.delete", pd);
	}

	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Client_problem_collectionMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Client_problem_collectionMapper.datalistPage", page);
	}
	/*
	*审核列表
	*/
	public List<PageData> verifyList(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Client_problem_collectionMapper.verifydatalistPage", page);
	}
	//问题反馈列表
	public List<PageData> question_feedbackList(Page page) throws Exception {
		List<PageData> list = (List<PageData>) dao.findForList("Client_problem_collectionMapper.feedbackdatalistPage",page);
		return list;
	}
	//列出问题来源
	public List<PageData> listAllSource(PageData pd) throws Exception{
	 return ( List<PageData>) dao.findForList("Client_problem_collectionMapper.listAllSource", pd);
	}
	//列出接收者
	public List<PageData> listAllUser(PageData pd) throws Exception{
		 return ( List<PageData>) dao.findForList("Client_problem_collectionMapper.listAllUser", pd);
		}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Client_problem_collectionMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Client_problem_collectionMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Client_problem_collectionMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 修改人员设置状态
	 * @param pd
	 * @throws Exception
	 */
	public void updatePlanStatus(PageData pd) throws Exception {
		dao.update("Client_problem_collectionMapper.updatePlanStatus", pd);
	}

	/**
	 * 用于问题列表页返回是否过期
	 * 
	 * @param varList
	 * @return
	 * @throws Exception
	 */
	public Map<Object, Object> getTimeIsOut(List<PageData> varList)throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String userId = "";
		if (user != null) {
			userId = user.getUSER_ID();
		}
		Boolean isAdmin = "1".equals(userId);
		// 判断时间是否超期
		String time = DateUtil.getTime();
		Date times = Tools.str2Date(time);
		for (int i = 0; i < varList.size(); i++) {
			PageData pds = new PageData();
			varList.get(i).put("USTATE",Integer.parseInt(varList.get(i).getString("PROCESSTATE")) + 1);
			pd.put("CLIENT_PROBLEM_COLLECTION_ID",varList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));
			pds.put("DANGQ", "");
			// 查询计划表
			List<PageData> planList = (List<PageData>) dao.findForList("PlanMapper.listAllByClientS", pd);
			if (planList != null) {
				for (PageData _pageData : planList) {
					// 当前步骤
					int USTEP = Integer.parseInt(_pageData.getString("STEP").substring(1));
					//是否即将过期
					boolean flog = QuestionDateUtil.getisBeyond(_pageData.get("PLANTIME").toString(), QuestionDateUtil.getBeyond(USTEP));
					
					_pageData.put("USTEP", _pageData.getString("STEP").substring(1));//得到当前需要判断的步骤 00 - 08 获取最后一位
					// 时间判断
					if (null != _pageData.get("PLANTIME")&& !"".equals(_pageData.get("PLANTIME"))) {
						//计划时间
						Date date = Tools.str2Date(_pageData.get("PLANTIME").toString());
						
						
						if (times.after(date)&& Integer.parseInt(_pageData.get("ISFINISH").toString()) == 0) {
							_pageData.put("ISOUTIME", 1);  //超期未完成
						} 
						
					   
						if(date.after(times) && Integer.parseInt(_pageData.get("ISFINISH").toString()) == 0 && flog){
							_pageData.put("ISOUTIME", 2);// 即将超期（计划时间与完成时间对比）
						}
						/*if (null != _pageData.get("FINISHTIME")&& !"".equals(_pageData.get("FINISHTIME"))) {
							//完成时间
							Date dates = Tools.str2Date(_pageData.get("FINISHTIME").toString());
							
							if(date.after(dates) && Integer.parseInt(_pageData.get("ISFINISH").toString()) == 1){
								_pageData.put("ISOUTIME", 3);// 计划内完成
							}
						}*/
					}
					//当前步棸
					System.out.println(pds.get("DANGQ").toString());
					if(pds.get("DANGQ").equals("")){//
						if(Integer.parseInt(_pageData.get("ISFINISH").toString()) == 0){
							pds.put("DANGQ", _pageData.getString("USTEP")+"");
						}
					}
				}
			}
			if(!"".equals(pds.getString("DANGQ"))&&!isAdmin){
				//pds.put("DANGQJY",9);
				pds.put("DANGQJY", Integer.parseInt(pds.getString("DANGQ"))+1);
			}else {
				pds.put("DANGQJY",9);
			}
			
			pds.put("CLIENT_PROBLEM_COLLECTION_ID",varList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));
			pds.put("planList", planList);
			map.put(i, pds);
		}
		return map;
	}

	
	/***
	 * 用户新列表的状态显示判断
	 */
	
	public List<PageData> getPrombleState(List<PageData> varList,List<PageData> dicList) {
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String userId = "";
		if (user != null) {
			userId = user.getUSER_ID();
		}
		Boolean isAdmin = "1".equals(userId);
		// 判断时间是否超期
		String time = DateUtil.getTime();
		Date times = Tools.str2Date(time);
	for (PageData pageData : varList) {
		PageData pds = new PageData();
		pageData.put("USTATE",Integer.parseInt(pageData.getString("PROCESSTATE")) + 1);
		pd.put("CLIENT_PROBLEM_COLLECTION_ID",pageData.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		pds.put("DANGQ", "");
		// 查询计划表
		List<PageData> planList;
		try {
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
									pageData.put("ISOUTIME", 1);  //超期未完成
								} 
								//是否即将过期
								boolean flog = QuestionDateUtil.getisBeyond(_pageData.get("PLANTIME").toString(), QuestionDateUtil.getBeyond(Integer.parseInt((pageData.get("DANGQ").toString()))));
								if(!times.after(date)&&flog){
									pageData.put("ISOUTIME", 2);// 即将超期（计划时间与完成时间对比）
								}
							}
						}
					}	
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
		
		return varList;
	}
	/***
	 * 用于查询过期，即将超期需要发邮件的邮件号
	 * @throws Exception 
	 */
	
	public List<String> getEmailtoSend() throws Exception {
		PageData pd = new PageData();
		List<PageData> varList = listAll(pd);//所有问题
		List<PageData> dicList = (List<PageData>) dao.findForList("DictMapper.getList", "processType");
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String userId = "";
		if (user != null) {
			userId = user.getUSER_ID();
		}
		Boolean isAdmin = "1".equals(userId);
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
		// 查询计划表
		List<PageData> planList;
		try {
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
									pageData.put("ISOUTIME", 1);  //超期未完成
									emList.add(_pageData.get("EMAIL").toString());
								} 
								//是否即将过期
								boolean flog = QuestionDateUtil.getisBeyond(_pageData.get("PLANTIME").toString(), QuestionDateUtil.getBeyond(Integer.parseInt((pageData.get("DANGQ").toString()))));
								if(!times.after(date)&&flog){
									pageData.put("ISOUTIME", 2);// 即将超期（计划时间与完成时间对比）
									jmList.add(_pageData.get("EMAIL").toString());
								}
							}
						}
					}	
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
		
		return emList;
	}
	
	
	/**
	 * 用于列表和新增编辑页 改变标题显示
	 * 
	 * @param varList
	 * @return
	 */
	public PageData getTitle(PageData pd) throws Exception {
		pd.put("DALEIBIE", "客户问题");
		if (pd.get("TYPE").toString().equals("1")) {
			pd.put("DINGTILE", "0公里问题");
		} else if (pd.get("TYPE").toString().equals("2")) {
			pd.put("DINGTILE", "客户投产问题");
		} else if (pd.get("TYPE").toString().equals("3")) {
			pd.put("DINGTILE", "售后问题");
		} else if (pd.get("TYPE").toString().equals("4")) {
			pd.put("DINGTILE", "沟通解决");
			pd.put("DALEIBIE", "现场问题");
		} else if (pd.get("TYPE").toString().equals("5")) {
			pd.put("DINGTILE", "供应商问题");
			pd.put("DALEIBIE", "供应商问题");
		}

		return pd;
	}

	// D0 D3 D7
	public List<PageData> getAttachMap(List<PageData> varList) {

		for (PageData pageData : varList) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			List<Object> list = new ArrayList<Object>();
			String accessory = pageData.getString("ATTACHMENTNURL");
			if (null != pageData.getString("ATTACHMENTNURL")) {
				String[] array = accessory.split(";;");
				if (StringUtils.isNotBlank(accessory)) {
					for (String str : array) {
						String realName = str.substring(0, str.indexOf("::"));
						String serverName = str.substring(str.indexOf("::") + 2, str.length());
						map.put(realName, serverName);
					}
					list.add(map);
				}
				pageData.put("ATTMAP", list);
			}
		}
		return varList;
	}

	// D4 D5
	public List<PageData> getAttachMaps(List<PageData> varList) {

		if (null != varList) {

			for (PageData pageData : varList) {
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

				String accessory = pageData.getString("ATTACHMENT");
				if (StringUtils.isNotBlank(accessory)) {
					String[] array = accessory.split(";;");

					for (String str : array) {
						Map<String, Object> map = new LinkedHashMap<String, Object>();
						String realName = str.substring(0, str.indexOf("::"));
						String serverName = str.substring(str.indexOf("::") + 2, str.length());
						map.put("k_name", realName);
						map.put("k_url", serverName);
						list.add(map);
					}

				}
				pageData.put("ATTACHMENT", list);
			}
		}
		return varList;
	}
	
	
}

