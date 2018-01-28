package com.ft.controller.system.equipmentdetail;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ft.controller.base.BaseController;
import com.ft.entity.Page;
import com.ft.service.system.equipmentdetail.EquipmentDetailService;
import com.ft.util.AppUtil;
import com.ft.util.Const;
import com.ft.util.Jurisdiction;
import com.ft.util.ObjectExcelRead;
import com.ft.util.ObjectExcelView;
import com.ft.util.PageData;
import com.ft.util.ReadExcel;

/**
 * 类名称：EquipmentDetailController 创建人：lichao 创建时间：2017-12-06
 */
@Controller
@RequestMapping(value = "/equipmentdetail")
public class EquipmentDetailController extends BaseController
{

	String menuUrl = "equipmentdetail/list.do"; // 菜单地址(权限用)
	@Resource(name = "equipmentdetailService")
	private EquipmentDetailService equipmentdetailService;

	/**
	 * 新增
	 */
	@ResponseBody
	@RequestMapping(value = "/save")
	public Map<String, Object> save() throws Exception
	{
		logBefore(logger, "新增EquipmentDetail");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add"))
		{
			return null;
		} // 校验权限
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try
		{

			// 判断为修改
			if (pd.get("EQUIPMENTDETAIL_ID") != null
					&& pd.get("EQUIPMENTDETAIL_ID").toString().length() > 0)
			{
				equipmentdetailService.edit(pd);
				map.put("status", "0");
 
			} else // 判断为添加
			{
				pd.put("EQUIPMENTDETAIL_ID", this.get32UUID()); // 主键
				equipmentdetailService.save(pd);
				map.put("status", "0");

			}

		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("status", "1");
		}

		return map;
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception
	{
		logBefore(logger, "删除EquipmentDetail");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del"))
		{
			return;
		} // 校验权限
		PageData pd = new PageData();
		try
		{
			pd = this.getPageData();
			equipmentdetailService.delete(pd);
			out.write("success");
			out.close();
		} catch (Exception e)
		{
			logger.error(e.toString(), e);
		}

	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception
	{
		logBefore(logger, "修改EquipmentDetail");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit"))
		{
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		equipmentdetailService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception
	{
		logBefore(logger, "列表EquipmentDetail");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try
		{
			pd = this.getPageData();

			page.setShowCount(15);
			int pages = 0;
			if (null != pd.get("pages")
					&& !"undefined".equals(pd.get("pages").toString()))
			{
				pages = Integer.parseInt(pd.get("pages").toString());// 当前页
			}
			page.setCurrentPage(pages + 1);
			page.setPd(pd);
			List<PageData> varList = equipmentdetailService.list(page); // 列出EquipmentDetail列表
			int tolpage = page.getTotalPage();
			mv.addObject("pages", pages);
			mv.addObject("tolpage", tolpage);
			mv.setViewName("system/equipmentdetail/equipment_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX, this.getHC()); // 按钮权限
		} catch (Exception e)
		{
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去新增页面
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception
	{
		logBefore(logger, "去新增EquipmentDetail页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try
		{
			mv.setViewName("system/equipmentdetail/equipmentdetail_add");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e)
		{
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去修改页面
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception
	{
		logBefore(logger, "去修改EquipmentDetail页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try
		{
			pd = equipmentdetailService.findById(pd); // 根据ID读取
			mv.setViewName("system/equipmentdetail/equipmentdetail_add");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e)
		{
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception
	{
		logBefore(logger, "批量删除EquipmentDetail");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "dell"))
		{
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if (null != DATA_IDS && !"".equals(DATA_IDS))
			{
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				equipmentdetailService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			} else
			{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e)
		{
			logger.error(e.toString(), e);
		} finally
		{
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
	public ModelAndView exportExcel() throws Exception
	{
		logBefore(logger, "导出EquipmentDetail到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha"))
		{
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try
		{
			Map<String, Object> dataMap = new HashMap<String, Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("设备名称"); // 1
			titles.add("设备编号"); // 2
			titles.add("项目"); // 3
			titles.add("规格/型号"); // 4
			titles.add("功率"); // 5
			titles.add("品牌"); // 6
			titles.add("设备类别"); // 7
			titles.add("位置"); // 8
			titles.add("厂家"); // 9
			titles.add("到厂日期"); // 10
			titles.add("联系人"); // 11
			titles.add("备注"); // 12
			titles.add("创建时间"); // 13
			titles.add("更新时间"); // 14
			dataMap.put("titles", titles);
			List<PageData> varOList = equipmentdetailService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for (int i = 0; i < varOList.size(); i++)
			{
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("NAME")); // 1
				vpd.put("var2", varOList.get(i).getString("NUMBER")); // 2
				vpd.put("var3", varOList.get(i).getString("PROJECT")); // 3
				vpd.put("var4", varOList.get(i).getString("MODEL")); // 4
				vpd.put("var5", varOList.get(i).getString("POWER")); // 5
				vpd.put("var6", varOList.get(i).getString("BRAND")); // 6
				vpd.put("var7", varOList.get(i).getString("CATEGORY")); // 7
				vpd.put("var8", varOList.get(i).getString("ADDRESS")); // 8
				vpd.put("var9", varOList.get(i).getString("MANUFACTOR")); // 9
				vpd.put("var10", varOList.get(i).getString("FACTORYDATE")); // 10
				vpd.put("var11", varOList.get(i).getString("CONTACTS")); // 11
				vpd.put("var12", varOList.get(i).getString("REMARKS")); // 12
				vpd.put("var13", varOList.get(i).get("CREATETIME").toString()); // 13
				vpd.put("var14", varOList.get(i).get("UPDATETIME").toString()); // 14
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv, dataMap);
		} catch (Exception e)
		{
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 导入excel到数据库
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/readexcel")
	public ResponseEntity<Map> readexcel(@RequestParam(value="file",required=false)MultipartFile file) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(null == file){
			map.put("info", "error");
		}
		String filename = file.getOriginalFilename();
		CommonsMultipartFile cf= (CommonsMultipartFile)file; 
        DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
        File excelFile = fi.getStoreLocation();
        boolean isExcel2003 = ObjectExcelRead.isExcel2003(filename);
        List<Object> clients = ObjectExcelRead.readExcel(excelFile, 5, 0, 0,isExcel2003);
        PageData equipPd = new PageData();
        for (Object object : clients) {
        	PageData pd = (PageData) object;
        	equipPd.put("NAME", pd.getString("var1"));
        	equipPd.put("NUMBER", pd.getString("var2"));
        	equipPd.put("PROJECT", pd.getString("var3"));
        	equipPd.put("MODEL", pd.getString("var4"));
        	equipPd.put("POWER", pd.getString("var5"));
        	equipPd.put("BRAND", pd.getString("var6"));
        	equipPd.put("CATEGORY", pd.getString("var7"));
        	equipPd.put("AMOUNT", pd.getString("var8"));
        	equipPd.put("MANUFACTOR", pd.getString("var9"));
        	equipPd.put("FACTORYDATE", pd.getString("var10"));
        	equipPd.put("CONTACTS", pd.getString("var11"));
        	equipPd.put("PHONE", pd.getString("var12"));
        	equipPd.put("REMARKS", pd.getString("var13"));
        	equipPd.put("EQUIPMENTDETAIL_ID", this.get32UUID());	//主键
        	equipmentdetailService.save(equipPd);
		}
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
        map.put("info", "success");
		return new ResponseEntity<Map>(map,headers,HttpStatus.OK);
	}

	/* ===============================权限================================== */
	public Map<String, String> getHC()
	{
		Subject currentUser = SecurityUtils.getSubject(); // shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>) session.getAttribute(Const.SESSION_QX);
	}

	/* ===============================权限================================== */

	@InitBinder
	public void initBinder(WebDataBinder binder)
	{
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}
}
