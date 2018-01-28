package com.ft.controller.system.plan;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.entity.system.User;
import com.ft.util.AppUtil;
import com.ft.util.DateUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.plan.PlanService;

/** 
 * 类名称：PlanController
 * 创建人：lichao 
 * 创建时间：2017-11-10
 */
@Controller
@RequestMapping(value="/plan")
public class PlanController extends BaseController {
	
	String menuUrl = "plan/list.do"; //菜单地址(权限用)
	@Resource(name="planService")
	private PlanService planService;
	
	//部门
	@Resource(name="departmentService")
	private DepartmentService departmentService;
	
	@Resource(name="client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Plan");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PLAN_ID", this.get32UUID());	//主键
		planService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除Plan");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			planService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改Plan");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		planService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Plan");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = planService.list(page);	//列出Plan列表
			mv.setViewName("system/plan/plan_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		logBefore(logger, "去新增Plan页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/plan/plan_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		logBefore(logger, "去修改Plan页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = planService.findById(pd);	//根据ID读取
			mv.setViewName("system/plan/plan_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, "批量删除Plan");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				planService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, "导出Plan到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("问题id");	//1
			titles.add("步骤");	//2
			titles.add("用户id’");	//3
			titles.add("计划时间");	//4
			titles.add("实际完成时间");	//5
			titles.add("添加时间");	//6
			titles.add("添加人");	//7
			titles.add("是否完成");	//8
			dataMap.put("titles", titles);
			List<PageData> varOList = planService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("STEP"));	//2
				vpd.put("var3", varOList.get(i).getString("USERID"));	//3
				vpd.put("var4", varOList.get(i).getString("PLANTIME"));	//4
				vpd.put("var5", varOList.get(i).getString("FINISHTIME"));	//5
				vpd.put("var6", varOList.get(i).getString("ADDTIME"));	//6
				vpd.put("var7", varOList.get(i).getString("ADDUSERID"));	//7
				vpd.put("var8", varOList.get(i).getString("ISFINISH"));	//8
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goPlan")
	public ModelAndView goPlan() throws Exception{
		logBefore(logger, "去责任人");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//当前用户公司部门
		List<PageData> deptList=departmentService.listAllByCOMPANY_ID(pd);

		pd.put("PLANTIME", DateUtil.getDay());
		try {
			mv.setViewName("system/plan/setPlan");
			mv.addObject("msg", "addD8Plan");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}	
		mv.addObject("deptList", deptList);
		return mv;
	}
	
	/**
	 * 设置D8计划
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addD8Plan")
	public ModelAndView addD8Plan() throws Exception{
		logBefore(logger, "去责任人");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String userId ="";
		if(user!=null){
			userId = user.getUSER_ID();
		}
		
		for (int i = 0 ; i < 8 ;i++) {
			PageData _pd = new PageData();
			_pd.put("USERID", pd.get("PRINCIPALD_ONENAME"+i).toString());
			_pd.put("PLANTIME", pd.get("PLANTIME"+i).toString());
			_pd.put("STEP", ("0"+i));
			_pd.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
			_pd.put("ADDTIME", DateUtil.getDay());
			_pd.put("ADDUSERID", userId);
			_pd.put("ISFINISH", 0);
			planService.save(_pd);
		}
		//修改问题的人员设置状态
		client_problem_collectionService.updatePlanStatus(pd);
		return mv;
	}
}
