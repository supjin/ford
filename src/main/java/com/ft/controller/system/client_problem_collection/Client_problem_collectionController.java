package com.ft.controller.system.client_problem_collection;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.codehaus.jackson.map.ObjectMapper;
import org.noggit.JSONUtil;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.entity.system.User;
import com.ft.service.system.attachment.AttachmentService;
import com.ft.service.system.caused4.CauseD4Service;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.clientmanagement.ClientManagementService;
import com.ft.service.system.complainmold.ComplainmoldService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.failuremode_management.Failuremode_managementService;
import com.ft.service.system.measures_message.Measures_messageService;
import com.ft.service.system.measures_message_do.Measures_message_doService;
import com.ft.service.system.measures_message_prevent.Measures_message_preventService;
import com.ft.service.system.measuresd5.MeasuresD5Service;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.problemmold.ProblemmoldService;
import com.ft.service.system.process_eight.Process_eightService;
import com.ft.service.system.process_five.Process_fiveService;
import com.ft.service.system.process_four.Process_fourService;
import com.ft.service.system.process_one.Process_oneService;
import com.ft.service.system.process_seven.Process_sevenService;
import com.ft.service.system.process_six.Process_sixService;
import com.ft.service.system.process_two.Process_twoService;
import com.ft.service.system.process_zero.Process_zeroService;
import com.ft.service.system.productmangement.ProductMangementService;
import com.ft.service.system.project_management.Project_managementService;
import com.ft.service.system.user.UserService;
import com.ft.service.system.zeroemergency.ZeroemergencyService;
import com.ft.util.AppUtil;
import com.ft.util.Const;
import com.ft.util.DateUtil;
import com.ft.util.JsonUtil;
import com.ft.util.Jurisdiction;
import com.ft.util.ObjectExcelView;
import com.ft.util.PageData;
import com.ft.util.Tools;

/**
 * 类名称：Client_problem_collectionController 创建人：lichao 创建时间：2017-11-06
 */
@Controller
@RequestMapping(value = "/client_problem_collection")
public class Client_problem_collectionController extends BaseController {

	String menuUrl = "client_problem_collection/list.do"; // 菜单地址(权限用)
	@Resource(name = "client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	@Resource(name = "userService")
	private UserService userService;

	// 失效模式
	@Resource(name = "failuremode_managementService")
	private Failuremode_managementService failuremode_managementService;
	// 产品
	@Resource(name = "productmangementService")
	private ProductMangementService productmangementService;
	// 项目
	@Resource(name = "project_managementService")
	private Project_managementService project_managementService;
	// 客户
	@Resource(name = "clientmanagementService")
	private ClientManagementService clientmanagementService;
	// 附件
	@Resource(name = "attachmentService")
	private AttachmentService attachmentService;
	// D0
	@Resource(name = "process_zeroService")
	private Process_zeroService process_zeroService;
	@Resource(name = "process_oneService")
	private Process_oneService process_oneService;
	@Resource(name = "dictService")
	private DictService dictService;
	// 部门
	@Resource(name = "departmentService")
	private DepartmentService departmentService;
	// 问题分类
	@Resource(name = "problemmoldService")
	private ProblemmoldService problemmoldService;
	// 抱怨分类
	@Resource(name = "complainmoldService")
	private ComplainmoldService complainmoldService;
	// 计划
	@Resource(name = "planService")
	private PlanService planService;
	// d0
	@Resource(name = "zeroemergencyService")
	private ZeroemergencyService zeroemergencyService;
	@Resource(name = "process_twoService")
	private Process_twoService process_twoService;
	@Resource(name = "measures_messageService")
	private Measures_messageService measures_messageService;
	@Resource(name = "caused4Service")
	private CauseD4Service caused4Service;
	@Resource(name = "process_fourService")
	private Process_fourService process_fourService;
	@Resource(name = "process_fiveService")
	private Process_fiveService process_fiveService;
	@Resource(name = "measuresd5Service")
	private MeasuresD5Service measuresd5Service;
	@Resource(name = "process_sixService")
	private Process_sixService process_sixService;
	@Resource(name = "measures_message_doService")
	private Measures_message_doService measures_message_doService;
	@Resource(name="process_sevenService")
	private Process_sevenService process_sevenService;
	@Resource(name="measures_message_preventService")
	private Measures_message_preventService measures_message_preventService;
	@Resource(name="process_eightService")
	private Process_eightService process_eightService;
	/**
	 * 去客户问题列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) {
		logBefore(logger, "列表Client_problem_collection");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		try {
			pd = this.getPageData();
			page.setShowCount(10);
			/*if(null != pd.get("pages") && !"undefined".equals(pd.get("pages").toString())){
			page.setCurrentResult((Integer.parseInt(pd.get("pages").toString())-1)*page.getShowCount());
			}else {
				page.setCurrentResult(0);	
				mv.addObject("meiban", 1);
			}*/
			int pages = 0;
			if(null != pd.get("pages") && !"undefined".equals(pd.get("pages").toString())){
				pages =Integer.parseInt(pd.get("pages").toString());//当前页
				}
			page.setCurrentPage(pages+1);
			page.setPd(pd);
			List<PageData> list = client_problem_collectionService.list(page); // 列出Client_problem_collection列表
			int tolpage = page.getTotalPage();
			
			List<PageData> clientList = clientmanagementService.listAllFactory(pd);// 客户
			List<PageData> productList = productmangementService.listAllName(pd);// 产品
			// 菜单列表
			List<PageData> dicList = dictService.getList("processType");
			// 获取每个问题是否过期的状态显示
			List<PageData> varList = client_problem_collectionService.getPrombleState(list,dicList);
			/*Map<Object, Object> map = new LinkedHashMap<Object, Object>();
			map = client_problem_collectionService.getTimeIsOut(varList);*/
			
			// 获取面包屑的内容
			pd = client_problem_collectionService.getTitle(pd);
			// 所有公司用户
			List<PageData> userList = userService.listAllUser(pd);
			List<PageData> failureList = failuremode_managementService.listAll(pd);
			mv.setViewName("system/client_problem_collection/client_list");
			mv.addObject("productList", productList);
			mv.addObject("userList", userList);
			mv.addObject("failureList", failureList);
			mv.addObject("clientList", clientList);
			mv.addObject("varList", varList);
			mv.addObject("dicList", dicList);
			/*mv.addObject("map", map);*/

			mv.addObject("pages", pages);
			mv.addObject("tolpage",tolpage);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去客户问题新增页
	 */
	@RequestMapping(value = "/goaddAndEdit")
	public ModelAndView goaddAndEdit(Page page) {
		logBefore(logger, "新增Client_problem_collection");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);

			// 公司部门
			List<PageData> deptList = departmentService.listAllByCOMPANY_ID(pd);
			if (deptList.size() > 0) {
				pd.put("DEPARTMENT_ID", deptList.get(0).get("DEPARTMENT_ID").toString());
				// 第一个
				List<PageData> deptuser = userService.listAllUserByDept(pd);
				mv.addObject("deptuser", deptuser);
			}
			mv.addObject("deptList", deptList);

			// 所有公司用户
			List<PageData> userList = userService.listAllUser(pd);
			if (pd.getString("CLIENT_PROBLEM_COLLECTION_ID") != null
					&& !"".equals(pd.getString("CLIENT_PROBLEM_COLLECTION_ID"))) {
				pd = client_problem_collectionService.findById(pd);
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
				/*pd.put("DOCUMENTDATE", DOCUMENTDATE);*/
				pd.put("TRACKINGNUMBER", TRACKINGNUMBER);
				pd.put("saveoredit", "采集");

			}

			// 获取面包屑的内容
			pd = client_problem_collectionService.getTitle(pd);

			List<PageData> failureList = failuremode_managementService.listAll(pd);
			List<PageData> productList = productmangementService.listAllName(pd);// 产品
			List<PageData> projectList = project_managementService.listAll(pd);
			List<PageData> clientList = clientmanagementService.listAllFactory(pd);// 客户
			List<PageData> problemList = problemmoldService.listAll(pd);
			List<PageData> complainList = complainmoldService.listAll(pd);

			mv.addObject("complainList", complainList);
			mv.addObject("problemList", problemList);
			mv.addObject("clientList", clientList);
			mv.addObject("failureList", failureList);
			mv.addObject("productList", productList);
			mv.addObject("projectList", projectList);
			mv.addObject("userList", userList);

			mv.setViewName("system/client_problem_collection/client_problem_edit");
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
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
		PageData pds = new PageData();
		PageData pdp = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("CLIENT_PROBLEM_COLLECTION_ID")&& !"".equals(pd.getString("CLIENT_PROBLEM_COLLECTION_ID"))) {
			client_problem_collectionService.edit(pd);
			map.put("mesage", "修改成功");
			map.put("status", "1");
			map.put("CLIENT_PROBLEM_COLLECTION_ID",pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		} else {
			String CLIENT_PROBLEM_COLLECTION_ID = this.get32UUID().toString();
			pd.put("CLIENT_PROBLEM_COLLECTION_ID", CLIENT_PROBLEM_COLLECTION_ID);
			pd.put("USER_ID", pd.getString("FIRSTDEPARTMENT"));
			pds = userService.findByUiId(pd);// 查询初判责任人信息
			client_problem_collectionService.saveAll(pd,pds);
			map.put("mesage", "保存成功");
			map.put("status", "2");
			map.put("CLIENT_PROBLEM_COLLECTION_ID",CLIENT_PROBLEM_COLLECTION_ID);
		}

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
			client_problem_collectionService.delete(pd);
			//planService.deleteBysj(pd);
			map.put("status", "1");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return map;
	}
	
	/**
	 * 去浏览页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/goBrows")
	public ModelAndView goBrows() throws Exception{
		logBefore(logger, "去浏览页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdt = new PageData();
		try {
			pd = this.getPageData();
			List<PageData>	failureList = failuremode_managementService.listAll(pd);
			List<PageData>	productList = productmangementService.listAllName(pd);//产品
			List<PageData>	projectList = project_managementService.listAll(pd);
			List<PageData>	clientList =  clientmanagementService.listAllFactory(pd);//客户
			
			//查询问题信息
			pd = client_problem_collectionService.findById(pd);
			// 获取面包屑的内容
			pd = client_problem_collectionService.getTitle(pd);
			//进行天数
			String time = DateUtil.getDay();
			Date times = Tools.str3Date(time);
			if (null != pd.get("CREATETIME")&& !"".equals(pd.get("CREATETIME").toString())) {
				String atime =  pd.get("CREATETIME").toString();
				Date addtime = Tools.str3Date(atime);
				int timepast = daysBetween(addtime,times);
				pd.put("timepast", timepast);
			}
			// d0的数据包含症状反应
			pds = process_zeroService.findByProblemId(pd);
			// 应急反应
			pd.put("SELECTSTATE", 0);
			List<PageData> list = zeroemergencyService.listAll(pd);
			// 处理应急反应的附件
			List<PageData> dzList = client_problem_collectionService.getAttachMap(list);
			//D1查plan表
			List<PageData> paList= planService.listAllIsEvent(pd);
			//D2
			pdt = process_twoService.findByClientId(pd);
			// 处理附件
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			List<Object> dtlist = new ArrayList<Object>();
			if (null !=pdt && !"".equals(pdt)) {
				String accessory = pdt.getString("ATTACHMENTNURL");
				if (StringUtils.isNotBlank(accessory)) {
					String[] imgkan =  accessory.split(",,,");
					for (String str : imgkan) {
						if (StringUtils.isNotBlank(str)) {
						String[] strs = str.split(";;");
						for (String ts : strs) {
							String realName = ts.substring(0, str.indexOf("::"));
							String serverName = ts.substring(
									ts.indexOf("::") + 2, ts.length());
							map.put(realName, serverName);
						}
						dtlist.add(map);
						}
					}
					
				}
			}
			
			//D3
			// 临时措施
			List<PageData> tlist = measures_messageService.listAll(pd);
			// 处理临时措施的附件
			List<PageData>thList = client_problem_collectionService.getAttachMap(tlist);
			//D4
			PageData pdf = process_fourService.findByD4Id(pd);
			pd.put("type", 1);
			List<PageData> flist = caused4Service.listAll(pd); // 列出根本原因
			List<PageData> fo1List = client_problem_collectionService.getAttachMaps(flist);
			mv.addObject("fo1List", fo1List);

			pd.put("type", 2);
			List<PageData> lists = caused4Service.listAll(pd); // 列出逃逸点
			List<PageData> varLists = client_problem_collectionService.getAttachMaps(lists);
			mv.addObject("varLists", varLists);

			pd.put("type", 3);
			List<PageData> listss = caused4Service.listAll(pd); // 列出体系原因
			List<PageData> varListss = client_problem_collectionService.getAttachMaps(listss);
			mv.addObject("varListss", varListss);
			
			//D5
			PageData pdfi= process_fiveService.findByD5Id(pd);
			List<PageData> listfi = measuresd5Service.listAll(pd); // 列出MeasuresD5列表
			List<PageData> fiList = client_problem_collectionService.getAttachMaps(listfi);
			//D6
			PageData pdsi = process_sixService.findByPromId(pd);
			// D6措施选择
			List<PageData> listi = measures_message_doService.listAll(pd);
			//处理D6措施的附件
			List<PageData> siList = client_problem_collectionService.getAttachMap(listi);
			//D7
			// d7的数据预防措施
			PageData pdse = process_sevenService.findByPromId(pd);
			pd.put("PREAVENTTYPE", 1);
			List<PageData> sList = measures_message_preventService.listAll(pd);
			//处理预防措施的附件
			List<PageData> mesList = client_problem_collectionService.getAttachMap(sList);
			// d7的数局体系整改预防措施
			pd.put("PREAVENTTYPE", 2);
			List<PageData> tList = measures_message_preventService.listAll(pd);
			//处理预防措施的附件
			List<PageData> tixList = client_problem_collectionService.getAttachMap(tList);
			//D8
			PageData pde = process_eightService.findByPromId(pd);
			mv.addObject("mesList", mesList);
			mv.addObject("tixList", tixList);
			mv.addObject("siList", siList);
			mv.addObject("fiList", fiList);
			mv.addObject("thList", thList);
			mv.addObject("dtlist", dtlist);
			mv.addObject("paList", paList);
			mv.addObject("pds", pds);
			mv.addObject("pdt", pdt);
			mv.addObject("pdf", pdf);
			mv.addObject("pdfi", pdfi);
			mv.addObject("pdsi", pdsi);
			mv.addObject("pdse", pdse);
			mv.addObject("pde", pde);
			mv.addObject("dzList", dzList);
			mv.addObject("clientList", clientList);
			mv.addObject("failureList", failureList);
			mv.addObject("productList", productList);
			mv.addObject("projectList",projectList);
			mv.setViewName("system/client_problem_collection/client_problem_brows");			mv.addObject("msg", "save");
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
	public void save(HttpServletResponse response) throws Exception{
		logBefore(logger, "新增Client_problem_collection");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CLIENT_PROBLEM_COLLECTION_ID", this.get32UUID());	//主键
		pd.put("USER_ID", pd.getString("FIRSTDEPARTMENT"));
		client_problem_collectionService.save(pd);
		response.sendRedirect("list");
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Client_problem_collection");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			client_problem_collectionService.delete(pd);
			planService.deleteBysj(pd);
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
	public void edit(HttpServletResponse response) throws Exception{
		logBefore(logger, "修改Client_problem_collection");
		PageData pd = new PageData();
		pd = this.getPageData();
		client_problem_collectionService.edit(pd);
		response.sendRedirect("list");
	}
	
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/verifyList")
	public ModelAndView verifyList(Page page){
		logBefore(logger, "审核列表Client_problem_collection");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = client_problem_collectionService.verifyList(page);	//列出Client_problem_collection列表
			mv.setViewName("system/client_problem_collection/client_problem_collection");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**
	 * 去审核页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/goCheck")
	public ModelAndView goCheck() throws Exception{
		logBefore(logger, "去修改Client_problem_collection页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		PageData pdo = new PageData();
		PageData pdu = new PageData();
		try {
			pd = this.getPageData();
			pds = process_zeroService.findByProblemId(pd);//D0
			//d1
			PageData  sj=	process_oneService.findBysjid(pd);
			if(sj!=null && sj.size()>0){
				
				sj.put("listmap",  JsonUtil.getJsonToList(sj.get("PERSONNEL_NAME").toString()));
				
				mv.addObject("sj", sj);
			}
			
			
			pd = client_problem_collectionService.findById(pd);	//问题
			pdu.put("PROCESSID", pds.getString("PROCESS_ZERO_ID"));
			List<PageData> attList = attachmentService.listAll(pdu);//附件
			mv.addObject("attList", attList);
			pdo.put("PROCESSID", sj.getString("PROCESS_ONE_ID"));//D1
			List<PageData> attoList = attachmentService.listAll(pdo);//附件
			mv.addObject("attoList", attoList);
			pdd.put("TYPE", "processType");
			List<PageData> biaoList = dictService.selectByTypeAll(pdd);//导航
			mv.addObject("biaoList", biaoList);
			mv.setViewName("system/client_problem_collection/client_problem_check");
			mv.addObject("pd", pd);
			mv.addObject("pdo", pdo);
			mv.addObject("pds", pds);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 审核通过
	 * @throws Exception 
	 */
	@RequestMapping(value="/changeStatus")
	@ResponseBody
	public Map<String, String> changeStatus() throws Exception{
		logBefore(logger, "修改通过状态");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		client_problem_collectionService.edit(pd);
		map.put("message", "审核成功");
		
		return map;
	}	
	/**
	 * 审核不通过
	 * @throws Exception 
	 */
	@RequestMapping(value="/saveChange")
	@ResponseBody
	public Map<String, String> saveChange() throws Exception{
		logBefore(logger, "修改通过状态");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		client_problem_collectionService.edit(pd);
		map.put("message", "审核成功");
		return map;
	}	
	
	
	/**
	 * 去新增页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		logBefore(logger, "去新增Client_problem_collection页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			PageData pds = new PageData();
			pds = (PageData) session.getAttribute(Const.SESSION_userpds);
			String USERNAME ="";
			String COMPANY_ID ="";
			String USERID="";
			if (pds != null) {
				COMPANY_ID = pds.getString("COMPANY_ID");// 公司id
			    USERNAME = pds.getString("NAME");// 申请人，取用户姓名
			    USERID = pds.getString("USER_ID");
			}
			String DOCUMENTDATE = DateUtil.getDay();// 单据日期
			Random random = new Random();
			int code = (1000 + random.nextInt(9000));//四位随机数
			String TRACKINGNUMBER = "RB"+createTimestamp()+code;//跟踪号（FT+时间搓+四位随机数）
			
			//公司部门
			List<PageData> deptList=departmentService.listAllByCOMPANY_ID(pd);
			if(deptList.size()>0){
			pd.put("DEPARTMENT_ID", deptList.get(0).get("DEPARTMENT_ID").toString());
			//第一个
			List<PageData> deptuser=userService.listAllUserByDept(pd);
			mv.addObject("deptuser", deptuser);
			}
			mv.addObject("deptList", deptList);
			
			pd.put("USERID",USERID);
			pd.put("COMPANY_ID",COMPANY_ID);
			pd.put("USERNAME",USERNAME);
			pd.put("DOCUMENTDATE",DOCUMENTDATE);
			pd.put("TRACKINGNUMBER",TRACKINGNUMBER);
			
			List<PageData>	failureList = failuremode_managementService.listAll(pd);
			List<PageData>	productList = productmangementService.listAllName(pd);//产品
			List<PageData>	projectList = project_managementService.listAll(pd);
			List<PageData>	clientList =  clientmanagementService.listAllFactory(pd);//客户
			mv.addObject("clientList", clientList);
			mv.addObject("failureList", failureList);
			mv.addObject("productList", productList);
			mv.addObject("projectList",projectList);
			mv.setViewName("system/client_problem_collection/client_problem_collection_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	
	/**
	 * 去修改页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		logBefore(logger, "去修改Client_problem_collection页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pdu = new PageData();
		try {
			pd = this.getPageData();
			List<PageData>	failureList = failuremode_managementService.listAll(pd);
			List<PageData>	productList = productmangementService.listAllName(pd);//产品
			List<PageData>	projectList = project_managementService.listAll(pd);
			List<PageData>	clientList = clientmanagementService.listAllFactory(pd);//客户
			pd = client_problem_collectionService.findById(pd);	//根据ID读取
			
			if(pd != null){
				//公司部门
				List<PageData> deptList=departmentService.listAllByCOMPANY_ID(pd);
				if(deptList.size()>0){
				pd.put("DEPARTMENT_ID", pd.getString("DEPARTMENT_ID"));
				//第一个
				List<PageData> deptuser=userService.listAllUserByDept(pd);
				mv.addObject("deptuser", deptuser);
				}
				mv.addObject("deptList", deptList);
			}
			
			pdu.put("USER_ID", pd.getString("FIRSTDEPARTMENT"));
			
			pdu = userService.findByUiId(pdu);
			mv.addObject("clientList", clientList);
			mv.addObject("failureList", failureList);
			mv.addObject("productList", productList);
			mv.addObject("projectList", projectList);
			mv.setViewName("system/client_problem_collection/client_problem_collection_edit");
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
		logBefore(logger, "批量删除Client_problem_collection");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				client_problem_collectionService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Client_problem_collection到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司ID");	//1
			titles.add("申请人");	//2
			titles.add("单据日期");	//3
			titles.add("跟踪号");	//4
			titles.add("产品名称");	//5
			titles.add("问题分类");	//6
			titles.add("问题来源");	//7
			titles.add("项目名称");	//8
			titles.add("客户名称");	//9
			titles.add("抱怨分类");	//10
			titles.add("缺陷症状描述");	//11
			titles.add("发生日期");	//12
			titles.add("生产批次");	//13
			titles.add("失效模式");	//14
			titles.add("不合格数量");	//15
			titles.add("是否重复");	//16
			titles.add("是否来料相关");	//17
			titles.add("供应商名字");	//18
			titles.add("参考经验教训");	//19
			titles.add("初判责任部门");	//20
			titles.add("其他客户自定义");	//21
			titles.add("创建时间");	//22
			titles.add("更新时间");	//23
			titles.add("审核时间");	//24
			titles.add("删除标识");	//25
			titles.add("问题链接");	//26
			titles.add("预留字段");	//27
			titles.add("预留字段2");	//28
			dataMap.put("titles", titles);
			List<PageData> varOList = client_problem_collectionService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANY_ID"));	//1
				vpd.put("var2", varOList.get(i).getString("USERNAME"));	//2
				vpd.put("var3", varOList.get(i).getString("DOCUMENTDATE"));	//3
				vpd.put("var4", varOList.get(i).getString("TRACKINGNUMBER"));	//4
				vpd.put("var5", varOList.get(i).getString("PRODUCTNAME"));	//5
				vpd.put("var6", varOList.get(i).get("QUESTIONCATEGORY").toString());	//6
				vpd.put("var7", varOList.get(i).getString("PROBLEMSOURCE"));	//7
				vpd.put("var8", varOList.get(i).getString("PROJECTNAME"));	//8
				vpd.put("var9", varOList.get(i).getString("CLIENTSNAME"));	//9
				vpd.put("var10", varOList.get(i).getString("COMPLAINTCLASSIFICATION"));	//10
				vpd.put("var11", varOList.get(i).getString("DEFECTDESCRIPTION"));	//11
				vpd.put("var12", varOList.get(i).getString("OCCURRENCEDATE"));	//12
				vpd.put("var13", varOList.get(i).getString("PRODUCTIONBATCH"));	//13
				vpd.put("var14", varOList.get(i).getString("FAILUREMODE"));	//14
				vpd.put("var15", varOList.get(i).getString("UNQUALIFIEDQUANTITY"));	//15
				vpd.put("var16", varOList.get(i).getString("WHETHERREPEAT"));	//16
				vpd.put("var17", varOList.get(i).getString("INCOMINGRALATED"));	//17
				vpd.put("var18", varOList.get(i).getString("SUPPLIERNAME"));	//18
				vpd.put("var19", varOList.get(i).getString("REFERENCELESSONS"));	//19
				vpd.put("var20", varOList.get(i).getString("FIRSTDEPARTMENT"));	//20
				vpd.put("var21", varOList.get(i).getString("COSTOMIZE"));	//21
				vpd.put("var22", varOList.get(i).getString("CREATETIME"));	//22
				vpd.put("var23", varOList.get(i).getString("UPDATETIME"));	//23
				vpd.put("var24", varOList.get(i).getString("AUDITTIME"));	//24
				vpd.put("var25", varOList.get(i).getString("DELETED"));	//25
				vpd.put("var26", varOList.get(i).getString("QUESTIONLINK"));	//26
				vpd.put("var27", varOList.get(i).getString("DECLERCODE"));	//27
				vpd.put("var28", varOList.get(i).getString("DECLERCODET"));	//28
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
	 /**  
     * 计算两个日期之间相差的天数  
     * @param smdate 较小的时间 
     * @param bdate  较大的时间 
     * @return 相差天数 
     * @throws ParseException  
     */    
    public static int daysBetween(Date smdate,Date bdate) throws ParseException {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        smdate=sdf.parse(sdf.format(smdate));  
        bdate=sdf.parse(sdf.format(bdate));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(smdate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(bdate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));           
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
