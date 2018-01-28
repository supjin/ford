package com.ft.controller.system.failuremode_management;

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
import com.ft.entity.system.User;
import com.ft.util.AppUtil;
import com.ft.util.ObjectExcelRead;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.failuremode_management.Failuremode_managementService;

/** 
 * 类名称：Failuremode_managementController
 * 创建人：lichao 
 * 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value="/failuremode_management")
public class Failuremode_managementController extends BaseController {
	
	String menuUrl = "failuremode_management/list.do"; //菜单地址(权限用)
	@Resource(name="failuremode_managementService")
	private Failuremode_managementService failuremode_managementService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Map<String, Object>  save() throws Exception{
		logBefore(logger, "新增Failuremode_management");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("FAILUREMODE_MANAGEMENT_ID") == null || "".equals(pd.getString("FAILUREMODE_MANAGEMENT_ID"))){
			pd.put("FAILUREMODE_MANAGEMENT_ID", this.get32UUID());	//主键
			failuremode_managementService.save(pd);
		}else {
			failuremode_managementService.edit(pd);
		}
		map.put("FAILUREMODE_MANAGEMENT_ID", pd.getString("FAILUREMODE_MANAGEMENT_ID"));
		return map;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Failuremode_management");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			failuremode_managementService.delete(pd);
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
		logBefore(logger, "修改Failuremode_management");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		failuremode_managementService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Failuremode_management");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			int pages = 0;
			if(null != pd.get("pages") && !"undefined".equals(pd.get("pages").toString())){
				pages =Integer.parseInt(pd.get("pages").toString());//当前页
				}
			page.setCurrentPage(pages+1);
			page.setPd(pd);
			page.setShowCount(15);
			List<PageData>	varList = failuremode_managementService.list(page);	//列出Failuremode_management列表
			int tolpage = page.getTotalPage();
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.setViewName("system/failuremode_management/failuremodle_list");
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
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		logBefore(logger, "去新增Failuremode_management页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();

			if(null != pd.getString("FAILUREMODE_MANAGEMENT_ID") && !"".equals(pd.getString("FAILUREMODE_MANAGEMENT_ID"))){
				pd = failuremode_managementService.findById(pd);
			}
			mv.setViewName("system/failuremode_management/failuremodle_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		logBefore(logger, "去修改Failuremode_management页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			pd = failuremode_managementService.findById(pd);	//根据ID读取
			mv.setViewName("system/failuremode_management/failuremode_management_edit");
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
		logBefore(logger, "批量删除Failuremode_management");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				failuremode_managementService.deleteAll(ArrayDATA_IDS);
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
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		PageData clientPd = new PageData();
		for(Object object:clients){
			PageData pd = (PageData) object;
			clientPd.put("FAILURENAME", pd.get("var0"));
			clientPd.put("FAILURECODE", pd.get("var1"));
			clientPd.put("FAILUREMODEL", pd.get("var2"));
			clientPd.put("FAILUREMODE_MANAGEMENT_ID", this.get32UUID());
			clientPd.put("USERID", user.getUSER_ID());
			clientPd.put("COMPANY_ID", user.getCOMPANY_ID());
			failuremode_managementService.save(clientPd);
		};
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.TEXT_PLAIN);
		map.put("info", "success");
		return new ResponseEntity<Map>(map,headers,HttpStatus.OK);
	}
	/*
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, "导出Failuremode_management到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("失效模式名称");	//1
			titles.add("失效代码");	//2
			titles.add("原因分类");	//3
//			titles.add("删除标识 0默认1删除");	//4
			titles.add("创建时间");	//5
			titles.add("更新时间");	//6
			dataMap.put("titles", titles);
			List<PageData> varOList = failuremode_managementService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("FAILURENAME"));	//1
				vpd.put("var2", varOList.get(i).getString("FAILURECODE"));	//2
				vpd.put("var3", varOList.get(i).getString("FAILUREMODEL"));	//3
				if(varOList.get(i).get("CREATETIME")!=null){
					vpd.put("var4", varOList.get(i).get("CREATETIME").toString().replace(".0", ""));	//4
				}
				if(varOList.get(i).get("UPADATETIME")!=null){
					vpd.put("var5", varOList.get(i).get("UPADATETIME").toString().replace(".0", ""));	//5
				}
//				if(varOList.get(i).get("DELETED")!=null){
//				vpd.put("var4", varOList.get(i).get("DELETED").toString());	//6
//			}
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
