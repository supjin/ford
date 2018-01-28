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
			if($("#VEHICLECUT").val()==""){
			$("#VEHICLECUT").tips({
				side:3,
	            msg:'请输入围堵措施截至车号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VEHICLECUT").focus();
			return false;
		}
		if($("#PARTCUT").val()==""){
			$("#PARTCUT").tips({
				side:3,
	            msg:'请输入零件截至号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PARTCUT").focus();
			return false;
		}
		if($("#IMPLEMENTION").val()==""){
			$("#IMPLEMENTION").tips({
				side:3,
	            msg:'请输入围堵措施实施日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IMPLEMENTION").focus();
			return false;
		}
		if($("#PARTDATE").val()==""){
			$("#PARTDATE").tips({
				side:3,
	            msg:'请输入零件截至日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PARTDATE").focus();
			return false;
		}
		if($("#QUANTITY").val()==""){
			$("#QUANTITY").tips({
				side:3,
	            msg:'请输入受影响零件总数量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#QUANTITY").focus();
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
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="investigate_table/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="INVESTIGATE_TABLE_ID" id="INVESTIGATE_TABLE_ID" value="${pd.INVESTIGATE_TABLE_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">围堵措施截至车号:</td>
				<td><input type="text" name="VEHICLECUT" id="VEHICLECUT" value="${pd.VEHICLECUT}" maxlength="32" placeholder="这里输入围堵措施截至车号" title="围堵措施截至车号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">零件截至号:</td>
				<td><input type="text" name="PARTCUT" id="PARTCUT" value="${pd.PARTCUT}" maxlength="32" placeholder="这里输入零件截至号" title="零件截至号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">围堵措施实施日期:</td>
				<td><input type="text" name="IMPLEMENTION" id="IMPLEMENTION" value="${pd.IMPLEMENTION}" maxlength="32" placeholder="这里输入围堵措施实施日期" title="围堵措施实施日期"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">零件截至日期:</td>
				<td><input type="text" name="PARTDATE" id="PARTDATE" value="${pd.PARTDATE}" maxlength="32" placeholder="这里输入零件截至日期" title="零件截至日期"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">受影响零件总数量:</td>
				<td><input type="text" name="QUANTITY" id="QUANTITY" value="${pd.QUANTITY}" maxlength="32" placeholder="这里输入受影响零件总数量" title="受影响零件总数量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题id:</td>
				<td><input type="text" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}" maxlength="32" placeholder="这里输入问题id" title="问题id"/></td>
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