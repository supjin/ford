package com.ft.controller.system.measuresd5;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
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
import com.ft.service.system.measures_message_do.Measures_message_doService;
import com.ft.service.system.measuresd5.MeasuresD5Service;
import com.ft.service.system.process_five.Process_fiveService;

/** 
 * 类名称：MeasuresD5Controller
 * 创建人：lichao 
 * 创建时间：2017-11-13
 */
@Controller
@RequestMapping(value="/measuresd5")
public class MeasuresD5Controller extends BaseController {
	
	String menuUrl = "measuresd5/list.do"; //菜单地址(权限用)
	@Resource(name="measuresd5Service")
	private MeasuresD5Service measuresd5Service;
	
	@Resource(name="process_fiveService")
	private Process_fiveService process_fiveService;
	@Resource(name="measures_message_doService")
	private Measures_message_doService measures_message_doService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增MeasuresD5");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MEASURESD5_ID", this.get32UUID());	//主键
		measuresd5Service.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除MeasuresD5");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			measuresd5Service.delete(pd);
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
		logBefore(logger, "修改MeasuresD5");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		measuresd5Service.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表MeasuresD5");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = measuresd5Service.list(page);	//列出MeasuresD5列表
			mv.setViewName("system/measuresd5/measuresd5_list");
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
		logBefore(logger, "去新增MeasuresD5页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/measuresd5/measuresd5_edit");
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
		logBefore(logger, "去修改MeasuresD5页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = measuresd5Service.findById(pd);	//根据ID读取
			
			String accessory = pd.get("ATTACHMENT").toString();
			if(StringUtils.isNotBlank(accessory)){
					String realName = accessory.substring(0, accessory.indexOf(":"));
					String serverName = accessory.substring(accessory.indexOf(":")+1,accessory.length());
			pd.put("realName", realName);
			pd.put("serverName", serverName);
			}	
			mv.setViewName("system/measuresd5/measuresd5_edit");
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
		logBefore(logger, "批量删除MeasuresD5");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				measuresd5Service.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出MeasuresD5到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("措施");	//1
			titles.add("验证");	//2
			titles.add("附件");	//3
			titles.add("步骤id");	//4
			titles.add("事件id");	//5
			titles.add("公司id");	//6
			dataMap.put("titles", titles);
			List<PageData> varOList = measuresd5Service.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("MEASURES"));	//1
				vpd.put("var2", varOList.get(i).getString("VALIDATION"));	//2
				vpd.put("var3", varOList.get(i).getString("ATTACHMENT"));	//3
				vpd.put("var4", varOList.get(i).getString("PROCESS_FIVE_ID"));	//4
				vpd.put("var5", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//5
				vpd.put("var6", varOList.get(i).getString("COMPANY_ID"));	//6
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
	
   //D5 选择添加修改
	@RequestMapping(value = "/updated")
	@ResponseBody
	public Map<String, String> symptom() throws Exception {
		logBefore(logger, "D0症状保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		try
		{
			if (null != pd.getString("MEASURESD5_ID") && pd.getString("MEASURESD5_ID").length()>0) {
				measuresd5Service.edit(pd);
				
				//d6表修改
				PageData pdd6=new PageData(1);
				pdd6.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
				pdd6.put("MEASURESNAME", pd.get("MEASURES"));
				pdd6.put("DOTIME", pd.get("schedule_time"));
				pdd6.put("VALIDATION", pd.get("VALIDATION"));
				pdd6.put("RESPONSIBLE", pd.get("PRINCIPALNAME"));
				pdd6.put("ATTACHMENTNURL", pd.get("ATTACHMENT"));
				pdd6.put("EFFICIENT", pd.get("efficient"));
				pdd6.put("MEASURES_MESSAGE_DO_ID", pd.get("MEASURESD5_ID"));
				measures_message_doService.edit(pdd6);
			} else {
				String MEASURESD5_ID = this.get32UUID().toString();
				pd.put("MEASURESD5_ID", MEASURESD5_ID);
				measuresd5Service.save(pd);
				map.put("MEASURESD5_ID", MEASURESD5_ID);
				
				
				//d6表添加
				
				PageData pdd6=new PageData(1);
				pdd6.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
				pdd6.put("MEASURESNAME", pd.get("MEASURES"));
				pdd6.put("DOTIME", pd.get("schedule_time"));
				pdd6.put("VALIDATION", pd.get("VALIDATION"));
				pdd6.put("RESPONSIBLE", pd.get("PRINCIPALNAME"));
				pdd6.put("ATTACHMENTNURL", pd.get("ATTACHMENT"));
				pdd6.put("EFFICIENT", pd.get("efficient"));
				pdd6.put("MEASURES_MESSAGE_DO_ID", MEASURESD5_ID);
				measures_message_doService.save(pdd6);
				//事件状态修改
				/*pd.put("PROCESSTATE", 5);
				client_problem_collectionService.edit(pd);*/
				
				//D5 步骤保存
				
				
				//d5 查询   回显判断
				PageData  sj=process_fiveService.findByD5Id(pd);
				//回显判断
				if(sj!=null && sj.size()>0){
					process_fiveService.edit(sj);
					
				}else{
					pd.put("PROCESS_FIVE_ID", this.get32UUID());
					process_fiveService.save(pd);
				}
			}
			map.put("message", "1");
			
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("message", "0");
		}
		
		return map;
	}
	
	
	
	
	
	//措施删除
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/delet")
	@ResponseBody
	public Object delete() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
				try
				{   //d5删除
					measuresd5Service.delete(pd);
					PageData pdd6=new PageData(1);
					pdd6.put("MEASURES_MESSAGE_DO_ID", pd.get("MEASURESD5_ID"));
					//d6删除
					measures_message_doService.delete(pdd6);
					map.put("message", "1");
					
				} catch (Exception e)
				{
					map.put("message", "0");
					
					e.printStackTrace();
				}
				
		return map;
	}
	
	
	
	
}
