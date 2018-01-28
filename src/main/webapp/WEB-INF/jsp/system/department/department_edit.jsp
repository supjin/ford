<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#DEPARTMENT_NAME").val()==""){
			$("#DEPARTMENT_NAME").tips({
				side:3,
	            msg:'请输入部门名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DEPARTMENT_NAME").focus();
			return false;
		}
		/* if($("#COMPANY_ID").val()==""){
			$("#COMPANY_ID").tips({
				side:3,
	            msg:'请选择公司',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMPANY_ID").focus();
			return false;
		} */
	/* 	if($("#COMPANY_PID").val()==""){
			$("#COMPANY_PID").tips({
				side:3,
	            msg:'请输入父级部门id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMPANY_PID").focus();
			return false;
		} */
		/* if($("#CREATION_TIME").val()==""){
			$("#CREATION_TIME").tips({
				side:3,
	            msg:'请输入创建时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATION_TIME").focus();
			return false;
		} */
		/* if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入部门负责人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		} */
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="department/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="DEPARTMENT_ID" id="DEPARTMENT_ID" value="${pd.DEPARTMENT_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">所属公司:</td>
				<td><%-- <input type="text" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="32" placeholder="这里输入公司id" title="公司id"/> --%>
				
				    <select  name="COMPANY_ID" id="field2"  style="vertical-align:top;width: 120px;">
						   <c:forEach items="${companyList}" var="var">
							  <option value="${var.COMPANY_ID}"  <c:if test="${var.COMPANY_ID eq pd.COMPANY_ID }">selected="selected"</c:if>>${var.COMPANY_NAME}</option>
							</c:forEach>
							
							
					 </select>
				
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">部门名称:</td>
				<td><input type="text" name="DEPARTMENT_NAME" id="DEPARTMENT_NAME" value="${pd.DEPARTMENT_NAME}" maxlength="32" placeholder="这里输入部门名称" title="部门名称"/></td>
			</tr>
			
			<%-- <tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">父级部门id:</td>
				<td><input type="text" name="COMPANY_PID" id="COMPANY_PID" value="${pd.COMPANY_PID}" maxlength="32" placeholder="这里输入父级部门id" title="父级部门id"/></td>
			</tr> --%>
			<%-- <tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建时间:</td>
				<td><input type="text" name="CREATION_TIME" id="CREATION_TIME" value="${pd.CREATION_TIME}" maxlength="32" placeholder="这里输入创建时间" title="创建时间"/></td>
			</tr> --%>
		    <tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">部门负责人:</td>
				<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入部门负责人" title="部门负责人"/></td>
			</tr> 
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>