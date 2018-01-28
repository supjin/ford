<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<meta name="format-detection"
	content="telephone=no,email=no,date=no,address=no">
<title>设备管理</title>
<link rel="stylesheet"
	href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
<link rel="stylesheet"href="${ctx }/static/fords/css/font-awesome.min.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
<script type="text/javascript"src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
<script type="text/javascript"src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js"></script>
    <script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
</head>
<body style="background-color: #edeff5; margin: 15px;">
	<div class="oiswen_box oiswen_boxavite">
		<!---顶部--->
		<div class="oiswen_titop">
			<div class="oiswen_titople">
				<div class="oiswen_titoplea">设备管理</div>
				<div class="oiswen_titopleb">
					<a href="javascript:;"><span
						class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a
						href="javascript:;">系统管理</a><span>/</span><a href="javascript:;">设备管理</a>
				</div>
			</div>
		</div>
		<!----问题采集---->
		<div class="wenti_box">
			<div class="container">
				<div class="row">
					<form id="Form">
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>设备名称</p>
								<input type="hidden" name="EQUIPMENTDETAIL_ID" id="EQUIPMENTDETAIL_ID" value="${pd.EQUIPMENTDETAIL_ID}" />
								<input type="text" name="NAME" id="NAME" value="${pd.NAME}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>设备编号</p>
								<input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>规格/型号</p>
								<input type="text" name="MODEL" id="MODEL" value="${pd.MODEL}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>功率</p>
								<input type="text" name="POWER" id="POWER"  value="${pd.POWER}"/>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>位置</p>
								<input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>品牌</p>
								<input type="text" name="BRAND" id="BRAND"  value="${pd.BRAND}"/>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>设备类别</p>
								<input type="text" name="CATEGORY" id="CATEGORY" value="${pd.CATEGORY}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>厂家</p>
								<input type="text" name="MANUFACTOR" id="MANUFACTOR" value="${pd.MANUFACTOR}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>到厂日期</p>
								<input type="txt" class="layui-input test-item pw_layimg " name="FACTORYDATE" id="FACTORYDATE" value="${pd.FACTORYDATE}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>联系人</p>
								<input type="text" name="CONTACTS" id="CONTACTS" value="${pd.CONTACTS}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>联系电话</p>
								<input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" />
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>备注</p>
								<input type="text" name="REMARKS" id="REMARKS" value="${pd.REMARKS}" />
							</div>
						</div>
					</form>
				</div>

			</div>
			<div class="acq_boxtx">
				<button type="button" class="jxbutton" onclick="history.go(-1)">关闭</button>
				<button type="button" class="tibutton" onclick="add();">提交</button>
				
				<c:if test="${pd.EQUIPMENTDETAIL_ID == null }">
				<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/equipmentdetail/goAdd'">继续添加</button>
				</c:if>
			</div>

		</div>

	</div>
	<script>
		$(function() {

		})

		function add() {

			$.ajax({
				type : "POST",
				url : '${ctx}/equipmentdetail/save',
				data : $("#Form").serialize(),
				dataType : 'json',
				async : false,
				cache : false,
				success : function(data) {
					if ("0" == data.status) {
						alert2("保存成功！");
					}else{
						alert2("保存失败！");
						
					}

				},

				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("系统繁忙请稍后再试");
				}
			});

		}
		 //同时绑定多个
		lay('.test-item').each(function(){
			laydate.render({
			    elem: this
			    ,trigger: 'click'//点击出发日期
			    ,type: 'date'//年月日
			    ,format: 'yyyy-MM-dd'//自定义格式
			    ,theme: 'molv'//墨绿色
			});
		});	
	</script>
</body>
</html>
