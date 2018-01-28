package com.ft.controller.system.clientmanagement;

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
import javax.servlet.http.HttpServletResponse;

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
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.ReadExcel;
import com.ft.util.Tools;
import com.sun.jmx.snmp.Timestamp;
import com.ft.util.Jurisdiction;
import com.ft.util.ObjectExcelRead;
import com.ft.service.system.clientmanagement.ClientManagementService;

/** 
 * 类名称：ClientManagementController
 * 创建人：lichao 
 * 创建时间：2017-12-07
 */
@Controller
@RequestMapping(value="/clientmanagement")
public class ClientManagementController extends BaseController {
	
	String menuUrl = "clientmanagement/list.do"; //菜单地址(权限用)
	@Resource(name="clientmanagementService")
	private ClientManagementService clientmanagementService;
	
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表ClientManagement");
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
			List<PageData>	varList = clientmanagementService.list(page);	//列出ClientManagement列表
			int tolpage = page.getTotalPage();
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.setViewName("system/clientmanagement/clientmana_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增ClientManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("CLIENTMANAGEMENT_ID") == null || "".equals(pd.getString("CLIENTMANAGEMENT_ID"))){
			pd.put("CLIENTMANAGEMENT_ID", this.get32UUID());	//主键
			clientmanagementService.save(pd);
		}else {
			clientmanagementService.edit(pd);
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
		logBefore(logger, "删除ClientManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			clientmanagementService.delete(pd);
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
		logBefore(logger, "修改ClientManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		clientmanagementService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		logBefore(logger, "去新增ClientManagement页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/clientmanagement/clientmana_edit");
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
		logBefore(logger, "去修改ClientManagement页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = clientmanagementService.findById(pd);	//根据ID读取
			mv.setViewName("system/clientmanagement/clientmana_edit");
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
		logBefore(logger, "批量删除ClientManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				clientmanagementService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出ClientManagement到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("工厂");	//1
			titles.add("部门");	//2
			titles.add("地址");	//3
			titles.add("姓名");	//4
			titles.add("职务");	//5
			titles.add("手机");	//6
			titles.add("邮箱");	//7
			titles.add("备注");	//8
			titles.add("创建时间");	//9
			titles.add("更新时间");	//10
			dataMap.put("titles", titles);
			List<PageData> varOList = clientmanagementService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("DEPARTMENT"));	//1
				vpd.put("var2", varOList.get(i).getString("FACTORY"));	//2
				vpd.put("var3", varOList.get(i).getString("ADDRESS"));	//3
				vpd.put("var4", varOList.get(i).getString("LINKSNAEM"));	//4
				vpd.put("var5", varOList.get(i).getString("JOBWORKS"));	//5
				vpd.put("var6", varOList.get(i).getString("PHONES"));	//6
				vpd.put("var7", varOList.get(i).getString("EMAILS"));	//7
				vpd.put("var8", varOList.get(i).getString("REMARKS"));	//8
				vpd.put("var9", varOList.get(i).get("CREATETIME").toString().replace(".0", ""));	//9
				vpd.put("var10", varOList.get(i).get("UPDATETIME").toString().replace(".0", ""));	//10
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
	
	
	/**
	 * 导入excel到数据库
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/readexcel")
	public ResponseEntity<Map> readexcel(@RequestParam(value="file",required=false)MultipartFile file) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(null == file){
			map.put("info", "error");
		}
		String filename = file.getOriginalFilename();
		CommonsMultipartFile cf= (CommonsMultipartFile)file; 
        DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
        File excelFile = fi.getStoreLocation();
        boolean isExcel2003 = ObjectExcelRead.isExcel2003(filename);
        List<Object> clients = ObjectExcelRead.readExcel(excelFile, 2, 0, 0,isExcel2003);
        PageData clientPd = new PageData();
        for (Object object : clients) {
        	PageData pd = (PageData) object;
        	clientPd.put("DEPARTMENT", pd.getString("var0"));
        	clientPd.put("FACTORY", pd.getString("var1"));
        	clientPd.put("LINKSNAEM", pd.getString("var2"));
        	clientPd.put("JOBWORKS", pd.getString("var3"));
        	clientPd.put("PHONES", pd.getString("var4"));
        	clientPd.put("EMAILS", pd.getString("var5"));
        	clientPd.put("REMARKS", pd.getString("var6"));
        	clientPd.put("CLIENTMANAGEMENT_ID", this.get32UUID());	//主键
        	clientmanagementService.save(clientPd);
		}
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
        map.put("info", "success");
		return new ResponseEntity<Map>(map,headers,HttpStatus.OK);
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
