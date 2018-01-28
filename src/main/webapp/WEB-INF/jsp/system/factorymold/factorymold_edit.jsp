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
			if($("#FACTORYNAME").val()==""){
			$("#FACTORYNAME").tips({
				side:3,
	            msg:'请输入工厂名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#FACTORYNAME").focus();
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
		if($("#DELATED").val()==""){
			$("#DELATED").tips({
				side:3,
	            msg:'请输入删除标识',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DELATED").focus();
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
		if($("#USERID").val()==""){
			$("#USERID").tips({
				side:3,
	            msg:'请输入创建人id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERID").focus();
			return false;
		}
		if($("#SORT").val()==""){
			$("#SORT").tips({
				side:3,
	            msg:'请输入排序降序',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SORT").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="factorymold/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="FACTORYMOLD_ID" id="FACTORYMOLD_ID" value="${pd.FACTORYMOLD_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">工厂名称:</td>
				<td><input type="text" name="FACTORYNAME" id="FACTORYNAME" value="${pd.FACTORYNAME}" maxlength="32" placeholder="这里输入工厂名称" title="工厂名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建时间:</td>
				<td><input class="span10 date-picker" name="CREATETIME" id="CREATETIME" value="${pd.CREATETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">更新时间:</td>
				<td><input class="span10 date-picker" name="UPDATETIME" id="UPDATETIME" value="${pd.UPDATETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="更新时间" title="更新时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">删除标识:</td>
				<td><input type="text" name="DELATED" id="DELATED" value="${pd.DELATED}" maxlength="32" placeholder="这里输入删除标识" title="删除标识"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">公司id:</td>
				<td><input type="text" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="32" placeholder="这里输入公司id" title="公司id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建人id:</td>
				<td><input type="text" name="USERID" id="USERID" value="${pd.USERID}" maxlength="32" placeholder="这里输入创建人id" title="创建人id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">排序降序:</td>
				<td><input type="number" name="SORT" id="SORT" value="${pd.SORT}" maxlength="32" placeholder="这里输入排序降序" title="排序降序"/></td>
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