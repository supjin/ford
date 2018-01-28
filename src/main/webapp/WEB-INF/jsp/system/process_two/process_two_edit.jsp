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
		if($("#WHATOBJECT").val()==""){
			$("#WHATOBJECT").tips({
				side:3,
	            msg:'请输入Object 对象',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHATOBJECT").focus();
			return false;
		}
		if($("#WHATDEFECT").val()==""){
			$("#WHATDEFECT").tips({
				side:3,
	            msg:'请输入Defect缺陷',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHATDEFECT").focus();
			return false;
		}
		if($("#WHEREVEHICLEOR").val()==""){
			$("#WHEREVEHICLEOR").tips({
				side:3,
	            msg:'请输入On Vehicle or Object',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHEREVEHICLEOR").focus();
			return false;
		}
		if($("#WHEREFIRSTOBSERVED").val()==""){
			$("#WHEREFIRSTOBSERVED").tips({
				side:3,
	            msg:'请输入First Observed & Seen Since',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHEREFIRSTOBSERVED").focus();
			return false;
		}
		if($("#WHENSINCE").val()==""){
			$("#WHENSINCE").tips({
				side:3,
	            msg:'请输入First Observed & Seen Since',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHENSINCE").focus();
			return false;
		}
		if($("#WHENPATTERN").val()==""){
			$("#WHENPATTERN").tips({
				side:3,
	            msg:'请输入Pattern Since 形式',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHENPATTERN").focus();
			return false;
		}
		if($("#HOWDEFECT").val()==""){
			$("#HOWDEFECT").tips({
				side:3,
	            msg:'请输入Defects per Object 每件的缺陷数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HOWDEFECT").focus();
			return false;
		}
		if($("#HOWTREND").val()==""){
			$("#HOWTREND").tips({
				side:3,
	            msg:'请输入Trend 趋势',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HOWTREND").focus();
			return false;
		}
		if($("#WHATINFO").val()==""){
			$("#WHATINFO").tips({
				side:3,
	            msg:'请输入what 获得信息',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHATINFO").focus();
			return false;
		}
		if($("#WHATIFODEFECT").val()==""){
			$("#WHATIFODEFECT").tips({
				side:3,
	            msg:'请输入缺陷获得信息',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHATIFODEFECT").focus();
			return false;
		}
		if($("#WHEREINFOVEHICLE").val()==""){
			$("#WHEREINFOVEHICLE").tips({
				side:3,
	            msg:'请输入地点获得信息',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHEREINFOVEHICLE").focus();
			return false;
		}
		if($("#WHEREOBSERVED").val()==""){
			$("#WHEREOBSERVED").tips({
				side:3,
	            msg:'请输入地点二获得信息',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHEREOBSERVED").focus();
			return false;
		}
		if($("#HOWMAGNITUDE").val()==""){
			$("#HOWMAGNITUDE").tips({
				side:3,
	            msg:'请输入Magnitude 等级',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HOWMAGNITUDE").focus();
			return false;
		}
		if($("#WHENONE").val()==""){
			$("#WHENONE").tips({
				side:3,
	            msg:'请输入世间获得信息一',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHENONE").focus();
			return false;
		}
		if($("#WHENTWO").val()==""){
			$("#WHENTWO").tips({
				side:3,
	            msg:'请输入时间2',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#WHENTWO").focus();
			return false;
		}
		if($("#HOWONEINFO").val()==""){
			$("#HOWONEINFO").tips({
				side:3,
	            msg:'请输入程度一',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HOWONEINFO").focus();
			return false;
		}
		if($("#HOWTWOINFO").val()==""){
			$("#HOWTWOINFO").tips({
				side:3,
	            msg:'请输入程度二',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HOWTWOINFO").focus();
			return false;
		}
		if($("#HOWTHREEINFO").val()==""){
			$("#HOWTHREEINFO").tips({
				side:3,
	            msg:'请输入程度三',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#HOWTHREEINFO").focus();
			return false;
		}
		if($("#USERID").val()==""){
			$("#USERID").tips({
				side:3,
	            msg:'请输入处理人id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERID").focus();
			return false;
		}
		if($("#PRINCIPALNAME").val()==""){
			$("#PRINCIPALNAME").tips({
				side:3,
	            msg:'请输入d2负责人',
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
		if($("#PRINCIPALD_THREENAME").val()==""){
			$("#PRINCIPALD_THREENAME").tips({
				side:3,
	            msg:'请输入d3负责人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRINCIPALD_THREENAME").focus();
			return false;
		}
		if($("#EXECUTIONDATE").val()==""){
			$("#EXECUTIONDATE").tips({
				side:3,
	            msg:'请输入执行日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXECUTIONDATE").focus();
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
	<form action=" process_two/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name=" PROCESS_TWO_ID" id=" PROCESS_TWO_ID" value="${pd. PROCESS_TWO_ID}"/>
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
				<td style="width:70px;text-align: right;padding-top: 13px;">Object 对象:</td>
				<td><input type="text" name="WHATOBJECT" id="WHATOBJECT" value="${pd.WHATOBJECT}" maxlength="32" placeholder="这里输入Object 对象" title="Object 对象"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">Defect缺陷:</td>
				<td><input type="text" name="WHATDEFECT" id="WHATDEFECT" value="${pd.WHATDEFECT}" maxlength="32" placeholder="这里输入Defect缺陷" title="Defect缺陷"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">On Vehicle or Object:</td>
				<td><input type="text" name="WHEREVEHICLEOR" id="WHEREVEHICLEOR" value="${pd.WHEREVEHICLEOR}" maxlength="32" placeholder="这里输入On Vehicle or Object" title="On Vehicle or Object"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">First Observed & Seen Since:</td>
				<td><input type="text" name="WHEREFIRSTOBSERVED" id="WHEREFIRSTOBSERVED" value="${pd.WHEREFIRSTOBSERVED}" maxlength="32" placeholder="这里输入First Observed & Seen Since" title="First Observed & Seen Since"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">First Observed & Seen Since:</td>
				<td><input type="text" name="WHENSINCE" id="WHENSINCE" value="${pd.WHENSINCE}" maxlength="32" placeholder="这里输入First Observed & Seen Since" title="First Observed & Seen Since"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">Pattern Since 形式:</td>
				<td><input type="text" name="WHENPATTERN" id="WHENPATTERN" value="${pd.WHENPATTERN}" maxlength="32" placeholder="这里输入Pattern Since 形式" title="Pattern Since 形式"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">Defects per Object 每件的缺陷数:</td>
				<td><input type="text" name="HOWDEFECT" id="HOWDEFECT" value="${pd.HOWDEFECT}" maxlength="32" placeholder="这里输入Defects per Object 每件的缺陷数" title="Defects per Object 每件的缺陷数"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">Trend 趋势:</td>
				<td><input type="text" name="HOWTREND" id="HOWTREND" value="${pd.HOWTREND}" maxlength="32" placeholder="这里输入Trend 趋势" title="Trend 趋势"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">what 获得信息:</td>
				<td><input type="text" name="WHATINFO" id="WHATINFO" value="${pd.WHATINFO}" maxlength="32" placeholder="这里输入what 获得信息" title="what 获得信息"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">缺陷获得信息:</td>
				<td><input type="text" name="WHATIFODEFECT" id="WHATIFODEFECT" value="${pd.WHATIFODEFECT}" maxlength="32" placeholder="这里输入缺陷获得信息" title="缺陷获得信息"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">地点获得信息:</td>
				<td><input type="text" name="WHEREINFOVEHICLE" id="WHEREINFOVEHICLE" value="${pd.WHEREINFOVEHICLE}" maxlength="32" placeholder="这里输入地点获得信息" title="地点获得信息"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">地点二获得信息:</td>
				<td><input type="text" name="WHEREOBSERVED" id="WHEREOBSERVED" value="${pd.WHEREOBSERVED}" maxlength="32" placeholder="这里输入地点二获得信息" title="地点二获得信息"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">Magnitude 等级:</td>
				<td><input type="text" name="HOWMAGNITUDE" id="HOWMAGNITUDE" value="${pd.HOWMAGNITUDE}" maxlength="32" placeholder="这里输入Magnitude 等级" title="Magnitude 等级"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">世间获得信息一:</td>
				<td><input type="text" name="WHENONE" id="WHENONE" value="${pd.WHENONE}" maxlength="32" placeholder="这里输入世间获得信息一" title="世间获得信息一"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">时间2:</td>
				<td><input type="text" name="WHENTWO" id="WHENTWO" value="${pd.WHENTWO}" maxlength="32" placeholder="这里输入时间2" title="时间2"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">程度一:</td>
				<td><input type="text" name="HOWONEINFO" id="HOWONEINFO" value="${pd.HOWONEINFO}" maxlength="32" placeholder="这里输入程度一" title="程度一"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">程度二:</td>
				<td><input type="text" name="HOWTWOINFO" id="HOWTWOINFO" value="${pd.HOWTWOINFO}" maxlength="32" placeholder="这里输入程度二" title="程度二"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">程度三:</td>
				<td><input type="text" name="HOWTHREEINFO" id="HOWTHREEINFO" value="${pd.HOWTHREEINFO}" maxlength="32" placeholder="这里输入程度三" title="程度三"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">处理人id:</td>
				<td><input type="text" name="USERID" id="USERID" value="${pd.USERID}" maxlength="32" placeholder="这里输入处理人id" title="处理人id"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">d2负责人:</td>
				<td><input type="text" name="PRINCIPALNAME" id="PRINCIPALNAME" value="${pd.PRINCIPALNAME}" maxlength="32" placeholder="这里输入d2负责人" title="d2负责人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">执行人:</td>
				<td><input type="text" name="EXECUTIVENAME" id="EXECUTIVENAME" value="${pd.EXECUTIVENAME}" maxlength="32" placeholder="这里输入执行人" title="执行人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">d3负责人:</td>
				<td><input type="text" name="PRINCIPALD_THREENAME" id="PRINCIPALD_THREENAME" value="${pd.PRINCIPALD_THREENAME}" maxlength="32" placeholder="这里输入d3负责人" title="d3负责人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">执行日期:</td>
				<td><input type="text" name="EXECUTIONDATE" id="EXECUTIONDATE" value="${pd.EXECUTIONDATE}" maxlength="32" placeholder="这里输入执行日期" title="执行日期"/></td>
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