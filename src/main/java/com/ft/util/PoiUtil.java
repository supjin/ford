package com.ft.util;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class PoiUtil
{    

    /**
     * 导入文件
     * @param MultipartFile
     * @param String type
     * @throws IOException 
     * @throws InvalidFormatException 
     */
    public static List<List<Map<String, Object>>> ExcelLead(MultipartFile file,String type) throws InvalidFormatException, IOException
	{
       //获取文件路径
 	   CommonsMultipartFile cf = (CommonsMultipartFile) file;
 	   DiskFileItem fi = (DiskFileItem) cf.getFileItem();
 	   File f = fi.getStoreLocation();
 	  List<List<Map<String, Object>>> sheetlist = new ArrayList<List<Map<String, Object>>>();
 	 
 	     //把文件加入工场
 	     Workbook wb = WorkbookFactory.create(f);
 	       //获取表格
 	      //1为学校 2 为公司
 	     if(type.equals("1")){ 
 	    	 Sheet sheet = wb.getSheetAt(0);
 	    	 Sheet sheet2 = wb.getSheetAt(1);
 	         sheetlist.add(getsheet(sheet));
 	         sheetlist.add(getsheet(sheet2));
 	    	
 	     }else if(type.equals("2")){
 	    	 
 	    	 Sheet sheet = wb.getSheetAt(0);
	         sheetlist.add(getsheet(sheet));
 	     }
        
         //获取一共多少行
        /* System.out.println(sheet.getLastRowNum());;*/
        
        
         
		return sheetlist;
 		
	}
    
   /* private static String getCellValue(Cell c) {
        String o = null;
        switch (c.getCellType()) {
        case Cell.CELL_TYPE_BLANK:
            o = ""; break;
        case Cell.CELL_TYPE_BOOLEAN:
            o = String.valueOf(c.getBooleanCellValue()); break;
        case Cell.CELL_TYPE_FORMULA:
            o = String.valueOf(c.getCellFormula()); break;
        case Cell.CELL_TYPE_NUMERIC:
            o = String.valueOf(c.getNumericCellValue()); break;
        case Cell.CELL_TYPE_STRING:
            o = c.getStringCellValue(); break;
        default:
            o = null;
            break;
        }
        return o;
    }*/
    
    /**
     * 获取Sheet
     * @param sheet
     * @return
     */
    public static List<Map<String,Object>> getsheet(Sheet sheet)
	{
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Row row = null;        //行
        for(int i=1;i<=sheet.getLastRowNum();i++) {
            row = sheet.getRow(i);
            //获取一行多少列
            Map<String,Object> map=new HashMap<String,Object>();  
            for(int j=row.getFirstCellNum();j<row.getLastCellNum();j++) {
           	 
                //getCellValue可以根据不同的类型获取一个String类型的值
                System.out.print(getCellValue(row.getCell(j))+"--");
                map.put("NAME", getCellValue(row.getCell(0))); //名称
                map.put("PASSWORD", getCellValue(row.getCell(1)));//密码
	            map.put("NICKNAME", getCellValue(row.getCell(2)));//昵称
	            map.put("PHONE", getCellValue(row.getCell(3)));//手机号码
	            map.put("MAIL", getCellValue(row.getCell(4)));//邮箱
	            map.put("USER_TYPE", getCellValue(row.getCell(5)));//用户类型
	            map.put("PHONECODE", getCellValue(row.getCell(6)));//国籍区号
               
                
                
            }
            list.add(map);
            System.out.println();
        }
		return list;
		
	}
    /**
     *每一行格式装换
     * @param cell
     * @return
     */
    public static String getCellValue(Cell cell) {
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

	
}
