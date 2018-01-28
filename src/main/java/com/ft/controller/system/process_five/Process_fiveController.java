package com.ft.controller.system.process_five;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
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
import com.ft.service.system.measures_message_do.Measures_message_doService;
import com.ft.service.system.measuresd5.MeasuresD5Service;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_five.Process_fiveService;
import com.ft.service.system.process_three.Process_threeService;
import com.ft.service.system.user.UserService;

/** 
 * 类名称：Process_fiveController
 * 创建人：lichao 
 * 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value="/process_five")
public class Process_fiveController extends BaseController {
	
	String menuUrl = "process_five/list.do"; //菜单地址(权限用)
	@Resource(name="process_fiveService")
	private Process_fiveService process_fiveService;
	@Resource(name="process_threeService")
	private Process_threeService process_threeService;
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
	
	@Resource(name="measuresd5Service")
	private MeasuresD5Service measuresd5Service;
	@Resource(name="measures_message_doService")
	private Measures_message_doService measures_message_doService;
	
	/**
	    * @author Administrator 去D5页
	    * @return
	    * @throws Exception
	    */
	@RequestMapping(value = "/goProcess")
	public ModelAndView goProcess() throws Exception {
		logBefore(logger, "列表Process_five");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			PageData pds = new PageData();
			pds = this.getPageData();
			pds = process_fiveService.findByD5Id(pd);
			// 流程头
			pd.put("TYPE", "efectentType");
			List<PageData> biaoList = dictService.selectByTypeAll(pd);
			// 查询当前事件状态
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "05");
			mv = planService.getHead(pd);
			// d5 查询 回显判断
			List<PageData> list = measuresd5Service.listAll(pd); // 列出MeasuresD5列表
			List<PageData> varList = client_problem_collectionService.getAttachMaps(list);
			mv.addObject("varList", varList);
			mv.setViewName("system/process_five/process_five_acta");
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
			mv.addObject("biaoList", biaoList);

		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * D5永久措施选择  页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit() throws Exception {
		logBefore(logger, "D0症状保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		try
		{
			if (null != pd.getString("MEASURESD5_ID") && pd.getString("MEASURESD5_ID").length()>0) {
				measuresd5Service.edit(pd);
				
				//d6表修改
				PageData pdd6=new PageData(1);
				pdd6.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
				pdd6.put("MEASURESNAME", pd.get("MEASURES"));
				pdd6.put("DOTIME", pd.get("schedule_time"));
				pdd6.put("VALIDATION", pd.get("VALIDATION"));
				pdd6.put("RESPONSIBLE", pd.get("PRINCIPALNAME"));
				pdd6.put("ATTACHMENTNURL", pd.get("ATTACHMENT"));
				pdd6.put("EFFICIENT", pd.get("efficient"));
				pdd6.put("MEASURES_MESSAGE_DO_ID", pd.get("MEASURESD5_ID"));
				measures_message_doService.edit(pdd6);
			} else {
				String MEASURESD5_ID = this.get32UUID().toString();
				pd.put("MEASURESD5_ID", MEASURESD5_ID);
				measuresd5Service.save(pd);
				
				
				
				//d6表添加
				
				PageData pdd6=new PageData(1);
				pdd6.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
				pdd6.put("MEASURESNAME", pd.get("MEASURES"));
				pdd6.put("DOTIME", pd.get("schedule_time"));
				pdd6.put("VALIDATION", pd.get("VALIDATION"));
				pdd6.put("RESPONSIBLE", pd.get("PRINCIPALNAME"));
				pdd6.put("ATTACHMENTNURL", pd.get("ATTACHMENT"));
				pdd6.put("EFFICIENT", pd.get("efficient"));
				pdd6.put("MEASURES_MESSAGE_DO_ID", MEASURESD5_ID);
				measures_message_doService.save(pdd6);
				//事件状态修改
				/*pd.put("PROCESSTATE", 5);
				client_problem_collectionService.edit(pd);*/
				
				//d5 查询   回显判断
				PageData  sj=process_fiveService.findByD5Id(pd);
				//回显判断
				/*if(sj!=null && sj.size()>0){
					process_fiveService.edit(sj);
				}else{
					pd.put("PROCESS_FIVE_ID", this.get32UUID());
					process_fiveService.save(pd);
				}*/
			}
			map.put("message", "1");
			map.put("MEASURESD5_ID", pd.getString("MEASURESD5_ID"));
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("message", "0");
		}
		
		return map;
	}
	
	/**
	 * D5永久措施  页面出后使用系统 验证证实
	 */
	@RequestMapping(value = "/symptom")
	@ResponseBody
	public Map<String, String> symptom() throws Exception {
		logBefore(logger, "D3临时措施 验证保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("PROCESS_FIVE_ID") && !"".equals(pd.getString("PROCESS_FIVE_ID"))) {
			process_fiveService.edit(pd);
		} else {
			String PROCESS_FIVE_ID = this.get32UUID().toString();
			pd.put("PROCESS_FIVE_ID", PROCESS_FIVE_ID);
			process_fiveService.save(pd);
		}
		
		pd.put("STEP", "05");
		PageData _plan = planService.queryAllByClientIdAndStep(pd);
		if(_plan.size()>0){
			if(Integer.parseInt(_plan.get("ISFINISH").toString()) == 0){
				pd.put("PLAN_ID", _plan.get("PLAN_ID"));
				pd.put("ISFINISH",1 );
				pd.put("FINISHTIME", DateUtil.getDay());
				planService.edit(pd);
			}
		}
		map.put("mesage", "保存成功");
		map.put("PROCESS_FIVE_ID", pd.getString("PROCESS_FIVE_ID"));
		return map;
	}
	
	
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save2")
	public ModelAndView save2() throws Exception{
		logBefore(logger, "新增Process_five");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROCESS_FIVE_ID", this.get32UUID());	//主键
		process_fiveService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除Process_five");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			process_fiveService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit2")
	public ModelAndView edit2() throws Exception{
		logBefore(logger, "修改Process_five");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		process_fiveService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Process_five");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = process_fiveService.list(page);	//列出Process_five列表
			mv.setViewName("system/process_five/process_five_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		logBefore(logger, "去修改Process_five页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = process_fiveService.findById(pd);	//根据ID读取
			mv.setViewName("system/process_five/process_five_edit");
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
		logBefore(logger, "批量删除Process_five");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				process_fiveService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Process_five到excel");
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
			titles.add("修改时间");	//4
			titles.add("失效时间");	//5
			titles.add("操作人");	//6
			titles.add("永久措施执行");	//7
			titles.add("执行时间");	//8
			titles.add("证实");	//9
			titles.add("责任人");	//10
			titles.add("执行人");	//11
			dataMap.put("titles", titles);
			List<PageData> varOList = process_fiveService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("COMPANY_ID"));	//2
				vpd.put("var3", varOList.get(i).getString("CREATETIME"));	//3
				vpd.put("var4", varOList.get(i).getString("UPDATETIME"));	//4
				vpd.put("var5", varOList.get(i).getString("VALIDITY"));	//5
				vpd.put("var6", varOList.get(i).getString("USER_ID"));	//6
				vpd.put("var7", varOList.get(i).getString("PERMANENT"));	//7
				vpd.put("var8", varOList.get(i).getString("EXECUTION_TIME"));	//8
				vpd.put("var9", varOList.get(i).getString("VALIDATION"));	//9
				vpd.put("var10", varOList.get(i).getString("RESPONSIBILITY"));	//10
				vpd.put("var11", varOList.get(i).getString("RESPONSIBLE"));	//11
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
	
	
	
   /**
    * @author Administrator 去D5页
    * @return
    * @throws Exception
    */
	@RequestMapping(value = "/goProcess_five")
	public ModelAndView goProcess_five() throws Exception {
		logBefore(logger, "列表Process_five");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			PageData pds = new PageData();
			pds = this.getPageData();
			// 流程头
			pds.put("TYPE", "efectentType");
			List<PageData> biaoList = dictService.selectByTypeAll(pds);
			// 查询当前事件状态
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "05");
			mv =planService.getHead(pd);
			// d5 查询 回显判断
			PageData sj = process_fiveService.findByD5Id(pd);
			// 回显判断
			if (sj != null && sj.size() > 0) {
				mv.addObject("sj", sj);

				List<PageData> list = measuresd5Service.listAll(pd); // 列出MeasuresD5列表
				List<PageData> varList = client_problem_collectionService.getAttachMaps(list);
				mv.addObject("varList", varList);

			}

			
			mv.setViewName("system/process_five/process_five_acta");
			mv.addObject("pd", pd);
			mv.addObject("biaoList", biaoList);

		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	@RequestMapping(value = "/goProcess_five2")
	public ModelAndView goProcess_five2() throws Exception {
		logBefore(logger, "列表Process_five");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/process_five/process_five2");
		return mv;
	}

	/**
	 * d5新增
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, Object> saveProcess_four() throws Exception {
		logBefore(logger, "新增saveProcess_four");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PROCESS_FIVE_ID = this.get32UUID().toString();
		pd.put("PROCESS_FIVE_ID", PROCESS_FIVE_ID); // 主键

		try {
			/*
			 * pd.put("PROCESS_ALL_ID", PROCESS_FIVE_ID);
			 * attachmentService.updatefile(pd);
			 */
			// 事件状态修改

			pd.put("PROCESSTATE", 5);
			client_problem_collectionService.edit(pd);

			// D5保存

			process_fiveService.save(pd);
			map.put("mesage", "保存成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("mesage", "保存失败");
		}

		return map;
	}
	/**
	 * 修改d5
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	@ResponseBody
	public Map<String, Object> editProcess_four() throws Exception {
		logBefore(logger, "新增saveProcess_four");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PROCESS_FIVE_ID = pd.getString("PROCESS_FIVE_ID");
		try {
			/*
			 * pd.put("PROCESS_ALL_ID", PROCESS_FIVE_ID); //删除附件或添加附件
			 * attachmentService.updatefile(pd);
			 */
			// 事件状态修改

			pd.put("PROCESSTATE", 5);
			client_problem_collectionService.edit(pd);

			// D1保存

			process_fiveService.edit(pd);
			map.put("mesage", "修改成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("mesage", "修改失败");
		}

		return map;
	}
}
