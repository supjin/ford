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
			if($("#PROBLEM_ID").val()==""){
			$("#PROBLEM_ID").tips({
				side:3,
	            msg:'请输入问题id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROBLEM_ID").focus();
			return false;
		}
		if($("#DESCRIPTION").val()==""){
			$("#DESCRIPTION").tips({
				side:3,
	            msg:'请输入问题描述',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DESCRIPTION").focus();
			return false;
		}
		if($("#WHAT_COLUMN").val()==""){
			$("#WHAT_COLUMN").tips({
				side:3,
	            msg:'请输入what列',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHAT_COLUMN").focus();
			return false;
		}
		if($("#WHERE_COLUMN").val()==""){
			$("#WHERE_COLUMN").tips({
				side:3,
	            msg:'请输入where 列',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHERE_COLUMN").focus();
			return false;
		}
		if($("#WHEN_COLUMN").val()==""){
			$("#WHEN_COLUMN").tips({
				side:3,
	            msg:'请输入when列',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHEN_COLUMN").focus();
			return false;
		}
		if($("#WHO_COLUMN").val()==""){
			$("#WHO_COLUMN").tips({
				side:3,
	            msg:'请输入who列',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHO_COLUMN").focus();
			return false;
		}
		if($("#HOWBIG_COLUMN").val()==""){
			$("#HOWBIG_COLUMN").tips({
				side:3,
	            msg:'请输入howbig列',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HOWBIG_COLUMN").focus();
			return false;
		}
		if($("#DETECTION").val()==""){
			$("#DETECTION").tips({
				side:3,
	            msg:'请输入检测',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DETECTION").focus();
			return false;
		}
		if($("#CREATION_TIME").val()==""){
			$("#CREATION_TIME").tips({
				side:3,
	            msg:'请输入创建时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATION_TIME").focus();
			return false;
		}
		if($("#UPDATE_TIME").val()==""){
			$("#UPDATE_TIME").tips({
				side:3,
	            msg:'请输入更新时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UPDATE_TIME").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="isnot/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ISNOT_ID" id="ISNOT_ID" value="${pd.ISNOT_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题id:</td>
				<td><input type="text" name="PROBLEM_ID" id="PROBLEM_ID" value="${pd.PROBLEM_ID}" maxlength="32" placeholder="这里输入问题id" title="问题id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题描述:</td>
				<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="32" placeholder="这里输入问题描述" title="问题描述"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">what列:</td>
				<td><input type="text" name="WHAT_COLUMN" id="WHAT_COLUMN" value="${pd.WHAT_COLUMN}" maxlength="32" placeholder="这里输入what列" title="what列"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">where 列:</td>
				<td><input type="text" name="WHERE_COLUMN" id="WHERE_COLUMN" value="${pd.WHERE_COLUMN}" maxlength="32" placeholder="这里输入where 列" title="where 列"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">when列:</td>
				<td><input type="text" name="WHEN_COLUMN" id="WHEN_COLUMN" value="${pd.WHEN_COLUMN}" maxlength="32" placeholder="这里输入when列" title="when列"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">who列:</td>
				<td><input type="text" name="WHO_COLUMN" id="WHO_COLUMN" value="${pd.WHO_COLUMN}" maxlength="32" placeholder="这里输入who列" title="who列"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">howbig列:</td>
				<td><input type="text" name="HOWBIG_COLUMN" id="HOWBIG_COLUMN" value="${pd.HOWBIG_COLUMN}" maxlength="32" placeholder="这里输入howbig列" title="howbig列"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">检测:</td>
				<td><input type="text" name="DETECTION" id="DETECTION" value="${pd.DETECTION}" maxlength="32" placeholder="这里输入检测" title="检测"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建时间:</td>
				<td><input type="text" name="CREATION_TIME" id="CREATION_TIME" value="${pd.CREATION_TIME}" maxlength="32" placeholder="这里输入创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">更新时间:</td>
				<td><input type="text" name="UPDATE_TIME" id="UPDATE_TIME" value="${pd.UPDATE_TIME}" maxlength="32" placeholder="这里输入更新时间" title="更新时间"/></td>
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