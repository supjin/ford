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
			if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入设备名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#NUMBER").val()==""){
			$("#NUMBER").tips({
				side:3,
	            msg:'请输入设备编号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NUMBER").focus();
			return false;
		}
		if($("#PROJECT").val()==""){
			$("#PROJECT").tips({
				side:3,
	            msg:'请输入项目',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROJECT").focus();
			return false;
		}
		if($("#MODEL").val()==""){
			$("#MODEL").tips({
				side:3,
	            msg:'请输入规格/型号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MODEL").focus();
			return false;
		}
		if($("#POWER").val()==""){
			$("#POWER").tips({
				side:3,
	            msg:'请输入功率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#POWER").focus();
			return false;
		}
		if($("#BRAND").val()==""){
			$("#BRAND").tips({
				side:3,
	            msg:'请输入品牌',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BRAND").focus();
			return false;
		}
		if($("#CATEGORY").val()==""){
			$("#CATEGORY").tips({
				side:3,
	            msg:'请输入设备类别',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CATEGORY").focus();
			return false;
		}
		if($("#AMOUNT").val()==""){
			$("#AMOUNT").tips({
				side:3,
	            msg:'请输入数量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AMOUNT").focus();
			return false;
		}
		if($("#MANUFACTOR").val()==""){
			$("#MANUFACTOR").tips({
				side:3,
	            msg:'请输入厂家',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MANUFACTOR").focus();
			return false;
		}
		if($("#FACTORYDATE").val()==""){
			$("#FACTORYDATE").tips({
				side:3,
	            msg:'请输入到厂日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#FACTORYDATE").focus();
			return false;
		}
		if($("#CONTACTS").val()==""){
			$("#CONTACTS").tips({
				side:3,
	            msg:'请输入联系人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CONTACTS").focus();
			return false;
		}
		if($("#REMARKS").val()==""){
			$("#REMARKS").tips({
				side:3,
	            msg:'请输入备注',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REMARKS").focus();
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
	<form action="equipmentdetail/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="EQUIPMENTDETAIL_ID" id="EQUIPMENTDETAIL_ID" value="${pd.EQUIPMENTDETAIL_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">设备名称:</td>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入设备名称" title="设备名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">设备编号:</td>
				<td><input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER}" maxlength="32" placeholder="这里输入设备编号" title="设备编号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">项目:</td>
				<td><input type="text" name="PROJECT" id="PROJECT" value="${pd.PROJECT}" maxlength="32" placeholder="这里输入项目" title="项目"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">规格/型号:</td>
				<td><input type="text" name="MODEL" id="MODEL" value="${pd.MODEL}" maxlength="32" placeholder="这里输入规格/型号" title="规格/型号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">功率:</td>
				<td><input type="text" name="POWER" id="POWER" value="${pd.POWER}" maxlength="32" placeholder="这里输入功率" title="功率"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">品牌:</td>
				<td><input type="text" name="BRAND" id="BRAND" value="${pd.BRAND}" maxlength="32" placeholder="这里输入品牌" title="品牌"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">设备类别:</td>
				<td><input type="text" name="CATEGORY" id="CATEGORY" value="${pd.CATEGORY}" maxlength="32" placeholder="这里输入设备类别" title="设备类别"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">数量:</td>
				<td><input type="text" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入数量" title="数量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">厂家:</td>
				<td><input type="text" name="MANUFACTOR" id="MANUFACTOR" value="${pd.MANUFACTOR}" maxlength="32" placeholder="这里输入厂家" title="厂家"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">到厂日期:</td>
				<td><input type="text" name="FACTORYDATE" id="FACTORYDATE" value="${pd.FACTORYDATE}" maxlength="32" placeholder="这里输入到厂日期" title="到厂日期"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">联系人:</td>
				<td><input type="text" name="CONTACTS" id="CONTACTS" value="${pd.CONTACTS}" maxlength="32" placeholder="这里输入联系人" title="联系人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">备注:</td>
				<td><input type="text" name="REMARKS" id="REMARKS" value="${pd.REMARKS}" maxlength="32" placeholder="这里输入备注" title="备注"/></td>
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