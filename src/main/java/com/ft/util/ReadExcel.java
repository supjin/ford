package com.ft.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ft.controller.base.BaseController;
import com.ft.service.system.clientmanagement.ClientManagementService;
import com.ft.service.system.equipmentdetail.EquipmentDetailService;
import com.ft.service.system.proceduremanagement.ProcedureManagementService;
import com.ft.service.system.productmangement.ProductMangementService;
import com.ft.service.system.supplierinventory.SupplierInventoryService;

public class ReadExcel {
	/*
	 * 导入到数据库
	 * 
	 * @return
	 */
	public static Map<String,Object> Readexcel(List<String> list,String path,int STATUS) throws Exception {
		String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+ "../../"; // 项目路径
		filePath = filePath.replaceAll("file:/", "");
		filePath = filePath.replaceAll("%20", " ");
		filePath = filePath.trim() + path;
		InputStream is = new FileInputStream(filePath);
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);

		PageData pd = new PageData();
		BaseController base = null;
		Map<String,Object> map = new HashMap<String, Object>();
		// 循环工作表Sheet
		for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
			if (hssfSheet == null) {
				continue;
			}

			// 循环行Row
			for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				if (hssfRow != null) {
					// student = new Student();
					for (int i = 0; i < list.size(); i++) {
						if (i == 0) {
							pd.put(list.get(i).toString(),get32UUID().toString());
						}else {
							pd.put(list.get(i).toString(),getValue(hssfRow.getCell(i-1)));
						}
					}
					if(STATUS == 1){
						saveEquip(pd);
					}else if(STATUS == 2){
						saveSuppler(pd);
					}else if(STATUS == 3){
						saveClient(pd);
					}else if(STATUS == 4){
						saveProduct(pd);
					}else if(STATUS == 5){
						saveGong(pd);
					}
				}
			}
			map.put("STATE", 1);
		}
		return map;
	}
	
	
	public static void saveEquip(PageData pd) throws Exception{
		HttpServletRequest request;
		request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		EquipmentDetailService equipmentdetailService = (EquipmentDetailService) wac.getBean("equipmentdetailService");
		equipmentdetailService.save(pd);
	}
	public static void saveSuppler(PageData pd) throws Exception{
		HttpServletRequest request;
		request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		SupplierInventoryService supplierinventoryService = (SupplierInventoryService) wac.getBean("supplierinventoryService");
		supplierinventoryService.save(pd);
	}
	public static void saveClient(PageData pd) throws Exception{
		HttpServletRequest request;
		request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		ClientManagementService clientmanagementService = (ClientManagementService) wac.getBean("clientmanagementService");
		clientmanagementService.save(pd);
	}
	public static void saveProduct(PageData pd) throws Exception{
		HttpServletRequest request;
		request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		ProductMangementService productmangementService = (ProductMangementService) wac.getBean("productmangementService");
		productmangementService.save(pd);
	}
	public static void saveGong(PageData pd) throws Exception{
		HttpServletRequest request;
		request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		ProcedureManagementService proceduremanagementService = (ProcedureManagementService) wac.getBean("proceduremanagementService");
		proceduremanagementService.save(pd);
	}
	public static String getValue(HSSFCell cell) {
		String value = "";
		if (null == cell) {
			return value;
		}
		switch (cell.getCellType()) {
		// 数值型
		case Cell.CELL_TYPE_NUMERIC:
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				// 如果是date类型则 ，获取该cell的date值
				Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				value = format.format(date);
			} else {// 纯数字
				BigDecimal big = new BigDecimal(cell.getNumericCellValue());
				value = big.toString();
				// 解决1234.0 去掉后面的.0 只有一个小数点
				if (null != value && !"".equals(value.trim())) {
					String[] item = value.split("[.]");
					if (1 < item.length && "0".equals(item[1])&& 3 > item.length) {
						value = item[0];
					}
				}
			}
			break;
		// 字符串类型
		case Cell.CELL_TYPE_STRING:
			value = cell.getStringCellValue().toString();
			break;
		// 公式类型
		case Cell.CELL_TYPE_FORMULA:
			// 读公式计算值
			value = String.valueOf(cell.getNumericCellValue());
			if (value.equals("NaN")) {// 如果获取的数据值为非法值,则转换为获取字符串
				value = cell.getStringCellValue().toString();
			}
			break;
		// 布尔类型
		case Cell.CELL_TYPE_BOOLEAN:
			value = " " + cell.getBooleanCellValue();
			break;
		// 空值
		case Cell.CELL_TYPE_BLANK:
			value = "";
			break;
		// 故障
		case Cell.CELL_TYPE_ERROR:
			value = "";
			break;
		default:
			value = cell.getStringCellValue().toString();
		}
		if ("null".endsWith(value.trim())) {
			value = "";
		}
		return value;
	}

	/**
	 * 得到32位的uuid
	 * 
	 * @return
	 */
	public static String get32UUID() {

		return UuidUtil.get32UUID();
	}
}
