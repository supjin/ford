package com.ft.controller.system.process_six;

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
import com.ft.service.system.attachment.AttachmentService;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.company.CompanyService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.measures_message.Measures_messageService;
import com.ft.service.system.measures_message_do.Measures_message_doService;
import com.ft.service.system.measuresd5.MeasuresD5Service;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_six.Process_sixService;
import com.ft.service.system.user.UserService;
import com.ft.util.AppUtil;
import com.ft.util.Const;
import com.ft.util.DateUtil;
import com.ft.util.Jurisdiction;
import com.ft.util.ObjectExcelView;
import com.ft.util.PageData;

/**
 * 类名称：Process_sixController 创建人：lichao 创建时间：2017-11-07
 */
@Controller
@RequestMapping(value = "/process_six")
public class Process_sixController extends BaseController {

	String menuUrl = "process_six/list.do"; // 菜单地址(权限用)
	@Resource(name = "process_sixService")
	private Process_sixService process_sixService;
	@Resource(name = "measures_message_doService")
	private Measures_message_doService measures_message_doService;

	@Resource(name = "userService")
	private UserService userService;
	// 问题
	@Resource(name = "client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	// 附件
	@Resource(name = "attachmentService")
	private AttachmentService attachmentService;
	// dic
	@Resource(name = "dictService")
	private DictService dictService;
	
	@Resource(name="measuresd5Service")
	private MeasuresD5Service measuresd5Service;
	@Resource(name = "planService")
	private PlanService planService;

	/**
	 * 页面出后使用系统 去D6页面
	 */
	@RequestMapping(value = "/goProcess")
	public ModelAndView goProcess() throws Exception {
		logBefore(logger, "去D6页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		pd = this.getPageData();
		try {
			
			// d6的数据
			pds = process_sixService.findByPromId(pd);
			// D5措施选择
			List<PageData> list = measures_message_doService.listAll(pd);
			//处理D5措施的附件
			List<PageData> varList = client_problem_collectionService.getAttachMap(list);
			//所有公司用户
			//List<PageData> userList= userService.listAllUser(pd);
			// 查问题 获取问题id 以及标题头部
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "06");
			mv =planService.getHead(pd);
			//mv.addObject("userList", userList);
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
			mv.setViewName("system/process_six/process_six_acta");
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
		if (null != pd.getString("MEASURES_MESSAGE_DO_ID")) {
			measures_message_doService.edit(pd);
			map.put("mesage", "保存成功");
		}else{
			map.put("mesage", "修改失败");

		}
			
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
		if (null != pd.getString("PROCESS_SIX_ID") && !"".equals(pd.getString("PROCESS_SIX_ID"))) {
			process_sixService.edit(pd);
		} else {
			String PROCESS_SIX_ID = this.get32UUID().toString();
			pd.put("PROCESS_SIX_ID", PROCESS_SIX_ID);
			process_sixService.save(pd);
		}
		pd.put("STEP", "06");
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
		map.put("PROCESS_SIX_ID", pd.getString("PROCESS_SIX_ID"));
		return map;
	}
	/**
	 * 新增
	 */
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, String> save() throws Exception {
		logBefore(logger, "新增Process_six");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		PageData pdp = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		String PROCESS_SIX_ID = this.get32UUID().toString();
		pd.put("PROCESS_SIX_ID", PROCESS_SIX_ID); // 主键
		Map<String, String> map = new HashMap<String, String>();

		// 存附件
		pds.put("PROCESS_ALL_ID", PROCESS_SIX_ID);
		pds.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pds.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pds);

		process_sixService.save(pd);

		// 修改问题中的状态
		pdp.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		pdp.put("PROCESSTATE", 6);
		client_problem_collectionService.edit(pdp);
		map.put("mesage", "保存成功");
		return map;
	}

	/**
	 * 去D6页面
	 */
	@RequestMapping(value = "/goProcessSix")
	public ModelAndView goProcessThree() throws Exception {
		logBefore(logger, "去D6页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		try {
			pd = this.getPageData();
			pdd.put("TYPE", "processType");
			List<PageData> biaoList = dictService.selectByTypeAll(pdd);// 导航
			pds = process_sixService.findByPromId(pd);// d0的数据
			// D0已经有数据（查看/修改）
			if (null != pds) {
				pd.put("PROCESSID", pds.getString("PROCESS_SIX_ID"));
				List<PageData> attList = attachmentService.listAll(pd);// 附件
				mv.addObject("attList", attList);
				mv.addObject("STATE", 1);
			}

			List<PageData> varList = measures_message_doService.listAll(pd);// 措施
			// 查问题
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "06");
			/*PageData handle = planService.checkUserIsHandle(pd);
			mv.addObject("handle", handle);*/
			mv.addObject("varList", varList);
			mv.addObject("biaoList", biaoList);
			mv.setViewName("system/process_six/process_six");
			mv.addObject("msg", "processThreeSave");
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) {
		logBefore(logger, "删除Process_six");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			process_sixService.delete(pd);
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
		logBefore(logger, "修改Process_six");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		PageData pda = new PageData();
		pd = this.getPageData();

		// 保存附件
		String PROCESS_ZERO_ID = pd.getString("PROCESS_SIX_ID");
		pda.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pda.put("PROCESS_ALL_ID", PROCESS_ZERO_ID);
		pda.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pda);

		process_sixService.edit(pd);

		map.put("mesage", "修改成功");
		return map;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) {
		logBefore(logger, "列表Process_six");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> varList = process_sixService.list(page); // 列出Process_six列表
			mv.setViewName("system/process_six/process_six_list");
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
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		logBefore(logger, "去新增Process_six页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/process_six/process_six_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去修改页面
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		logBefore(logger, "去修改Process_six页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = process_sixService.findById(pd); // 根据ID读取
			mv.setViewName("system/process_six/process_six_edit");
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
	public Object deleteAll() {
		logBefore(logger, "批量删除Process_six");
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
				process_sixService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Process_six到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("公司id"); // 1
			titles.add("问题id"); // 2
			titles.add("d6责任人"); // 3
			titles.add("执行人"); // 4
			titles.add("d7责任人"); // 5
			titles.add("失效时间"); // 6
			titles.add("执行时间"); // 7
			titles.add("措施id"); // 8
			titles.add("永久措施执行"); // 9
			titles.add("证实"); // 10
			titles.add("预留字段1"); // 11
			titles.add("预留字段2"); // 12
			dataMap.put("titles", titles);
			List<PageData> varOList = process_sixService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("COMPANY_ID")); // 1
				vpd.put("var2",
						varOList.get(i).getString(
								"CLIENT_PROBLEM_COLLECTION_ID")); // 2
				vpd.put("var3", varOList.get(i).getString("PRINCIPALNAME")); // 3
				vpd.put("var4", varOList.get(i).getString("EXECUTIVENAME")); // 4
				vpd.put("var5",
						varOList.get(i).getString("PRINCIPALD_FIVESNAME")); // 5
				vpd.put("var6", varOList.get(i).getString("VALIDITY")); // 6
				vpd.put("var7", varOList.get(i).getString("EXECUTIONDATE")); // 7
				vpd.put("var8", varOList.get(i).getString("CUOSHIID")); // 8
				vpd.put("var9", varOList.get(i).getString("MEASUREIMPL")); // 9
				vpd.put("var10", varOList.get(i).getString("COMGIRMED")); // 10
				vpd.put("var11", varOList.get(i).getString("CCODE")); // 11
				vpd.put("var12", varOList.get(i).getString("DCODE")); // 12
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
