package com.ft.controller.system.userspace;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.entity.system.Role;
import com.ft.entity.system.User;
import com.ft.service.system.client_problem_collection.Client_problem_collectionService;
import com.ft.service.system.dict.DictService;
import com.ft.service.system.imperfection_entry.Imperfection_entryService;
import com.ft.service.system.iqc_problem.IQC_problemService;
import com.ft.service.system.plan.PlanService;
import com.ft.service.system.productmangement.ProductMangementService;
import com.ft.service.system.role.RoleService;
import com.ft.util.Const;
import com.ft.util.PageData;

/**
 * UserspaceController
 * 
 * @author Ala 个人空间
 */
@Controller
@RequestMapping(value = "/userspace")
public class UserspaceController extends BaseController {
	String menuUrl = "userspace/list.do"; // 菜单地址(权限用)
	// 产品
	@Resource(name = "productmangementService")
	private ProductMangementService productmangementService;
	@Resource(name = "client_problem_collectionService")
	private Client_problem_collectionService client_problem_collectionService;
	// 计划
	@Resource(name = "planService")
	private PlanService planService;
	@Resource(name = "dictService")
	private DictService dictService;
	@Resource(name="iqc_problemService")
	private IQC_problemService iqc_problemService;
	@Resource(name="roleService")
	private RoleService roleService;
	//缺陷录入数据
	@Resource(name="imperfection_entryService")
	private Imperfection_entryService imperfection_entryService;
	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, "个人空间");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			String USER_ID = (String)session.getAttribute(Const.SESSION_USERID);		//获取session中用户id
			pd = this.getPageData();
			page.setPd(pd);
			page.setShowCount(2);
			List<PageData> varList = client_problem_collectionService.list(page); // 列出Client_problem_collection列表
			List<PageData> productList = productmangementService.listAllName(pd);// 产品
			// 菜单列表
			List<PageData> dicList = dictService.getList("processType");
			// 判断是否过期
			Map<Object, Object> map = new LinkedHashMap<Object, Object>();
			map = client_problem_collectionService.getTimeIsOut(varList);
			//待办事项（IQC供应商问题）
			pd.put("RESPONSEBLEMAN", USER_ID);
			
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
				
				
			List<PageData> iqcList = iqc_problemService.listAll(pd);
			//审批事项  经理有权限role.getROLE_NAME().equals("质量主管") || 
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String roleId = user.getROLE_ID();
			Role role = roleService.getRoleById(roleId);
			if(role.getROLE_NAME().equals("质量经理")){
				PageData pdr = new PageData();
				pdr.put("oderleader", 3);
				List<PageData> iqcLeaderList = iqc_problemService.listAll(pdr);
				pd.put("leaderiqc", iqcLeaderList.size());
				mv.addObject("iqcLeaderList", iqcLeaderList);
			}else {
				pd.put("leaderiqc", 0);
			}
			/*if(null == iqcList){
				pd.put("iqcdata", 0);
			}else {
				pd.put("iqcdata", iqcList.size());
			}*/
			pd.put("dataiqc", iqcList.size());
			mv.setViewName("system/userspace/userspace");
			mv.addObject("productList", productList);
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject("iqcList", iqcList);
			mv.addObject("json", json);
			mv.addObject("dicList", dicList);
			mv.addObject("map", map);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
}
