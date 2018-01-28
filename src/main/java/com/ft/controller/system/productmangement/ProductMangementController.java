package com.ft.controller.system.productmangement;

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
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.ReadExcel;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.util.ObjectExcelRead;
import com.ft.service.system.productmangement.ProductMangementService;

/** 
 * 类名称：ProductMangementController
 * 创建人：lichao 
 * 创建时间：2017-12-07
 */
@Controller
@RequestMapping(value="/productmangement")
public class ProductMangementController extends BaseController {
	
	String menuUrl = "productmangement/list.do"; //菜单地址(权限用)
	@Resource(name="productmangementService")
	private ProductMangementService productmangementService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Map<String, Object> save() throws Exception{
		logBefore(logger, "新增ProductMangement");
		/*if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} *///校验权限
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("PRODUCTMANGEMENT_ID") == null || "".equals(pd.getString("PRODUCTMANGEMENT_ID"))){
			pd.put("PRODUCTMANGEMENT_ID", this.get32UUID());	//主键
			productmangementService.save(pd);
		}else {
			productmangementService.edit(pd);
		}
		map.put("PRODUCTMANGEMENT_ID", pd.getString("PRODUCTMANGEMENT_ID"));
		return map;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除ProductMangement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			productmangementService.delete(pd);
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
		logBefore(logger, "修改ProductMangement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		productmangementService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表ProductMangement");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setShowCount(8);
			int pages = 0;
			if(null != pd.get("pages") && !"undefined".equals(pd.get("pages").toString())){
				pages =Integer.parseInt(pd.get("pages").toString());//当前页
				}
			page.setCurrentPage(pages+1);
			page.setPd(pd);
			List<PageData>	varList = productmangementService.list(page);	//列出ProductMangement列表
			int tolpage = page.getTotalPage();
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.setViewName("system/productmangement/product_list");
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
		logBefore(logger, "去新增ProductMangement页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			
			if(null != pd.getString("PRODUCTMANGEMENT_ID") && !"".equals(pd.getString("PRODUCTMANGEMENT_ID"))){
				pd = productmangementService.findById(pd);
			}
			mv.setViewName("system/productmangement/product_edit");
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
		logBefore(logger, "去修改ProductMangement页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = productmangementService.findById(pd);	//根据ID读取
			mv.setViewName("system/productmangement/productmangement_edit");
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
		logBefore(logger, "批量删除ProductMangement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				productmangementService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出ProductMangement到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司");	//1
			titles.add("产品类别");	//2
			titles.add("产品名称");	//3
			titles.add("产品编号客户");	//4
			titles.add("产品编号内部");	//5
			titles.add("产品图片");	//6
			titles.add("创建时间");	//10
			//titles.add("更新时间");	//11
			dataMap.put("titles", titles);
			List<PageData> varOList = productmangementService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANYS"));	//1
				vpd.put("var2", varOList.get(i).getString("MODLE"));	//2
				vpd.put("var3", varOList.get(i).getString("PRODUCTNAME"));	//3
				vpd.put("var4", varOList.get(i).getString("CODEK"));	//4
				vpd.put("var5", varOList.get(i).getString("CODEN"));	//5
				vpd.put("var6", varOList.get(i).getString("IMGURL"));	//6
				vpd.put("var7", varOList.get(i).get("CREATETIME").toString().replace(".0", ""));	//10
				//vpd.put("var11", varOList.get(i).getString("UPDATETIME").toString().replace(".0", ""));	//11
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
        PageData productPd = new PageData();
        for (Object object : clients) {
        	PageData pd = (PageData) object;
        	System.out.println(pd.toString());
        	productPd.put("COMPANYS", pd.getString("var1"));
        	productPd.put("MODLE", pd.getString("var2"));
        	productPd.put("PRODUCTNAME", pd.getString("var3"));
        	productPd.put("CODEK", pd.getString("var4"));
        	productPd.put("CODEN", pd.getString("var5"));
        	productPd.put("PRODUCTMANGEMENT_ID", this.get32UUID());
        	productmangementService.save(productPd);
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
