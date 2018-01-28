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
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="plan/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PLAN_ID" id="PLAN_ID" value="${pd.PLAN_ID}"/>
		<div id="zhongxin">
		<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}" maxlength="32" placeholder="这里输入问题id" title="问题id"/></td>
		<table id="table_report" class="table table-striped table-bordered table-hover" style="margin:0 auto;width: 1000px;">
			<tr>
				<td style="width:100px;text-align: center;padding-top: 13px;">步骤</td>
				<td style="width:350px;text-align: center;padding-top: 13px;">部门</td>
				<td style="width:350px;text-align: center;padding-top: 13px;">用户</td>
				<td style="width:200px;text-align: center;padding-top: 13px;">计划时间</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">D0：</td>
				<td>
					 <select class="select DEPT" name="DEPT"  onchange="setD0UserName('D0')" id="D0"  data-placeholder="请选择" style="vertical-align:top;width: 100%;">
						<c:forEach items="${deptList}" var="var">
						   <option value="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
						</c:forEach>
				  	</select>
				</td>
				<td>
					<select  name="PRINCIPALD_ONENAME0" style="vertical-align:top;width: 100%;"  id="D0_1" >
						<c:forEach items="${deptuser}" var="var">
						  	<option value="${var.USER_ID}" <c:if test="${sj.PRINCIPALD_ONENAME == var.USER_ID }">selected</c:if>>${var.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="date"  name="PLANTIME0" format="yyyy-MM-dd" id="DO_2" value="${pd.PLANTIME}" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">D1：</td>
				<td>
					 <select class="select DEPT" onchange="setD0UserName('D1')" name="DEPT" id="D1"  data-placeholder="请选择" style="vertical-align:top;width: 100%;">
						<c:forEach items="${deptList}" var="var">
						   <option value="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
						</c:forEach>
				  	</select>
				</td>
				<td>
					<select  name="PRINCIPALD_ONENAME1" style="vertical-align:top;width: 100%;"  id="D1_1" >
						<c:forEach items="${deptuser}" var="var">
						  	<option value="${var.USER_ID}" <c:if test="${sj.PRINCIPALD_ONENAME == var.USER_ID }">selected</c:if>>${var.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="date"  name="PLANTIME1" id="D1_2" value="${pd.PLANTIME}" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">D2：</td>
				<td>
					 <select class="select DEPT" onchange="setD0UserName('D2')" name="DEPT" id="D2"  data-placeholder="请选择" style="vertical-align:top;width: 100%;">
						<c:forEach items="${deptList}" var="var">
						   <option value="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
						</c:forEach>
				  	</select>
				</td>
				<td>
					<select  name="PRINCIPALD_ONENAME2" style="vertical-align:top;width: 100%;"  id="D2_1" >
						<c:forEach items="${deptuser}" var="var">
						  	<option value="${var.USER_ID}" <c:if test="${sj.PRINCIPALD_ONENAME == var.USER_ID }">selected</c:if>>${var.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="date"  name="PLANTIME2" id="D2_2" value="${pd.PLANTIME}" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">D3：</td>
				<td>
					 <select class="select DEPT" onchange="setD0UserName('D3')" name="DEPT" id="D3"  data-placeholder="请选择" style="vertical-align:top;width: 100%;">
						<c:forEach items="${deptList}" var="var">
						   <option value="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
						</c:forEach>
				  	</select>
				</td>
				<td>
					<select  name="PRINCIPALD_ONENAME3" style="vertical-align:top;width: 100%;"  id="D3_1" >
						<c:forEach items="${deptuser}" var="var">
						  	<option value="${var.USER_ID}" <c:if test="${sj.PRINCIPALD_ONENAME == var.USER_ID }">selected</c:if>>${var.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="date"  name="PLANTIME3" id="D3_2" value="${pd.PLANTIME}" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">D4：</td>
				<td>
					 <select class="select DEPT" onchange="setD0UserName('D4')" name="DEPT" id="D4"  data-placeholder="请选择" style="vertical-align:top;width: 100%;">
						<c:forEach items="${deptList}" var="var">
						   <option value="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
						</c:forEach>
				  	</select>
				</td>
				<td>
					<select  name="PRINCIPALD_ONENAME4" style="vertical-align:top;width: 100%;"  id="D4_1" >
						<c:forEach items="${deptuser}" var="var">
						  	<option value="${var.USER_ID}" <c:if test="${sj.PRINCIPALD_ONENAME == var.USER_ID }">selected</c:if>>${var.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="date"  name="PLANTIME4" id="D4_2" value="${pd.PLANTIME}" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">D5：</td>
				<td>
					 <select class="select DEPT" onchange="setD0UserName('D5')" name="DEPT" id="D5"  data-placeholder="请选择" style="vertical-align:top;width: 100%;">
						<c:forEach items="${deptList}" var="var">
						   <option value="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
						</c:forEach>
				  	</select>
				</td>
				<td>
					<select  name="PRINCIPALD_ONENAME5" style="vertical-align:top;width: 100%;"  id="D5_1" >
						<c:forEach items="${deptuser}" var="var">
						  	<option value="${var.USER_ID}" <c:if test="${sj.PRINCIPALD_ONENAME == var.USER_ID }">selected</c:if>>${var.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="date"  name="PLANTIME5" id="D5_2" value="${pd.PLANTIME}" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">D6：</td>
				<td>
					 <select class="select DEPT" onchange="setD0UserName('D6')" name="DEPT" id="D6"  data-placeholder="请选择" style="vertical-align:top;width: 100%;">
						<c:forEach items="${deptList}" var="var">
						   <option value="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
						</c:forEach>
				  	</select>
				</td>
				<td>
					<select  name="PRINCIPALD_ONENAME6" style="vertical-align:top;width: 100%;"  id="D6_1" >
						<c:forEach items="${deptuser}" var="var">
						  	<option value="${var.USER_ID}" <c:if test="${sj.PRINCIPALD_ONENAME == var.USER_ID }">selected</c:if>>${var.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="date"  name="PLANTIME6" id="D6_2" value="${pd.PLANTIME}" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">D7：</td>
				<td>
					 <select class="select DEPT" onchange="setD0UserName('D7')" name="DEPT" id="D7"  data-placeholder="请选择" style="vertical-align:top;width: 100%;">
						<c:forEach items="${deptList}" var="var">
						   <option value="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
						</c:forEach>
				  	</select>
				</td>
				<td>
					<select  name="PRINCIPALD_ONENAME7" style="vertical-align:top;width: 100%;"  id="D7_1" >
						<c:forEach items="${deptuser}" var="var">
						  	<option value="${var.USER_ID}" <c:if test="${sj.PRINCIPALD_ONENAME == var.USER_ID }">selected</c:if>>${var.NAME}</option>
						</c:forEach>
					</select>
				</td>
				<td><input type="date"  name="PLANTIME7" id="D7_2" value="${pd.PLANTIME}" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="window.history.go(-1);">返回</a>
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

		setD0UserName('D0');
		setD0UserName('D1');
		setD0UserName('D2');
		setD0UserName('D3');
		setD0UserName('D4');
		setD0UserName('D5');
		setD0UserName('D6');
		setD0UserName('D7');
		
	});
	
	function setD0UserName(step){
		var options=$("#"+step+" option:selected");
		peptid = options.val();
       	//二级下拉框
       	var a=$("#"+step+"_1");
        $(a).empty();
		$.ajax({
			type : "POST",
			url : '${ctx}/ford/department/deptAjas',
			data : {"DEPARTMENT_ID":peptid},
			async: false,
			dataType : 'json',
			success : function(data) {
				if(data.message=="1"){ 
				var users=data.deptuser;
				var str="";
					for (var i = 0; i < users.length; i++) {
						str+="<option value=\""+users[i].USER_ID+"\">"+users[i].NAME+"</option>"
					}
					$(a).append(str);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("操作无效");
			}
		})
	}
	</script>
</body>
</html>