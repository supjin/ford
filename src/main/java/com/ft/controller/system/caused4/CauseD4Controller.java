package com.ft.controller.system.caused4;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.util.AppUtil;
import com.ft.util.ObjectExcelView;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.Tools;
import com.ft.util.Jurisdiction;
import com.ft.service.system.caused4.CauseD4Service;
import com.ft.service.system.process_four.Process_fourService;

/** 
 * 类名称：CauseD4Controller
 * 创建人：lichao 
 * 创建时间：2017-11-13
 */
@Controller
@RequestMapping(value="/caused4")
public class CauseD4Controller extends BaseController {
	
	String menuUrl = "caused4/list.do"; //菜单地址(权限用)
	@Resource(name="caused4Service")
	private CauseD4Service caused4Service;
	
	@Resource(name="process_fourService")
	private Process_fourService process_fourService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增CauseD4");
		/*if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
*/		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CAUSED4_ID", this.get32UUID());	//主键
		caused4Service.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	//D4选择添加修改
		@RequestMapping(value = "/updated")
		@ResponseBody
		public Map<String, String> symptom() throws Exception {
			logBefore(logger, "D0症状保存/新增");
			Map<String, String> map = new HashMap<String, String>();
			PageData pd = new PageData();
			pd = this.getPageData();
			// 如果id不为空就修改
			try
			{
				if (null != pd.getString("CAUSED4_ID") && pd.getString("CAUSED4_ID").length()>0) {
					caused4Service.edit(pd);
				} else {
   					String CAUSED4_ID=this.get32UUID();
   					pd.put("CAUSED4_ID", CAUSED4_ID);
					caused4Service.save(pd);
					
					
					
					//事件状态修改
					/*pd.put("PROCESSTATE", 5);
					client_problem_collectionService.edit(pd);*/
					
					//D5 步骤保存
					
					//d5 查询   回显判断
					PageData  sj=process_fourService.findByD4Id(pd);
					//回显判断
					if(sj!=null && sj.size()>0){
						process_fourService.edit(sj);
						
					}else{
						pd.put("PROCESS_FOUR_ID", this.get32UUID());
						process_fourService.save(pd);
					}
				}
				map.put("message", "1");
				
			} catch (Exception e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
				map.put("message", "0");
			}
			map.put("CAUSED4_ID", pd.getString("CAUSED4_ID"));
			
			return map;
		}
		

		/**
		 * 原因删除
		 */
		@RequestMapping(value="/delet")
		@ResponseBody
		public Object delete() throws Exception {
			Map<String, String> map = new HashMap<String, String>();
			PageData pd = new PageData();
			pd = this.getPageData();
					try
					{   //d4删除
						caused4Service.delete(pd);
						
						map.put("message", "1");
						
					} catch (Exception e)
					{
						map.put("message", "0");
						
						e.printStackTrace();
					}
					
			return map;
		}
		
	
}
