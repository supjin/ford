<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>投诉记录表</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/defect.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
		<script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>

		<style>
			.inputboxa {
				max-width: 100%;
			}
			
			.gunbitit {
				font-size: 14px;
				color: #666666;
				float: left;
				margin-left: 20px;
				margin-right: 10px;
				height: 34px;
				line-height: 34px;
			}
			
			.gundate {
				padding: 5px 0px;
				font-size: 14px;
				color: #666666;
				border-radius: 5px;
				border: 1px solid #dedede;
				width: 200px;
				box-sizing: border-box;
			}
		</style>
	</head>

	<body style="background-color: #edeff5; margin: 15px;">
		<div class="oiswen_box oiswen_boxavite">
			<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">投诉记录表</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span>
						<a href="javascript:;">现场问题</a><span>/</span>
						<a href="javascript:;">缺陷录入</a>
					</div>
				</div>
			</div>

			<!----问题采集---->


				<div class="wenti_box">
					<div class="container">
						<div class="row">
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>跟踪号</p>
									<div class="tadiv">${pdproblem.TRACKINGNUMBER}</div>
									<input type="hidden" name="TRACKINGNUMBER" value="${pdproblem.TRACKINGNUMBER}">
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>发生时间</p>
									<div class="tadiv">
										<fmt:formatDate value="${pdproblem.OCCURRENCEDATE}" pattern="yyyy-MM-dd" />
									</div>
									<input type="hidden" name="OCCURRENCEDATE" value="${pdproblem.OCCURRENCEDATE}">
								</div>
							</div>

							<div class="col-sm-6 col-md-4 col-lg-4">
								<div class="inputboxa">
									<p>确认时间</p>
									<div class="tadiv">
										<fmt:formatDate value="${pdproblem.CREATETIME}" pattern="yyyy-MM-dd" />
									</div>

									<input type="hidden" name="CONFIME_TIME" value="${pdproblem.CONFIME_TIME}">
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">

								<div class="inputboxa">
									<p>客户名称</p>
									<div class="tadiv">${pdproblem.CLIENTSNAME}</div>
									<input type="hidden" name="CLIENTSNAME" value="${pdproblem.CLIENTSNAME}">

								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">

								<div class="inputboxa">
									<p>客户部门</p>
									<div class="tadiv">${pdproblem.PROBLEMSOURCE}</div>
									<input type="hidden" name="PROBLEMSOURCE" value="${pdproblem.PROBLEMSOURCE}">

								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">

								<div class="inputboxa">
									<p>投诉人</p>
									<div class="tadiv">${pdproblem.COMPLAINANT}</div>
									<input type="hidden" name="COMPLAINANT" value="${pdproblem.COMPLAINANT}">
								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">

								<div class="inputboxa">
									<p>接收者</p>

									<div class="tadiv">${pdproblem.USERNAME}</div>
									<input type="hidden" name="USERNAME" value="${pdproblem.USERNAME}">

								</div>
							</div>
							<div class="col-sm-6 col-md-4 col-lg-4">

								<div class="inputboxa">
									<p>责任职能工程师</p>
									<div class="tadiv">${pdproblem.NAME}</div>
									<input type="hidden" name="NAME" value="${pdproblem.NAME}">

								</div>
							</div>
						</div>
					</div>
				</div>
			<div class="wenti_box pw_edit" style="padding: 35px;">
			<input type="hidden" name="QUESTION_FEEDBACK_ID" id="QUESTION_FEEDBACK_ID" value="${pds.QUESTION_FEEDBACK_ID}">
			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}">
				
				<c:if test="${empty pds.QUESTION_FEEDBACK_ID }">
				
				<div class="jinji_div">
					<div class="neibka_bor">
						<form action="">
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-md-6">
											<div class="jinjiulb" style="max-width: 300px;">
												<p class="jinjiultit">第一次回复时间</p>
												<div class="jinjiuze">
													<input type="date" class="form-control" name="REPLY_TIME">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiulb" style="max-width: 300px;">
												<p class="jinjiultit">所剩时间：<span class="c_tcolor">16H</span></p>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">回复方案</p>
												<div class="jinjiuze">
													<textarea style="height: 95px;"name="REPLY_PROGRAM"></textarea>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">客户回复</p>
												<div class="jinjiuze">
													<textarea style="height: 95px;" name="CUSTOMER_REPLY"></textarea>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiule jinjiulb">
											<input type="hidden" name="ATTACHMENTNAME_PROGRAM">
												<div class="jinjiultit2">上传附件<input id="myfile0" name="myfile0" class="myfile0" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi jinjiddia" id="myfile0a">
														
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiule jinjiulb">
											<input type="hidden" name="ATTACHMENTNAME_CUSTOMER">
												<div class="jinjiultit2">上传附件<input id="myfiles0" name="myfiles0" class="myfiles0" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi jinjiddib" id="myfiles0a">
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!---按钮组--->
							<div class="jinji_divtitbot">
								<!-- <button class="pull-right zjbtn" type="button">新增</button> -->
							</div>
						</form>
					</div>
				</div>
				
				<div class="jinji_div">
					<div class="neibka_bor">
						<form action="">
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-md-6">
											<div class="jinjiulb" style="max-width: 300px;">
												<p class="jinjiultit">第二次回复时间</p>
												<div class="jinjiuze">
													<input type="date" class="form-control" name="REPLY_TIME">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiulb" style="max-width: 300px;">
												<p class="jinjiultit">所剩时间：<span class="c_tcolor">16H</span></p>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">回复方案</p>
												<div class="jinjiuze">
													<textarea style="height: 95px;"name="REPLY_PROGRAM">${REPLY_PROGRAM }</textarea>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">客户回复</p>
												<div class="jinjiuze">
													<textarea style="height: 95px;" name="CUSTOMER_REPLY">${CUSTOMER_REPLY }</textarea>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiule jinjiulb">
											<input type="hidden" name="ATTACHMENTNAME_PROGRAM">
												<div class="jinjiultit2">上传附件<input id="myfile1" name="myfile1" class="myfile1" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi jinjiddia" id="myfile1a">
														
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiule jinjiulb">
											<input type="hidden" name="ATTACHMENTNAME_CUSTOMER">
												<div class="jinjiultit2">上传附件<input id="myfiles1" name="myfiles1" class="myfiles1" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi jinjiddib" id="myfiles1a">
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!---按钮组--->
							<div class="jinji_divtitbot">
								<button class="pull-right zjbtn" type="button">新增</button>
							</div>
						</form>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty pds.QUESTION_FEEDBACK_ID }">
				<c:forEach items="${varList}" var="var" varStatus="status">
				<div class="jinji_div">
					<div class="neibka_bor">
						<form action="">
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-md-6">
											<div class="jinjiulb" style="max-width: 300px;">
												<p class="jinjiultit">第一次回复时间</p>
												<div class="jinjiuze">
													<input type="date" class="form-control" name="REPLY_TIME" value="${var.REPLY_TIME }">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiulb" style="max-width: 300px;">
												<p class="jinjiultit">所剩时间：<span class="c_tcolor">16H</span></p>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">回复方案</p>
												<div class="jinjiuze">
													<textarea style="height: 95px;"name="REPLY_PROGRAM">${var.REPLY_PROGRAM }</textarea>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">客户回复</p>
												<div class="jinjiuze">
													<textarea style="height: 95px;" name="CUSTOMER_REPLY">${var.CUSTOMER_REPLY }</textarea>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiule jinjiulb">
											<input type="hidden" name="ATTACHMENTNAME_PROGRAM">
												<div class="jinjiultit2">上传附件<input id="myfile${ status.index}" name="myfile${ status.index}" class="myfile${ status.index}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi jinjiddia" id="myfile${ status.index}a">
														<c:forEach items="${var.ATMAP }" var="map">
															<div class="jinjiuddd">
																<em class="jinjiudddeml pull-left"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a class="pull-left" href="${ctx }/process_two/downWen.do?filepath=${map.key}&filename=${map.value}" title="${map.value}">${map.value}</a>
																<input type='hidden' value='${map.key}'/>
																</div>
																<em class="jinjiudddemr pull-left"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
															</div>
														</c:forEach>	
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="jinjiule jinjiulb">
											<input type="hidden" name="ATTACHMENTNAME_CUSTOMER">
												<div class="jinjiultit2">上传附件<input id="myfiles${ status.index}" name="myfiles${ status.index}" class="myfiles${ status.index}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi jinjiddib" id="myfiles${ status.index}a">
													<c:forEach items="${var.ATMA}" var="map">
															<div class="jinjiuddd">
																<em class="jinjiudddeml pull-left"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a class="pull-left" href="${ctx }/process_two/downWen.do?filepath=${map.key}&filename=${map.value}" title="${map.value}">${map.value}</a>
																<input type='hidden' value='${map.key}'/>
																</div>
																<em class="jinjiudddemr pull-left"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
															</div>
													</c:forEach>	
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!---按钮组--->
							<div class="jinji_divtitbot">
								<c:if test="${status.index >0}">
								<button class="pull-right zjbtn" type="button">新增</button>
								</c:if>
								<c:if test="${status.index >1}">
								<button class="pull-right jinjiscbtn" type="button">删除</button>
								</c:if>
								
								
							</div>
						</form>
					</div>
				</div>
				</c:forEach>
			</c:if>
			</div>
			<!----关闭时间---->
			    <div class="wenti_box" style="margin-bottom: 20px;">
			        <p class="gunbitit">关闭时间</p><input class="gundate" type="date" name="CLOSED_TIME" id="CLOSED_TIME" value="${pds.CLOSED_TIME }"/>
			    </div>
				 <div style="box-sizing: border-box;" class="jinji_divtitbot baocunbot"><button class="jiushibtnxiu" type="button" style="margin: 30px 50%;"><c:if test="${not empty pds.QUESTION_FEEDBACK_ID }">修改</c:if><c:if test="${empty pds.QUESTION_FEEDBACK_ID }">保存</c:if></button></div>
			<!--TODO  -->
			<script>
				$(document).on("click", ".jiushibtnxiu", function() {
					var tis = $(this);
					var ud = {};
					$("form").each(function(index) {
						var ts = $(this);
						/** $("textarea[name='REPLY_PROGRAM']").each(function(index) {
							var ts  = $(this);
							if(ts.val()==""){
								ts.tips({
									side:3,
						            msg:'请输入回复方案',
						            bg:'#AE81FF',
						            time:2
						        });
								ts.focus();
								return false;
							} 
						}); **/
						//附件
						var accessorya = "";
						ts.parents(".jinji_div").find(".jinjiddia").find("a").each(function(index, el) {
							var realname = $(this).text(); //文件名
							var name = $(this).next().val(); //文件路径
							var str = realname + "::" + name + ";;";
							accessorya += str;
						});
						ts.parents(".jinji_div").find("input[name='ATTACHMENTNAME_PROGRAM']").val(accessorya);
						
						//附件
						var accessoryb = "";
						ts.parents(".jinji_div").find(".jinjiddib").find("a").each(function(index, el) {
							var realname = $(this).text(); //文件名
							var name = $(this).next().val(); //文件路径
							var str = realname + "::" + name + ";;";
							accessoryb += str;
						});
						ts.parents(".jinji_div").find("input[name='ATTACHMENTNAME_CUSTOMER']").val(accessoryb);
						ud[index] = ts.serializeArray();
					});
					
					var REPLY_TIME = JSON.stringify(ud);//转换成字符串
					var QUESTION_FEEDBACK_ID = $("#QUESTION_FEEDBACK_ID").val();
					var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
					var CLOSED_TIME = $("#CLOSED_TIME").val();
					$.ajax({
						type: "POST",
						url: "${ctx}/question_feedback/addAndEdit",
						data: {REPLY_TIME:REPLY_TIME,QUESTION_FEEDBACK_ID:QUESTION_FEEDBACK_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,CLOSED_TIME:CLOSED_TIME},
						success: function(data) {
							$("#QUESTION_FEEDBACK_ID").val(data.QUESTION_FEEDBACK_ID);
							tis.text("修改");
							alert2("保存成功");
						}
					});
				})

				$(".jinji_div").on("click", ".jinjiudddemr", function() {
					var s = $(this).parent().index();
					$(this).parent().remove();
				})
				
				//上传附件
				var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
				//附件上传
				function upload(target) {
					var name = target.value;
					var fileName = name.substring(name.lastIndexOf(".") + 1).toLowerCase();
					if(fileName != "doc" && fileName != "docx" && fileName != "xls" && fileName != "xlsx" && fileName != "pdf" && fileName != "txt" && fileName != "zip" && fileName != "rar" && fileName != "jpg" && fileName != "jpeg" && fileName != "png" && fileName != "gif" && fileName != "avi" && fileName != "mp3") {
						alert2("请选择正确格式的文件(doc,docx,xls,xlsx,pdf,txt,zip,png,jpg,jpeg,gif,avi,mp3)！");
						target.value = "";
						return
					}
					var fileSize = 0;
					if(isIE && !target.files) {
						try {
							var file = target;
							file.select();
							file.blur();
							var path = document.selection.createRange().text;
							var fso = new ActiveXObject("Scripting.FileSystemObject");
							fileSize = fso.GetFile(path).size;
						} catch(e) {
							alert2(e + "\n" + "如果错误为：Error:Automation 服务器不能创建对象；" + "\n" + "请按以下方法配置浏览器：" + "\n" + "请打开【Internet选项-安全-Internet-自定义级别-ActiveX控件和插件-对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本（不安全）-点击启用-确定】");
							return;
						}
					} else {
						fileSize = target.files[0].size;
					}
					var size = fileSize / 1024;
					if(size > 20480) {
						alert2("文件大小不能超过20M");
						target.value = "";
						return
					}

					DocAjaxFileUpload(target);

				}

				function DocAjaxFileUpload(target) {

					var name = target.value;
					var fileName = name.substring(name.lastIndexOf("\\") + 1);
					var $target = $(target);
					var classname = $target.attr('class');
					/* alert2(classname); */
					var myDate = new Date();
					var now = myDate.getTime();
					$.ajaxFileUpload({
						url: '${ctx}/pc/uploadfile',
						secureuri: false,
						fileElementId: classname,
						data: {
							"fileitem": "question_feedback"
						},
						/* dataType: 'JSON',   */
						success: function(data) {

							var str = $(data).find("body").text();
							var json = $.parseJSON(str);
							if("success" == json.info) {
								var str = "<div class='jinjiuddd'>" + "<em class='jinjiudddeml pull-left'><img src='${ctx }/static/fords/img/wenjian.png'/></em>";
								str += "<div class='jinjiudtits'>"
								str += "<a  href=\"${ctx }/process_two/downWen.do?filepath=" + json.url + "&filename=" + fileName + "\">" + fileName + "</a><input type='hidden' value='" + json.url + "'>";
								str += "</div>"
								str += "<em class='jinjiudddemr pull-left'><img src='${ctx }/static/fords/img/guanbi.png'/></em> </div>	";
								$("#" + classname + "a").append(str);
							} else if("oversize" == json.info) {
								alert2("系统繁忙请稍后再试！");
							}
						},
						error: function() {
							alert2("上传失败");
						}
					})
				}
				//点击删除文件
				$(document).on("click", ".jinjiudddemr", function() {
					var s = $(this).parent().index();
					$(this).parent().remove();
				})
				//点击新增(含删除按钮)
				var N = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "二十一", "二十二", "二十三", "二十四", "二十五", "二十六", "二十七", "二十八", "二十九", "三十", "三十一", "三十二", "三十三", "三十四", "三十五", "三十六", "三十七", "三十八", "三十九", "四十", "四十一", "四十二", "四十三", "四十四", "五十"]; //该数组对应下标0-9
				$(document).on("click", ".zjbtn", function() {
					var lens = $(this).parents(".jinji_div").parent(".wenti_box").children(".jinji_div").length + 1; //2
					var ais = conversi(lens);
					var str = '<div class="jinji_div"><div class="neibka_bor"><form action=""><div class="jinjiul"><div class="container"style="width: 100%;"><div class="row"><div class="col-md-6"><div class="jinjiulb"style="max-width: 300px;"><p class="jinjiultit">第' + ais + '次回复时间</p><div class="jinjiuze"><input type="date"class="form-control" name="REPLY_TIME"></div></div></div><div class="col-md-6"><div class="jinjiulb"style="max-width: 300px;"><p class="jinjiultit">所剩时间：<span class="c_tcolor">16H</span></p></div></div></div><div class="row"><div class="col-md-6"><div class="jinjiuld jinjiulb"><p class="jinjiultit">回复方案</p><div class="jinjiuze"><textarea style="height: 95px;" name="REPLY_PROGRAM"></textarea></div></div></div><div class="col-md-6"><div class="jinjiuld jinjiulb"><p class="jinjiultit">客户回复</p><div class="jinjiuze"><textarea style="height: 95px;"  name="CUSTOMER_REPLY"></textarea></div></div></div><div class="col-md-6"><div class="jinjiule jinjiulb"><input type="hidden" name="ATTACHMENTNAME_PROGRAM"><div class="jinjiultit2">上传附件<input id="myfile'+lens+'" name="myfile'+lens+'" class="myfile'+lens+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div><div class="jinjiuze"><div class="jinjiddi jinjiddia" id="myfile'+lens+'a"></div></div></div></div><div class="col-md-6"><div class="jinjiule jinjiulb"><input type="hidden" name="ATTACHMENTNAME_CUSTOMER"><div class="jinjiultit2">上传附件<input id="myfiles'+lens+'" name="myfiles'+lens+'" class="myfiles'+lens+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div><div class="jinjiuze"><div class="jinjiddi jinjiddib" id="myfiles'+lens+'a"></div></div></div></div></div></div></div><!---按钮组---><div class="jinji_divtitbot"><button class="pull-right zjbtn"type="button">新增+</button><button class="pull-right jinjiscbtn"type="button">删除</button></div></form></div></div>';
					$(this).parents(".wenti_box").append(str);
				})
				//转为数字
				function conversi(num) {
					var str = num.toString(); //转换为字符串格式
					var len = num.toString().length; //获取字符串长度
					var C_Num = [];
					if(len == 1) {
						for(var i = 0; i < len; i++) {
							C_Num.push(N[str.charAt(i)]);
						}
					} else if(len == 2) {
						C_Num.push(N[num])
					}
					return C_Num.join('');
				}
				//删除事件
				$(document).on("click", ".jinjiscbtn", function() {
					var a = $(this).parents(".jinji_div").parent(".wenti_box").children(".jinji_div").length - 1; //2(序号一二三)
					$(this).parents(".jinji_div").remove();
					for(var i = 1; i <= a; i++) {
						var ss = conversi(i);
						console.log(ss);
						$(".pw_edit .jinji_div").eq(i - 1).find(".jinjiultit").html('第' + ss + '次回复时间')
					}

				})
   $(function(){
				//开始的时候赋值一二三四五六。。。。。。
		$(".pw_edit .jinji_div").each(function(){
			var ass=$(this).index()-1;
			var csss=conversi(ass);
			$(this).find(".jinjiultit:eq(0)").html('第'+csss+'次回复时间');
		})
		
    })
			</script>
	</body>

</html>