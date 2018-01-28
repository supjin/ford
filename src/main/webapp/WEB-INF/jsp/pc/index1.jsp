<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>首页</title>
		<link rel="stylesheet" href="${ctx}/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/index.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/index.js" ></script>
		<!--引入弹窗组件start-->
		<script type="text/javascript" src="${ctx}/plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="${ctx}/plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->	
	</head>
	<body>
		<!--------右部分--------->
		<div class="index_box">
			<!---这是头部---->
			<div class="index_top">
				<!---展开菜单--->
				<span class="index_topcai pull-left"><img src="${ctx}/static/fords/img/cai.png" alt="菜单"/></span>
				<!---下拉菜单--->
				<div class="dropdown pull-right">
				    <div class="index_xiala dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
				    	<img class="index_xiauserimg pull-left" src="${ctx}/static/fords/img/chustox_d.jpg" alt="头像"/>
				    	<div class="index_xiatit pull-left">Welcome，admin</div>
				    	<img class="index_xiatui pull-left" src="${ctx}/static/fords/img/tui.png" alt="退出"/>
				    </div>
				    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				        <li role="presentation">
				            <a role="menuitem" tabindex="-1" href="${ctx }/head/goProductCode">生成代码</a>
				        </li>
				        <li role="presentation">
				            <a role="menuitem" tabindex="-1" href="#">数据挖掘</a>
				        </li>
				        <li role="presentation">
				            <a role="menuitem" tabindex="-1" href="#">数据通信/网络</a>
				        </li>
				        <li role="presentation">
				            <a role="menuitem" tabindex="-1" href="#">分离的链接</a>
				        </li>
				    </ul>
				</div>
				<!---3个信息提示--->
				<ul class="index_topxin pull-right">
					<li class="icon-envelope-alt icon-large"><span class="index_xinbga">1</span></li>
					<li class="icon-warning-sign icon-large"><span class="index_xinbgb">10</span></li>
					<li class="icon-tasks icon-large"><span class="index_xinbgc">333</span></li>
				</ul>
			</div>
			<!---这是内容部分---->
			<div class="index_main">
				<iframe src="${ctx}/client_problem_collection/list.do" style="border: none;width: 100%;height: 100%;" ></iframe>
			</div>
		</div>
		<!--------左部分导航-------->
		<div class="index_navbox">
			<div class="index_navtit">DQOS数字化质量操作系统</div>
			<div class="index_navuser">
				<img src="${ctx}/static/fords/img/chustox_d.jpg" alt="头像"/>
				<a href="javascript:;">admin</a>
			</div>
			<ul class="index_navlebox">
				<li class="index_navactive">
			        <a class="index_navlia" href="javascript:;" data-dizhi="">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava1.png"/><img src="${ctx}/static/fords/img/nava2.png"/></em>
			        	<span class="index_navatit">首　　页</span>
			        </a>
			    </li>
			    <li>
			        <a class="index_navlia" href="javascript:;" data-dizhi="">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava3.png"/><img src="${ctx}/static/fords/img/nava4.png"/></em>
			        	<span class="index_navatit">个人空间</span>
			        </a>
			    </li>
			    <%-- <li>
			        <a class="index_navlia" href="javascript:;" onclick="menu();">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava3.png"/><img src="${ctx}/static/fords/img/nava4.png"/></em>
			        	<span class="index_navatit">菜单管理</span>
			        </a>
			    </li> --%>
	<%-- 		    <li>
			        <a class="index_navlia" href="javascript:;" data-dizhi="">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava5.png"/><img src="${ctx}/static/fords/img/nava6.png"/></em>
			        	<span class="index_navatit">客户问题</span>
			        	<em class="index_you icon-angle-left pull-right"></em>
			        </a>
			        <ul class="index_namune">
			            <li><a data-dizhi="${ctx}/client_problem_collection/list.do?TYPE=1" href="javascript:;"><em class="index_naims icon-double-angle-right"></em><span class="index_nastit">0公里问题</span></a></li>
			            <li><a data-dizhi="" href="javascript:;"><em class="index_naims icon-double-angle-right"></em><span class="index_nastit">投产问题</span></a></li>
			            <li><a data-dizhi="" href="javascript:;"><em class="index_naims icon-double-angle-right"></em><span class="index_nastit">售后问题</span></a></li>
			        </ul>
			   </li>
			   <li>
			        <a class="index_navlia" href="javascript:;" data-dizhi="">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava7.png"/><img src="${ctx}/static/fords/img/nava8.png"/></em>
			        	<span class="index_navatit">IQC问题</span>
			        </a>
			   </li>
			   <li>
			        <a class="index_navlia" href="javascript:;" data-dizhi="">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava9.png"/><img src="${ctx}/static/fords/img/nava10.png"/></em>
			        	<span class="index_navatit">现场问题</span>
			        	<em class="index_you icon-angle-left pull-right"></em>
			        </a>
			        <ul class="index_namune">
			            <li><a data-dizhi="" href="javascript:;"><em class="index_naims icon-double-angle-right"></em><span class="index_nastit">0公里问题</span></a></li>
			            <li><a data-dizhi="" href="javascript:;"><em class="index_naims icon-double-angle-right"></em><span class="index_nastit">投产问题</span></a></li>
			            <li><a data-dizhi="" href="javascript:;"><em class="index_naims icon-double-angle-right"></em><span class="index_nastit">售后问题</span></a></li>
			        </ul>
			   </li>
			   <li>
			        <a class="index_navlia" href="javascript:;" data-dizhi="">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava11.png"/><img src="${ctx}/static/fords/img/nava12.png"/></em>
			        	<span class="index_navatit">审核体系</span>
			        </a>
			   </li>
			   <li>
			        <a class="index_navlia" href="javascript:;" data-dizhi="">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava13.png"/><img src="${ctx}/static/fords/img/nava14.png"/></em>
			        	<span class="index_navatit">知识管理库</span>
			        </a>
			   </li> --%>
			   
			   <c:forEach items="${menuList}" var="menu">
   			 <c:if test="${empty menu.subMenu}">
				<li>
				<a class="index_navlia" href="javascript:;" data-dizhi=""> <em class="index_sohi"><img src="${ctx}/static/fords/img/${menu.MENU_ICON}" /><img src="${ctx}/static/fords/img/${menu.MENU_ICONS}" /></em> <span class="index_navatit">${menu.MENU_NAME }</span></a>
				</li>
				</c:if>
			   
			   <c:if test="${not empty menu.subMenu}">
				<c:if test="${menu.hasMenu}">
				<li id="lm${menu.MENU_ID }">
					  <a class="index_navlia" href="javascript:;">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/${menu.MENU_ICON}"/><img src="${ctx}/static/fords/img/${menu.MENU_ICONS}"/></em>
			        	<span class="index_navatit">${menu.MENU_NAME }</span>
			        	<em class="index_you icon-angle-left pull-right"></em>
			          </a> 
			          
			          


						<ul class="index_namune">
				   <c:forEach items="${menu.subMenu}" var="sub">
								<c:if test="${sub.hasMenu}">
								<c:choose>
									<c:when test="${not empty sub.MENU_URL && sub.MENU_URL != '#'}">
									<li id="z${sub.MENU_ID }">
									<a data-dizhi="${ctx}/${sub.MENU_URL }" href="javascript:;"><em class="index_naims icon-double-angle-right"></em><span class="index_nastit">${sub.MENU_NAME }</span></a></li>
									</c:when>
									<c:otherwise>
									<li><a data-dizhi="" href="javascript:void(0);"><em class="index_naims icon-double-angle-right"></em><span class="index_nastit">${sub.MENU_NAME }</span></a></li>
									</c:otherwise>
								</c:choose>
								</c:if>
							</c:forEach>
			        </ul>
				</li>
				</c:if>
				</c:if>
			</c:forEach>
			   
			   
			   
			   
			</ul>
		</div>
	</body>
</html>
