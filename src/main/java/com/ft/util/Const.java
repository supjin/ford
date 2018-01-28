package com.ft.util;

import java.util.ResourceBundle;

import org.springframework.context.ApplicationContext;
/**
 * 项目名称：
 * @author:fh
 * 
*/
public class Const {
	
	private static ResourceBundle FileBase_PATH = ResourceBundle.getBundle("sysconfig");
	
	
	public static final String SAVE_FILE_PATH = FileBase_PATH.getString("serverlocation").trim(); // 文件存放路径
	public static final String VISIT_FILE_PATH = FileBase_PATH.getString("IMGURL").trim(); // 访问地址
	public static final String VISIT_FILE_PATH_RELAPCE =   FileBase_PATH.getString("VISIT_FILE_PATH_RELAPCE").trim(); // 图片默认地址
	
	
	
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	public static final String SESSION_USER = "sessionUser";
	public static final String SESSION_PCUSER = "sessionPCUser";
	public static final String  SESSION_USERID="USERID";
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String SESSION_menuList = "menuList";			//当前菜单
	public static final String SESSION_allmenuList = "allmenuList";		//全部菜单
	public static final String SESSION_QX = "QX";
	public static final String SESSION_userpds = "userpds";			
	public static final String SESSION_USERROL = "USERROL";				//用户对象
	public static final String SESSION_USERNAME = "USERNAME";			//用户名
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final String LOGIN = "/admin_login.do";				//登录地址
	public static final String SYSNAME = "admin/config/SYSNAME.txt";	//系统名称路径
	public static final String PAGE	= "admin/config/PAGE.txt";			//分页条数配置路径
	public static final String EMAIL = "admin/config/EMAIL.txt";		//邮箱服务器配置路径
	public static final String SMS1 = "admin/config/SMS1.txt";			//短信账户配置路径1
	public static final String SMS2 = "admin/config/SMS2.txt";			//短信账户配置路径2
	public static final String FWATERM = "admin/config/FWATERM.txt";	//文字水印配置路径
	public static final String IWATERM = "admin/config/IWATERM.txt";	//图片水印配置路径
	public static final String WEIXIN	= "admin/config/WEIXIN.txt";	//微信配置路径
	public static final String FILEPATHIMG = "uploadFiles/uploadImgs/";	//图片上传路径
	public static final String FILEPATHFILE = "uploadFiles/file/";		//文件上传路径
	public static final String FILEPATHTWODIMENSIONCODE = "uploadFiles/twoDimensionCode/"; //二维码存放路径
	public static final String NO_INTERCEPTOR_PATH = ".*/((admin_login)|(pc)|(ps)|(ford)|(login)|(logout)|(code)|(app)|(weixin)|(static)|(main)|(websocket)).*";	//不对匹配该值的访问路径拦截（正则）
	
	public static final String EQUIPMENTFILEPATH = "admin/excel/equipmen.xls";		//设备明细表
	public static final String SUPPLERFILEPATH = "admin/excel/suppler.xls";		//供应商存货表
	public static final String CLIENTFILEPATH = "admin/excel/client.xls";		//客户表
	public static final String PRODUCTFILEPATH = "admin/excel/prod.xls";		//产品表
	public static final String GONGFILEPATH = "admin/excel/gongxu.xls";//工序
	public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化
	
	/**
	 * APP Constants
	 */
	//app注册接口_请求协议参数)
	public static final String[] APP_REGISTERED_PARAM_ARRAY = new String[]{"countries","uname","passwd","title","full_name","company_name","countries_code","area_code","telephone","mobile"};
	public static final String[] APP_REGISTERED_VALUE_ARRAY = new String[]{"国籍","邮箱帐号","密码","称谓","名称","公司名称","国家编号","区号","电话","手机号"};
	
	//app根据用户名获取会员信息接口_请求协议中的参数
	public static final String[] APP_GETAPPUSER_PARAM_ARRAY = new String[]{"USERNAME"};
	public static final String[] APP_GETAPPUSER_VALUE_ARRAY = new String[]{"用户名"};
	

	
	/**
	 * 获取配置文件中的参数
	 * @param key
	 * @return
	 */
	public static String getConfig(String key){
		return FileBase_PATH.getString(key).trim();
	}
	

	
}
