package com.ft.controller.system.question_feedback;

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

import net.sf.json.JSONArray;

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

import com.alibaba.fastjson.JSONObject;
import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.clientmanagement.ClientManagementService;
import com.ft.service.system.complainmold.ComplainmoldService;
import com.ft.service.system.equipmentdetail.EquipmentDetailService;
import com.ft.service.system.failuremode_management.Failuremode_managementService;
import com.ft.service.system.imperfection_entry.Imperfection_entryService;
import com.ft.service.system.proceduremanagement.ProcedureManagementService;
import com.ft.service.system.productmangement.ProductMangementService;
import com.ft.service.system.question_feedback.Question_feedbackService;
import com.ft.util.AppUtil;
import com.ft.util.Const;
import com.ft.util.Jurisdiction;
import com.ft.util.ObjectExcelView;
import com.ft.util.PageData;

import sun.security.krb5.internal.PAData;

/**
 * 类名称：Imperfection_entryController 创建人：lichao 创建时间：2017-12-13 缺陷录入
 */
@Controller
@RequestMapping(value = "/question_feedback")
public class Question_feedbackController extends BaseController {

	String menuUrl = "question_feedback/list.do"; // 菜单地址(权限用)
	@Resource(name = "question_feedbackService")
	private Question_feedbackService question_feedbackService;

	@Resource(name = "imperfection_entryService")
	private Imperfection_entryService imperfection_entryService;
	// 产品
	@Resource(name = "productmangementService")
	private ProductMangementService productmangementService;
	// 抱怨分类
	@Resource(name = "complainmoldService")
	private ComplainmoldService complainmoldService;
	// 设备
	@Resource(name = "equipmentdetailService")
	private EquipmentDetailService equipmentdetailService;
	// 工序
	@Resource(name = "proceduremanagementService")
	private ProcedureManagementService proceduremanagementService;
	// 失效模式
	@Resource(name = "failuremode_managementService")
	private Failuremode_managementService failuremode_managementService;
	// 客户
	@Resource(name = "clientmanagementService")
	private ClientManagementService clientmanagementService;
	// 客户问题搜集
	@Resource(name = "client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;

	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/goaddAndEdit")
	public ModelAndView goaddAndEdit(Page page) {
		logBefore(logger, "去新增question_feedback");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();// 存id
		PageData pds = new PageData();
		PageData pdproblem = new PageData();
		try {
			pd = this.getPageData();
			pdproblem = client_problem_collectionService.findById(pd);// 客户问题收集
			// 通过问题id获取一条数据
			pds = question_feedbackService.findByCliId(pd);
			if (null != pds) {
				// 判断存的总数据不为空
				if (null != pds.getString("REPLY_TIME")&& !"".equals(pds.getString("REPLY_TIME"))) {
					String str = pds.getString("REPLY_TIME");
					JSONObject jsonObject = JSONObject.parseObject(str);
					List<PageData> _list = new ArrayList<PageData>();
					for (int i = 0; i < jsonObject.size(); i++) {
						System.out.println(jsonObject.get(String.valueOf(i)));
						JSONArray jsonArray = JSONArray.fromObject(jsonObject.get(String.valueOf(i)).toString());
						PageData _pdd = new PageData();
						Map<String, Object> _mapa = new LinkedHashMap<String, Object>();
						Map<String, Object> _mapb = new LinkedHashMap<String, Object>();
						for (int j = 0; j < jsonArray.size(); j++) {
							JSONObject jsonObjects = JSONObject.parseObject(jsonArray.getJSONObject(j).toString());
							String name = jsonObjects.getString("name");
							String value = jsonObjects.getString("value");
							//处理附件装map
							if ("ATTACHMENTNAME_PROGRAM".equals(name.trim())) {
								if (!"".equals(value)) {
									String[] array = value.split(";;");
									for (String strs : array) {
										String realName = strs.substring(0,strs.indexOf("::"));
										String serverName = strs.substring(strs.indexOf("::") + 2,strs.length());
										_mapa.put(serverName, realName);
									}
								}
								_pdd.put("ATMAP", _mapa);
							} else if ("ATTACHMENTNAME_CUSTOMER".equals(name
									.trim())) {
								if (!"".equals(value)) {
									String[] array = value.split(";;");
									for (String strs : array) {
										String realName = strs.substring(0,strs.indexOf("::"));
										String serverName = strs.substring(strs.indexOf("::") + 2,strs.length());
										_mapb.put(serverName, realName);
									}
								}

								_pdd.put("ATMA", _mapb);
							} else {
								_pdd.put(name, value);
							}
							System.out.println(jsonObjects.get("name") + ":"+ jsonObjects.get("value"));
						}
						_list.add(_pdd);
					}
					System.out.println(_list);
					mv.addObject("varList", _list);
				}
			}

			mv.setViewName("system/question_feedback/question_feedback_edit");
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
			mv.addObject("pdproblem", pdproblem);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 *  增加+修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit() throws Exception {
		logBefore(logger, "投诉记录表保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("QUESTION_FEEDBACK_ID") && !"".equals(pd.getString("QUESTION_FEEDBACK_ID"))) {
			question_feedbackService.edit(pd);
			map.put("mesage", "修改成功");
			map.put("status", "1");
		} else {
			String QUESTION_FEEDBACK_ID = this.get32UUID().toString();
			pd.put("QUESTION_FEEDBACK_ID", QUESTION_FEEDBACK_ID);
			question_feedbackService.save(pd);
			map.put("mesage", "保存成功");
			map.put("status", "2");
		}
		map.put("QUESTION_FEEDBACK_ID", pd.getString("QUESTION_FEEDBACK_ID"));
		return map;
	}
	
	
	
	
	
	
	
	
	/*@RequestMapping(value = "/goaddAndEdit")
	public ModelAndView goaddAndEdit(Page page) {
		logBefore(logger, "去新增question_feedback");
		ModelAndView mv = this.getModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		Map<String, Object> map1 = new LinkedHashMap<String, Object>();

		PageData pd = new PageData();//存id
		List<PageData > pds= new ArrayList<PageData>();//存每条回复
		PageData pdproblem = new PageData();
		try {
			pd = this.getPageData();
			if(question_feedbackService.findByProblemId(pd)!=null){
				if(question_feedbackService.findByProblemId(pd).size()>1){
					pds = question_feedbackService.findByProblemId(pd);//查询问题id对应的所有回复
					pd.put("TIMES", new Integer(2).toString());//回复次数
					pd.put("CLOSED_TIME", pds.get(0).get("CLOSED_TIME"));
				}
				else if(question_feedbackService.findByProblemId(pd).size()>0){
					pds.add(question_feedbackService.findByProblemId(pd).get(0));
					pds.add(new PageData());
					pd.put("TIMES", new Integer(1).toString());//回复次数
					pd.put("CLOSED_TIME", pds.get(0).get("CLOSED_TIME"));
				}
				else if(question_feedbackService.findByProblemId(pd).size()==0){
					pds.add(new PageData());
					pds.add(new PageData());
					pd.put("TIMES", new Integer(0).toString());//回复次数
				}
				
			}
			else{
				pds.add(new PageData());
				pds.add(new PageData());
				pd.put("TIMES", new Integer(0).toString());//回复次数
			}
			pdproblem=client_problem_collectionService.findById(pd);//客户问题收集
			if(pds!=null&&pds.size()>0){
				pds = question_feedbackService.PutLeftTime(pds,pdproblem);
			}
			mv.setViewName("system/question_feedback/question_feedback_edit");
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
			mv.addObject("pdproblem",pdproblem);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}*/

	
	/**
	 * 新增
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, "新增Question_feedback");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTION_FEEDBACK_ID", this.get32UUID()); // 主键
		question_feedbackService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, "删除Question_feedback");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			question_feedbackService.delete(pd);
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
	public ModelAndView edit() throws Exception {
		logBefore(logger, "修改Question_feedback");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		question_feedbackService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}



	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		logBefore(logger, "去新增Question_feedback页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/question_feedback/question_feedback_edit");
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
		logBefore(logger, "去修改Question_feedback页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = question_feedbackService.findById(pd); // 根据ID读取
			mv.setViewName("system/question_feedback/question_feedback_edit");
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
		logBefore(logger, "批量删除Question_feedback");
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
				question_feedbackService.deleteAll(ArrayDATA_IDS);
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

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, "列表question_feedback");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			List<PageData> clientList = clientmanagementService.listAllFactory(pd);// 客户
			List<PageData> sourceList = client_problem_collectionService.listAllSource(pd);
			List<PageData> userList = client_problem_collectionService.listAllUser(pd);// 用列表（接收者）
			pd = this.getPageData();
			page.setPd(pd);
			page.setShowCount(8);
			int pages = 0;
			if (null != pd.get("pages")&& !"undefined".equals(pd.get("pages").toString())&& !"".equals(pd.get("pages").toString())) {
				pages = Integer.parseInt(pd.get("pages").toString());// 当前页
			}
			page.setCurrentPage(pages + 1);

			List<PageData> varListF = client_problem_collectionService.question_feedbackList(page); // 查询出客户问题清单
			int tolpage = page.getTotalPage();
			int replytime = 0;
			String lastClientID = null;
			List<PageData> feedbackList = new ArrayList<PageData>();
			List<PageData> varList = new ArrayList<PageData>();
			for (PageData pdtmp : varListF) {
				if (question_feedbackService.findByProblemId(pdtmp) != null) {
					feedbackList = question_feedbackService.findByProblemId(pd);
				}
				pdtmp.put("TIMES", new Integer(feedbackList.size()).toString());// 回复次数
				feedbackList.clear();
				varList.add(pdtmp);
			}
			mv.setViewName("system/question_feedback/questlist");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject("clientList", clientList);
			mv.addObject("userList", userList);
			mv.addObject("tolpage", tolpage);
			mv.addObject("pages", pages);
			mv.addObject("sourceanduserList", sourceList);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/*
	 * 导出到excel
	 * 
	 * @return
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, "导出Question_feedback到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("跟踪号"); // 1
			titles.add("发生日期"); // 2
			titles.add("确认时间"); // 3
			titles.add("客户名称"); // 4
			titles.add("客户部门"); // 5
			titles.add("投诉人"); // 6
			titles.add("接收者"); // 7
			titles.add("责任职能工程师"); // 8
			titles.add("第一次回复时间"); // 9
			titles.add("第一次回复方案"); // 10
			titles.add("客户回复"); // 11
			titles.add("回复方案附件"); // 12
			titles.add("客户回复附件"); // 13
			titles.add("客户问题采集id"); // 14
			dataMap.put("titles", titles);
			List<PageData> varOList = question_feedbackService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("TRACKINGNUMBER")); // 1
				vpd.put("var2", varOList.get(i).getString("OCCURRENCEDATE")); // 2
				vpd.put("var3", varOList.get(i).getString("CONFIME_TIME")); // 3
				vpd.put("var4", varOList.get(i).getString("CLIENTSNAME")); // 4
				vpd.put("var5", varOList.get(i).getString("CLIENTSDEPARTMENT")); // 5
				vpd.put("var6", varOList.get(i).getString("COMPLAINANT")); // 6
				vpd.put("var7", varOList.get(i).getString("RECIPIENT")); // 7
				vpd.put("var8", varOList.get(i).getString("RESPONSIBILITYENGINEERS")); // 8
				vpd.put("var9", varOList.get(i).getString("FIRST_REPLY_TIME")); // 9
				vpd.put("var10", varOList.get(i).getString("FIRST_REPLY_PROGRAM")); // 10
				vpd.put("var11", varOList.get(i).getString("CUSTOMER_REPLY")); // 11
				vpd.put("var12", varOList.get(i).getString("ATTACHMENTNAME_PROGRAM")); // 12
				vpd.put("var13", varOList.get(i).getString("ATTACHMENTNAME_CUSTOMER")); // 13
				vpd.put("var14", varOList.get(i).getString("CLIENT_PROBLEM_COLLECTION_ID")); // 14
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
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
}
