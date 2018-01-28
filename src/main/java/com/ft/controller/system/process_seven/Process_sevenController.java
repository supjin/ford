package com.ft.controller.system.process_seven;

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
import com.ft.service.system.attachmodel.AttachmodelService;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.company.CompanyService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.measures_message.Measures_messageService;
import com.ft.service.system.measures_message_attachment.Measures_message_attachmentService;
import com.ft.service.system.measures_message_prevent.Measures_message_preventService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_seven.Process_sevenService;
import com.ft.service.system.user.UserService;
import com.ft.service.system.zeroemergency.ZeroemergencyService;

/** 
 * 类名称：Process_sevenController
 * 创建人：lichao 
 * 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value="/process_seven")
public class Process_sevenController extends BaseController {
	
	String menuUrl = "process_seven/list.do"; //菜单地址(权限用)
	@Resource(name="process_sevenService")
	private Process_sevenService process_sevenService;
	@Resource(name="zeroemergencyService")
	private ZeroemergencyService zeroemergencyService;
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
	@Resource(name="measures_message_preventService")
	private Measures_message_preventService measures_message_preventService;
	//D7的文件更新
	@Resource(name="measures_message_attachmentService")
	private Measures_message_attachmentService measures_message_attachmentService;
	
	//文件类型
	@Resource(name="attachmodelService")
	private AttachmodelService attachmodelService;
	

	/**D7预防措施+文件更新
	 * 页面出后使用系统 去D7页面
	 */
	@RequestMapping(value = "/goProcess")
	public ModelAndView goProcess() throws Exception {
		logBefore(logger, "去D7页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		pd = this.getPageData();
		try {
			// d7的数据预防措施
			pd.put("PREAVENTTYPE", 1);
			List<PageData> sList = measures_message_preventService.listAll(pd);
			//处理预防措施的附件
			List<PageData> mesList = client_problem_collectionService.getAttachMap(sList);
			pds = process_sevenService.findByPromId(pd);
			// d7的数局体系整改预防措施
			pd.put("PREAVENTTYPE", 2);
			List<PageData> tList = measures_message_preventService.listAll(pd);
			//处理预防措施的附件
			List<PageData> tixList = client_problem_collectionService.getAttachMap(tList);
			//文件更新基础数据
			//文件类型
			pd.put("TYPE", "attachType");
			List<PageData> attList = dictService.selectByTypeAll(pd);
			// 文件
			List<PageData> machList = measures_message_attachmentService.listAll(pd);
			// 查问题 获取问题id 以及标题头部
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			//所有公司用户
			//List<PageData> userList= userService.listAllUser(pd);
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "07");
			mv =planService.getHead(pd);
			
			//查询类型
			List<PageData> modelList = attachmodelService.listAll(pd);
			mv.setViewName("system/process_seven/process_seven_acta");
			mv.addObject("machList", machList);
			mv.addObject("attList", attList);
			mv.addObject("mesList", mesList);
			mv.addObject("modelList", modelList);
			mv.addObject("tixList", tixList);
			//mv.addObject("userList", userList);
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**预防措施+文件更新
	 * 预防措施
	 * 页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit() throws Exception {
		logBefore(logger, "D7预防措施新增/修改");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("MEASURES_MESSAGE_PREVENT_ID") && !"".equals(pd.getString("MEASURES_MESSAGE_PREVENT_ID"))) {
			measures_message_preventService.edit(pd);
			map.put("MEASURES_MESSAGE_PREVENT_ID",pd.getString("MEASURES_MESSAGE_PREVENT_ID"));
		} else {
			String MEASURES_MESSAGE_PREVENT_ID = this.get32UUID().toString();
			pd.put("MEASURES_MESSAGE_PREVENT_ID", MEASURES_MESSAGE_PREVENT_ID);
			measures_message_preventService.save(pd);
			map.put("MEASURES_MESSAGE_PREVENT_ID",MEASURES_MESSAGE_PREVENT_ID);
		}
		map.put("mesage", "保存成功");
		return map;
	}

	/**
	 * D6永久措施执行  页面出后使用系统 验证证实
	 */
	@RequestMapping(value = "/symptom")
	@ResponseBody
	public Map<String, String> symptom() throws Exception {
		logBefore(logger, "D3临时措施 验证保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("PROCESS_SEVEN_ID") && !"".equals(pd.getString("PROCESS_SEVEN_ID"))) {
			process_sevenService.edit(pd);
			map.put("mesage", "修改成功");
		} else {
			String PROCESS_SEVEN_ID = this.get32UUID().toString();
			pd.put("PROCESS_SEVEN_ID", PROCESS_SEVEN_ID);
			process_sevenService.save(pd);
			map.put("mesage", "保存成功");
		}
		pd.put("STEP", "07");
		PageData _plan = planService.queryAllByClientIdAndStep(pd);
		if(_plan.size()>0){
			if(Integer.parseInt(_plan.get("ISFINISH").toString()) == 0){
				pd.put("PLAN_ID", _plan.get("PLAN_ID"));
				pd.put("ISFINISH",1 );
				pd.put("FINISHTIME", DateUtil.getDay());
				planService.edit(pd);
			}
		}
		map.put("PROCESS_SEVEN_ID", pd.getString("PROCESS_SEVEN_ID"));
		return map;
	}
	/**预防措施+文件更新
	 * 文件更新
	 * 页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/fileAndEdit")
	@ResponseBody
	public Map<String, String> fileAndEdit() throws Exception {
		logBefore(logger, "D7文件更新新增/修改");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("MEASURES_MESSAGE_ATTACHMENT_ID") && !"".equals(pd.getString("MEASURES_MESSAGE_ATTACHMENT_ID"))) {
			measures_message_attachmentService.edit(pd);
			map.put("MEASURES_MESSAGE_ATTACHMENT_ID", pd.getString("MEASURES_MESSAGE_ATTACHMENT_ID"));
		} else {
			String MEASURES_MESSAGE_ATTACHMENT_ID = this.get32UUID().toString();
			pd.put("MEASURES_MESSAGE_ATTACHMENT_ID", MEASURES_MESSAGE_ATTACHMENT_ID);
			measures_message_attachmentService.save(pd);
			map.put("MEASURES_MESSAGE_ATTACHMENT_ID", MEASURES_MESSAGE_ATTACHMENT_ID);
		}
		map.put("mesage", "保存成功");
		return map;
	}
	/**预防措施+文件更新
	 * 文件更新
	 * 自定义 文件类型
	 * 页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/modelAndEdit")
	@ResponseBody
	public Map<String, String> modelAndEdit() throws Exception {
		logBefore(logger, "D7自定义文件更新新增/修改");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("ATTACHMODEL_ID") && !"".equals(pd.getString("ATTACHMODEL_ID"))) {
			attachmodelService.edit(pd);
			map.put("ATTACHMODEL_ID", pd.getString("ATTACHMODEL_ID"));
			map.put("MODEL", pd.getString("MODEL"));
		} else {
			String ATTACHMODEL_ID = this.get32UUID().toString();
			pd.put("ATTACHMODEL_ID", ATTACHMODEL_ID);
			attachmodelService.save(pd);
			map.put("ATTACHMODEL_ID", ATTACHMODEL_ID);
			map.put("MODEL", pd.getString("MODEL"));
		}
		map.put("mesage", "保存成功");
		return map;
	}
	/**
	 * D7预防措施 页面出后使用系统 措施删除
	 */
	@RequestMapping(value = "/delet")
	@ResponseBody
	public Map<String, String> delet() throws Exception {
		logBefore(logger, "D7预防措施删除");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		measures_message_preventService.delete(pd);
		map.put("mesage", "删除成功");
		return map;
	}
	/**
	 * 自定义文件更新 页面出后使用系统 自定义删除
	 */
	@RequestMapping(value = "/deletted")
	@ResponseBody
	public Map<String, String> deletted() throws Exception {
		logBefore(logger, "D7预防措施删除");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if(pd.getString("ATTACHMODEL_ID") != null){
			attachmodelService.delete(pd);
			pd.put("MODEL", pd.getString("ATTACHMODEL_ID"));
			measures_message_attachmentService.deleted(pd);
		}
		map.put("mesage", "删除成功");
		return map;
	}
	/**
	 * D7预防措施 页面出后使用系统 文件删除
	 */
	@RequestMapping(value = "/delets")
	@ResponseBody
	public Map<String, String> delets() throws Exception {
		logBefore(logger, "D7预防措施删除");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		measures_message_attachmentService.delete(pd);
		map.put("mesage", "删除成功");
		return map;
	}
	/**
	 * 自定义文件更新 页面出后使用系统 自定义否的时候删除所有文件
	 */
	@RequestMapping(value = "/delettes")
	@ResponseBody
	public Map<String, String> delettes() throws Exception {
		logBefore(logger, "D7预防措施删除");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if(pd.getString("ATTACHMODEL_ID") != null){
			pd.put("MODEL", pd.getString("ATTACHMODEL_ID"));
			measures_message_attachmentService.deleted(pd);
		}
		map.put("mesage", "删除成功");
		return map;
	}
	/**
	 * 去D7页面
	 */
	@RequestMapping(value="/goProcessSeven")
	public ModelAndView goProcessThree() throws Exception{
		logBefore(logger, "去D7页面");
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			PageData pds = new PageData();
			PageData pdd = new PageData();
			try {
				pd = this.getPageData();
				
				pdd.put("TYPE", "processType");
				List<PageData> biaoList = dictService.selectByTypeAll(pdd);//导航
				mv.addObject("biaoList", biaoList);
				
				pdd.put("TYPE", "attachType");
				List<PageData> attaList = dictService.selectByTypeAll(pdd);//文件更新
				mv.addObject("attaList", attaList);
				
				
				pds = process_sevenService.findByPromId(pd);//d0的数据
			/*	//D0已经有数据（查看/修改）
				if(null != pds){
				pd.put("PROCESSID", pds.getString("PROCESS_SEVEN_ID"));	
				List<PageData> varList = measures_message_preventService.listAll(pd);//措施
				mv.addObject("varList", varList);
				mv.addObject("STATE", 1);
				}*/
				//查应急反应
				/*List<PageData> merList = zeroemergencyService.listAll(pd);*/
				
				//查问题
				pd = client_problem_collectionService.findById(pd);	//根据ID读取
				//判断此用户是否拥有操作权限
				pd.put("STEP", "07");
				PageData handle = planService.checkUserIsHandle(pd);
				mv.addObject("handle", handle);
				
				/*mv.addObject("merList", merList);*/
				mv.setViewName("system/process_seven/process_seven");
				mv.addObject("msg", "processThreeSave");
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
		logBefore(logger, "新增Process_seven");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdp = new PageData();
		PageData pds = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		String PROCESS_SEVEN_ID = this.get32UUID().toString();
		pd.put("PROCESS_SEVEN_ID",PROCESS_SEVEN_ID );	//主键

		// 存附件
		pds.put("PROCESS_ALL_ID", PROCESS_SEVEN_ID);
		pds.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pds);
		
		process_sevenService.save(pd);
		// 修改问题中的状态
		pdp.put("CLIENT_PROBLEM_COLLECTION_ID",pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		pdp.put("PROCESSTATE", 7);
		client_problem_collectionService.edit(pdp);
		map.put("mesage", "保存成功");
		return map;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Process_seven");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			process_sevenService.delete(pd);
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
	public  Map<String, String> edit() throws Exception{
		logBefore(logger, "修改Process_seven");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		PageData pda = new PageData();
		pd = this.getPageData();
		
		// 保存附件
		String PROCESS_ZERO_ID = pd.getString("PROCESS_SEVEN_ID");
		pda.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pda.put("PROCESS_ALL_ID", PROCESS_ZERO_ID);
		pda.put("CLIENT_PROBLEM_COLLECTION_ID", pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pda);
		
		process_sevenService.edit(pd);
		map.put("mesage", "修改成功");
		return map;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Process_seven");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = process_sevenService.list(page);	//列出Process_seven列表
			mv.setViewName("system/process_seven/process_seven_list");
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
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Process_seven页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			mv.setViewName("system/process_seven/process_seven_edit");
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
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Process_seven页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			pd = process_sevenService.findById(pd);	//根据ID读取
			mv.setViewName("system/process_seven/process_seven_edit");
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
		logBefore(logger, "批量删除Process_seven");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				process_sevenService.deleteAll(ArrayDATA_IDS);
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
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Process_seven到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司id");	//1
			titles.add("d7责任人");	//2
			titles.add("问题id");	//3
			titles.add("执行人");	//4
			titles.add("d8责任人");	//5
			titles.add("失效时间");	//6
			titles.add("执行时间");	//7
			titles.add("更新时间");	//8
			titles.add("预防措施");	//9
			titles.add("体系整改预防措施");	//10
			titles.add("措施id");	//11
			dataMap.put("titles", titles);
			List<PageData> varOList = process_sevenService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANY_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("PRINCIPALNAME"));	//2
				vpd.put("var3", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//3
				vpd.put("var4", varOList.get(i).getString("EXECUTIVENAME"));	//4
				vpd.put("var5", varOList.get(i).getString("PRINCIPALD_FIVESNAME"));	//5
				vpd.put("var6", varOList.get(i).getString("VALIDITY"));	//6
				vpd.put("var7", varOList.get(i).getString("EXECUTIONDATE"));	//7
				vpd.put("var8", varOList.get(i).getString("UPDATETIME"));	//8
				vpd.put("var9", varOList.get(i).getString("PRECAUTION"));	//9
				vpd.put("var10", varOList.get(i).getString("SYSTEMMEASURE"));	//10
				vpd.put("var11", varOList.get(i).getString("CUOSHIID"));	//11
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
