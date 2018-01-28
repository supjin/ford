package com.ft.controller.system.process_zero;

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
import com.ft.util.AppUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.attachment.AttachmentService;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_zero.Process_zeroService;
import com.ft.service.system.zeroemergency.ZeroemergencyService;

/** 
 * 类名称：Process_zeroController
 * 创建人：lichao 
 * 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value="/process_zero")
public class Process_zeroController extends BaseController {
	
	String menuUrl = "process_zero/list.do"; //菜单地址(权限用)
	@Resource(name="process_zeroService")
	private Process_zeroService process_zeroService;
	//问题
	@Resource(name="client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	@Resource(name="dictService")
	private DictService dictService;
	//附件
	@Resource(name="attachmentService")
	private AttachmentService attachmentService;
	//应急反应
	@Resource(name="zeroemergencyService")
	private ZeroemergencyService zeroemergencyService;
	//计划安排
	@Resource(name="planService")
	private PlanService planService;
	
		/**
		 * 	去D0页面
		 * @throws Exception 
		 */
		@RequestMapping(value="/goDprocessZero")
		public ModelAndView goDprocessZero() throws Exception{
			logBefore(logger, "去D0页面");
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			PageData pds = new PageData();
			PageData pdu = new PageData();
			PageData pdd = new PageData();
			try {
				pd = this.getPageData();
				pdd.put("TYPE", "processType");
				List<PageData> biaoList = dictService.selectByTypeAll(pdd);//导航
				pds = process_zeroService.findByProblemId(pd);//d0的数据
				List<PageData> arrList = zeroemergencyService.listAll(pd);//应急反应
				//D0已经有数据（查看/修改）
				if(null != pds){
				pd.put("PROCESSID", pds.getString("PROCESS_ZERO_ID"));	
				List<PageData> attList = attachmentService.listAll(pd);//附件
				mv.addObject("attList", attList);
				mv.addObject("STATE", 1);
				}
				//查问题
				pd = client_problem_collectionService.findById(pd);	//根据ID读取
				//判断此用户是否拥有操作权限
				pd.put("STEP", "00");
				PageData handle = planService.checkUserIsHandle(pd);
				mv.addObject("handle", handle);
				mv.addObject("biaoList", biaoList);
				mv.setViewName("system/dprocess/dprocess_zer");
				mv.addObject("msg", "dProcessZeroSave");
				mv.addObject("pd", pd);
				mv.addObject("pds", pds);
				mv.addObject("arrList", arrList);
			} catch (Exception e) {
				logger.error(e.toString(), e);
			}						
			return mv;
		}	
		
		
		
		
		
		
		
		
		
		
	/**
	 * 去标准D8页面
	 */
	/*@RequestMapping(value="/goDprocess")
	public ModelAndView goDprocess(){
		logBefore(logger, "标准D8页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		try {
			pd = this.getPageData();
			pd = client_problem_collectionService.findById(pd);	//根据ID读取
			pds.put("TYPE", "processType");
			List<PageData> biaoList = dictService.selectByTypeAll(pds);
			mv.setViewName("system/process_zero/process_zero_edit");
			mv.addObject("biaoList", biaoList);
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}*/
	/**
	 * 去查看0
	 */
	@RequestMapping(value="/goProcessZeroSelect")
	public ModelAndView goProcessZeroSelect(){
		logBefore(logger, "去查看0");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pdu = new PageData();
		PageData pds = new PageData();
		try {
			pd = this.getPageData();
			pds = process_zeroService.findByProblemId(pd);//D0
			pd = client_problem_collectionService.findById(pd);	//根据ID读取
			pdu.put("PROCESSID", pds.getString("PROCESS_ZERO_ID"));
			List<PageData> attList = attachmentService.listAll(pdu);//附件
			mv.addObject("attList", attList);
			mv.addObject("pds", pds);
			mv.addObject("pd", pd);
			mv.setViewName("system/process_zero/process_zero_select");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Process_zero");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROCESS_ZERO_ID", this.get32UUID());	//主键
		process_zeroService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Process_zero");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			process_zeroService.delete(pd);
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
		logBefore(logger, "修改Process_zero");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		process_zeroService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Process_zero");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = process_zeroService.list(page);	//列出Process_zero列表
			mv.setViewName("system/process_zero/process_zero_list");
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
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Process_zero页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			mv.setViewName("system/process_zero/process_zero_edit");
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
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Process_zero页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			pd = process_zeroService.findById(pd);	//根据ID读取
			mv.setViewName("system/process_zero/process_zero_edit");
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
	public Object deleteAll() {
		logBefore(logger, "批量删除Process_zero");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				process_zeroService.deleteAll(ArrayDATA_IDS);
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
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Process_zero到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司id");	//1
			titles.add("症状描述");	//2
			titles.add("应急反应");	//3
			titles.add("验证");	//4
			titles.add("有效率");	//5
			titles.add("执行日期");	//6
			titles.add("负责人");	//7
			titles.add("执行人");	//8
			titles.add("D1负责人");	//9
			titles.add("问题id");	//10
			dataMap.put("titles", titles);
			List<PageData> varOList = process_zeroService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANY_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("SYSPTOMDESCRIPTION"));	//2
				vpd.put("var3", varOList.get(i).getString("EMERGENCYRESPONSE"));	//3
				vpd.put("var4", varOList.get(i).getString("VERIFICATION"));	//4
				vpd.put("var5", varOList.get(i).getString("EFFCIENT"));	//5
				vpd.put("var6", varOList.get(i).getString("EXECUTIONDATE"));	//6
				vpd.put("var7", varOList.get(i).getString("PRINCIPALNAME"));	//7
				vpd.put("var8", varOList.get(i).getString("EXECUTIVENAME"));	//8
				vpd.put("var9", varOList.get(i).getString("PRINCIPALD_ONENAME"));	//9
				vpd.put("var10", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//10
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
}
