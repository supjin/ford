package com.ft.controller.system.isnot;

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
import com.ft.util.JsonUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.isnot.IsNotService;

/** 
 * 类名称：IsNotController
 * 创建人：lichao 
 * 创建时间：2017-12-29
 */
@Controller
@RequestMapping(value="/isnot")
public class IsNotController extends BaseController {
	
	String menuUrl = "isnot/list.do"; //菜单地址(权限用)
	@Resource(name="isnotService")
	private IsNotService isnotService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增IsNot");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ISNOT_ID", this.get32UUID());	//主键
		isnotService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除IsNot");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			isnotService.delete(pd);
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
		logBefore(logger, "修改IsNot");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		isnotService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表IsNot");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = isnotService.list(page);	//列出IsNot列表
			mv.setViewName("system/isnot/isnot_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/goIsNot")
	public ModelAndView goIsNot() throws Exception{
		logBefore(logger, "列表IsNot");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/isnot/isnot");
		return mv;
	}
	
	
	/**
	 * 去isnot表
	 */
	@RequestMapping(value="/goisnot")
	public ModelAndView goisnot() throws Exception{
		logBefore(logger, "去新增IsNot页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Object PROBLEM_ID= pd.get("PROBLEM_ID");
		
		if(PROBLEM_ID!=null && PROBLEM_ID.toString().length()>0){
			PageData varisnot = isnotService.findByProblemId(pd);
			varisnot.put("WHAT_COLUMN", JsonUtil.getJsonToList2(varisnot.getString("WHAT_COLUMN")));//what列
			varisnot.put("WHERE_COLUMN", JsonUtil.getJsonToList2(varisnot.getString("WHERE_COLUMN")));//where 列
			varisnot.put("WHEN_COLUMN", JsonUtil.getJsonToList2(varisnot.getString("WHEN_COLUMN")));//when列
			varisnot.put("WHO_COLUMN", JsonUtil.getJsonToList2(varisnot.getString("WHO_COLUMN")));//who列
			varisnot.put("HOWBIG_COLUMN", JsonUtil.getJsonToList2(varisnot.getString("HOWBIG_COLUMN")));//howbig列
			varisnot.put("DETECTION", JsonUtil.getJsonToList2(varisnot.getString("DETECTION")));//检测
			mv.addObject("varisnot", varisnot);
		}
	    
		try {
			mv.setViewName("system/isnot/isnot_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		logBefore(logger, "去新增IsNot页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/isnot/isnot_edit");
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
		logBefore(logger, "去修改IsNot页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = isnotService.findById(pd);	//根据ID读取
			mv.setViewName("system/isnot/isnot_edit");
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
		logBefore(logger, "批量删除IsNot");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				isnotService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出IsNot到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("问题id");	//1
			titles.add("问题描述");	//2
			titles.add("what列");	//3
			titles.add("where 列");	//4
			titles.add("when列");	//5
			titles.add("who列");	//6
			titles.add("howbig列");	//7
			titles.add("检测");	//8
			titles.add("创建时间");	//9
			titles.add("更新时间");	//10
			dataMap.put("titles", titles);
			List<PageData> varOList = isnotService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("PROBLEM_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("DESCRIPTION"));	//2
				vpd.put("var3", varOList.get(i).getString("WHAT_COLUMN"));	//3
				vpd.put("var4", varOList.get(i).getString("WHERE_COLUMN"));	//4
				vpd.put("var5", varOList.get(i).getString("WHEN_COLUMN"));	//5
				vpd.put("var6", varOList.get(i).getString("WHO_COLUMN"));	//6
				vpd.put("var7", varOList.get(i).getString("HOWBIG_COLUMN"));	//7
				vpd.put("var8", varOList.get(i).getString("DETECTION"));	//8
				vpd.put("var9", varOList.get(i).getString("CREATION_TIME"));	//9
				vpd.put("var10", varOList.get(i).getString("UPDATE_TIME"));	//10
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
