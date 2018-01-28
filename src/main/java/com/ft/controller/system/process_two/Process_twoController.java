package com.ft.controller.system.process_two;

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
import javax.servlet.http.HttpServletResponse;

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
import com.ft.util.FileDownload;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.PathUtil;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.attachment.AttachmentService;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.isnot.IsNotService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.problemmold.ProblemmoldService;
import com.ft.service.system.process_two.Process_twoService;

/** 
 * 类名称： Process_twoController
 * 创建人：lichao 
 * 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value="/process_two")
public class  Process_twoController extends BaseController {
	
	String menuUrl = "process_two/list.do"; //菜单地址(权限用)
	@Resource(name="process_twoService")
	private  Process_twoService process_twoService;
	
	@Resource(name="dictService")
	private DictService dictService;
	
	@Resource(name="attachmentService")
	private AttachmentService attachmentService;
	
	@Resource(name="planService")
	private PlanService planService;
	//问题分类
	@Resource(name="problemmoldService")
	private ProblemmoldService problemmoldService;
	// 问题
	@Resource(name = "client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;

	//isnot
	@Resource(name="isnotService")
	private IsNotService IsNotService;
	
	/**
	 * D2问题描述 页面出后使用系统 去D2页面
	 */
	@RequestMapping(value = "/goProcess")
	public ModelAndView goProcess() throws Exception {
		logBefore(logger, "去D2页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		try {
			// 导航
			pd = this.getPageData();
			pdd.put("TYPE", "processType");
			List<PageData> biaoList = dictService.selectByTypeAll(pdd);
			// d2的数据
			pds = process_twoService.findByClientId(pd);
			// 处理附件
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			List<Object> list = new ArrayList<Object>();
			Map<String, Object> maps = new LinkedHashMap<String, Object>();
			List<Object> lists = new ArrayList<Object>();
			if (null !=pds && !"".equals(pds)) {
				String accessory = pds.getString("ATTACHMENTNURL");
				String ahj = accessory.substring(0, accessory.indexOf(",,,"));
				String bhj = accessory.substring(accessory.indexOf(",,,") + 3,accessory.length());

				if (StringUtils.isNotBlank(ahj)) {
					String[] imgkan = ahj.split(";;");
					for (String str : imgkan) {
						String realName = str.substring(0, str.indexOf("::"));
						String serverName = str.substring(
								str.indexOf("::") + 2, str.length());
						map.put(realName, serverName);
					}
					list.add(map);
				}
				if (StringUtils.isNotBlank(bhj)) {
					String[] wordkan = bhj.split(";;");
					for (String str : wordkan) {
						String realName = str.substring(0, str.indexOf("::"));
						String serverName = str.substring(
								str.indexOf("::") + 2, str.length());
						maps.put(realName, serverName);
					}
					lists.add(maps);
				}
			}
			List<PageData>	problemList = problemmoldService.listAll(pd);
			// 查问题 获取问题id 以及标题头部
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			//责任人--------
			pd.put("STEP", "02");
			mv =planService.getHead(pd);
			mv.setViewName("system/process_two/process_two_acta");
			mv.addObject("biaoList", biaoList);
			mv.addObject("list", list);
			mv.addObject("problemList", problemList);
			mv.addObject("lists", lists);
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * D2问题描述 页面出后使用系统     
	 * 包括问题表中的问题描述，D2表中的问题描述，修改问题表，D2表增加或修改
	 * 修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> symptom() throws Exception {
		logBefore(logger, "D0症状保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if(null != pd.getString("CLIENT_PROBLEM_COLLECTION_ID") && !"".equals(pd.getString("CLIENT_PROBLEM_COLLECTION_ID"))){
			client_problem_collectionService.edit(pd);
		}
		//D2表
		if(null != pd.getString("PROCESS_TWO_ID") && !"".equals(pd.getString("PROCESS_TWO_ID"))){
			process_twoService.edit(pd);
		}else{
			pd.put("PROCESS_TWO_ID", this.get32UUID().toString());
			process_twoService.save(pd);
			
		}
		pd.put("STEP", "02");
		PageData _plan = planService.queryAllByClientIdAndStep(pd);
		if(_plan.size()>0){
			if(Integer.parseInt(_plan.get("ISFINISH").toString()) == 0){
				pd.put("PLAN_ID", _plan.get("PLAN_ID"));
				pd.put("ISFINISH",1 );
				pd.put("FINISHTIME", DateUtil.getDay());
				planService.edit(pd);
			}
		}
		map.put("PROCESS_TWO_ID", pd.getString("PROCESS_TWO_ID"));
		map.put("mesage", "修改成功");
		return map;
	}
	
	
	/**
	 * D2问题描述 页面出后使用系统 去D2页面
	 */
	@RequestMapping(value = "/goIsnot")
	public ModelAndView goIsnot() throws Exception {
		logBefore(logger, "去D2页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData  isNotPd = new PageData();//存isnot对象
		try {
		
			pd=this.getPageData();
			if(pd.get("CLIENT_PROBLEM_COLLECTION_ID")!=null&&!"".equals(pd.get("CLIENT_PROBLEM_COLLECTION_ID"))){
				isNotPd = IsNotService.findByProblemId(pd);//根据问题id找
				if(isNotPd!=null&&isNotPd.get("ISNOT_ID")!=null&&!"".equals(isNotPd.get("ISNOT_ID"))){
					//存在isnotid则传查出来的内容
					pd=isNotPd;
					pd.put("message", "edit");
				}
				else{
					//不存在id则新增
					
					pd.put("message", "save");
				}
			}
			mv.addObject("pd",pd);
			mv.setViewName("system/process_two/disnot");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * D2问题描述 D2編輯提交
	 */
	
	@RequestMapping(value = "/IsnotAddAndEdit")
	public Map addAndEdit() throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		logBefore(logger, "编辑isnot");
		PageData pd =new PageData();
		pd=this.getPageData();
		
		
		return map;
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增 Process_two");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put(" PROCESS_TWO_ID", this.get32UUID());	//主键
		 process_twoService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除 Process_two");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			process_twoService.delete(pd);
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
		logBefore(logger, "修改 Process_two");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		process_twoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 下载模版
	 */
	@RequestMapping(value="/downWen")
	public void downWenjian(HttpServletResponse response)throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		if( pd.getString("filepath") != null &&  pd.getString("filename") != null)
		FileDownload.fileDownload(response, PathUtil.getClasspath() +  pd.getString("filepath"),  pd.getString("filename"));
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/editManage")
	public ModelAndView editManage() throws Exception{
		logBefore(logger, "修改 Process_two");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.get("PROCESS_TWO_ID") == null || pd.get("PROCESS_TWO_ID").toString().equals("")){
			pd.put("PROCESS_TWO_ID", this.get32UUID());
			process_twoService.save(pd);
		}else{
			process_twoService.edit(pd);
		}
		
		pd.put("PROCESS_ALL_ID", pd.getString("PROCESS_TWO_ID"));
		attachmentService.updatefile(pd);
		PageData pds = new PageData();
		pds.put("TYPE", "processType");
		List<PageData> biaoList = dictService.selectByTypeAll(pds);
		//判断此用户是否拥有操作权限
		pd.put("STEP", "02");
		PageData handle = planService.checkUserIsHandle(pd);
		//查询附件
		List<PageData> fjlist = attachmentService.listAll(pds);
		if(fjlist !=null && fjlist.size()>0){
			mv.addObject("fj", fjlist.get(0));
		}
		mv.addObject("handle", handle);
		mv.addObject("biaoList", biaoList);
		mv.addObject("pd", pd);
		mv.addObject("msg","editManage");
		mv.setViewName("system/process_two/processTwoManage");
		return mv;
	}
	
	
	@RequestMapping(value="/goManage")
	public ModelAndView goManage(){
		logBefore(logger, "去修改 Process_two页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			PageData pds = new PageData();
			pd = this.getPageData();
			String CLIENT_PROBLEM_COLLECTION_ID = pd.get("CLIENT_PROBLEM_COLLECTION_ID").toString();
			pd =  process_twoService.findByClientId(pd);	//根据问题ID读取
			if(pd==null){
				pd= new PageData();
			}
			//判断此用户是否拥有操作权限
			pd.put("STEP", "02");
			PageData handle = planService.checkUserIsHandle(pd);
			//查询附件
			List<PageData> fjlist = attachmentService.listAll(pds);
			if(fjlist !=null && fjlist.size()>0){
				mv.addObject("fj", fjlist.get(0));
			}
			mv.setViewName("system/process_two/processTwoManage");
			mv.addObject("msg", "editManage");
			pd.put("CLIENT_PROBLEM_COLLECTION_ID", CLIENT_PROBLEM_COLLECTION_ID);
			mv.addObject("pd", pd);
			mv.addObject("handle", handle);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表 Process_two");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList =  process_twoService.list(page);	//列出 Process_two列表
			mv.setViewName("system/process_two/process_two_list");
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
		logBefore(logger, "去新增 Process_two页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			mv.setViewName("system/process_two/process_two_edit");
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
		logBefore(logger, "去修改 Process_two页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			pd =  process_twoService.findById(pd);	//根据ID读取
			mv.setViewName("system/process_two/process_two_edit");
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
		logBefore(logger, "批量删除 Process_two");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				 process_twoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出 Process_two到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司id");	//1
			titles.add("问题id");	//2
			titles.add("Object 对象");	//3
			titles.add("Defect缺陷");	//4
			titles.add("On Vehicle or Object");	//5
			titles.add("First Observed & Seen Since");	//6
			titles.add("First Observed & Seen Since");	//7
			titles.add("Pattern Since 形式");	//8
			titles.add("Defects per Object 每件的缺陷数");	//9
			titles.add("Trend 趋势");	//10
			titles.add("what 获得信息");	//11
			titles.add("缺陷获得信息");	//12
			titles.add("地点获得信息");	//13
			titles.add("地点二获得信息");	//14
			titles.add("Magnitude 等级");	//15
			titles.add("世间获得信息一");	//16
			titles.add("时间2");	//17
			titles.add("程度一");	//18
			titles.add("程度二");	//19
			titles.add("程度三");	//20
			titles.add("处理人id");	//21
			titles.add("d2负责人");	//22
			titles.add("执行人");	//23
			titles.add("d3负责人");	//24
			titles.add("执行日期");	//25
			titles.add("更新时间");	//26
			dataMap.put("titles", titles);
			List<PageData> varOList =  process_twoService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANY_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID"));	//2
				vpd.put("var3", varOList.get(i).getString("WHATOBJECT"));	//3
				vpd.put("var4", varOList.get(i).getString("WHATDEFECT"));	//4
				vpd.put("var5", varOList.get(i).getString("WHEREVEHICLEOR"));	//5
				vpd.put("var6", varOList.get(i).getString("WHEREFIRSTOBSERVED"));	//6
				vpd.put("var7", varOList.get(i).getString("WHENSINCE"));	//7
				vpd.put("var8", varOList.get(i).getString("WHENPATTERN"));	//8
				vpd.put("var9", varOList.get(i).getString("HOWDEFECT"));	//9
				vpd.put("var10", varOList.get(i).getString("HOWTREND"));	//10
				vpd.put("var11", varOList.get(i).getString("WHATINFO"));	//11
				vpd.put("var12", varOList.get(i).getString("WHATIFODEFECT"));	//12
				vpd.put("var13", varOList.get(i).getString("WHEREINFOVEHICLE"));	//13
				vpd.put("var14", varOList.get(i).getString("WHEREOBSERVED"));	//14
				vpd.put("var15", varOList.get(i).getString("HOWMAGNITUDE"));	//15
				vpd.put("var16", varOList.get(i).getString("WHENONE"));	//16
				vpd.put("var17", varOList.get(i).getString("WHENTWO"));	//17
				vpd.put("var18", varOList.get(i).getString("HOWONEINFO"));	//18
				vpd.put("var19", varOList.get(i).getString("HOWTWOINFO"));	//19
				vpd.put("var20", varOList.get(i).getString("HOWTHREEINFO"));	//20
				vpd.put("var21", varOList.get(i).getString("USERID"));	//21
				vpd.put("var22", varOList.get(i).getString("PRINCIPALNAME"));	//22
				vpd.put("var23", varOList.get(i).getString("EXECUTIVENAME"));	//23
				vpd.put("var24", varOList.get(i).getString("PRINCIPALD_THREENAME"));	//24
				vpd.put("var25", varOList.get(i).getString("EXECUTIONDATE"));	//25
				vpd.put("var26", varOList.get(i).getString("UPDATETIME"));	//26
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
