package com.ft.util;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * 从EXCEL导入到数据库 创建人：FH 创建时间：2014年12月23日
 * 
 * @version
 */
public class ObjectExcelRead {

	/**
	 * @param filepath
	 *            //文件路径
	 * @param filename
	 *            //文件名
	 * @param startrow
	 *            //开始行号
	 * @param startcol
	 *            //开始列号
	 * @param sheetnum
	 *            //sheet
	 * @return list
	 */
	public static List<Object> readExcel(String filepath, String filename, int startrow, int startcol, int sheetnum) {
		List<Object> varList = new ArrayList<Object>();

		try {
			File target = new File(filepath, filename);
			FileInputStream fi = new FileInputStream(target);
			HSSFWorkbook wb = new HSSFWorkbook(fi);
			HSSFSheet sheet = wb.getSheetAt(sheetnum); // sheet 从0开始
			wb.close();
			int rowNum = sheet.getLastRowNum() + 1; // 取得最后一行的行号
			for (int i = startrow; i < rowNum; i++) { // 行循环开始

				PageData varpd = new PageData();
				HSSFRow row = sheet.getRow(i); // 行
				int cellNum = row.getLastCellNum(); // 每行的最后一个单元格位置

				for (int j = startcol; j < cellNum; j++) { // 列循环开始

					HSSFCell cell = row.getCell(Short.parseShort(j + ""));
					String cellValue = null;
					if (null != cell) {
						switch (cell.getCellType()) { // 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
						case 0:
							cellValue = String.valueOf((int) cell.getNumericCellValue());
							break;
						case 1:
							cellValue = cell.getStringCellValue();
							break;
						case 2:
							cellValue = cell.getNumericCellValue() + "";
							// cellValue =
							// String.valueOf(cell.getDateCellValue());
							break;
						case 3:
							cellValue = "";
							break;
						case 4:
							cellValue = String.valueOf(cell.getBooleanCellValue());
							break;
						case 5:
							cellValue = String.valueOf(cell.getErrorCellValue());
							break;
						}
					} else {
						cellValue = "";
					}

					varpd.put("var" + j, cellValue);

				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return varList;
	}

	/**
	 * 
	 * @param target  //excel 文件
	 * @param startrow //开始行号
	 * @param startcol //开始列号
	 * @param sheetnum //sheet
	 * @param isExcel2003 //是否为xls
	 * @return 
	 */
	
	/**
	 * 
	 * @param startrow
	 *            
	 * @param startcol
	 *            
	 * @param sheetnum
	 *            
	 * @return list
	 */
	public static List<Object> readExcel(File target, int startrow, int startcol, int sheetnum ,boolean isExcel2003) {
		List<Object> varList = new ArrayList<Object>();

		try {
			FileInputStream fi = new FileInputStream(target);
			Workbook wb = null;
			if(isExcel2003){
				wb = new HSSFWorkbook(fi);  //2003
			}else{
				wb = new XSSFWorkbook(fi);  //2007
			}
			
			Sheet sheet = wb.getSheetAt(sheetnum); // sheet 从0开始
			wb.close();
			int rowNum = sheet.getLastRowNum() + 1; // 取得最后一行的行号

			for (int i = startrow; i < rowNum; i++) { // 行循环开始

				PageData varpd = new PageData();
				Row row = sheet.getRow(i); // 行
				int cellNum = row.getLastCellNum(); // 每行的最后一个单元格位置

				for (int j = startcol; j < cellNum; j++) { // 列循环开始

					Cell cell = row.getCell(Short.parseShort(j + ""));
					String value = null;
					if (null != cell) {
						switch (cell.getCellType()) { // 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
						//数值型  
				        case Cell.CELL_TYPE_NUMERIC:  
				            if (HSSFDateUtil.isCellDateFormatted(cell)) {  
				                //如果是date类型则 ，获取该cell的date值  
				                Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());  
				                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
				                value = format.format(date);;  
				            }else {// 纯数字  
				                BigDecimal big=new BigDecimal(cell.getNumericCellValue());  
				                value = big.toString();  
				                //解决1234.0  去掉后面的.0  
				                if(null!=value&&!"".equals(value.trim())){  
				                     String[] item = value.split("[.]");  
				                     if(1<item.length&&"0".equals(item[1])){  
				                         value=item[0];  
				                     }  
				                }  
				            }  
				            break;  
				            //字符串类型   
				        case Cell.CELL_TYPE_STRING:  
				            value = cell.getStringCellValue().toString();  
				            break;  
				        // 公式类型  
				        case Cell.CELL_TYPE_FORMULA:  
				            //读公式计算值  
				            value = String.valueOf(cell.getNumericCellValue());  
				            if (value.equals("NaN")) {// 如果获取的数据值为非法值,则转换为获取字符串  
				                value = cell.getStringCellValue().toString();  
				            }  
				            break;  
				        // 布尔类型  
				        case Cell.CELL_TYPE_BOOLEAN:  
				            value = " "+ cell.getBooleanCellValue();  
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
					} else {
						value = "";
					}

					varpd.put("var" + j, value);

				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return varList;
	}

	/**
	 * 是否是2003的excel，返回true是2003
	 * @param filePath
	 * @return
	 */
	public static boolean isExcel2003(String filePath) {

		return filePath.matches("^.+\\.(?i)(xls)$");

	}

	/**
	 * 是否是2007的excel，返回true是2007 
	 * @param filePath
	 * @return
	 */
	public static boolean isExcel2007(String filePath) {

		return filePath.matches("^.+\\.(?i)(xlsx)$");

	}
}
