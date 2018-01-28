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
			if($("#DEPT").val()==""){
			$("#DEPT").tips({
				side:3,
	            msg:'请输入部门',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DEPT").focus();
			return false;
		}
		if($("#PERSONNEL_NAME").val()==""){
			$("#PERSONNEL_NAME").tips({
				side:3,
	            msg:'请输入人员姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PERSONNEL_NAME").focus();
			return false;
		}
		if($("#PHONE").val()==""){
			$("#PHONE").tips({
				side:3,
	            msg:'请输入电话',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PHONE").focus();
			return false;
		}
		if($("#POSITION").val()==""){
			$("#POSITION").tips({
				side:3,
	            msg:'请输入职位',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#POSITION").focus();
			return false;
		}
		if($("#STEPS").val()==""){
			$("#STEPS").tips({
				side:3,
	            msg:'请输入步骤负责人id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STEPS").focus();
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
		if($("#PROCESS_ONE_ID").val()==""){
			$("#PROCESS_ONE_ID").tips({
				side:3,
	            msg:'请输入d1_id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCESS_ONE_ID").focus();
			return false;
		}
		if($("#PLAN_ID").val()==""){
			$("#PLAN_ID").tips({
				side:3,
	            msg:'请输入问题计划id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PLAN_ID").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
		  <tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">角色:</td>
				<td>
				
			    <select class="select" name="STEPS" id="STEPS" data-placeholder="请选择" style="vertical-align:top;width: 100%;">
							  <option value="1">团队领导</option>
							  <option value="2">团队成员</option>
							
				</select>
				
				
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">部门:</td>
				<td>
				<select class="select" name="DEPT" id="DEPT" data-placeholder="请选择人员" style="vertical-align:top;width: 100%;">
							<c:forEach items="${deptList}" var="var">
							   <option value="${var.DEPARTMENT_NAME}" at="${var.DEPARTMENT_ID}">${var.DEPARTMENT_NAME}</option>
							</c:forEach>
				</select>
	<%-- 			<input type="text" name="DEPT" id="DEPT" value="${userfind.DEPARTMENT_NAME}" maxlength="32" placeholder="这里输入部门" title="部门"/> --%></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">人员姓名:</td>
				<td>
				
				<select class="select" name="PERSONNEL_NAME" id="PERSONNEL_NAME" data-placeholder="请选择人员" style="vertical-align:top;width: 100%;">
							<c:forEach items="${userall}" var="var">
							  <option  value="${var.NAME}" uid="${var.USER_ID}" <c:if test="${var.USER_ID eq userfind.USER_ID}">selected="selected"</c:if>>${var.NAME}</option>
							 
							</c:forEach>
				</select>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">职位:</td>
				<td><input type="text" name="POSITION" id="POSITION" value="${userfind.ROLE_NAME}" maxlength="32" placeholder="这里输入职位" title="职位"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">电话:</td>
				<td><input type="text" name="PHONE" id="PHONE" value="${userfind.PHONE}" maxlength="32" placeholder="这里输入电话" title="电话"/></td>
			</tr>
			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}" maxlength="32" placeholder="这里输入问题id" title="问题id"/>
			<input type="hidden" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="32" placeholder="这里输入公司id" title="公司id"/>
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
			
			
			
			
			$('#PERSONNEL_NAME').change(function(){
			     var uid=$(this).children('option:selected').attr("uid")
			     alert(uid)
			     var thi= $(this);
			       //二级下拉框
			      
						$.ajax({
							type : "POST",
							url : '${ctx}/teamd1/ajaxuserinfo',
							data : {"USER_ID":uid},
							async: false,
							dataType : 'json',
							success : function(data) {
								if(data.message=="1"){ 
								var users=data.userfind;
								    
								/* $("#DEPT").val(users.DEPARTMENT_NAME); */
								$("#POSITION").val(users.ROLE_NAME);
								$("#PHONE").val(users.PHONE);
								}
									
								
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								alert("操作无效");
							}
					})
			 
			});
			//部门二级联动
			
			$('#DEPT').change(function(){
			     var peptid=$(this).children('option:selected').attr("at")
			     var thi= $(this);
			       //二级下拉框
			      /*  var a=$(thi).parent().siblings().children(); */
			      var a=$("#PERSONNEL_NAME");
			          $(a).empty();
						$.ajax({
							type : "POST",
							url : '${ctx}/department/deptAjas',
							data : {"DEPARTMENT_ID":peptid},
							async: false,
							dataType : 'json',
							success : function(data) {
								if(data.message=="1"){ 
								var users=data.deptuser;
								var str="";
									for (var i = 0; i < users.length; i++) {
										/* str+="<option value=\""+users[i].NAME+"\">"+users[i].NAME+"</option>" */
										
										str+="<option  value=\""+users[i].NAME+"\" uid=\""+users[i].USER_ID+"\" >"+users[i].NAME+"</option>"
									}
									$(a).append(str);
									$('#PERSONNEL_NAME').change();
								}
									
								
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								alert("操作无效");
							}
					})
			 
			});
			
			// 初始化部门 人员 信息
			$('#DEPT').change();
			
		});
		
		</script>
</body>
</html>