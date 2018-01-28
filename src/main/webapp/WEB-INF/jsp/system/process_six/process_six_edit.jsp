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
		if($("#PRINCIPALNAME").val()==""){
			$("#PRINCIPALNAME").tips({
				side:3,
	            msg:'请输入d6责任人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRINCIPALNAME").focus();
			return false;
		}
		if($("#EXECUTIVENAME").val()==""){
			$("#EXECUTIVENAME").tips({
				side:3,
	            msg:'请输入执行人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXECUTIVENAME").focus();
			return false;
		}
		if($("#PRINCIPALD_FIVESNAME").val()==""){
			$("#PRINCIPALD_FIVESNAME").tips({
				side:3,
	            msg:'请输入d7责任人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRINCIPALD_FIVESNAME").focus();
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
		if($("#EXECUTIONDATE").val()==""){
			$("#EXECUTIONDATE").tips({
				side:3,
	            msg:'请输入执行时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXECUTIONDATE").focus();
			return false;
		}
		if($("#CUOSHIID").val()==""){
			$("#CUOSHIID").tips({
				side:3,
	            msg:'请输入措施id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CUOSHIID").focus();
			return false;
		}
		if($("#MEASUREIMPL").val()==""){
			$("#MEASUREIMPL").tips({
				side:3,
	            msg:'请输入永久措施执行',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MEASUREIMPL").focus();
			return false;
		}
		if($("#COMGIRMED").val()==""){
			$("#COMGIRMED").tips({
				side:3,
	            msg:'请输入证实',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMGIRMED").focus();
			return false;
		}
		if($("#CCODE").val()==""){
			$("#CCODE").tips({
				side:3,
	            msg:'请输入预留字段1',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CCODE").focus();
			return false;
		}
		if($("#DCODE").val()==""){
			$("#DCODE").tips({
				side:3,
	            msg:'请输入预留字段2',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DCODE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="process_six/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PROCESS_SIX_ID" id="PROCESS_SIX_ID" value="${pd.PROCESS_SIX_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">公司id:</td>
				<td><input type="text" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="32" placeholder="这里输入公司id" title="公司id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题id:</td>
				<td><input type="text" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}" maxlength="32" placeholder="这里输入问题id" title="问题id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">d6责任人:</td>
				<td><input type="text" name="PRINCIPALNAME" id="PRINCIPALNAME" value="${pd.PRINCIPALNAME}" maxlength="32" placeholder="这里输入d6责任人" title="d6责任人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">执行人:</td>
				<td><input type="text" name="EXECUTIVENAME" id="EXECUTIVENAME" value="${pd.EXECUTIVENAME}" maxlength="32" placeholder="这里输入执行人" title="执行人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">d7责任人:</td>
				<td><input type="text" name="PRINCIPALD_FIVESNAME" id="PRINCIPALD_FIVESNAME" value="${pd.PRINCIPALD_FIVESNAME}" maxlength="32" placeholder="这里输入d7责任人" title="d7责任人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">失效时间:</td>
				<td><input type="text" name="VALIDITY" id="VALIDITY" value="${pd.VALIDITY}" maxlength="32" placeholder="这里输入失效时间" title="失效时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">执行时间:</td>
				<td><input type="text" name="EXECUTIONDATE" id="EXECUTIONDATE" value="${pd.EXECUTIONDATE}" maxlength="32" placeholder="这里输入执行时间" title="执行时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">措施id:</td>
				<td><input type="text" name="CUOSHIID" id="CUOSHIID" value="${pd.CUOSHIID}" maxlength="32" placeholder="这里输入措施id" title="措施id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">永久措施执行:</td>
				<td><input type="text" name="MEASUREIMPL" id="MEASUREIMPL" value="${pd.MEASUREIMPL}" maxlength="32" placeholder="这里输入永久措施执行" title="永久措施执行"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">证实:</td>
				<td><input type="text" name="COMGIRMED" id="COMGIRMED" value="${pd.COMGIRMED}" maxlength="32" placeholder="这里输入证实" title="证实"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">预留字段1:</td>
				<td><input type="text" name="CCODE" id="CCODE" value="${pd.CCODE}" maxlength="32" placeholder="这里输入预留字段1" title="预留字段1"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">预留字段2:</td>
				<td><input type="text" name="DCODE" id="DCODE" value="${pd.DCODE}" maxlength="32" placeholder="这里输入预留字段2" title="预留字段2"/></td>
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