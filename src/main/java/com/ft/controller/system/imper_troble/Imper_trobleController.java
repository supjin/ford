package com.ft.controller.system.imper_troble;

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
import com.ft.service.system.imper_troble.Imper_trobleService;
import com.ft.service.system.proceduremanagement.ProcedureManagementService;
import com.ft.service.system.productmangement.ProductMangementService;
import com.ft.service.system.user.UserService;

/** 
 * 类名称：Imper_trobleController
 * 创建人：lichao 
 * 创建时间：2018-01-19
 */
@Controller
@RequestMapping(value="/imper_troble")
public class Imper_trobleController extends BaseController {
	
	String menuUrl = "imper_troble/list.do"; //菜单地址(权限用)
	@Resource(name="imper_trobleService")
	private Imper_trobleService imper_trobleService;
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
		@Resource(name = "userService")
		private UserService userService;

		
		/**
		 * 列表
		 */
		@RequestMapping(value="/list")
		public ModelAndView list(Page page) throws Exception{
			logBefore(logger, "列表Imper_troble");
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
				List<PageData>	list = imper_trobleService.list(page);	//列出Imper_troble列表
				int tolpage = page.getTotalPage();
				// 菜单列表
				List<PageData> dicList = dictService.getList("processType");
				// 获取每个问题是否过期的状态显示
				List<PageData> varList = imper_trobleService.getPrombleState(list,dicList);
				mv.setViewName("system/imper_troble/imper_troble_list");
				mv.addObject("varList", varList);
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
				
				if(null == pd.getString("IMPER_TROBLE_ID")){
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
					pd = imper_trobleService.findById(pd);
				}
				// 所有公司用户
				List<PageData> userList = userService.listAllUser(pd);
				List<PageData> resList = dictService.getList("resonanceType");//原因分类
				mv.addObject("userList", userList);
				mv.setViewName("system/imper_troble/imper_troble_edit");
				mv.addObject("msg", "save");
				mv.addObject("productList", productList);
				mv.addObject("failList", failList);
				mv.addObject("resList", resList);
				mv.addObject("failureList", failureList);
				mv.addObject("equipmentList", equipmentList);
				mv.addObject("procedureList", procedureList);
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
			PageData pds = new PageData();
			if(pd.getString("IMPER_TROBLE_ID") == null || "".equals(pd.getString("IMPER_TROBLE_ID"))){
				pd.put("IMPER_TROBLE_ID", this.get32UUID());	//主键
				pd.put("USER_ID", pd.getString("RESPONSEMAN"));
				pds = userService.findByUiId(pd);// 查询初判责任人信息
				imper_trobleService.saveAll(pd,pds);
			}else {
				imper_trobleService.edit(pd);
			}
				map.put("IMPER_TROBLE_ID", pd.getString("IMPER_TROBLE_ID"));
			return map;
		}
	
		/**
		 * 删除
		 */
		@RequestMapping(value="/deletes")
		@ResponseBody
		public Map<String, String> deletes(PrintWriter out){
			logBefore(logger, "删除Client_problem_collection");
			Map<String, String> map = new HashMap<String, String>();
			PageData pd = new PageData();
			try{
				pd = this.getPageData();
				imper_trobleService.delete(pd);
				//planService.deleteBysj(pd);
				map.put("status", "1");
			} catch(Exception e){
				logger.error(e.toString(), e);
			}
			return map;
		}
		
	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, "批量删除Imper_troble");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				imper_trobleService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Imper_troble到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("缺陷编号");	//1
			titles.add("产品名称");	//2
			titles.add("产品编号");	//3
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
			titles.add("单据日期");	//16
			titles.add("录入人员");	//17
			titles.add("检查数量");	//18
			titles.add("检查日期");	//19
			titles.add("批次");	//20
			titles.add("操作者");	//21
			titles.add("车间");	//22
			titles.add("产品外部编号");	//23
			titles.add("完成状态，默认0");	//24
			titles.add("初责任人");	//25
			dataMap.put("titles", titles);
			List<PageData> varOList = imper_trobleService.listAll(pd);
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
				vpd.put("var16", varOList.get(i).getString("DANJUDATE"));	//16
				vpd.put("var17", varOList.get(i).getString("LURUUSER"));	//17
				vpd.put("var18", varOList.get(i).getString("CHECKNUM"));	//18
				vpd.put("var19", varOList.get(i).getString("CHECKDATE"));	//19
				vpd.put("var20", varOList.get(i).getString("BATCH"));	//20
				vpd.put("var21", varOList.get(i).getString("DOUSER"));	//21
				vpd.put("var22", varOList.get(i).getString("CHEJIAN"));	//22
				vpd.put("var23", varOList.get(i).getString("PROCODEY"));	//23
				vpd.put("var24", varOList.get(i).getString("FINISHSTATE"));	//24
				vpd.put("var25", varOList.get(i).getString("RESPONSEMAN"));	//25
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
