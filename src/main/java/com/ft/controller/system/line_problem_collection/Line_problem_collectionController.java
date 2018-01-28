package com.ft.controller.system.line_problem_collection;

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
import com.ft.service.system.line_problem_collection.Line_problem_collectionService;

/** 
 * 类名称：Line_problem_collectionController
 * 创建人：lichao 
 * 创建时间：2017-11-29
 */
@Controller
@RequestMapping(value="/line_problem_collection")
public class Line_problem_collectionController extends BaseController {
	
	String menuUrl = "line_problem_collection/list.do"; //菜单地址(权限用)
	@Resource(name="line_problem_collectionService")
	private Line_problem_collectionService line_problem_collectionService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Line_problem_collection");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("LINE_PROBLEM_COLLECTION_ID", this.get32UUID());	//主键
		line_problem_collectionService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除Line_problem_collection");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			line_problem_collectionService.delete(pd);
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
		logBefore(logger, "修改Line_problem_collection");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		line_problem_collectionService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Line_problem_collection");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = line_problem_collectionService.list(page);	//列出Line_problem_collection列表
			mv.setViewName("system/line_problem_collection/line_problem_collection_list");
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
		logBefore(logger, "去新增Line_problem_collection页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/line_problem_collection/line_problem_collection_edit");
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
		logBefore(logger, "去修改Line_problem_collection页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = line_problem_collectionService.findById(pd);	//根据ID读取
			mv.setViewName("system/line_problem_collection/line_problem_collection_edit");
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
		logBefore(logger, "批量删除Line_problem_collection");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				line_problem_collectionService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Line_problem_collection到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司id");	//1
			titles.add("申请人");	//2
			titles.add("单据日期");	//3
			titles.add("跟踪号");	//4
			titles.add("问题分类");	//5
			titles.add("产品名称");	//6
			titles.add("项目名称");	//7
			titles.add("缺陷数量");	//8
			titles.add("停机时间");	//9
			titles.add("问题严重程度");	//10
			titles.add("问题来源");	//11
			titles.add("缺陷症状描述");	//12
			titles.add("是否重复");	//13
			titles.add("是否来料相关");	//14
			titles.add("供应商名字");	//15
			titles.add("参考经验教训");	//16
			titles.add("初判责任部门");	//17
			titles.add("类型");	//18
			titles.add("创建时间");	//19
			titles.add("更新时间");	//20
			titles.add("删除标识");	//21
			titles.add("完成状态");	//22
			titles.add("处理状态");	//23
			dataMap.put("titles", titles);
			List<PageData> varOList = line_problem_collectionService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANY_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("USERNAME"));	//2
				vpd.put("var3", varOList.get(i).getString("DOCUMENTDATE"));	//3
				vpd.put("var4", varOList.get(i).getString("TRACKINGNUMBER"));	//4
				vpd.put("var5", varOList.get(i).getString("QUESTIONCATEGORY"));	//5
				vpd.put("var6", varOList.get(i).getString("PRODUCTNAME"));	//6
				vpd.put("var7", varOList.get(i).getString("PROJECTNAME"));	//7
				vpd.put("var8", varOList.get(i).getString("UNQUALIFIEDQUANTITY"));	//8
				vpd.put("var9", varOList.get(i).getString("DOWNTIME"));	//9
				vpd.put("var10", varOList.get(i).getString("SERVRITY"));	//10
				vpd.put("var11", varOList.get(i).getString("PROBLEMSOURCE"));	//11
				vpd.put("var12", varOList.get(i).getString("DEFECTDESCRIPTION"));	//12
				vpd.put("var13", varOList.get(i).getString("WHETHERREPEAT"));	//13
				vpd.put("var14", varOList.get(i).getString("INCOMINGRALATED"));	//14
				vpd.put("var15", varOList.get(i).getString("SUPPLIERNAME"));	//15
				vpd.put("var16", varOList.get(i).getString("REFERENCELESSONS"));	//16
				vpd.put("var17", varOList.get(i).getString("FIRSTDEPARTMENT"));	//17
				vpd.put("var18", varOList.get(i).getString("TYPE"));	//18
				vpd.put("var19", varOList.get(i).getString("CREATETIME"));	//19
				vpd.put("var20", varOList.get(i).getString("UPDATETIME"));	//20
				vpd.put("var21", varOList.get(i).getString("DELETED"));	//21
				vpd.put("var22", varOList.get(i).getString("STATUS"));	//22
				vpd.put("var23", varOList.get(i).getString("PROCESSTATE"));	//23
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
