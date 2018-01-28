<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>D0</title>
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
		<link rel="stylesheet" href="static/css/fen_navlis.css" />
		
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
	<form action="dProcess/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		<div id="zhongxin">
		<%@ include file="/setting/tdtop.jsp"%>
		<table id="table_report" class="table table-striped table-bordered table-hover" style="width: 80%;margin:0 auto;">
			<thead>
			       <tr>
					    <th class="center" colspan="4" >D8标准</th>
					</tr>
					<!-- <tr>
					    <th class="center" style="width: 200px">部门</th>
						<th class="center" style="width: 200px">人员</th>
					</tr> -->
			</thead>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">跟踪号:</td>
				<td><input type="text" style="width: 29%"  readonly  unselectable="on"  id="TRACKINGNUMBER" value="${pd.TRACKINGNUMBER}" maxlength="32" placeholder="这里输入跟踪号" title="跟踪号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">问题描述:</td>
				<td><input type="text"  style="width: 29%" readonly  unselectable="on"   id="TITLE" value="${pd.TITLE}" maxlength="32" placeholder="这里输入申请人" title="申请人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">问题分类:</td>
				<td><input type="text"  style="width: 29%" readonly  unselectable="on"   id="QUESTIONCATEGORY" value="${pd.QUESTIONCATEGORY}" maxlength="32" placeholder="这里输入申请人" title="问题分类"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">问题来源:</td>
				<td><input type="text"  style="width: 29%" readonly  unselectable="on"   id="QUESTIONCATEGORY" value="${pd.QUESTIONCATEGORY}" maxlength="32" placeholder="这里输入申请人" title="问题来源"/></td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">产品名称:</td>
				<td><input type="text" style="width: 29%" readonly  unselectable="on"  id="PRODUCTNAME" value="${pd.PRODUCTNAME}" maxlength="32" placeholder="这里输入跟踪号" title="产品名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">项目名称:</td>
				<td><input type="text" style="width: 29%" readonly  unselectable="on"  id="PROJECTNAME" value="${pd.PROJECTNAME}" maxlength="32" placeholder="这里输入跟踪号" title="项目名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">供应商名字:</td>
				<td><input type="text" style="width: 29%" readonly  unselectable="on"  id="SUPPLIERNAME" value="${pd.SUPPLIERNAME}" maxlength="32" placeholder="这里输入跟踪号" title="供应商名字"/></td>
			</tr>
			<tr>
				<td style="width:85px;text-align: left;padding-top: 13px;">缺陷症状描述:</td>
				 <td>
					<textarea rows="3" readonly  unselectable="on" id="SYSPTOMDESCRIPTION" maxlength="200" style="width: 99%;">${pd.DEFECTDESCRIPTION}</textarea>
				</td>
			</tr>
			
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" href="${ctx }/client_problem_collection/list.do">返回</a>　　
					<a class="btn btn-mini btn-primary" href="${ctx }/dProcess/goDprocessZero.do?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a>
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