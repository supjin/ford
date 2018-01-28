package com.ft.controller.system.supplierinventory;

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
import com.ft.entity.system.User;
import com.ft.util.AppUtil;
import com.ft.util.DateUtil;
import com.ft.util.ObjectExcelRead;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.ReadExcel;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.util.UuidUtil;
import com.ft.service.system.supplierinventory.SupplierInventoryService;

/** 
 * 类名称：SupplierInventoryController
 * 创建人：lichao 
 * 创建时间：2017-12-06
 */
@Controller
@RequestMapping(value="/supplierinventory")
public class SupplierInventoryController extends BaseController {
	
	String menuUrl = "supplierinventory/list.do"; //菜单地址(权限用)
	@Resource(name="supplierinventoryService")
	private SupplierInventoryService supplierinventoryService;
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表SupplierInventory");
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
			List<PageData>	varList = supplierinventoryService.list(page);	//列出SupplierInventory列表
			int tolpage = page.getTotalPage();
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.setViewName("system/supplierinventory/supplier_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 通过存货编码查找数据
	 */
	@RequestMapping(value="/selectAllByCode")
	@ResponseBody
	public Map<String, Object> selectAllByCode(PrintWriter out){
		logBefore(logger, "通过存货编码查找数据");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd = supplierinventoryService.findByStokeCode(pd);
			map.put("STORKCODE", pd.getString("STORKCODE"));
			map.put("NAME", pd.getString("NAME"));
			map.put("CODE", pd.getString("CODE"));
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return map;
	}
	
	//去新增和修改页面
	@RequestMapping(value = "/goaddAndEdit")
	public ModelAndView goaddAndEdit(Page page) {
		logBefore(logger, "新增supplier");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			if (pd.getString("SUPPLIERINVENTORY_ID") != null
					&& !"".equals(pd.getString("SUPPLIERINVENTORY_ID"))) {
				pd = supplierinventoryService.findById(pd);
				pd.put("saveoredit", "编辑");
			} else {
				// shiro管理的session
				pd.put("saveoredit", "采集");
			}
			mv.setViewName("system/supplierinventory/supplier_edit");
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
//新增和修改
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit() throws Exception {
		logBefore(logger, "供应商管理新增、修改");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("SUPPLIERINVENTORY_ID")&& !"".equals(pd.getString("SUPPLIERINVENTORY_ID"))) {
			supplierinventoryService.edit(pd);
			map.put("mesage", "修改成功");
			map.put("status", "1");
			map.put("SUPPLIERINVENTORY_ID",pd.getString("SUPPLIERINVENTORY_ID"));
		} else {
			String SUPPLIERINVENTORY_ID = this.get32UUID().toString();
			pd.put("SUPPLIERINVENTORY_ID", SUPPLIERINVENTORY_ID);
			supplierinventoryService.save(pd);
			map.put("mesage", "保存成功");
			map.put("status", "2");
			map.put("SUPPLIERINVENTORY_ID",SUPPLIERINVENTORY_ID);
		}

		return map;
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增SupplierInventory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SUPPLIERINVENTORY_ID", this.get32UUID());	//主键
		supplierinventoryService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除SupplierInventory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			supplierinventoryService.delete(pd);
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
		logBefore(logger, "修改SupplierInventory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		supplierinventoryService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		logBefore(logger, "去新增SupplierInventory页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/supplierinventory/supplierinventory_edit");
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
		logBefore(logger, "去修改SupplierInventory页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = supplierinventoryService.findById(pd);	//根据ID读取
			mv.setViewName("system/supplierinventory/supplierinventory_edit");
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
		logBefore(logger, "批量删除SupplierInventory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				supplierinventoryService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出SupplierInventory到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("供应商编码");	//2
			titles.add("供应商名称");	//3
			titles.add("供应商分类");	//4
			titles.add("联系人一");
			titles.add("邮箱");
			titles.add("电话");
			titles.add("联系人二");
			titles.add("邮箱");
			titles.add("电话");
			dataMap.put("titles", titles);
			List<PageData> varOList = supplierinventoryService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("CODE"));	//1
				vpd.put("var2", varOList.get(i).getString("NAME"));	//2
				vpd.put("var3", varOList.get(i).getString("MODELCODE"));	//3
				vpd.put("var4", varOList.get(i).getString("LINKMAN"));	//4
				vpd.put("var5", varOList.get(i).getString("LINKEMAIL"));	//5
				vpd.put("var6", varOList.get(i).getString("LINKPHONE"));	//6
				vpd.put("var7", varOList.get(i).getString("LINKMANT"));	//7
				vpd.put("var8", varOList.get(i).getString("LINKEMAILT"));	//8
				vpd.put("var9", varOList.get(i).getString("LINKPHONET"));	//9
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
			clientPd.put("CODE", pd.get("var0"));
			clientPd.put("NAME", pd.get("var1"));
			clientPd.put("MODELCODE", pd.get("var2"));
			clientPd.put("LINKMAN",pd.get("var3"));
			clientPd.put("LINKEMAIL", pd.get("var4"));
			clientPd.put("LINKPHONE", pd.get("var5"));
			clientPd.put("SUPPLIERINVENTORY_ID", this.get32UUID());
			supplierinventoryService.save(clientPd);
		};
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.TEXT_PLAIN);
		map.put("info", "success");
		return new ResponseEntity<Map>(map,headers,HttpStatus.OK);
	}
	/*
	
	
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
