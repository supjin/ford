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
		if($("#USERNAME").val()==""){
			$("#USERNAME").tips({
				side:3,
	            msg:'请输入申请人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERNAME").focus();
			return false;
		}
		if($("#DOCUMENTDATE").val()==""){
			$("#DOCUMENTDATE").tips({
				side:3,
	            msg:'请输入单据日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DOCUMENTDATE").focus();
			return false;
		}
		if($("#TRACKINGNUMBER").val()==""){
			$("#TRACKINGNUMBER").tips({
				side:3,
	            msg:'请输入跟踪号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TRACKINGNUMBER").focus();
			return false;
		}
		if($("#QUESTIONCATEGORY").val()==""){
			$("#QUESTIONCATEGORY").tips({
				side:3,
	            msg:'请输入问题分类',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#QUESTIONCATEGORY").focus();
			return false;
		}
		if($("#PRODUCTNAME").val()==""){
			$("#PRODUCTNAME").tips({
				side:3,
	            msg:'请输入产品名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRODUCTNAME").focus();
			return false;
		}
		if($("#PROJECTNAME").val()==""){
			$("#PROJECTNAME").tips({
				side:3,
	            msg:'请输入项目名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROJECTNAME").focus();
			return false;
		}
		if($("#UNQUALIFIEDQUANTITY").val()==""){
			$("#UNQUALIFIEDQUANTITY").tips({
				side:3,
	            msg:'请输入缺陷数量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UNQUALIFIEDQUANTITY").focus();
			return false;
		}
		if($("#DOWNTIME").val()==""){
			$("#DOWNTIME").tips({
				side:3,
	            msg:'请输入停机时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DOWNTIME").focus();
			return false;
		}
		if($("#SERVRITY").val()==""){
			$("#SERVRITY").tips({
				side:3,
	            msg:'请输入问题严重程度',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SERVRITY").focus();
			return false;
		}
		if($("#PROBLEMSOURCE").val()==""){
			$("#PROBLEMSOURCE").tips({
				side:3,
	            msg:'请输入问题来源',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROBLEMSOURCE").focus();
			return false;
		}
		if($("#DEFECTDESCRIPTION").val()==""){
			$("#DEFECTDESCRIPTION").tips({
				side:3,
	            msg:'请输入缺陷症状描述',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DEFECTDESCRIPTION").focus();
			return false;
		}
		if($("#WHETHERREPEAT").val()==""){
			$("#WHETHERREPEAT").tips({
				side:3,
	            msg:'请输入是否重复',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHETHERREPEAT").focus();
			return false;
		}
		if($("#INCOMINGRALATED").val()==""){
			$("#INCOMINGRALATED").tips({
				side:3,
	            msg:'请输入是否来料相关',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INCOMINGRALATED").focus();
			return false;
		}
		if($("#SUPPLIERNAME").val()==""){
			$("#SUPPLIERNAME").tips({
				side:3,
	            msg:'请输入供应商名字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SUPPLIERNAME").focus();
			return false;
		}
		if($("#REFERENCELESSONS").val()==""){
			$("#REFERENCELESSONS").tips({
				side:3,
	            msg:'请输入参考经验教训',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REFERENCELESSONS").focus();
			return false;
		}
		if($("#FIRSTDEPARTMENT").val()==""){
			$("#FIRSTDEPARTMENT").tips({
				side:3,
	            msg:'请输入初判责任部门',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#FIRSTDEPARTMENT").focus();
			return false;
		}
		if($("#TYPE").val()==""){
			$("#TYPE").tips({
				side:3,
	            msg:'请输入类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
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
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入完成状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		if($("#PROCESSTATE").val()==""){
			$("#PROCESSTATE").tips({
				side:3,
	            msg:'请输入处理状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCESSTATE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="line_problem_collection/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="LINE_PROBLEM_COLLECTION_ID" id="LINE_PROBLEM_COLLECTION_ID" value="${pd.LINE_PROBLEM_COLLECTION_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">公司id:</td>
				<td><input type="text" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="32" placeholder="这里输入公司id" title="公司id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">申请人:</td>
				<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="32" placeholder="这里输入申请人" title="申请人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">单据日期:</td>
				<td><input type="text" name="DOCUMENTDATE" id="DOCUMENTDATE" value="${pd.DOCUMENTDATE}" maxlength="32" placeholder="这里输入单据日期" title="单据日期"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">跟踪号:</td>
				<td><input type="text" name="TRACKINGNUMBER" id="TRACKINGNUMBER" value="${pd.TRACKINGNUMBER}" maxlength="32" placeholder="这里输入跟踪号" title="跟踪号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题分类:</td>
				<td><input type="text" name="QUESTIONCATEGORY" id="QUESTIONCATEGORY" value="${pd.QUESTIONCATEGORY}" maxlength="32" placeholder="这里输入问题分类" title="问题分类"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">产品名称:</td>
				<td><input type="text" name="PRODUCTNAME" id="PRODUCTNAME" value="${pd.PRODUCTNAME}" maxlength="32" placeholder="这里输入产品名称" title="产品名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">项目名称:</td>
				<td><input type="text" name="PROJECTNAME" id="PROJECTNAME" value="${pd.PROJECTNAME}" maxlength="32" placeholder="这里输入项目名称" title="项目名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">缺陷数量:</td>
				<td><input type="text" name="UNQUALIFIEDQUANTITY" id="UNQUALIFIEDQUANTITY" value="${pd.UNQUALIFIEDQUANTITY}" maxlength="32" placeholder="这里输入缺陷数量" title="缺陷数量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">停机时间:</td>
				<td><input type="text" name="DOWNTIME" id="DOWNTIME" value="${pd.DOWNTIME}" maxlength="32" placeholder="这里输入停机时间" title="停机时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题严重程度:</td>
				<td><input type="text" name="SERVRITY" id="SERVRITY" value="${pd.SERVRITY}" maxlength="32" placeholder="这里输入问题严重程度" title="问题严重程度"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题来源:</td>
				<td><input type="text" name="PROBLEMSOURCE" id="PROBLEMSOURCE" value="${pd.PROBLEMSOURCE}" maxlength="32" placeholder="这里输入问题来源" title="问题来源"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">缺陷症状描述:</td>
				<td><input type="text" name="DEFECTDESCRIPTION" id="DEFECTDESCRIPTION" value="${pd.DEFECTDESCRIPTION}" maxlength="32" placeholder="这里输入缺陷症状描述" title="缺陷症状描述"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否重复:</td>
				<td><input type="text" name="WHETHERREPEAT" id="WHETHERREPEAT" value="${pd.WHETHERREPEAT}" maxlength="32" placeholder="这里输入是否重复" title="是否重复"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否来料相关:</td>
				<td><input type="text" name="INCOMINGRALATED" id="INCOMINGRALATED" value="${pd.INCOMINGRALATED}" maxlength="32" placeholder="这里输入是否来料相关" title="是否来料相关"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">供应商名字:</td>
				<td><input type="text" name="SUPPLIERNAME" id="SUPPLIERNAME" value="${pd.SUPPLIERNAME}" maxlength="32" placeholder="这里输入供应商名字" title="供应商名字"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">参考经验教训:</td>
				<td><input type="text" name="REFERENCELESSONS" id="REFERENCELESSONS" value="${pd.REFERENCELESSONS}" maxlength="32" placeholder="这里输入参考经验教训" title="参考经验教训"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">初判责任部门:</td>
				<td><input type="text" name="FIRSTDEPARTMENT" id="FIRSTDEPARTMENT" value="${pd.FIRSTDEPARTMENT}" maxlength="32" placeholder="这里输入初判责任部门" title="初判责任部门"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">类型:</td>
				<td><input type="text" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="32" placeholder="这里输入类型" title="类型"/></td>
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
				<td style="width:70px;text-align: right;padding-top: 13px;">删除标识:</td>
				<td><input type="text" name="DELETED" id="DELETED" value="${pd.DELETED}" maxlength="32" placeholder="这里输入删除标识" title="删除标识"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">完成状态:</td>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入完成状态" title="完成状态"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">处理状态:</td>
				<td><input type="text" name="PROCESSTATE" id="PROCESSTATE" value="${pd.PROCESSTATE}" maxlength="32" placeholder="这里输入处理状态" title="处理状态"/></td>
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