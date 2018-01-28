package com.ft.service.system.plan;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.entity.system.User;
import com.ft.util.Const;
import com.ft.util.DateUtil;
import com.ft.util.PageData;
import com.ft.util.Tools;


@Service("planService")
public class PlanService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("PlanMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("PlanMapper.save", pd);
	}
	
	/*
	* 删除事件负责人 （根据事件id）
	*/
	public void deleteBysj(PageData pd)throws Exception{
		dao.delete("PlanMapper.deleteBysj", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("PlanMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PlanMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PlanMapper.listAll", pd);
	}
	/*
	*列表(全部)  
	*ALAN   
	*通过问题id和步棸
	*/
	public List<PageData> listAllByClientS(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PlanMapper.listAllByClientS", pd);
	}
	/*
	*列表(根据事件查询全部)
	*/
	public List<PageData> listAllIsEvent(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PlanMapper.listAllIsEvent", pd);
	}
	/*
	*列表(步骤负责人id (userid)查询全部)
	*/
	public List<PageData> listAllIsUser(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PlanMapper.listAllIsUser", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PlanMapper.findById", pd);
	}
	/*
	* 通过id获取数据
	*/
	public PageData queryAllByClientIdAndStep(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PlanMapper.queryAllByClientIdAndStep", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("PlanMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 检查用户是否对问题的指定流程有操作权限，并且返回问题指定流程的完成状态
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData checkUserIsHandle(PageData pd) throws Exception {
		// 查询问题指定步骤的全部操作人
		PageData handldpd = (PageData) dao.findForObject(
				"PlanMapper.queryAllByClientIdAndStep", pd);
		if (handldpd == null || handldpd.size() < 1) {
			handldpd = new PageData();
			PageData handldcd = (PageData) dao.findForObject("Client_problem_collectionMapper.findById", pd);
			if (handldcd != null) {
				// 提出问题初判的责任人
				handldpd.put("USERID", handldcd.getString("FIRSTDEPARTMENT"));
			} else {
				handldpd.put("USERID", "-1");
			}

		}
		// 获取当前用户的用户ID
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String userId = "";
		if (user != null) {
			userId = user.getUSER_ID();
		}
		Boolean isAdmin = "1".equals(userId);
		// 循环便利判断是否操作人中有当前查询的用户 或者当前用户是admin
		if (handldpd.getString("USERID").equals(userId) || isAdmin) {
			handldpd.put("ISHANDLE", "1");
		} else {
			handldpd.put("ISHANDLE", "0");
		}
		// 存姓名
		pd.put("USER_ID", handldpd.getString("USERID"));
		PageData handluser = (PageData) dao.findForObject("UserXMapper.findByUiId", pd);
		if (handluser != null) {
			handldpd.put("RSNAME", handluser.getString("NAME"));
		}
		handldpd.put("uid", "clickId");
		handldpd.put("DQUID", userId);
		handldpd.put("DQUNM", user.getNAME());
		handldpd.put("USTEP",  handldpd.getString("STEP").substring(1));
		// 判断当前是否完成，完成可下一步，反之不能下一步 ISFINISH

		return handldpd;
	}

	/**
	 * 导航栏 + 操作权限
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public ModelAndView getHead(PageData pd) throws Exception {
		ModelAndView mv = new ModelAndView();
		// 判断此用户是否拥有操作权限
		PageData handle = this.checkUserIsHandle(pd);
		// 查询完成状态
		List<PageData> planList = (List<PageData>) dao.findForList("PlanMapper.listAllIsEvent", pd);
		// 判断时间是否超期
		String time = DateUtil.getDay();
		Date times = Tools.str3Date(time);
		pd.put("DANGQJY", "");
		pd.put("DANGQ", "");
		if (null != planList && planList.size() > 0) {
			for (PageData pageData : planList) {
				pageData.put("USTEP", pageData.getString("STEP").substring(1));
				// 时间判断 是否超期
				if (null != pageData.get("PLANTIME")&& !"".equals(pageData.get("PLANTIME").toString())) {
					Date date = Tools.str2Date(pageData.get("PLANTIME").toString());
					if (times.after(date)&& Integer.parseInt(pageData.get("ISFINISH").toString()) == 0) {
						pageData.put("ISOUTIME", 1);// 过期未处理
					} 
					if (null != pageData.get("FINISHTIME")&& !"".equals(pageData.get("FINISHTIME").toString())) {
						Date dates = Tools.str2Date(pageData.get("FINISHTIME").toString());
						if(dates.after(date) && Integer.parseInt(pageData.get("ISFINISH").toString()) == 1){
							pageData.put("ISOUTIME", 2);// 超期完成（计划时间与完成时间对比）
						}
					}
				}
				//当前步棸
				if("".equals(pd.get("DANGQ").toString())){
					if(Integer.parseInt(pageData.get("ISFINISH").toString()) == 0){
						pd.put("DANGQ", pageData.getString("USTEP"));
						pd.put("DANGQJY",Integer.parseInt(pageData.getString("USTEP"))+1 );
					}
				}
			}
		} 
		//进行天数
		if (null != handle.get("ADDTIME")&& !"".equals(handle.get("ADDTIME").toString())) {
			String atime =  handle.get("ADDTIME").toString();
			Date addtime = Tools.str3Date(atime);
			int timepast = daysBetween(addtime,times);
			pd.put("timepast", timepast);
		}
		//当前步棸加一判断是否可点
		if( "".equals(pd.get("DANGQJY").toString())|| handle.getString("DQUID").equals("1")){
			mv.addObject("DANGQJY", 9);
		}else {
			//mv.addObject("DANGQJY", 9);
			mv.addObject("DANGQJY", pd.get("DANGQJY").toString());
		}
		// 菜单列表
		String type = "processType";
		List<PageData> dicList = (List<PageData>) dao.findForList("DictMapper.getList", type);
		// 所有公司用户
		List<PageData> userList = (List<PageData>) dao.findForList("UserXMapper.listAllUser", pd);

		mv.addObject("DALEIBIE", "客户问题");
		if (pd.get("TYPE").toString().equals("1")) {
			mv.addObject("DINGTILE", "0公里问题");
		} else if (pd.get("TYPE").toString().equals("2")) {
			mv.addObject("DINGTILE", "投产问题");
		} else if (pd.get("TYPE").toString().equals("3")) {
			mv.addObject("DINGTILE", "售后问题");
		} else if (pd.get("TYPE").toString().equals("4")) {
			mv.addObject("DINGTILE", "问题解决");
			mv.addObject("DALEIBIE", "现场问题");
		} else if (pd.get("TYPE").toString().equals("5")) {
			mv.addObject("DINGTILE", "IQC问题");
			mv.addObject("DALEIBIE", "IQC问题");
		}

		mv.addObject("STEPS", "D" + (pd.getString("STEP").substring(1)));
		mv.addObject("dicList", dicList);
		mv.addObject("planList", planList);
		mv.addObject("handle", handle);
		mv.addObject("userList", userList);
		return mv;
	}
    /**  
     * 计算两个日期之间相差的天数  
     * @param smdate 较小的时间 
     * @param bdate  较大的时间 
     * @return 相差天数 
     * @throws ParseException  
     */    
    public static int daysBetween(Date smdate,Date bdate) throws ParseException {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        smdate=sdf.parse(sdf.format(smdate));  
        bdate=sdf.parse(sdf.format(bdate));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(smdate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(bdate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));           
    } 
}

