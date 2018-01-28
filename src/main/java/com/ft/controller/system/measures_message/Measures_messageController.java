package com.ft.controller.system.measures_message;

import java.io.PrintWriter;
import java.text.DateFormat;
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
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.measures_message.Measures_messageService;
import com.ft.service.system.process_three.Process_threeService;

/** 
 * 类名称：Measures_messageController
 * 创建人：lichao 
 * 创建时间：2017-11-09
 */
@Controller
@RequestMapping(value="/measures_message")
public class Measures_messageController extends BaseController {
	
	String menuUrl = "measures_message/list.do"; //菜单地址(权限用)
	@Resource(name="measures_messageService")
	private Measures_messageService measures_messageService;
	@Resource(name="process_threeService")
	private Process_threeService process_threeService;
	//问题
	@Resource(name="client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	@Resource(name="dictService")
	private DictService dictService;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Measures_message");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		pd.put("MEASURES_MESSAGE_ID", this.get32UUID());	//主键
		measures_messageService.save(pd);
		pds = process_threeService.findByPromId(pd);
		if(pds == null){
			pd.put("PROCESS_THREE_ID", this.get32UUID().toString());
			process_threeService.save(pd);
			pd.put("PROCESSTATE", 3);
			client_problem_collectionService.edit(pd);
		}
		
		
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除Measures_message");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			measures_messageService.delete(pd);
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
		logBefore(logger, "修改Measures_message");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		measures_messageService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Measures_message");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = measures_messageService.list(page);	//列出Measures_message列表
			mv.setViewName("system/measures_message/measures_message_list");
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
		logBefore(logger, "去新增Measures_message页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE", "efectentType");
			List<PageData> arryList =dictService.getAll(pd);
			mv.setViewName("system/measures_message/measures_message_edit");
			mv.addObject("msg", "save");
			mv.addObject("arryList", arryList);
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
		logBefore(logger, "去修改Measures_message页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("TYPE", "efectentType");
			List<PageData> arryList =dictService.getAll(pd);
			pd = measures_messageService.findById(pd);	//根据ID读取
		/*	
			String accessory = pd.get("ATTACHMENT").toString();
			if(StringUtils.isNotBlank(accessory)){
					String realName = accessory.substring(0, accessory.indexOf(":"));
					String serverName = accessory.substring(accessory.indexOf(":")+1,accessory.length());
			pd.put("realName", realName);
			pd.put("serverName", serverName);
			}	*/
			mv.setViewName("system/measures_message/measures_message_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.addObject("arryList", arryList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	/**
	 * 去查看页面
	 */
	@RequestMapping(value="/goMessage")
	public ModelAndView goMessage() throws Exception{
		logBefore(logger, "去修改Measures_message页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = measures_messageService.findById(pd);	//根据ID读取
			
			/*String accessory = pd.get("ATTACHMENT").toString();
			if(StringUtils.isNotBlank(accessory)){
					String realName = accessory.substring(0, accessory.indexOf(":"));
					String serverName = accessory.substring(accessory.indexOf(":")+1,accessory.length());
			pd.put("realName", realName);
			pd.put("serverName", serverName);
			}	*/
			mv.setViewName("system/measures_message/measures_message");
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
		logBefore(logger, "批量删除Measures_message");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				measures_messageService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Measures_message到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("措施");	//1
			titles.add("创建时间");	//2
			titles.add("实施时间");	//3
			titles.add("问题id");	//4
			titles.add("公司id");	//5
			titles.add("附件");	//6
			dataMap.put("titles", titles);
			List<PageData> varOList = measures_messageService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("MEASURESNAME"));	//1
				vpd.put("var2", varOList.get(i).getString("CREATETIME"));	//2
				vpd.put("var3", varOList.get(i).getString("DOTIME"));	//3
				vpd.put("var4", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//4
				vpd.put("var5", varOList.get(i).getString("COMPANY_ID"));	//5
				vpd.put("var6", varOList.get(i).getString("ATTACHMENT"));	//6
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
