package com.ft.controller.uploadfile;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ft.controller.base.BaseController;
import com.ft.util.Const;
import com.ft.util.DateUtil;
import com.ft.util.FileUpload;
import com.ft.util.PathUtil;




/**
 * 文件上传
 * @author Administrator
 *
 */
@Controller

public class UploadFileController extends BaseController{
	
	@RequestMapping(value="/ps/uploadfile",method=RequestMethod.POST)
	public ResponseEntity<Map> uploadFile(HttpServletRequest request,HttpServletResponse response,String fileitem){
		Map<String,String> map=new HashMap<String, String>();
		String msg="error";
		String dburl="";
		String imgurl="";
		String fileName = "";
		 String upfilename = "";
		if (request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
            Iterator iter = mr.getFileMap().values().iterator();
  
            if (iter.hasNext()) {
                MultipartFile file = (MultipartFile) iter.next();
                upfilename =  file.getOriginalFilename();
                if(null != file && !file.isEmpty()){
                	
                	String  ffile = DateUtil.getDays();
    				String filePath="";
    				
    				filePath = PathUtil.getClasspath()+fileitem+"/"+ ffile;		//文件上传路径
    				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
    				dburl=fileitem+"/"+ffile+"/"+fileName;
    				imgurl=Const.VISIT_FILE_PATH+dburl;
    				msg="success";
                	
                	/*if((file.getSize()/1024)<2048){
                		String  ffile = DateUtil.getDays();
        				String filePath="";
        				
        				filePath = PathUtil.getClasspath()+fileitem+"/"+ ffile;		//文件上传路径
        				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
        				dburl=fileitem+"/"+ffile+"/"+fileName;
        				imgurl=Const.FILEURL+dburl;
        				msg="success";
                	}else{
                		msg="oversize";
                	}*/
    			}
            }
        }
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
        map.put("oldname", upfilename);
		map.put("info", msg);
		map.put("url", dburl);
		map.put("imgurl", imgurl);
		map.put("filename", fileName);
		return new ResponseEntity<Map>(map,headers,HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/pc/uploadfile",method=RequestMethod.POST)
	public ResponseEntity<Map> pcuploadFile(HttpServletRequest request,HttpServletResponse response,String fileitem){
		Map<String,String> map=new HashMap<String, String>();
		String msg="error";
		String dburl="";
		String imgurl="";
		String fileName = "";
		 String upfilename = "";
		if (request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
            Iterator iter = mr.getFileMap().values().iterator();
  
            if (iter.hasNext()) {
                MultipartFile file = (MultipartFile) iter.next();
                upfilename =  file.getOriginalFilename();
                if(null != file && !file.isEmpty()){
                	
                	String  ffile = DateUtil.getDays();
    				String filePath="";
    				
    				filePath = PathUtil.getClasspath()+fileitem+"/"+ ffile;		//文件上传路径
    				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
    				dburl=fileitem+"/"+ffile+"/"+fileName;
    				imgurl=Const.VISIT_FILE_PATH+dburl;
    				msg="success";
                	
                	/*if((file.getSize()/1024)<2048){
                		String  ffile = DateUtil.getDays();
        				String filePath="";
        				
        				filePath = PathUtil.getClasspath()+fileitem+"/"+ ffile;		//文件上传路径
        				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
        				dburl=fileitem+"/"+ffile+"/"+fileName;
        				imgurl=Const.FILEURL+dburl;
        				msg="success";
                	}else{
                		msg="oversize";
                	}*/
    			}
            }
        }
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
        map.put("oldname", upfilename);
		map.put("info", msg);
		map.put("url", dburl);
		map.put("imgurl", imgurl);
		map.put("filename", fileName);
		return new ResponseEntity<Map>(map,headers,HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/editheadimg",method=RequestMethod.POST)
	public ResponseEntity<Map> editheadimg(HttpServletRequest request,HttpServletResponse response,String fileitem){
		Map<String,String> map=new HashMap<String, String>();
		String msg="error";
		String dburl="";
		String imgurl="";
		String fileName = "";
		if (request instanceof MultipartHttpServletRequest) {
            MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
            Iterator iter = mr.getFileMap().values().iterator();
  
            if (iter.hasNext()) {
                MultipartFile file = (MultipartFile) iter.next();
                if(null != file && !file.isEmpty()){
                	
                	String  ffile = DateUtil.getDays();
    				String filePath="";
    				
    				filePath = PathUtil.getClasspath()+fileitem+"/"+ ffile;		//文件上传路径
    				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
    				dburl=fileitem+"/"+ffile+"/"+fileName;
    				imgurl=Const.VISIT_FILE_PATH+dburl;
    				msg="success";
                	
                	/*if((file.getSize()/1024)<2048){
                		String  ffile = DateUtil.getDays();
        				String filePath="";
        				
        				filePath = PathUtil.getClasspath()+fileitem+"/"+ ffile;		//文件上传路径
        				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
        				dburl=fileitem+"/"+ffile+"/"+fileName;
        				imgurl=Const.FILEURL+dburl;
        				msg="success";
                	}else{
                		msg="oversize";
                	}*/
    			}
            }
        }
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
		
		map.put("info", msg);
		map.put("url", dburl);
		map.put("imgurl", imgurl);
		map.put("filename", fileName);
		return new ResponseEntity<Map>(map,headers,HttpStatus.OK);
		
	}

}
