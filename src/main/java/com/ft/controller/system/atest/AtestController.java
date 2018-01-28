package com.ft.controller.system.atest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
/**
 * AnalysisController
 * @author Ala
 * 每日分析
 */
@Controller
@RequestMapping(value="/pc")
public class AtestController extends BaseController {
	
		/**
		 * 列表
		 */
		@RequestMapping(value="/paicha")
		public ModelAndView list(Page page) throws Exception{
			ModelAndView mv = this.getModelAndView();
			mv.setViewName("system/atest/pctable");
			return mv;
		}
		
		/**
		 * 列表
		 */
		@RequestMapping(value="/fivewhy")
		public ModelAndView fivewhy(Page page) throws Exception{
			ModelAndView mv = this.getModelAndView();
			mv.setViewName("system/atest/5why");
			return mv;
		}
		
		
		/**
		 * 列表
		 */
		@RequestMapping(value="/questlist")
		public ModelAndView questlist(Page page) throws Exception{
			ModelAndView mv = this.getModelAndView();
			mv.setViewName("system/atest/questlist");
			return mv;
		}
		/**
		 * 列表
		 */
		@RequestMapping(value="/goisNot")
		public ModelAndView goisNot(Page page) throws Exception{
			ModelAndView mv = this.getModelAndView();
			mv.setViewName("system/atest/isNot");
			return mv;
		}
}
