<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- 避免IE使用兼容模式 -->
        <meta name="renderer" content="webkit"><!----页面默认谷歌内核----->
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>睿博光电质量管理系统</title>
		<link rel="stylesheet" href="${ctx}/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/index.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/index.js" ></script>
		<script type="text/javascript" src="${ctx}/static/js/myjs/head.js" ></script>
		<!-- 弹窗js -->
		<script type="text/javascript" src="${ctx}/static/fords/layer/layer.js" ></script>
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
				    	<img class="index_xiatui pull-left" src="${ctx}/static/fords/img/tui.png"   onclick='window.location.href="${ctx }/logout"' alt="退出"/>
				    </div>

				   <!--  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"> -->
				        <%-- <li role="presentation">
				            <a role="menuitem" tabindex="-1" href="${ctx }/head/goProductCode">生成代码</a>
				        </li> --%>
				       <!--  <li role="presentation">
				            <a role="menuitem" tabindex="-1" href="#">数据挖掘</a>
				        </li>
				        <li role="presentation">
				            <a role="menuitem" tabindex="-1" href="#">数据通信/网络</a>
				        </li> -->
				       <%--  <li role="presentation">
				            <a role="menuitem" href="${ctx }/logout" tabindex="-1" href="#">退出</a>
				        </li>
				    </ul> --%>
				</div>
				<ul class="index_topxin pull-right">
					<li class="icon-envelope-alt icon-large"><span class="index_xinbga">1</span></li>
					<!-- <li class="icon-warning-sign icon-large"><span class="index_xinbgb">10</span></li> -->
					<li class="icon-tasks icon-large"><span class="index_xinbgc">33</span></li>
				</ul>
			</div>
			<!---这是内容部分---->
			<div class="index_main">
				<iframe src="${ctx}/userspace/list.do" style="border: none;width: 100%;height: 100%;" ></iframe>
			</div>
		</div>
		<!--------左部分导航-------->
		<div class="index_navbox">
<!-- 					<button class="btn btn-small btn-danger" title="菜单管理" id="adminmenu" onclick="menu();"><i class="icon-folder-open"></i></button> -->
			<div class="index_navtit"><img src="${ctx}/static/fords/img/rebodqos.png" alt="图片"/></div>
			<!----新增的2个div包裹头像和导航---->
			<div class="img_ulbox">
			<div class="img_ulboxios">
			<div class="index_navuser">
				<img src="${ctx}/static/fords/img/chustox_d.jpg" alt="头像"/>
				<a class="index_name" href="javascript:;">King</a>
				<a class="index_zhis" href="javascript:;">质量管理部部长</a>
			</div>
			<ul class="index_navlebox">
			
			    <li class="index_navactive">
			        <a class="index_navlia" href="javascript:;" data-dizhi="${ctx}/userspace/list.do">
			        	<em class="index_sohi"><img src="${ctx}/static/fords/img/nava1.png"/><img src="${ctx}/static/fords/img/nava2.png"/></em>
			        	<span class="index_navatit">个人空间</span>
			        </a>
			    </li>
			   
			   <c:forEach items="${menuList}" var="menu">
   				<c:if test="${empty menu.subMenu}">
				<li>
				<c:choose>
									<c:when test="${not empty menu.MENU_URL && menu.MENU_URL != '#'}">
									<a class="index_navlia" href="javascript:;" data-dizhi="${ctx}/${menu.MENU_URL }"> <em class="index_sohi"><img src="${ctx}/static/fords/img/${menu.MENU_ICON}" /><img src="${ctx}/static/fords/img/${menu.MENU_ICONS}" /></em> <span class="index_navatit">${menu.MENU_NAME }</span></a>
									</c:when>
									<c:otherwise>
									<a class="index_navlia" href="javascript:;" data-dizhi=""> <em class="index_sohi"><img src="${ctx}/static/fords/img/${menu.MENU_ICON}" /><img src="${ctx}/static/fords/img/${menu.MENU_ICONS}" /></em> <span class="index_navatit">${menu.MENU_NAME }</span></a>
									</c:otherwise>
				</c:choose>
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
			<div class="left_imgullisbox">
				<img src="${ctx}/static/fords/img/wuyou.png" alt="头像"/>
			</div>
			</div>
			</div>
		</div>
	</body>
	<script>
		$(function(){
			//全局样式
	        layer.config({
	            skin: 'demo-class'//自定义样式demo-class
	        })
			/*$(".index_namune").click(function(){
				parent.layer.open({
		        	type:1,//类型
					title:"",//标题
					content:'<div class="pwalerttit">你确定删除该问题？</div>',
					area:['500px','230px'],//宽高
					closeBtn: 0,//不显示右上角关闭按钮
					shadeClose:false,//是否点击遮罩关闭
					scrollbar: false,//是否允许浏览器出现滚动条
					btn:['确定','取消'],
					btnAlign: 'c',//按钮居中
					yes:function(index,layero){
						parent.layer.close(index);//关闭弹
					},
					btn2:function(index){
						parent.layer.close(index);//关闭弹
					}
		        })
			})*/
		})
	</script>
</html>
