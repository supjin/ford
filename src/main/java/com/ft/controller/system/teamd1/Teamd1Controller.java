package com.ft.controller.system.teamd1;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.util.AppUtil;
import com.ft.util.JsonUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.company.CompanyService;
import com.ft.service.system.department.DepartmentService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.teamd1.Teamd1Service;
import com.ft.service.system.user.UserService;

/** 
 * 类名称：Teamd1Controller
 * 创建人：lichao 
 * 创建时间：2017-11-14
 */
@Controller
@RequestMapping(value="/teamd1")
public class Teamd1Controller extends BaseController {
	
	String menuUrl = "teamd1/list.do"; //菜单地址(权限用)
	@Resource(name="teamd1Service")
	private Teamd1Service teamd1Service;
	
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
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Teamd1");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TEAMD1_ID", this.get32UUID());	//主键
		
		String PLAN_ID= pd.get("STEPS").toString();
		
		if(PLAN_ID.equals("1")){
			
			pd.put("PLAN_ID", "团队领导");
		}else if(PLAN_ID.equals("2")){
			
			pd.put("PLAN_ID", "团队成员");
		}
		teamd1Service.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete2")
	public void delete2(PrintWriter out) throws Exception{
		logBefore(logger, "删除Teamd1");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			teamd1Service.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Map<String, Object> delete() throws Exception{
		logBefore(logger, "删除Teamd1");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd=this.getPageData();
		try
		{
			//通过用户id查询是否 已添加负责人
			List<PageData> userlist= planService.listAllIsUser(pd);
			if(userlist!=null && userlist.size()>0){
				map.put("message", "3");
				return map;
			}
			
			
			teamd1Service.delete(pd);
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
	@RequestMapping(value="/edit2")
	
	public ModelAndView edit2() throws Exception{
		logBefore(logger, "修改Teamd1");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		teamd1Service.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="/edit")
	@ResponseBody
	public Map<String, Object> edit() throws Exception{
		logBefore(logger, "修改Teamd1");
		
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try
		{
			teamd1Service.edit(pd);
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
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, "列表Teamd1");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = teamd1Service.listAll(pd);
			mv.setViewName("system/teamd1/teamd1_list");
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
		logBefore(logger, "去新增Teamd1页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			//根据用户id 获取数据(部门职位)
			pd.put("USER_ID","06cf126f44b04c20a4a3e1563cf82ba9");
			PageData userfind= userService.listByuser(pd);
			//所有公司用户
			List<PageData> userall= userService.listAllUser(pd);
			//当前用户公司部门
			List<PageData> deptList=departmentService.listAllByCOMPANY_ID(pd);
			
			mv.addObject("userfind", userfind);
			mv.addObject("userall", userall);
			mv.setViewName("system/teamd1/teamd1_edit");
			mv.addObject("msg", "save");
			mv.addObject("deptList", deptList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 根据用户id查询用户部门职位
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ajaxuserinfo")
	@ResponseBody
	public Map<String, Object> ajaxuserinfo () throws Exception{		
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		//根据用户id 获取数据(部门职位)
		PageData userfind= userService.listByuser(pd);
		map.put("userfind", userfind);
		map.put("message", "1");
		
		return map;
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
