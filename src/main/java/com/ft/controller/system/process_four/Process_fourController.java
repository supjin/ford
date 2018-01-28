package com.ft.controller.system.process_four;

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
import com.ft.service.system.attachment.AttachmentService;
import com.ft.service.system.caused4.CauseD4Service;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.company.CompanyService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_four.Process_fourService;
import com.ft.service.system.user.UserService;
import com.ft.util.AppUtil;
import com.ft.util.Const;
import com.ft.util.DateUtil;
import com.ft.util.Jurisdiction;
import com.ft.util.ObjectExcelView;
import com.ft.util.PageData;

/** 
 * 类名称：Process_fourController
 * 创建人：lichao 
 * 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value="/process_four")
public class Process_fourController extends BaseController {
	
	   String menuUrl = "process_four/list.do"; //菜单地址(权限用)
	   @Resource(name="process_fourService")
	   private Process_fourService process_fourService;
	   //部门
		@Resource(name="departmentService")
		private DepartmentService departmentService;
		//公司
		@Resource(name="companyService")
		private CompanyService companyService;
		
		@Resource(name="userService")
		private UserService userService;
		@Resource(name="dictService")
		private DictService dictService;
		@Resource(name="planService")
		private PlanService planService;
		//D4 
		@Resource(name="caused4Service")
		private CauseD4Service caused4Service;
		
		//附件
		@Resource(name="attachmentService")
		private AttachmentService attachmentService;
		
		//问题
		@Resource(name="client_problem_collectionService")
		private Client_problem_collectionService client_problem_collectionService;
	
	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Process_four");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				process_fourService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Process_four到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司id");	//1
			titles.add("问题id");	//2
			titles.add("d4责任人");	//3
			titles.add("执行人");	//4
			titles.add("d5责任人");	//5
			titles.add("失效时间");	//6
			titles.add("发生原因");	//7
			titles.add("逃出原因");	//8
			titles.add("验证");	//9
			titles.add("体系原因");	//10
			titles.add("贡献");	//11
			titles.add("备注（空白）");	//12
			titles.add("预留字段一");	//13
			titles.add("预留字段二");	//14
			titles.add("执行日期");	//15
			dataMap.put("titles", titles);
			List<PageData> varOList = process_fourService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANY_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//2
				vpd.put("var3", varOList.get(i).getString("PRINCIPALNAME"));	//3
				vpd.put("var4", varOList.get(i).getString("EXECUTIVENAME"));	//4
				vpd.put("var5", varOList.get(i).getString("PRINCIPALD_FIVESNAME"));	//5
				vpd.put("var6", varOList.get(i).getString("VALIDITY"));	//6
				vpd.put("var7", varOList.get(i).getString("CAUSERESON"));	//7
				vpd.put("var8", varOList.get(i).getString("ESCAPTRESON"));	//8
				vpd.put("var9", varOList.get(i).getString("VERIFICATION"));	//9
				vpd.put("var10", varOList.get(i).getString("SYSTEMRESON"));	//10
				vpd.put("var11", varOList.get(i).getString("CONTREBUTION"));	//11
				vpd.put("var12", varOList.get(i).getString("REMARKK"));	//12
				vpd.put("var13", varOList.get(i).getString("RECODE"));	//13
				vpd.put("var14", varOList.get(i).getString("DECODE"));	//14
				vpd.put("var15", varOList.get(i).getString("EXECUTIONDATE"));	//15
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
	 * 到 D4
	 * @throws Exception 
	 *//*
	@RequestMapping(value="/go")
	public ModelAndView goProcess_four() throws Exception{
		logBefore(logger, "列表Process_four");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		PageData pds = new PageData();
		pds=this.getPageData();
		//流程头
		pds.put("TYPE", "processType");
		List<PageData> biaoList = dictService.selectByTypeAll(pds);
		//查询当前事件状态
		pd = client_problem_collectionService.findById(pd);	//根据ID读取
		
		try{
			
			
			PageData  sj=process_fourService.findByD4Id(pd);
			if(sj!=null && sj.size()>0){
				
				mv.addObject("sj", sj);
				
				//附件
				pd.put("PROCESSID", sj.getString("PROCESS_FOUR_ID"));
				
				
				List<PageData> attList = attachmentService.listAll(pd);//附件
				mv.addObject("attList", attList);
				
			}
			
			//判断此用户是否拥有操作权限
			pd.put("STEP", "04");
			PageData handle = planService.checkUserIsHandle(pd);
			mv.setViewName("system/process_four/process_four");
			
			
			mv.addObject("handle", handle);
			mv.addObject("pd", pd);
			mv.addObject("biaoList", biaoList);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	*/
	
	/**
	 * 到 D4
	 * @throws Exception 
	 */
	@RequestMapping(value = "/go")
	public ModelAndView go() throws Exception {
		logBefore(logger, "列表Process_four");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 查询当前事件状态
		pd = client_problem_collectionService.findById(pd); // 根据ID读取

		try {
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "04");
			mv =planService.getHead(pd);
			PageData pds = process_fourService.findByD4Id(pd);
				pd.put("type", 1);
				List<PageData> list = caused4Service.listAll(pd); // 列出根本原因
				List<PageData> varList = client_problem_collectionService.getAttachMaps(list);
				mv.addObject("varList", varList);

				pd.put("type", 2);
				List<PageData> lists = caused4Service.listAll(pd); // 列出逃逸点
				List<PageData> varLists = client_problem_collectionService.getAttachMaps(lists);
				mv.addObject("varLists", varLists);

				pd.put("type", 3);
				List<PageData> listss = caused4Service.listAll(pd); // 列出体系原因
				List<PageData> varListss = client_problem_collectionService.getAttachMaps(listss);
				mv.addObject("varListss", varListss);


		
			mv.setViewName("system/process_four/process_four_acta");
			mv.addObject("pd", pd);
			mv.addObject("pds",pds);

		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * D3临时措施+应急反应 页面出后使用系统 验证证实
	 */
	@RequestMapping(value = "/symptom")
	@ResponseBody
	public Map<String, String> symptom() throws Exception {
		logBefore(logger, "D3临时措施 验证保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("PROCESS_FOUR_ID") && !"".equals(pd.getString("PROCESS_FOUR_ID"))) {
			process_fourService.edit(pd);
		} else {
			String PROCESS_FOUR_ID = this.get32UUID().toString();
			pd.put("PROCESS_FOUR_ID", PROCESS_FOUR_ID);
			process_fourService.save(pd);
		}
		
		pd.put("STEP", "04");
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
		map.put("PROCESS_FOUR_ID", pd.getString("PROCESS_FOUR_ID"));
		return map;
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Map<String, Object> saveProcess_four() throws Exception{
		logBefore(logger, "新增saveProcess_four");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PROCESS_FOUR_ID = this.get32UUID().toString();
		pd.put("PROCESS_FOUR_ID", PROCESS_FOUR_ID);	//主键
		
		
		
				try
				{  
					pd.put("PROCESS_ALL_ID", PROCESS_FOUR_ID);
					attachmentService.updatefile(pd);
					//事件状态修改
					
					pd.put("PROCESSTATE", 4);
					client_problem_collectionService.edit(pd);
					
					//D1保存
					
					process_fourService.save(pd);
					map.put("mesage", "保存成功");
				} catch (Exception e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
					map.put("mesage", "保存失败");
				}
		
		return map;
	}
	/**
	 * 修改D4
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public Map<String, Object> editProcess_four() throws Exception{
		logBefore(logger, "新增saveProcess_four");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PROCESS_FOUR_ID = pd.getString("PROCESS_FOUR_ID");
		
		
				try
				{  
					pd.put("PROCESS_ALL_ID", PROCESS_FOUR_ID);
					//删除附件或添加附件
					attachmentService.updatefile(pd);
					//事件状态修改
					
					pd.put("PROCESSTATE", 4);
					client_problem_collectionService.edit(pd);
					
					//D1保存
					
					process_fourService.edit(pd);
					map.put("mesage", "修改成功");
				} catch (Exception e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
					map.put("mesage", "修改失败");
				}
		
		return map;
	}
}
