package com.ft.controller.system.analysis;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.service.system.imperfection_entry.Imperfection_entryService;
import com.ft.service.system.productmangement.ProductMangementService;
import com.ft.util.PageData;
/**
 * AnalysisController
 * @author Ala
 * 每日分析
 */
@Controller
@RequestMapping(value="/analysis")
public class AnalysisController extends BaseController {
		String menuUrl = "analysis/list.do"; //菜单地址(权限用)
		//产品
		@Resource(name="productmangementService")
		private ProductMangementService productmangementService;
		//缺陷录入数据
		@Resource(name="imperfection_entryService")
		private Imperfection_entryService imperfection_entryService;
		
		
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
				//不良数TOP10
				List<PageData>	imeList =imperfection_entryService.listMostNomber(pd);//不良总数top10
				
				for (PageData pageData : imeList) {
					pageData.put("NONMBER", pageData.get("NONMBER").toString().replace(".0", ""));
					
				}
				 JSONArray json = new JSONArray();
				List<PageData>	imvList =imperfection_entryService.listMostNonlve(pd);//失效模式top10
				for (PageData pageData2 : imvList) {
					JSONObject jo = new JSONObject();
					if(null != pageData2.get("IMPERFECTION_NAME") && !"".equals(pageData2.get("IMPERFECTION_NAME").toString())){
					jo.put("NONLVE", pageData2.get("NONLVE"));
					jo.put("IMPERFECTION_NAME", pageData2.get("IMPERFECTION_NAME"));
					}
					json.add(jo);
				}
				JSONArray projson = new JSONArray();
				List<PageData>	proList =imperfection_entryService.listMostProducber(pd);//产品top10
				for (PageData pageData : proList) {
					JSONObject jo = new JSONObject();
					if(null != pageData.get("PRODUCTS_NUMBERING") && !"".equals(pageData.get("PRODUCTS_NUMBERING").toString())){
					jo.put("value", pageData.get("NONLVE").toString());
					jo.put("name", pageData.get("PRODUCTS_NUMBERING").toString());
					}
					projson.add(jo);
				}
				
				JSONArray equjson = new JSONArray();
				List<PageData>	equList =imperfection_entryService.listMostequiber(pd);//设备top10
				for (PageData pageData : equList) {
					JSONObject jo = new JSONObject();
					if(null != pageData.get("EQUIPMENT_NAME") && !"".equals(pageData.get("EQUIPMENT_NAME").toString())){
					jo.put("value", pageData.get("NONLVE").toString());
					jo.put("name", pageData.get("EQUIPMENT_NAME").toString());
					}
					equjson.add(jo);
				}
				//工序
				JSONArray procjson = new JSONArray();
				List<PageData>	procList =imperfection_entryService.listMosteprocber(pd);//工序top10
				for (PageData pageData : procList) {
					JSONObject jo = new JSONObject();
					if(null != pageData.get("PROCESS_NAME") && !"".equals(pageData.get("PROCESS_NAME").toString())){
					jo.put("value", pageData.get("NONLVE").toString());
					jo.put("name", pageData.get("PROCESS_NAME").toString());
					}
					procjson.add(jo);
				}
				
				mv.setViewName("system/analysis/analysis");
				mv.addObject("productList", productList);
				mv.addObject("imeList", imeList);
				mv.addObject("imvList", imvList);
				mv.addObject("pd", pd);
				mv.addObject("json", json);
				mv.addObject("projson", projson);
				mv.addObject("equjson", equjson);
				mv.addObject("procjson", procjson);
			} catch(Exception e){
				logger.error(e.toString(), e);
			}
			return mv;
		}
}
