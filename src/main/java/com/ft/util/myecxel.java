package com.ft.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hslf.model.Sheet;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class myecxel
{
	public static void main2(String[] args)
	{
		String[] title = {"id","name","sex"};
		
		//创建工作簿
		HSSFWorkbook wb = new HSSFWorkbook();
		//创建Excel工作表对象     
		HSSFSheet sheet = wb.createSheet("sheet1");
		//创建Excel工作表的行   
		HSSFRow row = sheet.createRow(0);
		
		HSSFCell cell = null;
		//添加表头信息
		for (int i = 0; i < title.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(title[i]);
			
		}
		//追加数据
				for (int i = 1; i <= 10; i++) {
					HSSFRow nextrow = sheet.createRow(i);
					HSSFCell cell2 = nextrow.createCell(0);
					cell2.setCellValue("a" + i);
					cell2 = nextrow.createCell(1);
					cell2.setCellValue("user" + i);
					cell2 = nextrow.createCell(2);
					cell2.setCellValue("男");
				}
				
				//创建一个文件
				File file = new File("e:/poi_test.xls");
				try {
					file.createNewFile();
					//将Excel内容存盘
					FileOutputStream stream = new FileOutputStream(file);
					wb.write(stream);
					stream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
	}
	public static void main(String[] args) throws IOException
	{  
		
		//读进一个excel模版       
		FileInputStream fos = new FileInputStream("e:/123.xlsx");       
		
		/*//创建一个工作薄       
		HSSFWorkbook wb = new HSSFWorkbook(); 
		
		//创建工作表
		HSSFSheet sheet= wb.createSheet("xls");
		//获取第一行
		sheet.createRow(0);*/
		
		/*POIFSFileSystem fs=new POIFSFileSystem(fos);  */
		//得到Excel工作簿对象    
	
		POIFSFileSystem fs=new POIFSFileSystem(new FileInputStream("e:/poi_test.xls"));   
		//得到Excel工作簿对象    
		HSSFWorkbook wb = new HSSFWorkbook(fs);  
		//得到Excel工作表对象    
		HSSFSheet sheet = wb.getSheetAt(0);  
		
		File file = new File("e:/XL/G8D.xls");
		
			file.createNewFile();
			//将Excel内容存盘
			FileOutputStream stream = new FileOutputStream(file);
			wb.write(stream);
			stream.close();
			System.out.print("OK");
		   
	}

}
