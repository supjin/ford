<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>问题采集</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/zcity.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/combo.select.css">
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<!-- 下拉框-->
		<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
		<script src="${ctx }/static/fords/js/jquery-1.11.3.min.js"></script>
		<script src="${ctx }/static/fords/js/jquery.combo.select.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/zcity.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js"></script>
		<!--下拉框  -->
		<script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js"></script>

		<style>
			.dowebok {
				width: 400px;
				margin: 100px auto;
			}
		</style>
		<!--  下拉框-->
		<style>
			.chzn-container-single .chzn-single {
				line-height: 33px;
				-webkit-border-radius: 0px;
				-moz-border-radius: 0px;
				border-radius: 0px;
			}
			
			.form-control {
				font-size: 16px;
			}
			
			.form-control:focus {
				box-shadow: none;
				-webkit-box-shadow: none
			}
		</style>
	</head>

	<body style="background-color: #edeff5; margin: 15px;">
		<div class="oiswen_box oiswen_boxavite">
			<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">问题${pd.saveoredit }</div>
					<div class="oiswen_titopleb">
						<a href="${ctx}/userspace/list.do"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span>
						<a href="${ctx }/client_problem_collection/list?TYPE=${pd.TYPE} ">${pd.DINGTILE }</a><span>/</span>
						<a href="javascript:;">问题${pd.saveoredit }</a>
					</div>
				</div>
			</div>
			<!----问题采集---->
			<form action="" name="coetForm" id="coetForm">
				<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"> <input type="hidden" name="TYPE" id="TYPE" value="${pd.TYPE}">
				<div class="wenti_box">
					<div class="container">
						<div class="row">
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>申请人</p>
									<div class="tadiv">${pd.USERNAME}</div>
									<input type="hidden" name="USERNAME" value="${pd.USERNAME}">
								</div>
							</div>
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>录入日期</p>
									<%-- 		<div class="tadiv">${pd.DOCUMENTDATE}</div>
								<input type="hidden" name="DOCUMENTDATE"
									value="${pd.DOCUMENTDATE}"> --%>

									<input name="DOCUMENTDATE" id="DOCUMENTDATE"  value="${pd.DOCUMENTDATE }" class="layui-input test-item pw_layimg  shifenm "  onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm'})"/>

								</div>
							</div>

							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>跟踪号</p>
									<div class="tadiv">${pd.TRACKINGNUMBER}</div>
									<input type="hidden" name="TRACKINGNUMBER" value="${pd.TRACKINGNUMBER}">
								</div>
							</div>

							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>产品名称</p>
									<select class="chzn-select" name="PRODUCTNAME" id="PRODUCTNAME" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
										<c:forEach items="${productList }" var="var">
											<option value="${var.PRODUCTNAME }" <c:if test="${pd.PRODUCTNAME == var.PRODUCTNAME }"> selected="selected"</c:if>>${var.PRODUCTNAME }</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>产品件号</p>
									<input type="text" name="PRODUCTNUMBER" value="${pd.PRODUCTNUMBER }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>项目名称</p>
									<input type="text" name="PROJECTNAME" id="PROJECTNAME" value="${pd.PROJECTNAME }" />
								</div>
							</div>

							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>客户名称</p>
									<select class="chzn-select" name="CLIENTSNAME" id="CLIENTSNAME" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
										<c:forEach items="${clientList }" var="var">
											<option value="${var.DEPARTMENT }" <c:if test="${pd.CLIENTSNAME == var.DEPARTMENT }"> selected="selected"</c:if>>${var.DEPARTMENT }</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>严重程度</p>
										<select name="PROBLEMSOURCE">
										<c:if test="${pd.PROBLEMSOURCE eq '停发' }">selected="selected"</c:if>
											<option value="停发" <c:if test="${pd.PROBLEMSOURCE eq '停发' }">selected="selected"</c:if>>停发</option>
				 							<option value="停线" <c:if test="${pd.PROBLEMSOURCE eq '停线' }">selected="selected"</c:if>>停线</option>
											<option value="重复" <c:if test="${pd.PROBLEMSOURCE eq '重复' }">selected="selected"</c:if>>重复</option>
											<option value="批量" <c:if test="${pd.PROBLEMSOURCE eq '批量' }">selected="selected"</c:if>>批量</option>
											<option value="一般" <c:if test="${pd.PROBLEMSOURCE eq '一般' }">selected="selected"</c:if>>一般</option>
										</select>
									<%-- <input type="text" name="PROBLEMSOURCE" value="${pd.PROBLEMSOURCE }" /> --%>
								</div>
							</div>

							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>投诉人</p>
									<!-- 								<select>
									<option>coco</option>
									<option>jojo</option>
								</select> -->

									<input type="text" name="COMPLAINANT" value="${pd.COMPLAINANT }" />

								</div>
							</div>

							<div class="col-sm-12 col-md-12 col-lg-12">
								<div class="inputboxa">
									<p>缺陷症状描述</p>
									<textarea name="TITLE" id="TITLE">${pd.TITLE }</textarea>
								</div>
							</div>
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>发生日期</p>
									<input name="OCCURRENCEDATE" id="OCCURRENCEDATE" value="<fmt:formatDate value='${pd.OCCURRENCEDATE }' pattern='yyyy-MM-dd HH:mm' />" class="layui-input test-item pw_layimg "/>
								</div>
							</div>
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>生产批次</p>
									<input type="text" name="PRODUCTIONBATCH" value="${pd.PRODUCTIONBATCH }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>失效模式</p>
									<select class="chzn-select" name="FAILUREMODE" id="FAILUREMODE" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
										<c:forEach items="${failureList }" var="var">
											<option value="${var.FAILURENAME }" <c:if test="${pd.FAILUREMODE == var.FAILURENAME}">selected</c:if>>${var.FAILURENAME }</option>
										</c:forEach>
									</select>
									<%-- <div class="input-group">
									<input type="text" class="form-control" name="FAILUREMODE"
										value="${pd.FAILUREMODE }">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown">
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu pull-right">
											<c:forEach items="${failureList }" var="var">
												<li><a href="javascript:;">${var.FAILURENAME }</a></li>
											</c:forEach>

										</ul>
									</div>
								</div> --%>
								</div>
							</div>
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>不合格数量</p>
									<input type="number" name="UNQUALIFIEDQUANTITY" value="${pd.UNQUALIFIEDQUANTITY }" />
								</div>
							</div>
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p>客户问题追踪号</p>
									<input type="text" name=CLIENTPROBLEMTRACKINGNUMBER value="${pd.CLIENTPROBLEMTRACKINGNUMBER }" />
								</div>
							</div>

							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="inputboxa">
									<p class="fistcal">初判责任人</p>
									<select class="chzn-select" name="FIRSTDEPARTMENT" id="FIRSTDEPARTMENT" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
										<c:forEach items="${userList }" var="var">
											<option value="${var.USER_ID }" <c:if test="${var.USER_ID eq pd.FIRSTDEPARTMENT }"> selected="selected"</c:if>>${var.NAME }</option>
										</c:forEach>
									</select>

								</div>
							</div>

						</div>
						<div class="acq_boxtx">
							<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/client_problem_collection/list?TYPE=${pd.TYPE }'">关闭</button>

							<button type="button" class="tibutton" id="tibutton">提交</button>
							<c:if test="${(pd.CLIENT_PROBLEM_COLLECTION_ID  == null) }">
							<button type="button" class="jxbutton " onclick="window.location.href='${ctx}/client_problem_collection/goaddAndEdit?TYPE=${pd.TYPE }'">继续添加</button>
							</c:if>
						</div>
			</form>
			</div>
			<script>
			//获取时分秒
			shifens();
			function shifens(){
				var oDate = new Date(); //实例一个时间对象；
				var nian=oDate.getFullYear();   //获取系统的年；
				var yue=oDate.getMonth()+1;   //获取系统月份，由于月份是从0开始计算，所以要加1
				var ri=oDate.getDate(); // 获取系统日，
				function Appendzero(obj) {
		           if (obj < 10) return "0" + obj; else return obj;
		        }
				var shi=oDate.getHours(); //获取系统时，
				var fen=oDate.getMinutes(); //分;格式如：2018-01-25 10:49
				var strtade=Appendzero(nian)+"-"+Appendzero(yue)+"-"+Appendzero(ri)+" "+Appendzero(shi)+":"+Appendzero(fen);
				if($("#CLIENT_PROBLEM_COLLECTION_ID").val() == ""){
					$(".shifenm").val(strtade);
				}
				
				
			}
			 //同时绑定多个
			lay('.test-item').each(function(){
				laydate.render({
				    elem: this
				    ,trigger: 'click'//点击出发日期
				    ,type: 'datetime'//年月日
				    ,format: 'yyyy-MM-dd HH:mm'//自定义格式
				    ,theme: 'molv'//墨绿色
				});
			});	
				$(function() {
					//失效输入框赋值
					$(document).on("click", ".dropdown-menu>li", function() {
						var a = $(this).children("a").html();
						$(this).parents(".input-group").find("input").val(a);
					})
					//下拉框----初判责任部门(引用zcity.js)
					zcityrun('.zcityGroup');
				});

				//部门联动
				function empchang(thi, userid) {

					var peptid = $(thi).children('option:selected').attr("at")
					var thi = $(thi);

					$
						.ajax({
							type: "POST",
							url: '${ctx}/department/deptAjas',
							data: {
								"DEPARTMENT_ID": peptid
							},
							async: false,
							dataType: 'json',
							success: function(data) {
								if(data.message == "1") {
									var users = data.deptuser;
									var str = "";
									for(var i = 0; i < users.length; i++) {
										var sd = '';
										if(userid == users[i].USER_ID) {
											sd = 'selected="selected"';
											/* alert("ok"); */
										}
										/* str+="<option value=\""+users[i].NAME+"\">"+users[i].NAME+"</option>" */

										str += "<option " + sd + " value=\"" + users[i].USER_ID + "\" uid=\"" + users[i].USER_ID + "\" >" +
											users[i].NAME + "</option>"
									}
									$(".userft").html("");
									$(".userft").append(str);
									//$(a).change();
								}

							},
							error: function(XMLHttpRequest, textStatus,
								errorThrown) {
								alert("操作无效");
							}
						})

				}

				//选择搜索框
				$(function() {
					$('select').comboSelect();
				});
				$(".chzn-select").chosen({
					search_contains: true,
					enable_split_word_search: true
				});
				//提交
				$(document).on("click", "#tibutton", function() {
					var TYPE = $("#TYPE").val();
					if($("#PROJECTNAME").val() == "") {
						$("#PROJECTNAME").tips({
							side: 3,
							msg: '项目名称不能为空',
							bg: '#AE81FF',
							time: 2
						});
						$("#PROJECTNAME").focus();
						return false;
					}
					if($("#TITLE").val() == "") {
						$("#TITLE").tips({
							side: 3,
							msg: '缺陷性症状描述不能为空',
							bg: '#AE81FF',
							time: 2
						});
						$("#TITLE").focus();
						return false;
					}

					if($("#OCCURRENCEDATE").val() == "") {
						$("#OCCURRENCEDATE").tips({
							side: 3,
							msg: '发生日期不能为空',
							bg: '#AE81FF',
							time: 2
						});
						$("#OCCURRENCEDATE").focus();
						return false;
					}
					if($("#FIRSTDEPARTMENT").val() == "") {
						$(".fistcal").tips({
							side: 3,
							msg: '初判责任部门不能为空',
							bg: '#AE81FF',
							time: 2
						});
						$("#FIRSTDEPARTMEN").focus();
						return false;
					}

					$.ajax({
						type: "POST",
						url: "${ctx}/client_problem_collection/addAndEdit",
						data: $("#coetForm").serialize(),
						success: function(data) {
							alert2("保存成功！");

						},
						error: function() {
							alert("上传失败");
						}
					});
					
				})
			</script>
	</body>

</html>