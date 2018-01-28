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
	            msg:'请输入事件id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLIENT_PROBLEM_COLLECTION_ID").focus();
			return false;
		}
		if($("#COMPANY_ID").val()==""){
			$("#COMPANY_ID").tips({
				side:3,
	            msg:'请输入公司id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMPANY_ID").focus();
			return false;
		}
		if($("#CREATETIME").val()==""){
			$("#CREATETIME").tips({
				side:3,
	            msg:'请输入创建时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATETIME").focus();
			return false;
		}
		if($("#UPDATETIME").val()==""){
			$("#UPDATETIME").tips({
				side:3,
	            msg:'请输入更新时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UPDATETIME").focus();
			return false;
		}
		if($("#VALIDITY").val()==""){
			$("#VALIDITY").tips({
				side:3,
	            msg:'请输入失效时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VALIDITY").focus();
			return false;
		}
		if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入操作人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		}
		if($("#RESPONSIBILITY").val()==""){
			$("#RESPONSIBILITY").tips({
				side:3,
	            msg:'请输入责任人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RESPONSIBILITY").focus();
			return false;
		}
		if($("#RESPONSIBLE").val()==""){
			$("#RESPONSIBLE").tips({
				side:3,
	            msg:'请输入执行人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RESPONSIBLE").focus();
			return false;
		}
		if($("#RESULTS").val()==""){
			$("#RESULTS").tips({
				side:3,
	            msg:'请输入审核结果',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RESULTS").focus();
			return false;
		}
		if($("#WHY").val()==""){
			$("#WHY").tips({
				side:3,
	            msg:'请输入未通过原因',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHY").focus();
			return false;
		}
		if($("#RETREAT").val()==""){
			$("#RETREAT").tips({
				side:3,
	            msg:'请输入退回到',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RETREAT").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="process_eight/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PROCESS_EIGHT_ID" id="PROCESS_EIGHT_ID" value="${pd.PROCESS_EIGHT_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">事件id:</td>
				<td><input type="text" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}" maxlength="32" placeholder="这里输入事件id" title="事件id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">公司id:</td>
				<td><input type="text" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="32" placeholder="这里输入公司id" title="公司id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建时间:</td>
				<td><input type="text" name="CREATETIME" id="CREATETIME" value="${pd.CREATETIME}" maxlength="32" placeholder="这里输入创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">更新时间:</td>
				<td><input type="text" name="UPDATETIME" id="UPDATETIME" value="${pd.UPDATETIME}" maxlength="32" placeholder="这里输入更新时间" title="更新时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">失效时间:</td>
				<td><input type="text" name="VALIDITY" id="VALIDITY" value="${pd.VALIDITY}" maxlength="32" placeholder="这里输入失效时间" title="失效时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">操作人:</td>
				<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入操作人" title="操作人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">责任人:</td>
				<td><input type="text" name="RESPONSIBILITY" id="RESPONSIBILITY" value="${pd.RESPONSIBILITY}" maxlength="32" placeholder="这里输入责任人" title="责任人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">执行人:</td>
				<td><input type="text" name="RESPONSIBLE" id="RESPONSIBLE" value="${pd.RESPONSIBLE}" maxlength="32" placeholder="这里输入执行人" title="执行人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">审核结果:</td>
				<td><input type="text" name="RESULTS" id="RESULTS" value="${pd.RESULTS}" maxlength="32" placeholder="这里输入审核结果" title="审核结果"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">未通过原因:</td>
				<td><input type="text" name="WHY" id="WHY" value="${pd.WHY}" maxlength="32" placeholder="这里输入未通过原因" title="未通过原因"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">退回到:</td>
				<td><input type="text" name="RETREAT" id="RETREAT" value="${pd.RETREAT}" maxlength="32" placeholder="这里输入退回到" title="退回到"/></td>
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