package com.ft.controller.system.imperfection_entry;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

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
import com.ft.entity.system.User;
import com.ft.util.AppUtil;
import com.ft.util.DateUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.complainmold.ComplainmoldService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.equipmentdetail.EquipmentDetailService;
import com.ft.service.system.failuremode_management.Failuremode_managementService;
import com.ft.service.system.handler.HandlerService;
import com.ft.service.system.imperfection_entry.Imperfection_entryService;
import com.ft.service.system.proceduremanagement.ProcedureManagementService;
import com.ft.service.system.productmangement.ProductMangementService;

/** 
 * 类名称：Imperfection_entryController
 * 创建人：lichao 
 * 创建时间：2017-12-13
 * 缺陷录入
 */
@Controller
@RequestMapping(value="/imperfection_entry")
public class Imperfection_entryController extends BaseController {
	
	String menuUrl = "imperfection_entry/list.do"; //菜单地址(权限用)
	@Resource(name="imperfection_entryService")
	private Imperfection_entryService imperfection_entryService;
	//产品
	@Resource(name="productmangementService")
	private ProductMangementService productmangementService;
	//抱怨分类
	@Resource(name="complainmoldService")
	private ComplainmoldService complainmoldService;
	//设备
	@Resource(name="equipmentdetailService")
	private EquipmentDetailService equipmentdetailService;
	//工序
	@Resource(name="proceduremanagementService")
	private ProcedureManagementService proceduremanagementService;
	//失效模式
	@Resource(name="failuremode_managementService")
	private Failuremode_managementService failuremode_managementService;
	@Resource(name = "dictService")
	private DictService dictService;
	//操作人
	@Resource(name ="handlerService")
	private HandlerService HandlerService;
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAndandEdit")
	public ModelAndView goAndandEdit() throws Exception{
		logBefore(logger, "去新增Imperfection_entry页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			List<PageData> productList = productmangementService.listAll(pd);// 产品
			List<PageData> failureList = failuremode_managementService.listAll(pd);
			List<PageData> failList = failuremode_managementService.listAllYuan(pd);
			List<PageData> equipmentList = equipmentdetailService.listAll(pd);
			List<PageData> procedureList = proceduremanagementService.listAll(pd);
			List<PageData> handlerList = HandlerService.listAll(pd);
			
			if(null == pd.getString("IMPERFECTION_ENTRY_ID")){
				Subject currentUser = SecurityUtils.getSubject();
				Session session = currentUser.getSession();
				User user = (User) session.getAttribute(Const.SESSION_USER);
				String USERNAME = user.getNAME();// 申请人，取用户姓名
			    String USERID = user.getUSER_ID();
				String DOCUMENTDATE = DateUtil.getDay();// 单据日期
				String TRACKINGNUMBER = "RB" + createTimestamp() + createCode();// 跟踪号（RB+时间搓+四位随机数）

				pd.put("LURUUSER", USERNAME);
				//pd.put("DANJUDATE", DOCUMENTDATE);
				pd.put("IMPERFECTION_NUMBERING", TRACKINGNUMBER);	
			}else {
				pd = imperfection_entryService.findById(pd);
			}
			List<PageData> resList = dictService.getList("resonanceType");//原因分类
			mv.setViewName("system/imperfection_entry/imperfection_edit_acta");
			mv.addObject("msg", "save");
			mv.addObject("productList", productList);
			mv.addObject("failList", failList);
			mv.addObject("resList", resList);
			mv.addObject("failureList", failureList);
			mv.addObject("equipmentList", equipmentList);
			mv.addObject("procedureList", procedureList);
			mv.addObject("handlerList",handlerList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	
	
	
	/**
	 * 保存/修改
	 */
	@RequestMapping(value="/addAndEdit")
	@ResponseBody
	public Map<String,Object> addAndEdit() throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("IMPERFECTION_ENTRY_ID") == null || "".equals(pd.getString("IMPERFECTION_ENTRY_ID"))){
			pd.put("IMPERFECTION_ENTRY_ID", this.get32UUID());	//主键
			imperfection_entryService.save(pd);
		}else {
			imperfection_entryService.edit(pd);
		}
			
		return map;
	}
	
	
	/**
	 * 根据编号获取产品名字
	 */
	@RequestMapping(value="/getProductN")
	@ResponseBody
	public Map<String,Object> getProductN() throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = productmangementService.findByCode(pd);
		if(pd !=null){
		map.put("CODEK", pd.getString("CODEK"));	
		map.put("CODEN", pd.getString("CODEN"));
		map.put("PRODUCTNAME", pd.getString("PRODUCTNAME"));
		}
		List<PageData> productList = productmangementService.listAll(pd);// 产品
		map.put("proList", productList);
		return map;
	}
	/**
	 * 根据编号获取设备名字
	 */
	@RequestMapping(value="/getEquiptN")
	@ResponseBody
	public Map<String,Object> getEquiptN() throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = equipmentdetailService.findByNumber(pd);
		map.put("NUMBER", pd.getString("NUMBER"));	
		return map;
	}
	/**
	 * 根据工序名获取工序代码
	 */
	@RequestMapping(value="/getProcesB")
	@ResponseBody
	public Map<String,Object> getProcesB() throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = proceduremanagementService.findByName(pd);
		map.put("PROCODE", pd.getString("PROCODE"));	
		return map;
	}
	/**
	 * 根据缺陷名模糊搜索
	 */
	@RequestMapping(value="/getProcesF")
	@ResponseBody
	public Map<String,Object> getProcesF() throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> failList = failuremode_managementService.listAllName(pd);
		map.put("failList", failList);	
		return map;
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Imperfection_entry");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("IMPERFECTION_ENTRY_ID", this.get32UUID());	//主键
		imperfection_entryService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除Imperfection_entry");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			imperfection_entryService.delete(pd);
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
		logBefore(logger, "修改Imperfection_entry");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		imperfection_entryService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Imperfection_entry");
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
			List<PageData>	productList = productmangementService.listAll(pd);//产品
			List<PageData>	varList = imperfection_entryService.list(page);	//列出Imperfection_entry列表
			int tolpage = page.getTotalPage();
			List<PageData> failureList = failuremode_managementService.listAll(pd);
			
			mv.setViewName("system/imperfection_entry/imperfection_list");
			mv.addObject("varList", varList);
			mv.addObject("failureList", failureList);
			mv.addObject("productList", productList);
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
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
		logBefore(logger, "去新增Imperfection_entry页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/imperfection_entry/imperfection_entry_edit");
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
		logBefore(logger, "去修改Imperfection_entry页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = imperfection_entryService.findById(pd);	//根据ID读取
			mv.setViewName("system/imperfection_entry/imperfection_entry_edit");
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
		logBefore(logger, "批量删除Imperfection_entry");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				imperfection_entryService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Imperfection_entry到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("缺陷编号");	//1
			titles.add("产品编号");	//2
			titles.add("产品名称");	//3
			titles.add("缺陷代码");	//4
			titles.add("缺陷名称");	//5
			titles.add("不合格数");	//6
			titles.add("设备编号");	//7
			titles.add("设备名称");	//8
			titles.add("原因分类");	//9
			titles.add("处置意见");	//10
			titles.add("工序代码");	//11
			titles.add("工序名称");	//12
			titles.add("备注");	//13
			titles.add("创建时间");	//14
			titles.add("修改时间");	//15
			dataMap.put("titles", titles);
			List<PageData> varOList = imperfection_entryService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("IMPERFECTION_NUMBERING"));	//1
				vpd.put("var2", varOList.get(i).getString("PRODUCTS_NUMBERING"));	//2
				vpd.put("var3", varOList.get(i).getString("PRODUCTS_NAME"));	//3
				vpd.put("var4", varOList.get(i).getString("IMPERFECTION_CODE"));	//4
				vpd.put("var5", varOList.get(i).getString("IMPERFECTION_NAME"));	//5
				vpd.put("var6", varOList.get(i).getString("NONCONFORMITY"));	//6
				vpd.put("var7", varOList.get(i).getString("EQUIPMENT"));	//7
				vpd.put("var8", varOList.get(i).getString("EQUIPMENT_NAME"));	//8
				vpd.put("var9", varOList.get(i).getString("REASONS_TYPE"));	//9
				vpd.put("var10", varOList.get(i).getString("DISPOSAL"));	//10
				vpd.put("var11", varOList.get(i).getString("PROCESS_CODE"));	//11
				vpd.put("var12", varOList.get(i).getString("PROCESS_NAME"));	//12
				vpd.put("var13", varOList.get(i).getString("REMARK"));	//13
				vpd.put("var14", varOList.get(i).getString("CREATION_TIME"));	//14
				vpd.put("var15", varOList.get(i).getString("UPDATE_TIME"));	//15
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
	// 生成随机字符串
			private static String createNonceStr() {
				return UUID.randomUUID().toString();
			}
		// 生成时间戳
		private static String createTimestamp() {
			return Long.toString(System.currentTimeMillis() / 1000);
		}
		// 生成四位随机数
		private static int createCode() {
			Random random = new Random();
			return (1000 + random.nextInt(9000));
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
