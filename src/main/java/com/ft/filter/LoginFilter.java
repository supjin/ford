package com.ft.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;

import com.ft.controller.base.BaseController;
import com.ft.util.Const;
import com.ft.util.FileUtil;
import com.ft.util.PageData;

/**
 * 登录验证过滤器
 */
@WebFilter("/*")
public class LoginFilter extends BaseController implements Filter {

	/**
	 * 初始化
	 */
	public void init(FilterConfig fc) throws ServletException {
		//FileUtil.createDir("d:/FH/topic/");
	}
	
	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		String uri=request.getRequestURI().replace("/ford", "");
		PageData pcsessionuser = (PageData) SecurityUtils.getSubject().getSession().getAttribute(Const.SESSION_PCUSER);
		if(request.getRequestURI().contains("/ps")){
			if(pcsessionuser!=null){
				chain.doFilter(request, response);
			}else{
				req.getRequestDispatcher("/pc/goLogin").forward(request, response);
			}
		}else{
			chain.doFilter(request, response);
		}
		
		
	
		
		
	}

}
