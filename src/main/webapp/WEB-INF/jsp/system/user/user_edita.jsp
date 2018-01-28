<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>成员录入</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="${ctx }/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
		<!--下拉框  -->
		<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
		<script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js" ></script>
		<style>
		    body .chzn-container-single .chzn-single span{
		        padding:2px 0px;
		    }
		    body .chzn-container-single .chzn-single{
		        border-radius:0px;
		        webkit-border-radius:0px;
		        -moz-border-radius:0px;
		    }
		</style>
	</head>

	<body style="background-color:#edeff5;margin: 15px;">
		<div class="oiswen_box oiswen_boxavite">
			<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">成员录入</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span>
						<a href="javascript:;">系统工具</a><span>/</span>
						<a href="javascript:;">成员录入</a>
					</div>
				</div>
			</div>
			<!----问题采集---->
			<div class="wenti_box">
				<div class="container">
						<form action="" name="coetForm" id="coetForm">
					<div class="row">
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>用户名</p>
								<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
								<input type="text"  name="USERNAME" id="loginname" value="${pd.USERNAME }" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>密码</p>
								<input type="password" name="PASSWORD" id="password" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>确认密码</p>
								<input type="password" name="chkpwd" id="chkpwd"/>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>姓名</p>
								<input type="text"  name="NAME" id="name"  value="${pd.NAME }" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>邮箱</p>
								<input type="text"  name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" onblur="hasE('${pd.USERNAME }')"/>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>工号</p>
								<input type="text"  name="WORKNUMBER" id="WORKNUMBER"  value="${pd.WORKNUMBER }" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>电话号码</p>
								<input type="text" name="PHONE" id="PHONE"  value="${pd.PHONE }" />
							</div>
						</div>

						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>部门</p>
								<input type="hidden"  name="DEPARTMENT_ID" id="DEPARTMENT_ID"  value="${pd.DEPARTMENT_ID }"/>
								<select class="chzn-select" name="DEPARTMENT_NAME" id="DEPARTMENT_NAME" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
									<option ></option>
							     	<c:forEach items="${deList }" var="var">
			                    	<option value="${var.DEPARTMENT_NAME }" <c:if test="${pd.DEPARTMENT_NAME == var.DEPARTMENT_NAME }"> selected="selected"</c:if>>${var.DEPARTMENT_NAME }</option>
			            			</c:forEach>
								</select>
							</div>
						</div>

						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>子部门</p>
								<input type="hidden"  name="SUBDEPARTMEN" id="SUBDEPARTMEN"  value="${pd.SUBDEPARTMEN }"/>
								<select class="chzn-select" name="SUBDEPARTMEN" id="SUBDEPARTMEN" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
									<option ></option>
							     	<c:forEach items="${suList }" var="var">
			                    	<option value="${var.SUBDEPARTMEN }" <c:if test="${pd.SUBDEPARTMEN == var.SUBDEPARTMEN }"> selected="selected"</c:if>>${var.SUBDEPARTMEN }</option>
			            			</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>岗位</p>
								<select class="chzn-select" name="ROLE_ID" id="ROLE_ID" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
									<option ></option>
							     	<c:forEach items="${roleList }" var="var">
			                    	<option value="${var.ROLE_ID }" <c:if test="${pd.ROLE_ID == var.ROLE_ID }"> selected="selected"</c:if>>${var.ROLE_NAME }</option>
			            			</c:forEach>
								</select>
							</div>
						</div>

					</div>
					<div class="acq_boxtx">
						<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/user/listUsers.do'">取消</button>
						<button type="button" class="tibutton">提交</button>
						<c:if test="${pd.USER_ID == null }">
						<button type="button" class="jxbutton" onclick="window.location.href='${ctx }/user/goAddU'">继续添加</button>
						</c:if>
					</div>
				</form>
				</div>

			</div>
			<script>
				$(function() {
					$(".chzn-select").chosen({
						search_contains: true,
						enable_split_word_search: true
					});
					$(document).on("click", ".tibutton", function() {
						
						if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
							
							$("#loginname").tips({
								side:3,
					            msg:'输入用户名',
					            bg:'#AE81FF',
					            time:2
					        });
							
							$("#loginname").focus();
							$("#loginname").val('');
							$("#loginname").css("background-color","white");
							return false;
						}else{
							$("#loginname").val(jQuery.trim($('#loginname').val()));
						}	
						

						if($("#user_id").val()=="" && $("#password").val()==""){
							
							$("#password").tips({
								side:3,
					            msg:'输入密码',
					            bg:'#AE81FF',
					            time:2
					        });
							
							$("#password").focus();
							return false;
						}
						if($("#password").val()!=$("#chkpwd").val()){
							
							$("#chkpwd").tips({
								side:3,
					            msg:'两次密码不相同',
					            bg:'#AE81FF',
					            time:3
					        });
							
							$("#chkpwd").focus();
							return false;
						}
						
						if($("#name").val()==""){
							
							$("#name").tips({
								side:3,
					            msg:'输入姓名',
					            bg:'#AE81FF',
					            time:3
					        });
							$("#name").focus();
							return false;
						}

						if($("#EMAIL").val()==""){
							
							$("#EMAIL").tips({
								side:3,
					            msg:'输入邮箱',
					            bg:'#AE81FF',
					            time:3
					        });
							$("#EMAIL").focus();
							return false;
						}else if(!ismail($("#EMAIL").val())){
							$("#EMAIL").tips({
								side:3,
					            msg:'邮箱格式不正确',
					            bg:'#AE81FF',
					            time:3
					        });
							$("#EMAIL").focus();
							return false;
						}
						var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
						if($("#PHONE").val()==""){
							
							$("#PHONE").tips({
								side:3,
					            msg:'输入手机号',
					            bg:'#AE81FF',
					            time:3
					        });
							$("#PHONE").focus();
							return false;
						}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
							$("#PHONE").tips({
								side:3,
					            msg:'手机号格式不正确',
					            bg:'#AE81FF',
					            time:3
					        });
							$("#PHONE").focus();
							return false;
						}
						
						function ismail(mail){
							return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
						}
						
						$("#DEPARTMENT_ID").val($("#DEPARTMENT_NAME>option:selected").attr("atid"));
						
						
						if($("#user_id").val()==""){
							hasU();
						}else{
							saveUS();	
						}
						
						
						
						
						
					})
			
					
				})
					function saveUS(){
						$.ajax({
							type: "POST",
							url: "${ctx}/user/saveUS",
							data: $("#coetForm").serialize(),
							success: function(data) {
								if(data.states==1){
									alert2("没有权限！");
								}else{
									alert2("保存成功！");
									$("#user_id").val(data.USER_ID)
								}
								
							},
							error: function() {
								alert("上传失败");
							}
						});
					}
						//判断用户名是否存在
					function hasU(){
						var USERNAME = $.trim($("#loginname").val());
						$.ajax({
							type: "POST",
							url: '${ctx}/user/hasU.do',
					    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
							dataType:'json',
							cache: false,
							success: function(data){
								 if("success" != data.result){
									 setTimeout("$('#loginname').val('此用户名已存在!')",100);
								 }else{
									 saveUS();
								 }
							}
						});
					}
					
					//判断邮箱是否存在
					function hasE(USERNAME){
						var EMAIL = $.trim($("#EMAIL").val());
						$.ajax({
							type: "POST",
							url: '${ctx}/user/hasE.do',
					    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
							dataType:'json',
							cache: false,
							success: function(data){
								 if("success" != data.result){
									 $("#EMAIL").tips({
											side:3,
								            msg:'邮箱已存在',
								            bg:'#AE81FF',
								            time:3
								        });
									setTimeout("$('#EMAIL').val('')",2000);
								 }
							}
						});
					}
					
			</script>
	</body>

</html>