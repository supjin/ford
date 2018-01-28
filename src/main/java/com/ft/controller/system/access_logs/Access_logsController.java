package com.ft.controller.system.access_logs;

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
import com.ft.service.system.access_logs.Access_logsService;
import com.ft.service.system.user.UserService;

/** 
 * 类名称：Access_logsController
 * 创建人：lichao 
 * 创建时间：2018-01-06
 */
@Controller
@RequestMapping(value="/access_logs")
public class Access_logsController extends BaseController {
	
	String menuUrl = "access_logs/list.do"; //菜单地址(权限用)
	@Resource(name="access_logsService")
	private Access_logsService access_logsService;
	@Resource(name = "userService")
	private UserService userService;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Access_logs");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ACCESS_LOGS_ID", this.get32UUID());	//主键
		access_logsService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
//	/**
//	 * 删除
//	 */
//	@RequestMapping(value="/delete")
//	public void delete(PrintWriter out) throws Exception{
//		logBefore(logger, "删除Access_logs");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
//		PageData pd = new PageData();
//		try{
//			pd = this.getPageData();
//			access_logsService.delete(pd);
//			out.write("success");
//			out.close();
//		} catch(Exception e){
//			logger.error(e.toString(), e);
//		}
//		
//	}
	
//	/**
//	 * 修改
//	 */
//	@RequestMapping(value="/edit")
//	public ModelAndView edit() throws Exception{
//		logBefore(logger, "修改Access_logs");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		access_logsService.edit(pd);
//		mv.addObject("msg","success");
//		mv.setViewName("save_result");
//		return mv;
//	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Access_logs");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			
			int pages = 0;
			if(null != pd.get("pages") && !"undefined".equals(pd.get("pages").toString())){
				pages =Integer.parseInt(pd.get("pages").toString());//当前页
				}
			page.setShowCount(15);
			page.setCurrentPage(pages+1);
			page.setPd(pd);

			List<PageData> userList = userService.listAllUsers(pd);
			List<PageData>	varList = access_logsService.list(page);	//列出Access_logs列表
			int tolpage = page.getTotalPage();
			mv.setViewName("system/access_logs/access_logs_list");
			mv.addObject("varList", varList);
			mv.addObject("userList",userList);
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
//	/**
//	 * 去新增页面
//	 */
//	@RequestMapping(value="/goAdd")
//	public ModelAndView goAdd() throws Exception{
//		logBefore(logger, "去新增Access_logs页面");
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		try {
//			mv.setViewName("system/access_logs/access_logs_edit");
//			mv.addObject("msg", "save");
//			mv.addObject("pd", pd);
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}						
//		return mv;
//	}	
//	
//	/**
//	 * 去修改页面
//	 */
//	@RequestMapping(value="/goEdit")
//	public ModelAndView goEdit() throws Exception{
//		logBefore(logger, "去修改Access_logs页面");
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		try {
//			pd = access_logsService.findById(pd);	//根据ID读取
//			mv.setViewName("system/access_logs/access_logs_edit");
//			mv.addObject("msg", "edit");
//			mv.addObject("pd", pd);
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		}						
//		return mv;
//	}	
	
//	/**
//	 * 批量删除
//	 */
//	@RequestMapping(value="/deleteAll")
//	@ResponseBody
//	public Object deleteAll() throws Exception {
//		logBefore(logger, "批量删除Access_logs");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
//		PageData pd = new PageData();		
//		Map<String,Object> map = new HashMap<String,Object>();
//		try {
//			pd = this.getPageData();
//			List<PageData> pdList = new ArrayList<PageData>();
//			String DATA_IDS = pd.getString("DATA_IDS");
//			if(null != DATA_IDS && !"".equals(DATA_IDS)){
//				String ArrayDATA_IDS[] = DATA_IDS.split(",");
//				access_logsService.deleteAll(ArrayDATA_IDS);
//				pd.put("msg", "ok");
//			}else{
//				pd.put("msg", "no");
//			}
//			pdList.add(pd);
//			map.put("list", pdList);
//		} catch (Exception e) {
//			logger.error(e.toString(), e);
//		} finally {
//			logAfter(logger);
//		}
//		return AppUtil.returnObject(pd, map);
//	}
//	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, "导出Access_logs到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("操作人");	//1
			titles.add("操作对象");	//2
			titles.add("操作方式");	//3
			titles.add("操作时间");	//4
			titles.add("修改时间");	//5
			titles.add("是否删除");	//6
			dataMap.put("titles", titles);
			List<PageData> varOList = access_logsService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("USERNAME"));	//1
				vpd.put("var2", varOList.get(i).getString("OBJECTNAME"));	//2
				vpd.put("var3", varOList.get(i).getString("OPERATIONNAME"));	//3
				vpd.put("var4", varOList.get(i).getString("CREATETIME"));	//4
				vpd.put("var5", varOList.get(i).getString("UPDATETIME"));	//5
				vpd.put("var6", varOList.get(i).get("DELETE").toString());	//6
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
