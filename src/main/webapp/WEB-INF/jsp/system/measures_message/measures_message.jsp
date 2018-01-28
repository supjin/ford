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
		if($("#MEASURESTITLE").val()==""){
			$("#MEASURESTITLE").tips({
				side:3,
	            msg:'请输入标题',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MEASURESTITLE").focus();
			return false;
		}
		if($("#MEASURESNAME").val()==""){
			$("#MEASURESNAME").tips({
				side:3,
	            msg:'请输入措施',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MEASURESNAME").focus();
			return false;
		}
		if($("#EFFICIENT").val()==""){
			$("#EFFICIENT").tips({
				side:3,
	            msg:'请输入有效率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EFFICIENT").focus();
			return false;
		}
		if($("#VALIDATION").val()==""){
			$("#VALIDATION").tips({
				side:3,
	            msg:'请输入验证/证实',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VALIDATION").focus();
			return false;
		}
		
		//附件
	/* 	var accessory = "";
		
		$(".fujian").each(function(index,el){
			var realname = $(this).text();
			var name = $(this).next().val();
			var str = realname + ":" + name +";";
			accessory += str;
		});
		$("#ATTACHMENT").val(accessory); */
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="measures_message/${msg }.do" name="Form" id="Form" method="post">
	<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		<input type="hidden" name="MEASURES_MESSAGE_ID" id="MEASURES_MESSAGE_ID" value="${pd.MEASURES_MESSAGE_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">标题:</td>
				<td><input style="width: 50%"  name="MEASURESTITLE"  readonly="readonly" id="MEASURESTITLE" value="${pd.MEASURESTITLE}" maxlength="60" type="text" title="标题"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">临时措施:</td>
				<td>
				<textarea rows="5" name="MEASURESNAME" id="MEASURESNAME"  readonly="readonly"  maxlength="250" style="width: 90%;">${pd.MEASURESNAME}</textarea>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">上传附件</td>
				<td>
					<a href="${fns:getConfig('IMGURL')}/${pd.serverName}" class='fujian'>${pd.realName}</a>
					<div id="submyfile"></div>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">有效率:</td>
				<td><input style="width: 50%"  name="EFFICIENT" id="EFFICIENT"  readonly="readonly" value="${pd.EFFICIENT}" type="text" title="有效率"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">验证/证实:</td>
				<td><input style="width: 50%"  name="VALIDATION" id="VALIDATION"  readonly="readonly" value="${pd.VALIDATION}" type="text"  title="验证/证实"/></td>
			</tr>
			
			<tr>
				<td style="width:88px;text-align: right;padding-top: 13px;">预计实施时间:</td>
				<td><input style="width: 53%"  name="DOTIME" id="DOTIME" value="${pd.DOTIME}" type="text" readonly="readonly" title="实施时间"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<!-- <a class="btn btn-mini btn-primary" onclick="save();">保存</a> -->
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回</a>
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
		<!-- 编辑框-->
		<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
		<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
		<!-- 编辑框-->
		<script type="text/javascript" src="static/js/myjs/headEmail.js"></script>
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
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