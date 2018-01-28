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
			if($("#FACTORY").val()==""){
			$("#FACTORY").tips({
				side:3,
	            msg:'请输入工厂',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#FACTORY").focus();
			return false;
		}
		if($("#DEPARTMENT").val()==""){
			$("#DEPARTMENT").tips({
				side:3,
	            msg:'请输入部门',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DEPARTMENT").focus();
			return false;
		}
		if($("#LINKSNAEM").val()==""){
			$("#LINKSNAEM").tips({
				side:3,
	            msg:'请输入姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LINKSNAEM").focus();
			return false;
		}
		if($("#JOBWORKS").val()==""){
			$("#JOBWORKS").tips({
				side:3,
	            msg:'请输入职务',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#JOBWORKS").focus();
			return false;
		}
		if($("#PHONES").val()==""){
			$("#PHONES").tips({
				side:3,
	            msg:'请输入手机',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PHONES").focus();
			return false;
		}
		if($("#EMAILS").val()==""){
			$("#EMAILS").tips({
				side:3,
	            msg:'请输入邮箱',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EMAILS").focus();
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
		if($("#SORT").val()==""){
			$("#SORT").tips({
				side:3,
	            msg:'请输入排序',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SORT").focus();
			return false;
		}
		if($("#DELETED").val()==""){
			$("#DELETED").tips({
				side:3,
	            msg:'请输入删除标识',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DELETED").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="clientmanagement/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="CLIENTMANAGEMENT_ID" id="CLIENTMANAGEMENT_ID" value="${pd.CLIENTMANAGEMENT_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">工厂:</td>
				<td><input type="text" name="FACTORY" id="FACTORY" value="${pd.FACTORY}" maxlength="32" placeholder="这里输入工厂" title="工厂"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">部门:</td>
				<td><input type="text" name="DEPARTMENT" id="DEPARTMENT" value="${pd.DEPARTMENT}" maxlength="32" placeholder="这里输入部门" title="部门"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">姓名:</td>
				<td><input type="text" name="LINKSNAEM" id="LINKSNAEM" value="${pd.LINKSNAEM}" maxlength="32" placeholder="这里输入姓名" title="姓名"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">职务:</td>
				<td><input type="text" name="JOBWORKS" id="JOBWORKS" value="${pd.JOBWORKS}" maxlength="32" placeholder="这里输入职务" title="职务"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">手机:</td>
				<td><input type="text" name="PHONES" id="PHONES" value="${pd.PHONES}" maxlength="32" placeholder="这里输入手机" title="手机"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">邮箱:</td>
				<td><input type="text" name="EMAILS" id="EMAILS" value="${pd.EMAILS}" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
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
				<td style="width:70px;text-align: right;padding-top: 13px;">公司id:</td>
				<td><input type="text" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="32" placeholder="这里输入公司id" title="公司id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">排序:</td>
				<td><input type="text" name="SORT" id="SORT" value="${pd.SORT}" maxlength="32" placeholder="这里输入排序" title="排序"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">删除标识:</td>
				<td><input type="text" name="DELETED" id="DELETED" value="${pd.DELETED}" maxlength="32" placeholder="这里输入删除标识" title="删除标识"/></td>
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