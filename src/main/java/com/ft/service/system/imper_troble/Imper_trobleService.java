package com.ft.service.system.imper_troble;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

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


@Service("imper_trobleService")
public class Imper_trobleService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Imper_trobleMapper.save", pd);
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
				_plan.put("CLIENT_PROBLEM_COLLECTION_ID",pd.get("IMPER_TROBLE_ID"));
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
				pdp.put("CLIENT_PROBLEM_COLLECTION_ID",pd.get("IMPER_TROBLE_ID"));
				pdp.put("RESPONSIBILITY", pds.getString("USER_ID"));// 默认负责人
				pdp.put("DEPT", pds.getString("DEPARTMENT_ID"));// 部门
				dao.save("Process_oneMapper.save", pdp);
			}
		}
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
		pd.put("CLIENT_PROBLEM_COLLECTION_ID",pageData.getString("IMPER_TROBLE_ID"));
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
									if(pageData.getString("LABELS") == null){
									pageData.put("LABELS", pageData2.getString("REMARKS"));
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
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Imper_trobleMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Imper_trobleMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Imper_trobleMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Imper_trobleMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Imper_trobleMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Imper_trobleMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

