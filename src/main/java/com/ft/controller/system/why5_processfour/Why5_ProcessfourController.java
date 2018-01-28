package com.ft.controller.system.why5_processfour;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.entity.system.User;
import com.ft.util.AppUtil;
import com.ft.util.DateUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.why5_processfour.Why5_ProcessfourService;

/**
 * 类名称：Why5_ProcessfourController 创建人：lichao 创建时间：2018-01-12
 */
@Controller
@RequestMapping(value = "/why5_processfour")
public class Why5_ProcessfourController extends BaseController {

	String menuUrl = "why5_processfour/list.do"; // 菜单地址(权限用)
	@Resource(name = "why5_processfourService")
	private Why5_ProcessfourService why5_processfourService;

	/**
	 * 新增
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, "新增Why5_Processfour");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("WHY5_PROCESSFOUR_ID", this.get32UUID()); // 主键
		why5_processfourService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, "删除Why5_Processfour");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			why5_processfourService.delete(pd);
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
		logBefore(logger, "修改Why5_Processfour");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		why5_processfourService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, "列表Why5_Processfour");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> varList = why5_processfourService.list(page); // 列出Why5_Processfour列表
			mv.setViewName("system/why5_processfour/why5_processfour_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/*
	 * 去新增和添加界面
	 */

	@RequestMapping(value = "/goaddAndEdit")
	public ModelAndView goaddAndEdit(Page page) {
		logBefore(logger, "新增5why");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		//存放问题对应所有why
		List<PageData> pds = new ArrayList<PageData>();
		//存放所有类型对应文字
		Map<Integer,Object> map = new HashMap<Integer,Object>();
		try {
			pd = this.getPageData();
			for (int i = 1; i < 4; i++) {
				PageData pdd = new PageData();
				if (i == 1) {
					pdd.put("DINGTITLE", "失效模式（产生原因）：焊点虚焊");
				} else if (i == 2) {
					pdd.put("DINGTITLE", "失效模式（流出原因）：为何不良品没有被检出?");
				} else if (i ==3) {
					pdd.put("DINGTITLE", "针对预防措施的系统原因：系统上为何让不良品出现?");
				}
				map.put(i, pdd);
			}
			//如果是下面的两个问题则不传数据
			if(pd.getString("5WHYTYPE")!=null&&pd.getString("5WHYTYPE").equals("1")){
				mv.setViewName("system/why5_processfour/why5_processfour_edit");
				pd.put("STATE", 0);
				mv.addObject("pd",pd);
				return mv;
			}
			//如果是根据问题id查出所有why
			if (pd.getString("CLIENT_PROBLEM_COLLECTION_ID") != null&& !"".equals(pd.getString("CLIENT_PROBLEM_COLLECTION_ID"))) {
				pds = why5_processfourService.findByProblemId(pd);
					if(null == pds||pds.size()==0){
						pd.put("STATE", 0);
					}else {
						pd.put("STATE", 1);
					}
				} 
			mv.setViewName("system/why5_processfour/why5_processfour_edit");
			mv.addObject("pd", pd);
			mv.addObject("pds", pds);
			mv.addObject("map", map);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 5why增加+修改
	 */
	@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, String> addAndEdit(@RequestParam String[] type1,
			@RequestParam String[] type2, @RequestParam String[] type3)
			throws Exception {
		logBefore(logger, "5why保存/新增");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> pds = new ArrayList<PageData>();
		
		// 如果id不为
		if (null != pd.getString("CLIENT_PROBLEM_COLLECTION_ID")
				&& !"".equals(pd.getString("CLIENT_PROBLEM_COLLECTION_ID"))) {
			pds = why5_processfourService.findByProblemId(pd);
			List<String> list1 = new ArrayList<String>();
			//将数组存进list
			for (String string : type1) {
				list1.add(string);
			}
			
			List<String> list2 = new ArrayList<String>();
			for (String string : type2) {
				list2.add(string);
			}
			
			List<String> list3 = new ArrayList<String>();
			for (String string : type3) {
				list3.add(string);
			}
			
			pd.put("list1", list1);
			pd.put("list2", list2);
			pd.put("list3", list3);
			
			// TODO  先删除再增加
			why5_processfourService.edit(pd);
			map.put("mesage", "修改成功");
			map.put("status", "1");
			map.put("CLIENT_PROBLEM_COLLECTION_ID",
			pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));

		}

		return map;
	}

	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		logBefore(logger, "去新增Why5_Processfour页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/why5_processfour/why5_processfour_edit");
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
		logBefore(logger, "去修改Why5_Processfour页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = why5_processfourService.findById(pd); // 根据ID读取
			mv.setViewName("system/why5_processfour/why5_processfour_edit");
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
		logBefore(logger, "批量删除Why5_Processfour");
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
				why5_processfourService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, "导出Why5_Processfour到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("问题id"); // 1
			titles.add("原因类型"); // 2
			titles.add("为何内容"); // 3
			titles.add("创建时间"); // 4
			titles.add("更新时间"); // 5
			dataMap.put("titles", titles);
			List<PageData> varOList = why5_processfourService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++) {
				PageData vpd = new PageData();
				vpd.put("var1",
						varOList.get(i).getString(
								"CLIENT_PROBLEM_COLLECTION_ID")); // 1
				vpd.put("var2", varOList.get(i).get("TYPE").toString()); // 2
				vpd.put("var3", varOList.get(i).getString("WHY")); // 3
				vpd.put("var4", varOList.get(i).getString("CREATETIME")); // 4
				vpd.put("var5", varOList.get(i).getString("UPDATETIME")); // 5
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
