package com.ft.interceptor;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.entity.system.User;
import com.ft.service.system.access_logs.Access_logsService;
import com.ft.util.Const;
import com.ft.util.PageData;
import com.ft.util.UuidUtil;

@Aspect
@Service
public class ServiceInterceptor {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Pointcut(value = "execution(* com.ft.service.system..*.*(..))&& args(param)", argNames = "param")
	private void anyMethod(Object param) {
	}
	String methodName =null;
	String ObjectName = null;
	int flag =0;//标志是否存入数据库
@Before( value="execution(* com.ft.service.system..*.*(..))")
	public void doAccessCheck(JoinPoint joinpoint) throws Exception {
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		String username = (String) session.getAttribute(Const.SESSION_USERNAME);//用户名称
		String ACCESS_LOGS_ID=UuidUtil.get32UUID();//得到id
		methodName = joinpoint.getSignature().getName();//方法名称（操作）
		ObjectName = joinpoint.getTarget().getClass().getSimpleName();//操作的对象
		List<Object> params = Arrays.asList(joinpoint.getArgs());
		
		if(!params.isEmpty()){
			Object param = params.get(0);
			Page page = new Page();
			PageData pdtmp = new PageData();
			if(Page.class.isInstance(param)){//判断数据是否是page
				page = (Page) param;
				pdtmp=page.getPd();
			}
			else if (PageData.class.isInstance(param)){
				pdtmp = (PageData)param;
			}
			//判断操作对象和操作方式
			flag = whichOperation(pdtmp);
			pd.put("USERNAME", username);
			pd.put("ACCESS_LOGS_ID", ACCESS_LOGS_ID);
			pd.put("OBJECTNAME", ObjectName);
			pd.put("OPERATIONNAME", methodName);
		}
		if(flag==1){
			dao.save("Access_logsMapper.save", pd);
			flag = 0;
		}
	}
	/*
	 * @AfterReturning("anyMethod()") public void doAfter() {
	 * System.out.println("后置通知"); }
	 * 
	 * @After("anyMethod()") public void after() { System.out.println("最终通知"); }
	 * 
	 * @AfterThrowing("anyMethod()") public void doAfterThrow() {
	 * System.out.println("例外通知");
	 * 
	 * }
	 * 
	 * @Around("anyMethod()") public Object doBasicProfiling(ProceedingJoinPoint
	 * pjp) throws Throwable { System.out.println("进入环绕通知"); Object object =
	 * pjp.proceed();// 执行该方法 System.out.println("退出方法"); return object; }
	 */



private int whichOperation(PageData pdtmp) {
	if(ObjectName.equals("Client_problem_collectionService")){
		if(pdtmp.get("TYPE")!=null&&!"".equals(pdtmp.get("TYPE"))){
			String type = null ;
			if(pdtmp.get("TYPE") instanceof String){
				type= (String) pdtmp.get("TYPE");
			}
			else{
				type= ((Integer) pdtmp.get("TYPE")).toString();
			}
			if(type.equals("1")){
				ObjectName="0公里问题";
			}
			if(type.equals("2")){
				ObjectName="投产问题";
			}
			if(type.equals("3")){
				ObjectName="售后问题";
			}
			if(type.equals("4")){
				ObjectName="问题解决";
			}
			//判断是什么操作
			methodName = whichWay(methodName);
			if(methodName!=null){
				flag=1;
			}
		}
	}
	return flag;
}

//判断是否是
private String whichWay(String methodName) {
	String operation = null;
	if(methodName.equals("save")){
		operation = "新增";
	}else if(methodName.equals("saveAll")){
		operation="新增问题和计划";
	}else if(methodName.equals("delete")){
		operation="删除";
	}else if(methodName.equals("edit")){
		operation="编辑";
	}else if(methodName.equals("list")){
		operation="查看列表";
	}else if(methodName.equals("deleteAll")){
		operation="批量删除";
	}
	
	if(operation!=null){
		return operation;
	}
	return null;	
}
}
