<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>沟通解决</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/defect.css" />
		<!-- 下拉框-->
		<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js"></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/seekall.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js"></script>
		<!-- 下拉框-->
		<script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js"></script>
		<style>
			.chzn-container-single .chzn-single {
				line-height: 33px;
				-webkit-border-radius: 0px;
				-moz-border-radius: 0px;
				border-radius: 0px;
			}
		</style>
	</head>

	<body style="background-color:#edeff5;margin: 15px;">
		<div class="oiswen_box oiswen_boxavite">
			<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">沟通解决</div>
					<div class="oiswen_titopleb">
						<a href="${ctx }/userspace/list.do"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span>
						<a href="javascript:;">现场问题</a><span>/</span>
						<a href="${ctx }/imper_troble/list.do">沟通解决</a>
					</div>
				</div>
			</div>
			<!----问题采集---->
			<div class="wenti_box">
				<form action="" name="imForm" id="imForm">
					<input type="hidden" name="IMPER_TROBLE_ID" id="IMPER_TROBLE_ID" value="${pd.IMPER_TROBLE_ID }">
					<div class="container">
						<div class="row">
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>缺陷编号</p>
									<div class="tadiv">${pd.IMPERFECTION_NUMBERING }</div>
									<input type="hidden" name="IMPERFECTION_NUMBERING" id="IMPERFECTION_NUMBERING" value="${pd.IMPERFECTION_NUMBERING }">
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>录入日期</p>
									<%-- <div class="tadiv">${pd.DANJUDATE }</div> --%>
									<!-- <input class="layui-input test-item pw_layimg shifenm  assd"  /> -->
									<input type="text" class="shifenm layui-input test-item pw_layimg" name="DANJUDATE" id="DANJUDATE" value="<fmt:formatDate value='${pd.DANJUDATE }' pattern='yyyy-MM-dd HH:mm' />"  />
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>录入人员</p>
									<div class="tadiv">${pd.LURUUSER }</div>
									<input type="hidden" name="LURUUSER" id="LURUUSER" value="${pd.LURUUSER }">
								</div>
							</div>
							
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>产品编号(内)</p>
									<select class="chzn-select" name="PRODUCTS_NAME" id="PRODUCTS_NAME" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
										<c:forEach items="${productList }" var="var">
											<option value="${var.CODEN }" atid="${var.PRODUCTNAME }" attid="${var.CODEK }" <c:if test="${pd.PRODUCTS_NAME == var.CODEN }"> selected="selected"</c:if>>${var.CODEN }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>产品名称</p>
									<div class="tadiv proname">${pd.PRODUCTS_NUMBERING }</div>
									<input type="hidden" name="PRODUCTS_NUMBERING" id="PRODUCTS_NUMBERING" value="${pd.PRODUCTS_NUMBERING }">
									<%-- <select class="chzn-select" name="PRODUCTS_NAME" id="PRODUCTS_NAME" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<c:forEach items="${productList }" var="var">
											<option value="${var.CODEN }" <c:if test="${pd.PRODUCTS_NAME == var.CODEN }"> selected="selected"</c:if>>${var.PRODUCTNAME }</option>
										</c:forEach>
									</select> --%>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>产品编号(外)</p>
									<div class="tadiv procok">${pd.PROCODEY }</div>
									<input type="hidden" name="PROCODEY" id="PROCODEY" value="${pd.PROCODEY }">
									<%-- <select class="chzn-select" name="CODEK" id="CODEK" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<c:forEach items="${productList }" var="var">
											<option value="${var.CODEN }" <c:if test="${pd.PRODUCTS_NAME == var.CODEN }"> selected="selected"</c:if>>${var.CODEK }</option>
										</c:forEach>
									</select> --%>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>处置意见</p>
									<select name="DISPOSAL">
										<option value="报废" <c:if test="${pd.DISPOSAL eq '报废' }">selected="selected"</c:if>>报废</option>
										<option value="返工/返修" <c:if test="${pd.DISPOSAL eq '返工/返修' }">selected="selected"</c:if>>返工/返修</option>
										<option value="让步使用" <c:if test="${pd.DISPOSAL eq '返工' }">selected="selected"</c:if>>让步使用</option>
										<option value="待评审" <c:if test="${pd.DISPOSAL eq '报销' }">selected="selected"</c:if>>待评审</option>
									</select>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>缺陷名称</p>
									<select class="chzn-select" name="IMPERFECTION_NAME" id="IMPERFECTION_NAME" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<c:forEach items="${failureList }" var="var">
											<option value="${var.FAILURENAME }" attid="${var.FAILURECODE }" <c:if test="${pd.IMPERFECTION_NAME == var.FAILURENAME}">selected</c:if>>${var.FAILURENAME }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>缺陷代码</p>
									<div class="tadiv quecode">${pd.IMPERFECTION_CODE }</div>
									<input type="hidden" name="IMPERFECTION_CODE" id="IMPERFECTION_CODE" value="${pd.IMPERFECTION_CODE }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>原因分类</p>
									<select name="REASONS_TYPE" id="REASONS_TYPE">
										<c:forEach items="${resList }" var="var">
											<option value="${var.VALUE }" <c:if test="${pd.REASONS_TYPE == var.VALUE}">selected</c:if>>${var.LABEL }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>设备名称</p>
									<select class="chzn-select" name="EQUIPMENT" id="EQUIPMENT" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
										<c:forEach items="${equipmentList }" var="var">
											<option value="${var.NUMBER }" attid="${var.NAME }" <c:if test="${pd.EQUIPMENT eq var.NUMBER }"> selected="selected"</c:if>>${var.NAME }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>设备编号</p>
									<div class="tadiv shecode">${pd.EQUIPMENT }</div>
									<input type="hidden" name="EQUIPMENT_NAME" id="EQUIPMENT_NAME" value="${pd.EQUIPMENT_NAME }">
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>车间</p>
									<input type="text" name="CHEJIAN" id="CHEJIAN" value="${pd.CHEJIAN }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>不合格数量</p>
									<input type="number" name="NONCONFORMITY" id="NONCONFORMITY" value="${pd.NONCONFORMITY }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>检查数量</p>
									<input type="number" name="CHECKNUM" id="CHECKNUM" value="${pd.CHECKNUM }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>检查日期</p>
									<!-- <input class="shifenm layui-input test-item pw_layimg  assd" onClick="laydate({istime: true, format: 'yyyy-MM-dd HH:mm'})" /> -->
									<input type="text" class="shifenm layui-input test-item pw_layimg " name="CHECKDATE" id="CHECKDATE" value="<fmt:formatDate value='${pd.CHECKDATE }' pattern='yyyy-MM-dd HH:mm' />" />
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>批次</p>
									<input type="text" name="BATCH" id="BATCH" value="${pd.BATCH }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>操作者</p>
									<input type="text" name="DOUSER" id="DOUSER" value="${pd.DOUSER }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>工序名称</p>
									<select class="chzn-select" name="PROCESS_NAME" id="PROCESS_NAME" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
										<c:forEach items="${procedureList }" var="var">
											<option value="${var.PROCEDURE }" attid="${var.PROCODE }" <c:if test="${pd.PROCESS_NAME == var.PROCEDURE}">selected="selected"</c:if>>${var.PROCEDURE }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>工序代码</p>
									<div class="tadiv gonxu">${pd.PROCESS_CODE }</div>
									<input type="hidden" name="PROCESS_CODE" id="PROCESS_CODE" value="${pd.PROCESS_CODE }">
									<%-- <input type="hidden" name="PROCESS_CODE" id="PROCESS_CODE" value="${pd.PROCESS_CODE }" /> --%>
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p class="fistcal">初判责任人</p>
									<select class="chzn-select" name="RESPONSEMAN" id="RESPONSEMAN" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
										<c:forEach items="${userList }" var="var">
											<option value="${var.USER_ID }" <c:if test="${var.USER_ID eq pd.RESPONSEMAN }"> selected="selected"</c:if>>${var.NAME }</option>
										</c:forEach>
									</select>

								</div>
							</div>
							<div class="col-sm-12 col-md-12 col-lg-12">
								<div class="inputboxa">
									<p>备注</p>
									<textarea name="REMARK">${pd.REMARK }</textarea>
								</div>
							</div>

						</div>
					</div>
					<div class="acq_boxtj">
						<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/imper_troble/list'">关闭</button>
						<button type="button" class="tibutton">提交</button>
						<c:if test="${(pd.IMPER_TROBLE_ID  == null) }">
						<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/imper_troble/goAndandEdit'">继续添加</button>
						</c:if>
					</div>
				</form>
			</div>

		</div>

		<script>
	
			//下拉框选择
			$(".chzn-select").chosen({
				search_contains: true,
				enable_split_word_search: true
			});
			$(function() {
				//失效输入框赋值
				$(document).on("click", ".dropdown-menu>li", function() {
					var a = $(this).children("a").html();
					$(this).parents(".input-group").find("input").val(a);
				})
				//提交数据
				$(document).on("click", ".tibutton", function() {
					$("")
					if($("#PRODUCTS_NUMBERING").val() == "") {
						$("#PRODUCTS_NUMBERING").tips({
							side: 3,
							msg: '请选择产品编号',
							bg: '#AE81FF',
							time: 2
						});
						$("#PRODUCTS_NUMBERING").focus();
						return false;
					}
					if($("#PRODUCTS_NAME").val() == "") {
						$("#PRODUCTS_NAME").tips({
							side: 3,
							msg: '请输入产品名称',
							bg: '#AE81FF',
							time: 2
						});
						$("#PRODUCTS_NAME").focus();
						return false;
					}
					/* if($("#IMPERFECTION_CODE").val() == "") {
						$("#IMPERFECTION_CODE").tips({
							side: 3,
							msg: '请输入缺陷编码',
							bg: '#AE81FF',
							time: 2
						});
						$("#IMPERFECTION_CODE").focus();
						return false;
					} */
					if($("#IMPERFECTION_NAME").val() == "") {
						$("#IMPERFECTION_NAME").tips({
							side: 3,
							msg: '请选择缺陷名称',
							bg: '#AE81FF',
							time: 2
						});
						$("#IMPERFECTION_NAME").focus();
						return false;
					}
					$.ajax({
						type: "POST",
						url: "${ctx}/imper_troble/addAndEdit",
						data: $("#imForm").serialize(),
						success: function(data) {
							alert2("保存成功！");
						},
						error: function() {
							alert2("操作无效");
						}
					});

				})
				$(document).on("change", "#PRODUCTS_NAME", function() {
					 var atis =  $(this).find('option:selected').attr("attid");
					 var atie =  $(this).find('option:selected').attr("atid");
					 $(".procok").html(atis);
					$(".proname").html(atie);
					$("#PRODUCTS_NUMBERING").val(atie);
					$("#PROCODEY").val(atis);
					/* var PRODUCTS_NUMBERING = $(this).val();
					$.ajax({
						type: "POST",
						url: "${ctx}/imperfection_entry/getProductN",
						data: {
							CODEN: PRODUCTS_NUMBERING
						},
						success: function(data) {
							
							$(".procok").html(data.CODEK);
							$(".proname").html(data.PRODUCTNAME);
							$("#PRODUCTS_NUMBERING").val(data.PRODUCTNAME);
							
						},
						error: function() {
							alert2("操作无效");
						}
					}); */
				})
				$(document).on("change", "#EQUIPMENT", function() {
					var atie =  $(this).find('option:selected').val();
					var atis =  $(this).find('option:selected').attr("attid");
					 $(".shecode").html(atie);
					$("#EQUIPMENT_NAME").val(atis);
					/* var EQUIPMENT = $("#EQUIPMENT").val();
					$.ajax({
						type: "POST",
						url: "${ctx}/imperfection_entry/getEquiptN",
						data: {
							NUMBER: EQUIPMENT
						},
						success: function(data) {
							$(".shecode").html(data.NUMBER);
						},
						error: function() {
							alert2("操作无效");
						}
					}); */
				})
				$(document).on("change", "#PROCESS_NAME", function() {
					var atis =  $(this).find('option:selected').attr("attid");
					 $(".gonxu").html(atis);
					$("#PROCESS_CODE").val(atis);
					/* var PROCESS_NAME = $("#PROCESS_NAME").val();
					$.ajax({
						type: "POST",
						url: "${ctx}/imperfection_entry/getProcesB",
						data: {
							PROCEDURE: PROCESS_NAME
						},
						success: function(data) {
							$(".gonxu").html(data.PROCODE);
						},
						error: function() {
							alert2("操作无效");
						}
					}); */
				})
			$(document).on("change", "#IMPERFECTION_NAME", function() {
					var atis =  $(this).find('option:selected').attr("attid");
					 $(".quecode").html(atis);
					$("#IMPERFECTION_CODE").val(atis);
					/* var PROCESS_NAME = $("#PROCESS_NAME").val();
					$.ajax({
						type: "POST",
						url: "${ctx}/imperfection_entry/getProcesB",
						data: {
							PROCEDURE: PROCESS_NAME
						},
						success: function(data) {
							$(".gonxu").html(data.PROCODE);
						},
						error: function() {
							alert2("操作无效");
						}
					}); */
				})
				
			})
			 //同时绑定多个
			lay('.test-item').each(function(){
				laydate.render({
				    elem: this
				    ,trigger: 'click'//点击出发日期
				    ,type: 'date'//年月日
				    ,format: 'yyyy-MM-dd HH:mm'//自定义格式
				    ,theme: 'molv'//墨绿色
				});
			});	
			//获取时分秒
			shifens();

			function shifens() {
				var oDate = new Date(); //实例一个时间对象；
				var nian = oDate.getFullYear(); //获取系统的年；
				var yue = oDate.getMonth() + 1; //获取系统月份，由于月份是从0开始计算，所以要加1
				var ri = oDate.getDate(); // 获取系统日，
				function Appendzero(obj) {
					if(obj < 10) return "0" + obj;
					else return obj;
				}
				var shi = oDate.getHours(); //获取系统时，
				var fen = oDate.getMinutes(); //分;格式如：2018-01-25 10:49
				var strtade = Appendzero(nian) + "-" + Appendzero(yue) + "-" + Appendzero(ri) + " " + Appendzero(shi) + ":" + Appendzero(fen);
				if($("#IMPER_TROBLE_ID").val() == ""){
				$(".shifenm").val(strtade);
				}
			}
		</script>
	</body>

</html>