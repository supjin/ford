package com.ft.controller.system.iqc_problem;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.el.lang.ELArithmetic;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.entity.system.Role;
import com.ft.entity.system.User;
import com.ft.util.AppUtil;
import com.ft.util.DateUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.util.mail.SendMail;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.failuremode_management.Failuremode_managementService;
import com.ft.service.system.iqc_problem.IQC_problemService;
import com.ft.service.system.material_namagement.Material_namagementService;
import com.ft.service.system.role.RoleService;
import com.ft.service.system.supplierinventory.SupplierInventoryService;
import com.ft.service.system.user.UserService;

/** 
 * 类名称：IQC_problemController
 * 创建人：lichao 
 * 创建时间：2018-01-03
 */
@Controller
@RequestMapping(value="/iqc_problem")
public class IQC_problemController extends BaseController {
	
	String menuUrl = "iqc_problem/list.do"; //菜单地址(权限用)
	@Resource(name="iqc_problemService")
	private IQC_problemService iqc_problemService;
	//供应商
	@Resource(name="supplierinventoryService")
	private SupplierInventoryService supplierinventoryService;
	@Resource(name="dictService")
	private DictService dictService;
	//失效模式
	@Resource(name="failuremode_managementService")
	private Failuremode_managementService failuremode_managementService;
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="material_namagementService")
	private Material_namagementService material_namagementService;
	@Resource(name="roleService")
	private RoleService roleService;
	/**
	 * 列表
	 */

	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表IQC_problem");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			pd = this.getPageData();
			page.setShowCount(10);
			int pages = 0;
			if(null != pd.get("pages") && !"undefined".equals(pd.get("pages").toString())){
				pages =Integer.parseInt(pd.get("pages").toString());//当前页
				}
			page.setCurrentPage(pages+1);
			page.setPd(pd);
			List<PageData>	varList = iqc_problemService.qinlist(page);	//列出IQC_problem列表
			int tolpage = page.getTotalPage();
			// 所有公司用户
			List<PageData> userList = userService.listAllUser(pd);
			List<PageData>	suList = material_namagementService.listAll(pd);	//列出零件
			List<PageData> failureList = failuremode_managementService.listAll(pd);//失效模式
			
			//编辑删除权限经理有权限role.getROLE_NAME().equals("质量主管") || 系统管理员 
			//在处理2前都有权限
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String roleId = user.getROLE_ID();
			Role role = roleService.getRoleById(roleId);
			if(null != varList){
			for (PageData pageData : varList) {
				if(role.getROLE_NAME().equals("质量经理") || roleId.equals("1") || pageData.getString("FINISHSTATE").equals("1")){
					pageData.put("XIANQX", 1);
				}else {
					pageData.put("XIANQX", 0);
				}
				Date  requireddate = (Date)pageData.get("REQUIREDATE");
				if(requireddate!=null)
				{
					System.out.println(requireddate.toString());
					Date now = new Date();
					long timeoftwo = 	(now.getTime())+requireddate.getTime();//时间差
					Date toExtended = new Date(now.getTime() +(timeoftwo*3)/10);//即将超期的时间节点
					if(requireddate.compareTo(now)<0)
						{
						pageData.put("isExtended", 0);//超期了
					}
					else if(toExtended.compareTo(now)<0) {
						pageData.put("isExtended", 1);//即将超期
					}
					else{
						pageData.put("isExtended", 2);//未超期
					}
				}
				else{
					pageData.put("isExtended", 2);//未超期
				}
			}
			}
			
			
			mv.addObject("userList", userList);
			mv.addObject("suList", suList);
			mv.addObject("failureList", failureList);
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.setViewName("system/iqc_problem/iqc_problem_listb");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 处理列表
	 */
	@RequestMapping(value="/deallist")
	public ModelAndView deallist(Page page) throws Exception{
		logBefore(logger, "处理列表IQC_problem");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			String USER_ID = (String)session.getAttribute(Const.SESSION_USERID);		//获取session中用户id
			if(pd.getString("oderleader") == null){
			pd.put("TITLE", "待办");
			pd.put("RESPONSEBLEMAN", USER_ID);}else{
				pd.put("TITLE", "审批");
			}
			page.setShowCount(5);
			int pages = 0;
			if(null != pd.get("pages") && !"undefined".equals(pd.get("pages").toString())){
				pages =Integer.parseInt(pd.get("pages").toString());//当前页
				}
			page.setCurrentPage(pages+1);
			page.setPd(pd);
			List<PageData> iqcList = iqc_problemService.list(page);	//列出IQC_problem列表
			
			int tolpage = page.getTotalPage();
			// 所有公司用户
			List<PageData> userList = userService.listAllUser(pd);
			List<PageData>	suList = material_namagementService.listAll(pd);	//列出零件
			List<PageData> failureList = failuremode_managementService.listAll(pd);//失效模式
			
			if(null != iqcList){
				for (PageData pageData : iqcList) {
					/*if(role.getROLE_NAME().equals("质量经理") || roleId.equals("1") || pageData.getString("FINISHSTATE").equals("1")){
						pageData.put("XIANQX", 1);
					}else {
						pageData.put("XIANQX", 0);
					}*/
					Date  requireddate = (Date)pageData.get("REQUIREDATE");
					if(requireddate!=null)
					{
						System.out.println(requireddate.toString());
						Date now = new Date();
						long timeoftwo = 	(now.getTime())+requireddate.getTime();//时间差
						Date toExtended = new Date(now.getTime() +(timeoftwo*3)/10);//即将超期的时间节点
						if(requireddate.compareTo(now)<0)
							{
							pageData.put("isExtended", 0);//超期了
						}
						else if(toExtended.compareTo(now)<0) {
							pageData.put("isExtended", 1);//即将超期
						}
						else{
							pageData.put("isExtended", 2);//未超期
						}
					}
					else{
						pageData.put("isExtended", 2);//未超期
					}
				}
				}
			
			mv.addObject("userList", userList);
			mv.addObject("suList", suList);
			mv.addObject("failureList", failureList);
			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.setViewName("system/iqc_problem/iqc_problem_deallist");
			mv.addObject("iqcList", iqcList);
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
	@RequestMapping(value="/goandAddEdit")
	public ModelAndView goandAddEdit() throws Exception{
		logBefore(logger, "去新增IQC_problem页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			// 所有公司用户
			List<PageData> userList = userService.listAllUser(pd);
			if (pd.getString("IQC_PROBLEM_ID") != null&& !"".equals(pd.getString("IQC_PROBLEM_ID"))) {
				pd = iqc_problemService.findById(pd);
				pd.put("saveoredit", "编辑");
			} else {
				// shiro管理的session
				Subject currentUser = SecurityUtils.getSubject();
				Session session = currentUser.getSession();
				User user = (User) session.getAttribute(Const.SESSION_USER);
				String USERNAME = "";
				String USERID = "";
				if (user != null) {
					USERNAME = user.getNAME();// 申请人，取用户姓名
					USERID = user.getUSER_ID();
				}
				String DOCUMENTDATE = DateUtil.getDay();// 单据日期
				String TRACKINGNUMBER = "RB" + createTimestamp() + createCode();// 跟踪号（RB+时间搓+四位随机数）

				pd.put("USERID", USERID);
				pd.put("USERNAME", USERNAME);
				pd.put("DOCUMENTDATE", DOCUMENTDATE);
				pd.put("TRACKINGNUMBER", TRACKINGNUMBER);
				pd.put("saveoredit", "录入");

			}
			List<PageData>	suList = material_namagementService.listAll(pd);	//列出零件
			List<PageData>	dicList = dictService.getList("iqcpbmType");	//列出问题分类
			List<PageData> failureList = failuremode_managementService.listAll(pd);//失效模式
			mv.setViewName("system/iqc_problem/iqc_problem_edit");
			mv.addObject("userList", userList);
			mv.addObject("suList", suList);
			mv.addObject("failureList", failureList);
			mv.addObject("dicList", dicList);
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 去处理页面
	 */
	@RequestMapping(value="/goDeal")
	public ModelAndView goDealOne() throws Exception{
		logBefore(logger, "去处理IQC_problem页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		pd = this.getPageData();
		try {
			pds.put("TYPE", pd.getString("TYPE"));
			pds.put("NEWSTATE", pd.getString("NEWSTATE"));
			
			// 所有公司用户
			List<PageData> userList = userService.listAllUser(pd);
			if (pd.getString("IQC_PROBLEM_ID") != null&& !"".equals(pd.getString("IQC_PROBLEM_ID"))) {
				pd = iqc_problemService.findById(pd);
				pds.put("NAME",pd.getString("GYNAME"));
				pdd = supplierinventoryService.findByStokeCode(pds);
				String accessory = pd.getString("FILEURL");
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				if(accessory !=null && !accessory.equals("")){
					String[] array = accessory.split(";;");
					for (String str : array) {
						String realName = str.substring(0, str.indexOf("::"));
						String serverName = str.substring(str.indexOf("::") + 2, str.length());
						map.put(realName, serverName);
					}
				}
				pd.put("ATTMAP", map);
				
			}
			List<PageData>	suList = material_namagementService.listAll(pd);	//列出零件
			List<PageData>	dicList = dictService.getList("iqcpbmType");	//列出问题分类
			List<PageData> failureList = failuremode_managementService.listAll(pd);//失效模式
			if(pds.getString("TYPE").equals("5")){
				pd.put("TITLE", "供应商问题审批");
				mv.setViewName("system/iqc_problem/iqc_problem_dealeader");
			}else{
				if(pds.getString("TYPE").equals("1")){
					pd.put("TITLE", "发送供应商问题通知");	
				}else if (pds.getString("TYPE").equals("2") || pds.getString("TYPE").equals("4") ) {
					pd.put("TITLE", "供应商反馈8D报告");	
				}else if (pds.getString("TYPE").equals("3")) {
					pd.put("TITLE", "领导审核状态");
				}
				mv.setViewName("system/iqc_problem/iqc_problem_deala");
			}
			mv.addObject("userList", userList);
			mv.addObject("suList", suList);
			mv.addObject("failureList", failureList);
			mv.addObject("dicList", dicList);
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
			mv.addObject("pdd", pdd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 去处理页面
	 */
	@RequestMapping(value="/goEyes")
	public ModelAndView goEyes() throws Exception{
		logBefore(logger, "去处理IQC_problem页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pdd = new PageData();
		pd = this.getPageData();
		try {
			// 所有公司用户
			List<PageData> userList = userService.listAllUser(pd);
			if (pd.getString("IQC_PROBLEM_ID") != null&& !"".equals(pd.getString("IQC_PROBLEM_ID"))) {
				pd = iqc_problemService.findById(pd);
				pdd = supplierinventoryService.findByStokeCode(pd);
				String accessory = pd.getString("FILEURL");
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				if(accessory !=null && !accessory.equals("")){
					String[] array = accessory.split(";;");
					for (String str : array) {
						String realName = str.substring(0, str.indexOf("::"));
						String serverName = str.substring(str.indexOf("::") + 2, str.length());
						map.put(realName, serverName);
					}
				}
				pd.put("ATTMAP", map);
				
			}
			List<PageData>	suList = material_namagementService.listAll(pd);	//列出零件
			List<PageData>	dicList = dictService.getList("iqcpbmType");	//列出问题分类
			List<PageData> failureList = failuremode_managementService.listAll(pd);//失效模式
			mv.setViewName("system/iqc_problem/iqc_problem_eyes");
			mv.addObject("userList", userList);
			mv.addObject("suList", suList);
			mv.addObject("failureList", failureList);
			mv.addObject("dicList", dicList);
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
			mv.addObject("pdd", pdd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 增加+修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit() throws Exception {
		logBefore(logger, "D0应急反应保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdp = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("IQC_PROBLEM_ID")&& !"".equals(pd.getString("IQC_PROBLEM_ID"))) {
			pds = iqc_problemService.findById(pd);
 			if(pd.get("TYPE") != null && Integer.parseInt(pd.get("TYPE").toString())==1 && pds.get("FINISHTIMEA") == null){
				pd.put("FINISHTIMEA", DateUtil.getTime());
				pd.put("FINISHSTATE", 2);
			}else if(pd.get("TYPE") != null && Integer.parseInt(pd.get("TYPE").toString())==4 && pds.get("FINISHTIMEB") == null){
				pd.put("FINISHTIMEB", DateUtil.getTime());
				pd.put("FINISHSTATE", 5);
			}else if(pd.get("TYPE") != null && Integer.parseInt(pd.get("TYPE").toString())==2 && pds.get("FINISHTIMEB") == null){
				pd.put("FINISHTIMEB", DateUtil.getTime());
				pd.put("FINISHSTATE", 5);
			}
 			if(pd.getString("SENDEMAIL") != null && !pd.getString("SENDEMAIL").equals("")){
 				if(checkEmail(pd.getString("SENDEMAIL").trim())){
 	 	        	SendMail sendMail = new SendMail();
 	 	 			sendMail.sinkMail(pd.getString("SENDEMAIL").trim(), pds);
 	 	        }else{
 	 				map.put("status", "2");
 	 				return map;
 	 			} 
 			}
 			
			iqc_problemService.edit(pd);
			map.put("mesage", "修改成功");
			map.put("status", "1");
			map.put("IQC_PROBLEM_ID",pd.getString("IQC_PROBLEM_ID"));
		} else {
			String IQC_PROBLEM_ID = this.get32UUID().toString();
			pd.put("IQC_PROBLEM_ID", IQC_PROBLEM_ID);
			iqc_problemService.save(pd);
			map.put("mesage", "保存成功");
			map.put("status", "2");
			map.put("IQC_PROBLEM_ID",IQC_PROBLEM_ID);
		}

		return map;
	}
	public Boolean checkEmail(String email){
		Boolean flag;
		final String pattern1 = "\\w+@\\w+(\\.\\w+)+"; 
		/* final Pattern pattern = Pattern.compile(pattern1); 
        final Matcher mat = pattern.matcher(email); */
        if (email.matches(pattern1)) { 
        	flag =true;
        } else {
        	flag =false;
		}
		return flag;
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增IQC_problem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		pd = this.getPageData();
		
		
		/*String str = pd.getString("REPLY_TIME");
		JSONObject jsonObject = JSONObject.parseObject(str);
		List<PageData> list = new ArrayList<PageData>();
		for (int i = 0; i < jsonObject.size(); i++) {
			System.out.println(jsonObject.get(String.valueOf(i)));
			JSONArray jsonArray = JSONArray.fromObject(jsonObject.get(String.valueOf(i)).toString()); 
			PageData pds = new PageData();
			for (int j = 0; j < jsonArray.size(); j++) {
				JSONObject jsonObjects = JSONObject.parseObject(jsonArray.getJSONObject(j).toString());	
				String name = jsonObjects.getString("name");
				String value = jsonObjects.getString("value");
				pds.put(name, value);
				System.out.println(jsonObjects.get("name")+":"+jsonObjects.get("value"));
			}
			list.add(pds);
		}
		System.out.println(list);
		mv.addObject("list",list);
		*/
		pd.put("IQC_PROBLEM_ID", this.get32UUID());	//主键
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除IQC_problem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
				iqc_problemService.delete(pd);
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
		logBefore(logger, "修改IQC_problem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		iqc_problemService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	
	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		logBefore(logger, "去修改IQC_problem页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = iqc_problemService.findById(pd);	//根据ID读取
			mv.setViewName("system/iqc_problem/iqc_problem_edit");
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
		logBefore(logger, "批量删除IQC_problem");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				iqc_problemService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出IQC_problem到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("申请人");	//1
			titles.add("单据日期");	//2
			titles.add("发生日期");	//3
			titles.add("零件编码");	//4
			titles.add("批次号");	//5
			titles.add("抽样数量");	//6
			titles.add("失效模式");	//7
			titles.add("缺陷数量");	//8
			titles.add("责任部门");	//9
			titles.add("缺陷症状描述");	//10
			titles.add("备注");	//11
			titles.add("创建时间");	//12
			titles.add("更新时间");	//13
			titles.add("删除标识");	//14
			titles.add("完成状态");	//15
			titles.add("预留");	//16
			titles.add("预留");	//17
			titles.add("预留");	//18
			dataMap.put("titles", titles);
			List<PageData> varOList = iqc_problemService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("APPLICANT"));	//1
				vpd.put("var2", varOList.get(i).getString("BILLDATE"));	//2
				vpd.put("var3", varOList.get(i).getString("OCCURENTDATE"));	//3
				vpd.put("var4", varOList.get(i).getString("PARTCODING"));	//4
				vpd.put("var5", varOList.get(i).getString("BATCHNUMBER"));	//5
				vpd.put("var6", varOList.get(i).getString("SANPLI"));	//6
				vpd.put("var7", varOList.get(i).getString("FALUREMODEL"));	//7
				vpd.put("var8", varOList.get(i).getString("DEFECTSNUMBER"));	//8
				vpd.put("var9", varOList.get(i).getString("RESPONSEBLEMAN"));	//9
				vpd.put("var10", varOList.get(i).getString("DEFECTDESCRIP"));	//10
				vpd.put("var11", varOList.get(i).getString("REMARK"));	//11
				vpd.put("var12", varOList.get(i).getString("CREATETIME"));	//12
				vpd.put("var13", varOList.get(i).getString("UPDATETIME"));	//13
				vpd.put("var14", varOList.get(i).getString("DELETED"));	//14
				vpd.put("var15", varOList.get(i).getString("FINISHSTATE"));	//15
				vpd.put("var16", varOList.get(i).getString("HANJUE"));	//16
				vpd.put("var17", varOList.get(i).getString("KUAIJD"));	//17
				vpd.put("var18", varOList.get(i).getString("LIUYJD"));	//18
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
	// 生成时间戳
	private static String createTimestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}
	// 生成四位随机数
	private static int createCode() {
		Random random = new Random();
		return (1000 + random.nextInt(9000));
	}
}
