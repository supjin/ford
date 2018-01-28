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
			if($("#CLIENT_PROBLEM_COLLECTION_ID").val()==""){
			$("#CLIENT_PROBLEM_COLLECTION_ID").tips({
				side:3,
	            msg:'请输入问题id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLIENT_PROBLEM_COLLECTION_ID").focus();
			return false;
		}
		if($("#STEP").val()==""){
			$("#STEP").tips({
				side:3,
	            msg:'请输入步骤',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STEP").focus();
			return false;
		}
		if($("#USERID").val()==""){
			$("#USERID").tips({
				side:3,
	            msg:'请输入用户id’',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERID").focus();
			return false;
		}
		if($("#PLANTIME").val()==""){
			$("#PLANTIME").tips({
				side:3,
	            msg:'请输入计划时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PLANTIME").focus();
			return false;
		}
		if($("#FINISHTIME").val()==""){
			$("#FINISHTIME").tips({
				side:3,
	            msg:'请输入实际完成时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#FINISHTIME").focus();
			return false;
		}
		if($("#ADDTIME").val()==""){
			$("#ADDTIME").tips({
				side:3,
	            msg:'请输入添加时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ADDTIME").focus();
			return false;
		}
		if($("#ADDUSERID").val()==""){
			$("#ADDUSERID").tips({
				side:3,
	            msg:'请输入添加人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ADDUSERID").focus();
			return false;
		}
		if($("#ISFINISH").val()==""){
			$("#ISFINISH").tips({
				side:3,
	            msg:'请输入是否完成',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ISFINISH").focus();
			return false;
		}
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
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题id:</td>
				<td><input type="text" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}" maxlength="32" placeholder="这里输入问题id" title="问题id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">步骤:</td>
				<td><input type="text" name="STEP" id="STEP" value="${pd.STEP}" maxlength="32" placeholder="这里输入步骤" title="步骤"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">用户id’:</td>
				<td><input type="text" name="USERID" id="USERID" value="${pd.USERID}" maxlength="32" placeholder="这里输入用户id’" title="用户id’"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">计划时间:</td>
				<td><input type="text" name="PLANTIME" id="PLANTIME" value="${pd.PLANTIME}" maxlength="32" placeholder="这里输入计划时间" title="计划时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">实际完成时间:</td>
				<td><input type="text" name="FINISHTIME" id="FINISHTIME" value="${pd.FINISHTIME}" maxlength="32" placeholder="这里输入实际完成时间" title="实际完成时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">添加时间:</td>
				<td><input type="text" name="ADDTIME" id="ADDTIME" value="${pd.ADDTIME}" maxlength="32" placeholder="这里输入添加时间" title="添加时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">添加人:</td>
				<td><input type="text" name="ADDUSERID" id="ADDUSERID" value="${pd.ADDUSERID}" maxlength="32" placeholder="这里输入添加人" title="添加人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否完成:</td>
				<td><input type="text" name="ISFINISH" id="ISFINISH" value="${pd.ISFINISH}" maxlength="32" placeholder="这里输入是否完成" title="是否完成"/></td>
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