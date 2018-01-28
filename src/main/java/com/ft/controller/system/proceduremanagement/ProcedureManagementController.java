package com.ft.controller.system.proceduremanagement;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.util.AppUtil;
import com.ft.util.ObjectExcelRead;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.ReadExcel;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.proceduremanagement.ProcedureManagementService;

/** 
 * 类名称：ProcedureManagementController
 * 创建人：lichao 
 * 创建时间：2017-12-13
 */
@Controller
@RequestMapping(value="/proceduremanagement")
public class ProcedureManagementController extends BaseController {
	
	String menuUrl = "proceduremanagement/list.do"; //菜单地址(权限用)
	@Resource(name="proceduremanagementService")
	private ProcedureManagementService proceduremanagementService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增ProcedureManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROCEDUREMANAGEMENT_ID", this.get32UUID());	//主键
		pd.put("DELETED", 0);
		proceduremanagementService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/ajaxsave")
	@ResponseBody
	public Map<String, Object> ajaxSave(){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			if(!pd.containsKey("PROCEDUREMANAGEMENT_ID")){
				proceduremanagementService.edit(pd);
			}else{
				pd.put("PROCEDUREMANAGEMENT_ID", this.get32UUID());	//主键
				pd.put("DELETED", 0);
				proceduremanagementService.save(pd);
			}
			map.put("status", 1);
		} catch (Exception e) {
			map.put("status", 0);
			e.printStackTrace();
		}
		map.put("status", 1);
		return map;
	}
	
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/ajaxdelete")
	@ResponseBody
	public Map<String, Object> ajaxdelete(){
		Map<String, Object> map= new HashMap<String, Object>();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			proceduremanagementService.delete(pd);
			map.put("status", 1);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return map;
		
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除ProcedureManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			proceduremanagementService.delete(pd);
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
		logBefore(logger, "修改ProcedureManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		proceduremanagementService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表ProcedureManagement");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setShowCount(15);
			int pages = 0;
			if(null != pd.get("pages") && !"undefined".equals(pd.get("pages").toString())){
				pages =Integer.parseInt(pd.get("pages").toString());//当前页
				}
			page.setCurrentPage(pages+1);
			page.setPd(pd);
			List<PageData>	varList = proceduremanagementService.list(page);	//列出ProcedureManagement列表
			int tolpage = page.getTotalPage();
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.setViewName("system/proceduremanagement/processdure_list");
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
		logBefore(logger, "去新增ProcedureManagement页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/proceduremanagement/processdure_add");
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
		logBefore(logger, "去修改ProcedureManagement页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = proceduremanagementService.findById(pd);	//根据ID读取
			mv.setViewName("system/proceduremanagement/processdure_add");
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
		logBefore(logger, "批量删除ProcedureManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				proceduremanagementService.deleteAll(ArrayDATA_IDS);
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
	/**
	 * 导入excel到数据库
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/readexcel")
	public ResponseEntity<Map> readexcel(@RequestParam(value="file",required=false)MultipartFile file) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		if(null==file){
			map.put("info", "error");
		}
		String filename = file.getOriginalFilename();
		CommonsMultipartFile cf = (CommonsMultipartFile)file;
		DiskFileItem fi = (DiskFileItem)cf.getFileItem();
		File excelFile = fi.getStoreLocation();
		boolean isExcel2003 = ObjectExcelRead.isExcel2003(filename);
		List<Object> clients = ObjectExcelRead.readExcel(excelFile, 1, 0, 0, isExcel2003);
		PageData clientPd = new PageData();
		for(Object object:clients){
			PageData pd = (PageData) object;
			clientPd.put("PROCEDURE", pd.get("var0"));
			clientPd.put("PROCODE", pd.get("var1"));
			clientPd.put("DELETED", 0);
			clientPd.put("PROCEDUREMANAGEMENT_ID", this.get32UUID());
			proceduremanagementService.save(clientPd);
		};
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.TEXT_PLAIN);
		map.put("info", "success");
		return new ResponseEntity<Map>(map,headers,HttpStatus.OK);
	}
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, "导出ProcedureManagement到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("工序");	//1
			titles.add("工序编号");	//2
			titles.add("创建时间");	//3
			titles.add("更新时间");	//4
			dataMap.put("titles", titles);
			List<PageData> varOList = proceduremanagementService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("PROCEDURE"));	//1
				vpd.put("var2", varOList.get(i).getString("PROCODE"));	//2
				vpd.put("var3", varOList.get(i).get("CREATETIME").toString().replace(".0", ""));	//3
				vpd.put("var4", varOList.get(i).get("UPDATETIME").toString().replace(".0", ""));	//4
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
