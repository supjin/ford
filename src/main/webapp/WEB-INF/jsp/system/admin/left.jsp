﻿<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="menu-min">

				<div id="sidebar-shortcuts" style="overflow: hidden;line-height:normal;max-height:none;">
					<!-- <div id="sidebar-shortcuts-large"> -->
					<img src="static/avatars/user.jpg" class="pw_aidimg nav-user-photo" />
					<a class="pw_aida">${NAME }</a>
				</div><!-- #sidebar-shortcuts -->


				<ul class="nav nav-list">
					

					<li class="active" id="fhindex">
					  <a href="main/index"><i class="icon-home icon-large"></i><span>后台首页</span></a>
					</li>
					
						
					<li id="lm">
					  <a onclick="menu();"  style="color:#585858 "><i class="icon-th-large"></i><span>菜单管理</span></a>
					</li>

			<c:forEach items="${menuList}" var="menu">
				<c:if test="${menu.hasMenu}">
				<li id="lm${menu.MENU_ID }">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						<i class="${menu.MENU_ICON == null ? 'icon-desktop' : menu.MENU_ICON}"></i><span>${menu.MENU_NAME }</span>
						<b class="arrow icon-angle-down"></b>
					  </a>
					  <ul class="submenu">
							<c:forEach items="${menu.subMenu}" var="sub">
								<c:if test="${sub.hasMenu}">
								<c:choose>
									<c:when test="${not empty sub.MENU_URL}">
									<li id="z${sub.MENU_ID }">
									<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z${sub.MENU_ID }','lm${menu.MENU_ID }','${sub.MENU_NAME }','${sub.MENU_URL }')"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
									</c:when>
									<c:otherwise>
									<li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
									</c:otherwise>
								</c:choose>
								</c:if>
							</c:forEach>
				  		</ul>
				</li>
				</c:if>
			</c:forEach>

				</ul><!--/.nav-list-->

				<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>

			</div><!--/#sidebar-->

