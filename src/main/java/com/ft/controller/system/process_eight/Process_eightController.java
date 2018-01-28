package com.ft.controller.system.process_eight;

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
import com.ft.util.DateUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.attachment.AttachmentService;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.company.CompanyService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.measures_message.Measures_messageService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_eight.Process_eightService;
import com.ft.service.system.user.UserService;

/** 
 * 类名称：Process_eightController
 * 创建人：lichao 
 * 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value="/process_eight")
public class Process_eightController extends BaseController {
	
	String menuUrl = "process_eight/list.do"; //菜单地址(权限用)
	@Resource(name="process_eightService")
	private Process_eightService process_eightService;
	@Resource(name="userService")
	private UserService userService;
	//问题
	@Resource(name="client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	//附件
	@Resource(name="attachmentService")
	private AttachmentService attachmentService;
	//部门
	@Resource(name="departmentService")
	private DepartmentService departmentService;
	//公司
	@Resource(name="companyService")
	private CompanyService companyService;
	//dic
	@Resource(name="dictService")
	private DictService dictService;
	@Resource(name="planService")
	private PlanService planService;
	@Resource(name="measures_messageService")
	private Measures_messageService measures_messageService;
	
	/**D8团队
	 * 页面出后使用系统 去D8团队页面
	 */
	@RequestMapping(value = "/goProcess")
	public ModelAndView goProcess() throws Exception {
		logBefore(logger, "去D8团队页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		pd = this.getPageData();
		try {
			// d8的数据
			pds = process_eightService.findByPromId(pd);
			
			//所有公司用户
			List<PageData> userList= userService.listAllUser(pd);
			// 查问题 获取问题id 以及标题头部
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "08");
			mv =planService.getHead(pd);
			mv.setViewName("system/process_eight/process_eight_acta");
			mv.addObject("userList", userList);
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * D0应急反应 页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit() throws Exception {
		logBefore(logger, "D0应急反应保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("PROCESS_EIGHT_ID") && !"".equals(pd.getString("PROCESS_EIGHT_ID"))) {
			process_eightService.edit(pd);
			map.put("mesage", "修改成功");
			map.put("PROCESS_EIGHT_ID", pd.getString("PROCESS_EIGHT_ID"));
		} else {
			String PROCESS_EIGHT_ID = this.get32UUID().toString();
			pd.put("PROCESS_EIGHT_ID", PROCESS_EIGHT_ID);
			process_eightService.save(pd);
			map.put("mesage", "保存成功");
			map.put("PROCESS_EIGHT_ID",PROCESS_EIGHT_ID);
		}
		pd.put("STEP", "08");
		PageData _plan = planService.queryAllByClientIdAndStep(pd);
		if(_plan.size()>0){
			if(Integer.parseInt(_plan.get("ISFINISH").toString()) == 0){
				pd.put("PLAN_ID", _plan.get("PLAN_ID"));
				pd.put("ISFINISH",1 );
				pd.put("FINISHTIME", DateUtil.getDay());
				planService.edit(pd);
			}
		}
		return map;
	}
	
	
	/**
	 * selectuser
	 */
	/**
	 * D0应急反应 页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/selectuser")
	@ResponseBody
	public Map<String, Object> selectUser() throws Exception {
		logBefore(logger, "查询人");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> userList;
		// 如果id不为空就修改
		if (null != pd.getString("USERNAME") && !"".equals(pd.getString("USERNAME"))) {
			//所有公司用户
		 userList= userService.listAllUser(pd);
		} else {
			//所有公司用户
			userList= userService.listAllUser(pd);
		}
		map.put("userList", userList);
		return map;
	}
	/**
	 * 去D8页面
	 */
	@RequestMapping(value="/goProcessEight")
	public ModelAndView goProcessThree() throws Exception{
		logBefore(logger, "去D8页面");
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			PageData pds = new PageData();
			PageData pdd = new PageData();
			try {
				pd = this.getPageData();
				pdd.put("TYPE", "processType");
				List<PageData> biaoList = dictService.selectByTypeAll(pdd);//导航
				pds = process_eightService.findByPromId(pd);//d0的数据
				//D0已经有数据（查看/修改）
				if(null != pds){
				pd.put("PROCESSID", pds.getString("PROCESS_EIGHT_ID"));	
				List<PageData> attList = attachmentService.listAll(pd);//附件
				mv.addObject("attList", attList);
				mv.addObject("STATE", 1);
				}
				//查问题
				pd = client_problem_collectionService.findById(pd);	//根据ID读取
				//判断此用户是否拥有操作权限
				pd.put("STEP", "08");
				PageData handle = planService.checkUserIsHandle(pd);
				mv.addObject("handle", handle);
				mv.addObject("biaoList", biaoList);
				mv.setViewName("system/process_eight/process_eight");
				mv.addObject("pd", pd);
				mv.addObject("pds", pds);
			} catch (Exception e) {
				logger.error(e.toString(), e);
			}
			return mv;
		}	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public  Map<String, String> save() throws Exception{
		logBefore(logger, "新增Process_eight");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdp = new PageData();
		PageData pds = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		String PROCESS_EIGHT_ID = this.get32UUID().toString();
		pd.put("PROCESS_EIGHT_ID",PROCESS_EIGHT_ID );	//主键
		/*if(pd.getString("RESULTS") != null){
			if(Integer.parseInt(pd.getString("RESULTS")) == 1){
				pdp.put("PROCESSTATE", 9);//流程状态
				pdp.put("STATUS", 0);//审核状态由null变为0（未审核）
			}else {
				pdp.put("PROCESSTATE", 8);
			}
			
		}else {
			map.put("mesage", "提交失败");
			return map;
		}*/
		// 存附件
	/*	pds.put("PROCESS_ALL_ID", PROCESS_EIGHT_ID);
		pds.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pds);*/
		
		process_eightService.save(pd);
		// 修改问题中的状态
		pdp.put("CLIENT_PROBLEM_COLLECTION_ID",pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		
		
		map.put("mesage", "保存成功");
		return map;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除Process_eight");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			process_eightService.delete(pd);
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
	@ResponseBody
	public  Map<String, String>  edit() throws Exception{
		logBefore(logger, "修改Process_eight");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		PageData pdp = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
	/*	if(pd.getString("RESULTS") != null){
			if(Integer.parseInt(pd.getString("RESULTS")) == 1){
				pdp.put("PROCESSTATE", 9);
			}else {
				pdp.put("PROCESSTATE", 8);
			}
		}else {
			map.put("mesage", "提交失败");
			return map;
		}*/
		// 存附件
		/*pds.put("PROCESS_ALL_ID", pd.getString("PROCESS_EIGHT_ID"));
		pds.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pds);
		// 修改问题中的状态
		pdp.put("CLIENT_PROBLEM_COLLECTION_ID",pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		*/
		process_eightService.edit(pd);
		/*client_problem_collectionService.edit(pdp);*/
		map.put("mesage", "修改成功");
		return map;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Process_eight");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = process_eightService.list(page);	//列出Process_eight列表
			mv.setViewName("system/process_eight/process_eight_list");
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
		logBefore(logger, "去新增Process_eight页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/process_eight/process_eight_edit");
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
		logBefore(logger, "去修改Process_eight页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = process_eightService.findById(pd);	//根据ID读取
			mv.setViewName("system/process_eight/process_eight_edit");
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
		logBefore(logger, "批量删除Process_eight");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				process_eightService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Process_eight到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("事件id");	//1
			titles.add("公司id");	//2
			titles.add("创建时间");	//3
			titles.add("更新时间");	//4
			titles.add("失效时间");	//5
			titles.add("操作人");	//6
			titles.add("责任人");	//7
			titles.add("执行人");	//8
			titles.add("审核结果");	//9
			titles.add("未通过原因");	//10
			titles.add("退回到");	//11
			dataMap.put("titles", titles);
			List<PageData> varOList = process_eightService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("COMPANY_ID"));	//2
				vpd.put("var3", varOList.get(i).getString("CREATETIME"));	//3
				vpd.put("var4", varOList.get(i).getString("UPDATETIME"));	//4
				vpd.put("var5", varOList.get(i).getString("VALIDITY"));	//5
				vpd.put("var6", varOList.get(i).getString("USER_ID"));	//6
				vpd.put("var7", varOList.get(i).getString("RESPONSIBILITY"));	//7
				vpd.put("var8", varOList.get(i).getString("RESPONSIBLE"));	//8
				vpd.put("var9", varOList.get(i).getString("RESULTS"));	//9
				vpd.put("var10", varOList.get(i).getString("WHY"));	//10
				vpd.put("var11", varOList.get(i).getString("RETREAT"));	//11
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
