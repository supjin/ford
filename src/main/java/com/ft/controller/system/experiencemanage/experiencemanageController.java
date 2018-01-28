package com.ft.controller.system.experiencemanage;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.service.system.productmangement.ProductMangementService;
import com.ft.util.PageData;
/**
 * experiencemanageController
 * @author Ala
 * 经验管理
 */
@Controller
@RequestMapping(value="/experiencemanage")
public class experiencemanageController extends BaseController {
	String menuUrl = "experiencemanage/list.do"; //菜单地址(权限用)
	
		//产品
		@Resource(name="productmangementService")
		private ProductMangementService productmangementService;
		
		/**
		 * 列表
		 */
		@RequestMapping(value="/list")
		public ModelAndView list(Page page) throws Exception{
			logBefore(logger, "列表Imperfection_entry");
			//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			try{
				pd = this.getPageData();
				page.setPd(pd);
				page.setShowCount(15);
				List<PageData>	productList = productmangementService.listAllName(pd);//产品
				mv.setViewName("system/experiencemanage/experiencemanage");
				mv.addObject("productList", productList);
				mv.addObject("pd", pd);
			} catch(Exception e){
				logger.error(e.toString(), e);
			}
			return mv;
		}
}
