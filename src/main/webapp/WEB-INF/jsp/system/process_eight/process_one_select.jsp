<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
		<form action="process_zero/list.do" method="post" name="Form" id="Form">
		<table id="table_one" class="table table-striped table-bordered table-hover"  style="width: 80%;margin:0 auto; display: none;">
			<thead>
			      <tr>
						<th class="center">部门</th>
						<th class="center">姓名</th>
						<th class="center">电话</th>
					</tr>
			</thead>
			<c:if test="${not empty sj}">
			  <c:forEach items="${sj.listmap}" var="var">
					<tr >
					
					     <td style="width: 20%" class="center"> 
					         ${var.DEPT} 
					     </td>
					     
						 <td class="center">
						       ${var.PERSONNEL_NAME} 
						 </td>
						 
						 <td class="center">
						       ${var.PHONE} 
						 </td>
					</tr>
			
			   </c:forEach>     
			
			</c:if>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;"  colspan="4">附件:　　　
				
					 <c:forEach var="var" items="${attoList}">
                    	<a href="${fns:getConfig('IMGURL')}/${var.ATTACHMENT_URL}" class='fujian'>${var.ATTACHMENT_NAME}</a><input type='hidden' value='${var.ATTACHMENT_URL}'>
                    </c:forEach>
			</td>
			</tr>
		</table>
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			
		});
		
		
		</script>
		
	</body>
</html>

