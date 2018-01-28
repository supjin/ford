package com.ft.controller.system.process_one;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.util.AppUtil;
import com.ft.util.DateUtil;
import com.ft.util.JsonUtil;
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
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_one.Process_oneService;
import com.ft.service.system.teamd1.Teamd1Service;
import com.ft.service.system.user.UserService;
import com.sun.org.glassfish.gmbal.ParameterNames;

/** 
 * 类名称：Process_oneController
 * 创建人：lichao 
 * 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value="/process_one")
public class Process_oneController extends BaseController {
	
	String menuUrl = "process_one/list.do"; //菜单地址(权限用)
	@Resource(name="process_oneService")
	private Process_oneService process_oneService;
	@Resource(name="dictService")
	private DictService dictService;
	//部门
	@Resource(name="departmentService")
	private DepartmentService departmentService;
	//公司
	@Resource(name="companyService")
	private CompanyService companyService;
	
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="planService")
	private PlanService planService;
	
	//附件
	@Resource(name="attachmentService")
	private AttachmentService attachmentService;
	
	//问题
	@Resource(name="client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	@Resource(name="teamd1Service")
	private Teamd1Service teamd1Service;
	
	/**
	 * D1团队 页面出后使用系统 去D1页面
	 */
	@RequestMapping(value = "/goProcess")
	public ModelAndView goProcess() throws Exception {
		logBefore(logger, "去D3页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdu = new PageData();
		pd = this.getPageData();
		try {
		//当前用户公司所有部门
		List<PageData> deptList=departmentService.listAllByCOMPANY_ID(pd);
		//负责人
		pd.put("TYPE", 1);
		PageData pdfz = process_oneService.findById(pd);
		//领导
		pd.put("TYPE", 2);
		PageData ldfz = process_oneService.findById(pd);
		//队员
		pd.put("TYPE", 3);
		List<PageData> dyList=process_oneService.listAll(pd);
		//所有公司用户
		List<PageData> userAllList= userService.listAllUser(pd);
		
		String USER_ID = null ;
		//责任人根据部门查找所有人
		pds.put("USER_ID", pdfz.getString("RESPONSIBILITY"));
		pdu = userService.findByUiId(pds) ;
	    List<PageData> deptuser=userService.listAllUserByDept(pdu);
		
	    pds.put("USER_ID", ldfz.getString("RESPONSIBILITY"));
		pdu = userService.findByUiId(pds) ;
	    List<PageData> ldeptuser=userService.listAllUserByDept(pdu);
		//查Dplan下拉选择的人
		pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		List<PageData> kxList= process_oneService.listAllName(pds);
		//查plan表
		List<PageData> paList= planService.listAllIsEvent(pd);
		pd = client_problem_collectionService.findById(pd);
		// 判断此用户是否拥有操作权限
		pd.put("STEP", "01");
		mv =planService.getHead(pd);
		mv.addObject("deptList", deptList);
		mv.addObject("pdfz", pdfz);
		mv.addObject("ldfz", ldfz);
		mv.addObject("dyList", dyList);
		mv.addObject("deptuser", deptuser);
		mv.addObject("ldeptuser", ldeptuser);
		mv.addObject("userAllList", userAllList);
		mv.addObject("paList", paList);
		mv.addObject("kxList", kxList);
		mv.addObject("pd", pd);
		mv.setViewName("system/process_one/process_one_acta");
		
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit() throws Exception {
		logBefore(logger, "D6保存/新增");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("PLAN_ID")) {
			planService.edit(pd);
			map.put("mesage", "保存成功");
		}else{
			map.put("mesage", "修改失败");

		}
		pd.put("STEP", "01");
		PageData _plan = planService.queryAllByClientIdAndStep(pd);
		if(_plan.size()>0){
			if(Integer.parseInt(_plan.get("ISFINISH").toString()) == 0){
				pd.put("PLAN_ID", _plan.get("PLAN_ID"));
				pd.put("ISFINISH",1 );
				planService.edit(pd);
			}
		}	
		return map;
	}
	
	/**
	 * 页面出后使用系统 增加+修改  队员
	 */
	@RequestMapping(value = "/syspom")
	@ResponseBody
	public Map<String, Object> syspom() throws Exception {
		logBefore(logger, "D6保存/新增");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("PROCESS_ONE_ID") && !"".equals(pd.getString("PROCESS_ONE_ID"))) {
			process_oneService.edit(pd);
		}else{
			pd.put("PROCESS_ONE_ID", this.get32UUID().toString());
			process_oneService.save(pd);

		}
		PageData pds = new PageData();
		pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		List<PageData> dyList=process_oneService.listAllName(pds);
		map.put("mesage", "保存成功");
		pd.put("STEP", "01");
		PageData _plan = planService.queryAllByClientIdAndStep(pd);
		if(_plan.size()>0){
			if(Integer.parseInt(_plan.get("ISFINISH").toString()) == 0){
				pd.put("PLAN_ID", _plan.get("PLAN_ID"));
				pd.put("ISFINISH",1 );
				pd.put("FINISHTIME", DateUtil.getDay());
				planService.edit(pd);
			}
		}	
		map.put("dyList", dyList);
		map.put("PROCESS_ONE_ID", pd.getString("PROCESS_ONE_ID"));
		return map;
	}
	
	
	
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, "删除Process_one");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			process_oneService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	

	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Process_one");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = process_oneService.list(page);	//列出Process_one列表
			mv.setViewName("system/process_one/process_one_list");
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
		logBefore(logger, "去新增Process_one页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/process_one/process_one_edit");
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
		logBefore(logger, "去修改Process_one页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = process_oneService.findById(pd);	//根据ID读取
			mv.setViewName("system/process_one/process_one_edit");
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
		logBefore(logger, "批量删除Process_one");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				process_oneService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Process_one到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司id");	//1
			titles.add("录入问题id");	//2
			titles.add("人员名称");	//3
			titles.add("部门");	//4
			titles.add("电话");	//5
			titles.add("操作人");	//6
			titles.add("责任人");	//7
			titles.add("实际负责人");	//8
			titles.add("创建时间");	//9
			titles.add("更新时间");	//10
			dataMap.put("titles", titles);
			List<PageData> varOList = process_oneService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANY_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//2
				vpd.put("var3", varOList.get(i).getString("PERSONNEL_NAME"));	//3
				vpd.put("var4", varOList.get(i).getString("DEPT"));	//4
				vpd.put("var5", varOList.get(i).getString("PHONE"));	//5
				vpd.put("var6", varOList.get(i).getString("USER_ID"));	//6
				vpd.put("var7", varOList.get(i).getString("RESPONSIBILITY"));	//7
				vpd.put("var8", varOList.get(i).getString("RESPONSIBLE"));	//8
				vpd.put("var9", varOList.get(i).getString("CREATETIME"));	//9
				vpd.put("var10", varOList.get(i).getString("UPDATETIME"));	//10
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
	 * 去D1
	 */
	@RequestMapping(value="/go")
	public ModelAndView goProcess_one() throws Exception{
		logBefore(logger, "去新增Process_one页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		PageData pd2 = new PageData();
		pd2 = this.getPageData();
		//根据用户id 获取数据(部门职位)
		pd2.put("USER_ID","06cf126f44b04c20a4a3e1563cf82ba9");
		try {
			PageData pds = new PageData();
			//查问题
			
			//查询当前事件状态
			pd = client_problem_collectionService.findById(pd);	//根据ID读取
			
			//当前用户公司部门
			List<PageData> deptList=departmentService.listAllByCOMPANY_ID(pd);
			//责任人--------
			pd.put("STEP", "01");
			mv =planService.getHead(pd);
			
			//查询是否有d1数据（回显还是新增）
			PageData  sj=process_oneService.findBysjid(pd);
			if(sj!=null && sj.size()>0){
				
				pd2.put("USER_ID", sj.get("RESPONSIBILITY"));
				mv.addObject("sj", sj);
				
				//当前事件团队人员
				List<PageData>	teamList = teamd1Service.listAll(pd);
				mv.addObject("teamList", teamList);
				
				//步骤
				
				List<PageData> planlist= planService.listAllIsEvent(pd);
				mv.addObject("planlist", planlist);
				
			 
			}else{
				
			}
			
			
			
			//根据用户id 获取数据(部门职位)
		
			PageData userfind= userService.listByuser(pd2);
			//所有公司用户
			List<PageData> userall= userService.listAllUser(pd2);
			
			mv.addObject("userfind", userfind);
			mv.addObject("userall", userall);
			//责任人end--------
			List<PageData>	varList = teamd1Service.listAll(pd);
			//判断此用户是否拥有操作权限
			
			
			
			mv.addObject("varList", varList);
			mv.addObject("deptList", deptList);
			mv.setViewName("system/process_one/process_one_acta");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
			
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
	public Map<String, Object> save(
			@RequestParam(value = "TEAMD1_ID") String[] TEAMD1_ID,  //团队成员id
			@RequestParam(value = "STEPS") String[] STEPS,  //角色类别
			@RequestParam(value = "DEPT") String[] DEPT,     //部门
			@RequestParam(value = "PERSONNEL_NAME") String[] PERSONNEL_NAME  //人员名称 （user_id）
           ) throws Exception{
		logBefore(logger, "新增Process_one");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PROCESS_ONE_ID = this.get32UUID().toString();
		pd.put("PROCESS_ONE_ID", PROCESS_ONE_ID);	//主键
		
		PageData pds = new PageData();
		PageData pdp = new PageData();
		//d1 负责人
		String userId="";
		try
		{  
				//团队表添加
			for (int i = 0; i < DEPT.length; i++)
			{
			
				pd.put("STEPS", STEPS[i]);	//角色类型
				pd.put("DEPT", DEPT[i]);	//部门id
				pd.put("PERSONNEL_NAME", PERSONNEL_NAME[i]); //人员user_id
				pd.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID")); //问题id
				
				if(STEPS[i].equals("3")){
					
					userId = PERSONNEL_NAME[i];
				}
				
				//根据用户id 获取数据(部门职位)
				PageData userpd = new PageData(1);
				userpd.put("USER_ID", PERSONNEL_NAME[i]);
				PageData userfind= userService.listByuser(userpd);
				
				if(userfind!=null && userfind.size()>0){
					
					pd.put("POSITION", userfind.get("ROLE_NAME")); //职位
					pd.put("PHONE", userfind.get("PHONE"));        //电话
					
				}
			
				pd.put("TEAMD1_ID", this.get32UUID());	//主键
				teamd1Service.save(pd);
		    }
		
				
					//事件状态修改
					/*pdp.put("CLIENT_PROBLEM_COLLECTION_ID",pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
					pdp.put("PROCESSTATE", 1);
					client_problem_collectionService.edit(pdp);*/
					
					//D1保存
					/*pd.put("PERSONNEL_NAME", JsonUtil.setListToJson(DEPT, PERSONNEL_NAME, PHONE))  ;*/
					
			        process_oneService.save(pd);
					
					//设置步骤莫默认这责任人======
			        
			      //清空事件负责人
			         planService.deleteBysj(pd);
					//添加默认负责人
					for (int i = 0 ; i <=8 ;i++) {
						PageData _pd = new PageData(1);
						_pd.put("USERID", userId);
					/*	_pd.put("PLANTIME", pd.get("PLANTIME"+i).toString());*/
						_pd.put("STEP", ("0"+i));
						_pd.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
						_pd.put("ADDTIME", DateUtil.getDay());
						/*_pd.put("ADDUSERID", _pd.get("LOGINUSER_ID"));*/
						_pd.put("ISFINISH", 0);
						planService.save(_pd);
					}
			        
			        
					
					map.put("message", "1");
				} catch (Exception e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
					map.put("message", "0");
				}
		
		return map;
	}
	
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public Map<String, Object> edit(
			@RequestParam(value = "TEAMD1_ID") String[] TEAMD1_ID,  //团队成员id
			@RequestParam(value = "STEPS") String[] STEPS,  //角色类别
			@RequestParam(value = "DEPT") String[] DEPT,     //部门
			@RequestParam(value = "PERSONNEL_NAME") String[] PERSONNEL_NAME  //人员名称 （user_id）
			) throws Exception{
		logBefore(logger, "新增Process_one");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PROCESS_ONE_ID = pd.getString("PROCESS_ONE_ID");
		pd.put("PROCESS_ONE_ID", PROCESS_ONE_ID);	//主键
		
		PageData pds = new PageData();
		PageData pdp = new PageData();
		PageData pda = new PageData();
		
		//团队表添加
		for (int i = 0; i < DEPT.length; i++)
		{
			
			pd.put("STEPS", STEPS[i]);	//角色类型
			pd.put("DEPT", DEPT[i]);	//部门id
			pd.put("PERSONNEL_NAME", PERSONNEL_NAME[i]); //人员user_id
			pd.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID")); //问题id
			
			//根据用户id 获取数据(部门职位)
			PageData userpd = new PageData(1);
			userpd.put("USER_ID", PERSONNEL_NAME[i]);
			PageData userfind= userService.listByuser(userpd);
			
			if(userfind!=null && userfind.size()>0){
				
				pd.put("POSITION", userfind.get("ROLE_NAME")); //职位
				pd.put("PHONE", userfind.get("PHONE"));        //电话
				
			}
			//修改团队
			if(TEAMD1_ID[i] !=null && TEAMD1_ID[i].length()>0){
				teamd1Service.edit(pd);
			//添加团队成员	
			}else{
				pd.put("TEAMD1_ID", this.get32UUID());	//主键
				teamd1Service.save(pd);
			}
			
		}
		
				try
				{  
					
					//事件状态修改
					pdp.put("CLIENT_PROBLEM_COLLECTION_ID",pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
					pdp.put("PROCESSTATE", 1);
					//client_problem_collectionService.edit(pdp);
					
					//D1保存
				
					process_oneService.edit(pd);
					map.put("message", "1");
				} catch (Exception e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
					map.put("message", "0");
				}
		
		return map;
	}
	
	
	
	/**
	 * 步骤修改
	 */
	@RequestMapping(value="/paenEdit")
	@ResponseBody
	public Map<String, Object> edit() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> map=new HashMap<String, Object>();

		try
		{    
			
			planService.edit(pd);
			
			map.put("message", "1");
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("message", "0");
		}
		return map;
	}

}
