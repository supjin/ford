<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/setting/taglib.jsp"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>${pd.SYSNAME}</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx }/static/css/pwpublic.css" />
<link rel="stylesheet" href="${ctx }/static/css/login.css" />
<script type="text/javascript" src="${ctx }/static/js/jquery-1.9.1.js" ></script>
	</head>
	<body style="background-color: #efefef;">
		<div class="login_box">
		    <div class="login_tit1"><em><img src="${ctx }/static/img/logo.png"/></em>重庆睿博光电</div>
			<div class="login_tit2">DQOS数字化质量操作系统</div>
		</div>
			<form action="" method="post" name="loginForm"id="loginForm">
		<div class="login_div">
			<div class="login_ado">
				<p>用户名：</p>
				<input type="text" name="loginname" id="loginname" placeholder="请输入用户名"/>
			</div>
			<div class="login_ado">
				<p>密　码：</p>
				<input type="password"  name="password" id="password" placeholder="请输入密码"/>
			</div>
			
			<div class="login_adoos">
			    <p>验证码：</p>
				<input type="text" name="code" id="code" class="login_code" />
				<i><img id="codeImg" alt="点击更换" title="点击更换" src="" /></i>
		    </div>
		    
			<div class="login_sty">
			    <label class="login_styri"><input type="checkbox"  id="saveid" onclick="savePaw();"/>记住密码</label>
			</div>
			
			<button class="login_btn" id="to-recover" onclick="severCheck();" type="button">登 录</button>
		</div>
			</form>

	<script type="text/javascript">
	
		//服务器校验
		function severCheck(){
			if(check()){
				
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: '${ctx}/login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="${ctx}/main/index";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "${ctx}/code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {

				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {

				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#code").focus();
				return false;
			}

			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		function quxiao() {
			$("#loginname").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>

	<script src="${ctx }/static/js/bootstrap.min.js"></script>
	<script src="${ctx }/static/js/jquery-1.7.2.js"></script>
	<script src="${ctx }/static/login/js/jquery.easing.1.3.js"></script>
	<script src="${ctx }/static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="${ctx }/static/login/js/camera.min.js"></script>
	<script src="${ctx }/static/login/js/templatemo_script.js"></script>
	<script type="text/javascript" src="${ctx }/static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="${ctx }/static/js/jquery.cookie.js"></script>
</body>

</html>