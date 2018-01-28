package com.ft.controller.system.dprocess;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.service.system.attachment.AttachmentService;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.company.CompanyService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.investigate_fujia_table.Investigate_fujia_tableService;
import com.ft.service.system.investigate_table.Investigate_tableService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.process_zero.Process_zeroService;
import com.ft.service.system.user.UserService;
import com.ft.service.system.zeroemergency.ZeroemergencyService;
import com.ft.util.DateUtil;
import com.ft.util.PageData;
import com.ft.util.Tools;

/**
 * D8处理流程
 * 
 * @author Ala
 *
 */
@Controller
@RequestMapping(value = "dProcess")
public class DprocessController extends BaseController {
	// 问题
	@Resource(name = "client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	@Resource(name = "userService")
	private UserService userService;
	// D0
	@Resource(name = "process_zeroService")
	private Process_zeroService process_zeroService;
	@Resource(name = "dictService")
	private DictService dictService;
	// 附件
	@Resource(name = "attachmentService")
	private AttachmentService attachmentService;
	// 部门
	@Resource(name = "departmentService")
	private DepartmentService departmentService;
	// 公司
	@Resource(name = "companyService")
	private CompanyService companyService;
	@Resource(name = "planService")
	private PlanService planService;
	@Resource(name = "zeroemergencyService")
	private ZeroemergencyService zeroemergencyService;
	//排查表上部分
	@Resource(name="investigate_tableService")
	private Investigate_tableService investigate_tableService;
	//下部分
	@Resource(name="investigate_fujia_tableService")
	private Investigate_fujia_tableService investigate_fujia_tableService;
	
	/**
	 * D0应急反应 页面出后使用系统 去D0页面
	 */
	@RequestMapping(value = "/goProcess")
	public ModelAndView goProcess() throws Exception {
		logBefore(logger, "去D0页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdd = new PageData();
		pd = this.getPageData();
		try {
			//有效率
			pdd.put("TYPE", "efectentType");
			List<PageData> biaoList = dictService.selectByTypeAll(pdd);
			// d0的数据包含症状反应
			pds = process_zeroService.findByProblemId(pd);
			// 应急反应
			pd.put("SELECTSTATE", 0);
			List<PageData> list = zeroemergencyService.listAll(pd);
			// 处理应急反应的附件
			List<PageData> varList = client_problem_collectionService.getAttachMap(list);
			// 公司所有用户
			List<PageData> deptList = departmentService.listAllByCOMPANY_ID(pd);// 公司部门
			// 选部门再选人
			List<PageData> userList = userService.listAllUser(pd);
			// 查问题 获取问题id 以及标题头部
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			pd.put("STEP", "00");
			mv = planService.getHead(pd);
			mv.setViewName("system/dprocess/dprocess_zera");
			mv.addObject("deptList", deptList);
			mv.addObject("varList", varList);
			mv.addObject("biaoList", biaoList);
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
		if (null != pd.getString("ZEROEMERGENCY_ID") && !"".equals(pd.getString("ZEROEMERGENCY_ID"))) {
			zeroemergencyService.edit(pd);
			map.put("mesage", "修改成功");
			map.put("ZEROEMERGENCY_ID", pd.getString("ZEROEMERGENCY_ID"));
		} else {
			String ZEROEMERGENCY_ID = this.get32UUID().toString();
			pd.put("ZEROEMERGENCY_ID", ZEROEMERGENCY_ID);
			zeroemergencyService.save(pd);
			pd.put("PROCESSTATE", 1);
			client_problem_collectionService.edit(pd);
			map.put("mesage", "保存成功");
			map.put("ZEROEMERGENCY_ID",ZEROEMERGENCY_ID);
		}
		return map;
	}

	/**
	 * D0症状描述 页面出后使用系统 增加+修改
	 */
	@RequestMapping(value = "/symptom")
	@ResponseBody
	public Map<String, String> symptom() throws Exception {
		logBefore(logger, "D0症状保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		if (null != pd.getString("PROCESS_ZERO_ID") && !"".equals(pd.getString("PROCESS_ZERO_ID"))) {
			process_zeroService.edit(pd);
		} else {
			String PROCESS_ZERO_ID = this.get32UUID().toString();
			pd.put("PROCESS_ZERO_ID", PROCESS_ZERO_ID);
			process_zeroService.save(pd);
			pd.put("PROCESSTATE", 1);
			client_problem_collectionService.edit(pd);
			pd.put("STEP", "00");
			PageData _plan = planService.queryAllByClientIdAndStep(pd);
			if(_plan.size()>0){
				if(Integer.parseInt(_plan.get("ISFINISH").toString()) == 0){
					pd.put("PLAN_ID", _plan.get("PLAN_ID"));
					pd.put("ISFINISH",1 );
					pd.put("FINISHTIME", DateUtil.getDay());
					planService.edit(pd);
				}
			}
		}
		map.put("mesage", "保存成功");
		map.put("PROCESS_ZERO_ID", pd.getString("PROCESS_ZERO_ID"));
		return map;
	}
	/**
	 * D0应急反应 页面出后使用系统 删除
	 */
	@RequestMapping(value = "/delet")
	@ResponseBody
	public Map<String, String> delet() throws Exception {
		logBefore(logger, "D0应急反应");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 如果id不为空就修改
		zeroemergencyService.delete(pd);
		map.put("mesage", "删除成功");
		return map;
	}

	/**
	 * 去D0页面
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/goDprocessZero")
	public ModelAndView goEdit() throws Exception {
		logBefore(logger, "去D0页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdu = new PageData();
		PageData pdd = new PageData();
		try {
			pd = this.getPageData();
			pdd.put("TYPE", "processType");
			List<PageData> biaoList = dictService.selectByTypeAll(pdd);// 导航
			pds = process_zeroService.findByProblemId(pd);// d0的数据
			List<PageData> arrList = zeroemergencyService.listAll(pd);// 应急反应
			// D0已经有数据（查看/修改）
			if (null != pds) {
				pd.put("PROCESSID", pds.getString("PROCESS_ZERO_ID"));
				List<PageData> attList = attachmentService.listAll(pd);// 附件
				mv.addObject("attList", attList);
				mv.addObject("STATE", 1);
			}
			// 查问题
			pd = client_problem_collectionService.findById(pd); // 根据ID读取
			// 判断此用户是否拥有操作权限
			pd.put("STEP", "00");
			PageData handle = planService.checkUserIsHandle(pd);
			mv.addObject("handle", handle);
			mv.addObject("biaoList", biaoList);
			mv.setViewName("system/dprocess/dprocess_zero");
			mv.addObject("msg", "dProcessZeroSave");
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
			mv.addObject("arrList", arrList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	
	/**
	 * 去排查表
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/goScreening")
	public ModelAndView goScreening() throws Exception {
		logBefore(logger, "去排查表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		//上部分
		pds = investigate_tableService.findByCliId(pd);
		//下部分
		Map<Object,Object> map = new LinkedHashMap<Object, Object>();
		List<PageData> tpListAll = investigate_fujia_tableService.tpListAll(pd);// 所有问题的排查数据
		for (int i = 1; i < 5; i++) {
			PageData pdd = new PageData();
			pdd.put("LARGETITLE", "");
			// 所有数据
			pdd.put("ISNOTDATE", "0");//是否有数据，默认没有
			pdd.put("ADDRESS", "");
			pdd.put("ISFIRST", 0);
			if (null != tpListAll) {
				for (PageData pageData : tpListAll) {
					int typ = Integer.parseInt(pageData.get("TYPE").toString());
					// 将Type分组，一个类型中插入大标题和一个地点
					if (typ == i) {
						String ADDRESS = pageData.getString("ADDRESS");
						if ("".equals(pdd.getString("ADDRESS"))) {
							pdd.put("ADDRESS", ADDRESS);
						} else if (pdd.getString("ISNOTDATE").equals("0")) {
							pdd.put("ISNOTDATE", "1");
						}
						if (Integer.parseInt(pdd.get("ISFIRST").toString()) == 0) {
							pdd.put("ISFIRST", 1);
							pageData.put("ISFIRST", 1);
						} else {
							pageData.put("ISFIRST", 0);
						}
					}
					
				}

			}
			if ("".equals(pdd.getString("LARGETITLE")) && i == 1) {
				pdd.put("LARGETITLE", "OEM厂内/In OEM");
			} else if ("".equals(pdd.getString("LARGETITLE")) && i == 2) {
				pdd.put("LARGETITLE", "OEM RDC库存/OEM RDC Warhouse");
			} else if ("".equals(pdd.getString("LARGETITLE")) && i == 3) {
				pdd.put("LARGETITLE",
						"客户处库存 Warehouse(including parts on the way包括所有在途零件)");
			} else if ("".equals(pdd.getString("LARGETITLE")) && i == 4) {
				pdd.put("LARGETITLE", "整车排查 Vehicle Inspection");
			}
			map.put(i, pdd);
		}
		
		for (PageData pageData : tpListAll) {
			System.out.println(pageData.get("ISFIRST").toString()+"====");
		}
		
		
		mv.setViewName("system/screening/screening_table");
		mv.addObject("pds", pds);
		mv.addObject("pd", pd);
		mv.addObject("tpListAll", tpListAll);
		mv.addObject("map", map);
		return mv;
	}
	
	/**
	 * D0排查表 页面出后使用系统 增加+修改 上部分 + 下部分
	 */
	@RequestMapping(value = "/screenAndEdit")
	@ResponseBody
	public Map<String, Object> screenAndEdit(
			@RequestParam(value = "TYPE") String[] TYPE, // 类型
			@RequestParam(value = "DATESHIF") String[] DATESHIF, // 日期
			@RequestParam(value = "INVESTIGATE_FUJIA_TABLE_ID") String[] INVESTIGATE_FUJIA_TABLE_ID, // id
			@RequestParam(value = "SHIF") String[] SHIF, // 班次
			@RequestParam(value = "INSPECTOR") String[] INSPECTOR, // 检查按钮
			@RequestParam(value = "CHECKNO") String[] CHECKNO, // 检查数量
			@RequestParam(value = "DEFECTNO") String[] DEFECTNO, // 缺陷数量
			@RequestParam(value = "ADDRESS") String[] ADDRESS // 地点
	) throws Exception {
		logBefore(logger, "D0排查表保存/新增");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		List<Object> idList = new ArrayList<Object>();
		// 排查表上部分
		// 如果id不为空就修改
		if (null != pd.getString("INVESTIGATE_TABLE_ID")&& !"".equals(pd.getString("INVESTIGATE_TABLE_ID"))) {
			investigate_tableService.edit(pd);
			map.put("mesage", "修改成功");
			map.put("INVESTIGATE_TABLE_ID",pd.getString("INVESTIGATE_TABLE_ID"));
		} else {
			String INVESTIGATE_TABLE_ID = this.get32UUID().toString();
			pd.put("INVESTIGATE_TABLE_ID", INVESTIGATE_TABLE_ID);
			investigate_tableService.save(pd);
			map.put("mesage", "保存成功");
			map.put("INVESTIGATE_TABLE_ID", INVESTIGATE_TABLE_ID);
		}
		// 返回ID
		// 排查表下
		for (int i = 0; i < TYPE.length; i++) {
			pds.put("TYPE", TYPE[i].trim());
			pds.put("DATESHIF", DATESHIF[i].trim());
			pds.put("SHIF", SHIF[i].trim());
			pds.put("INSPECTOR", INSPECTOR[i].trim());
			pds.put("CHECKNO", CHECKNO[i].trim());
			pds.put("DEFECTNO", DEFECTNO[i].trim());

			pds.put("ADDRESS", ADDRESS[Integer.parseInt(TYPE[i].trim())-1]);// 只有四个
			pds.put("CLIENT_PROBLEM_COLLECTION_ID",pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
			String ID_INVEN = INVESTIGATE_FUJIA_TABLE_ID[i].trim();
			// 新增
			if (ID_INVEN.length() == 0) {
				ID_INVEN = this.get32UUID().toString();
				pds.put("INVESTIGATE_FUJIA_TABLE_ID", ID_INVEN);
				investigate_fujia_tableService.save(pds);
			} else {
				pds.put("INVESTIGATE_FUJIA_TABLE_ID", ID_INVEN);
				investigate_fujia_tableService.edit(pds);
			}
			idList.add(ID_INVEN);
		}
		map.put("idList", idList);
		// 下部分

		return map;
	}
	
	
	
	/**
	 * 新增D0
	 */
	@RequestMapping(value = "/save")
	@ResponseBody
	public Map<String, String> save() throws Exception {
		logBefore(logger, "新增Process_zero");
		PageData pd = new PageData();
		PageData pds = new PageData();
		PageData pdp = new PageData();
		pd = this.getPageData();
		Map<String, String> map = new HashMap<String, String>();
		String PROCESS_ZERO_ID = this.get32UUID().toString();
		// 存附件
		pds.put("PROCESS_ALL_ID", PROCESS_ZERO_ID);
		pds.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pds.put("CLIENT_PROBLEM_COLLECTION_ID",pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pds);

		// 存D0
		pd.put("PROCESS_ZERO_ID", PROCESS_ZERO_ID); // 主键
		process_zeroService.save(pd);
		// 修改问题中的状态
		pdp.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		pdp.put("PROCESSTATE", 0);
		client_problem_collectionService.edit(pdp);
		map.put("mesage", "保存成功");
		return map;
	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/edit")
	@ResponseBody
	public Map<String, String> edit() throws Exception {
		logBefore(logger, "修改Process_zero");
		PageData pd = new PageData();
		PageData pda = new PageData();
		pd = this.getPageData();
		Map<String, String> map = new HashMap<String, String>();
		// 判断数据是否提交成功
		if (pd == null) {
			map.put("mesage", "数据提交有误");
			return map;
		}
		// 判断是否有D0的id
		if (null == pd.getString("PROCESS_ZERO_ID")) {
			map.put("mesage", "数据提交有误");
			return map;
		}
		// 保存附件
		String PROCESS_ZERO_ID = pd.getString("PROCESS_ZERO_ID");
		pda.put("ATTACHMENT_URL", pd.getString("ATTACHMENT_URL"));
		pda.put("PROCESS_ALL_ID", PROCESS_ZERO_ID);
		pda.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
		attachmentService.updatefile(pda);

		// 修改D0表
		process_zeroService.edit(pd);

		map.put("mesage", "修改成功");
		return map;
	}
	/**
	 * c查询计划表，返回用户权限，完成状态
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public ModelAndView getHead(PageData pd) throws Exception {
		ModelAndView mv = this.getModelAndView();
		// 判断此用户是否拥有操作权限
		pd.put("STEP", "00");
		PageData handle = planService.checkUserIsHandle(pd);
		//判断时间是否超期
		String time = DateUtil.getDay();
		Date times = Tools.str3Date(time);
		//当前日期的前一天
		String tim = DateUtil.getDayBefor();
		Date tims = Tools.str3Date(tim);
		// 查询完成状态

		List<PageData> planList = planService.listAllIsEvent(pd);
		if (null != planList && planList.size() > 0) {
			for (PageData pageData : planList) {
				pageData.put("USTEP", pageData.getString("STEP").substring(1));
				//时间判断
				if (null != pageData.get("PLANTIME")&& !"".equals(pageData.get("PLANTIME"))) {
					Date date = Tools.str2Date(pageData.get("PLANTIME").toString());
					if (times.after(date)&& Integer.parseInt(pageData.get("ISFINISH").toString()) == 0) {
						pageData.put("ISOUTIME", 1);
					}else if(!times.after(date)&& !tims.before(date) && Integer.parseInt(pageData.get("ISFINISH").toString()) == 0){
						pageData.put("ISOUTIME", 2);//即将超期
					}
				}
			}
		} else {
			mv.addObject("USTEP", pd.getString("STEP").substring(1));
		}
		// 菜单列表
		List<PageData> dicList = dictService.getList("processType");
		mv.addObject("USTEP", pd.getString("STEP").substring(1));
		mv.addObject("STEPS", "D"+(handle.getString("STEP").substring(1)));
		mv.addObject("dicList", dicList);
		mv.addObject("planList", planList);
		mv.addObject("handle", handle);

		return mv;
	}

}
