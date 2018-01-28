package com.ft.controller.system.process_three;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.ft.service.system.attachment.AttachmentService;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.company.CompanyService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.measures_message.Measures_messageService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_three.Process_threeService;
import com.ft.service.system.user.UserService;
import com.ft.service.system.zeroemergency.ZeroemergencyService;
import com.ft.util.AppUtil;
import com.ft.util.Const;
import com.ft.util.DateUtil;
import com.ft.util.Jurisdiction;
import com.ft.util.ObjectExcelView;
import com.ft.util.PageData;

/**
 * 类名称：Process_threeController 创建人：lichao 使用方法：备注页面出后使用系统对应的方法 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value = "/process_three")
public class Process_threeController extends BaseController {

	String menuUrl = "process_three/list.do"; // 菜单地址(权限用)
	@Resource(name = "process_threeService")
	private Process_threeService process_threeService;
	@Resource(name = "userService")
	private UserService userService;
	// 问题
	@Resource(name = "client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	// 附件
	@Resource(name = "attachmentService")
	private AttachmentService attachmentService;
	// 部门
	@Resource(name = "departmentService")
	private DepartmentService departmentService;
	// 公司
	@Resource(name = "companyService")
	private CompanyService companyService;
	// dic
	@Resource(name = "dictService")
	private DictService dictService;
	@Resource(name = "planService")
	private PlanService planService;
	@Resource(name = "measures_messageService")
	private Measures_messageService measures_messageService;
	@Resource(name = "zeroemergencyService")
	private ZeroemergencyService zeroemergencyService;

	/**
	 * D3临时措施 页面出后使用系统 去D3页面
	 */
	@RequestMapping(value = "/goProcess")
	public ModelAndView goProcess() throws Exception {
		logBefore(logger, "去D3页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		pd = this.getPageData();
		try {
			// 流程头
			pdd.put("TYPE", "efectentType");
			List<PageData> biaoList = dictService.selectByTypeAll(pdd);
			// d3的数据
			pds = process_threeService.findByPromId(pd);
			// 临时措施
			List<PageData> list = measures_messageService.listAll(pd);
			// 处理临时措施的附件
			List<PageData> varList = client_problem_collectionService.getAttachMap(list);
			// D0应急反应
			List<PageData> merList = zeroemergencyService.listAll(pd);
			// 公司所有用户
			List<PageData> deptList = departmentService.listAllByCOMPANY_ID(pd);// 公司部门
			// 查问题 获取问题id 以及标题头部
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			// 所有公司用户
			//List<PageData> userList = userService.listAllUser(pd);
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "03");
			mv =planService.getHead(pd);
			mv.setViewName("system/process_three/process_three_acta");
			mv.addObject("deptList", deptList);
			mv.addObject("varList", varList);
			mv.addObject("merList", merList);
			mv.addObject("biaoList", biaoList);
			//mv.addObject("userList", userList);
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * D3临时措施+应急反应 临时措施 页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit() throws Exception {
		logBefore(logger, "D3临时措施新增/修改");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("MEASURES_MESSAGE_ID") && !"".equals(pd.getString("MEASURES_MESSAGE_ID"))) {
			measures_messageService.edit(pd);
			map.put("MEASURES_MESSAGE_ID",pd.getString("MEASURES_MESSAGE_ID"));
		} else {
			String MEASURES_MESSAGE_ID = this.get32UUID().toString();
			pd.put("MEASURES_MESSAGE_ID", MEASURES_MESSAGE_ID);
			measures_messageService.save(pd);
			map.put("MEASURES_MESSAGE_ID",MEASURES_MESSAGE_ID);
		}
		map.put("mesage", "保存成功");
		return map;
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
		if (null != pd.getString("PROCESS_THREE_ID") && !"".equals(pd.getString("PROCESS_THREE_ID"))) {
			process_threeService.edit(pd);
		} else {
			String PROCESS_THREE_ID = this.get32UUID().toString();
			pd.put("PROCESS_THREE_ID", PROCESS_THREE_ID);
			process_threeService.save(pd);
			PageData pds = new PageData();
		}
		
		pd.put("STEP", "03");
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
		map.put("PROCESS_THREE_ID", pd.getString("PROCESS_THREE_ID"));
		return map;
	}
	
	/**
	 * D3临时措施+应急反应 页面出后使用系统 应急反应选定
	 */
	@RequestMapping(value = "/checkAdd")
	@ResponseBody
	public Map<String, Object> checkAdd() throws Exception {
		logBefore(logger, "D3应急反应选定");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		pd = this.getPageData();

		pds = zeroemergencyService.findById(pd);
		// 选定成功，将数据从应急反应存到临时措施表，存的理由是：修改D3不能改D0，D3中显示和措施形式一样
		if (pds != null) {
			String MEASURES_MESSAGE_ID = this.get32UUID().toString();
			pd.put("MEASURES_MESSAGE_ID", MEASURES_MESSAGE_ID);
			pd.put("MEASURESNAME", pds.getString("EMERGENCYRESPONSE"));
			pd.put("EFFICIENT", pds.getString("EFFCIENT"));
			pd.put("VALIDATION", pds.getString("VERIFICATION"));
			pd.put("DOTIME", pds.getString("PLANTIME"));
			pd.put("CLIENT_PROBLEM_COLLECTION_ID",pds.getString("CLIENT_PROBLEM_COLLECTION_ID"));
			pd.put("ATTACHMENTNURL", pds.getString("ATTACHMENTNURL"));
			pd.put("EXECUTIONDATE", pds.getString("EXECUTIONDATE"));
			pd.put("RESPONSIBLE", pds.getString("RESPONSIBLE"));
			measures_messageService.save(pd);
			//回显
			pdd.put("MEASURES_MESSAGE_ID", MEASURES_MESSAGE_ID);
			pdd = measures_messageService.findById(pdd);
			List<Object> list = new ArrayList<Object>();
			String accessory = pdd.getString("ATTACHMENTNURL");
			if(null != pdd.getString("ATTACHMENTNURL")){
			String[] array = accessory.split(";;");
			if(StringUtils.isNotBlank(accessory)){
				for (String str : array) {
					list.add(str);
				}
			}
			pdd.put("ATTACH", list);
			}
			map.put("list", pdd);
			
		} else {
			map.put("mesage", "选定失败");
			return map;
		}
		return map;
	}
	/**
	 * D0症状描述 页面出后使用系统 删除
	 */
	@RequestMapping(value = "/delet")
	@ResponseBody
	public Map<String, String> delet() throws Exception {
		logBefore(logger, "D0症状保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		measures_messageService.delete(pd);
		map.put("mesage", "删除成功");
		return map;
	}
	
	
	/**
	 * D3临时措施+应急反应 18号开会后不用此方法 应急反应 页面出后使用系统 增加/修改
	 */
	@RequestMapping(value = "/symptomEdit")
	@ResponseBody
	public Map<String, String> symptomEdit() throws Exception {
		logBefore(logger, "D3应急反应修改");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("ZEROEMERGENCY_ID")) {
			measures_messageService.edit(pd);
		} else {
			String ZEROEMERGENCY_ID = this.get32UUID().toString();
			pd.put("ZEROEMERGENCY_ID", ZEROEMERGENCY_ID);
			pd.put("SELECTSTATE", 1);
			zeroemergencyService.save(pd);
		}
		map.put("mesage", "保存成功");
		return map;
	}


	/**
	 * 去D3页面
	 */
	@RequestMapping(value = "/goProcessThree")
	public ModelAndView goProcessThree() throws Exception {
		logBefore(logger, "去D3页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		try {
			pd = this.getPageData();
			pdd.put("TYPE", "processType");
			List<PageData> biaoList = dictService.selectByTypeAll(pdd);// 导航
			pds = process_threeService.findByPromId(pd);// d0的数据
			// 查问题
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "03");
			PageData handle = planService.checkUserIsHandle(pd);

			List<PageData> varList = measures_messageService.listAll(pd);// 措施
			List<PageData> merList = zeroemergencyService.listAll(pd);// 应急反应
			pd.put("SELECTSTATE", 1);

			List<PageData> arrList = zeroemergencyService.listAll(pd);// 应急反应
			mv.addObject("handle", handle);
			mv.addObject("varList", varList);
			mv.addObject("merList", merList);
			mv.addObject("arrList", arrList);
			mv.addObject("biaoList", biaoList);
			mv.setViewName("system/process_three/process_three");
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
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, String> save() throws Exception {
		logBefore(logger, "新增Process_three");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdp = new PageData();
		pd = this.getPageData();
		String PROCESS_THREE_ID = this.get32UUID().toString();
		pd.put("PROCESS_THREE_ID", PROCESS_THREE_ID); // 主键
		Map<String, String> map = new HashMap<String, String>();
		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		PageData pduser = new PageData();
		pduser = (PageData) session.getAttribute(Const.SESSION_userpds);
		String USERNAME = "";
		if (pduser != null) {
			USERNAME = pduser.getString("NAME");// 申请人，取用户姓名
		}
		pd.put("RESPONSIBLE", USERNAME);
		// 存附件
		pds.put("PROCESS_ALL_ID", PROCESS_THREE_ID);
		pds.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pds.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pds);
		process_threeService.save(pd);

		// 修改问题中的状态
		pdp.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		pdp.put("PROCESSTATE", 3);
		client_problem_collectionService.edit(pdp);
		map.put("mesage", "保存成功");
		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, "删除Process_three");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			process_threeService.delete(pd);
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/edit")
	@ResponseBody
	public Map<String, String> edit() throws Exception {
		logBefore(logger, "修改Process_three");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		PageData pds = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		pd = this.getPageData();
		// 存附件
		pds.put("PROCESS_ALL_ID", pd.getString("PROCESS_THREE_ID"));
		pds.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pds.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pds);
		process_threeService.edit(pd);
		map.put("mesage", "修改成功");
		return map;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, "列表Process_three");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> varList = process_threeService.list(page); // 列出Process_three列表
			mv.setViewName("system/process_three/process_three_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		logBefore(logger, "去新增Process_three页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/process_three/process_three_edit");
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
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		logBefore(logger, "去修改Process_three页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = process_threeService.findById(pd); // 根据ID读取
			mv.setViewName("system/process_three/process_three_edit");
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
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, "批量删除Process_three");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "dell")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if (null != DATA_IDS && !"".equals(DATA_IDS)) {
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				process_threeService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			} else {
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
	 * 
	 * @return
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, "导出Process_three到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("事件id"); // 1
			titles.add("公司id"); // 2
			titles.add("创建时间"); // 3
			titles.add("修改时间"); // 4
			titles.add("失效时间"); // 5
			titles.add("操作人"); // 6
			titles.add("初步判定原因"); // 7
			titles.add("临时措施"); // 8
			titles.add("执行时间"); // 9
			titles.add("有效率"); // 10
			titles.add("验证"); // 11
			titles.add("责任人"); // 12
			titles.add("执行人"); // 13
			dataMap.put("titles", titles);
			List<PageData> varOList = process_threeService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1",
						varOList.get(i).getString(
								"CLIENT_PROBLEM_COLLECTION_ID")); // 1
				vpd.put("var2", varOList.get(i).getString("COMPANY_ID")); // 2
				vpd.put("var3", varOList.get(i).getString("CREATETIME")); // 3
				vpd.put("var4", varOList.get(i).getString("UPDATETIME")); // 4
				vpd.put("var5", varOList.get(i).getString("VALIDITY")); // 5
				vpd.put("var6", varOList.get(i).getString("USER_ID")); // 6
				vpd.put("var7", varOList.get(i).getString("ESTIMATED")); // 7
				vpd.put("var8", varOList.get(i).getString("TEMPORARY")); // 8
				vpd.put("var9", varOList.get(i).getString("EXECUTION_TIME")); // 9
				vpd.put("var10", varOList.get(i).getString("EFFICIENT")); // 10
				vpd.put("var11", varOList.get(i).getString("VALIDATION")); // 11
				vpd.put("var12", varOList.get(i).getString("RESPONSIBILITY")); // 12
				vpd.put("var13", varOList.get(i).getString("RESPONSIBLE")); // 13
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, dataMap);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/* ===============================权限================================== */
	public Map<String, String> getHC() {
		Subject currentUser = SecurityUtils.getSubject(); // shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>) session.getAttribute(Const.SESSION_QX);
	}

	/* ===============================权限================================== */

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}
}
