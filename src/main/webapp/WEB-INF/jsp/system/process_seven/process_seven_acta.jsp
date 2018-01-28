<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>${DINGTILE }</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d4.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d7.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d7.js" ></script>
		<script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/seek.js" ></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 20px;">
		<div class="oiswen_box">
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
			<input type="hidden" name="PROCESS_SEVEN_ID" id="PROCESS_SEVEN_ID" value="${pds.PROCESS_SEVEN_ID }">
			<input type="hidden" name="DQUID" id="DQUID" value="${handle.DQUID }">
			<input type="hidden" name="DQUID" id="DQUID" value="${handle.DQUID }">
			<!----d7预防措施---->
			<div class="d7_boxs">
				<div class="d7_titsbox"><div class="d7_tits">D7预防措施</div></div>
				<!---新增预防措施---->
				<div class="jinji_box jinji_boxa">
					<div class="d7_dbots">
					    <p>预防措施</p>
					    <a class="zjbtna" href="javascript:;">新增+</a>
					</div>
					<c:forEach items="${mesList }" var="var" varStatus="status">
					<div class="jinji_div">
						<div class="xuhao_bocn">序号-<span>${ status.index + 1}</span></div>
						<div class="neibka_bor">
							<form action="">
							<input type="hidden" name="PREAVENTTYPE" value="1">
							<input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value="${var.MEASURES_MESSAGE_PREVENT_ID}">
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
								<div class="jinjiul">
									<div class="container" style="width: 100%;">
										<div class="row">
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiula">
													<p class="jinjiultit">责任人</p>
													<div class="jinjiuze">
														<div class="baidssb">
															<input type="hidden" class="responsese" value="${var.RESPONSIBLE }">
											                <input class="sowe_lse form-control" maxlength="6" name="RESPONSIBLE"   type="text" <c:if test="${not empty var.NAME}"> value="${var.NAME }"</c:if><c:if test="${empty var.NAME}"> value="${var.RESPONSIBLE }"</c:if>/>
											                <div class="taocen_cn">
										                    <ul class="houxuciu"></ul>
										                	</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiulb">
													<p class="jinjiultit">计划时间</p>
													<div class="jinjiuze">
														<input type="date" class="form-control" name="DOTIME" value="${var.DOTIME }">
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiulb">
													<p class="jinjiultit">执行时间</p>
													<div class="jinjiuze">
														<input type="date" class="form-control" name="EXECUTIONDATE"value="${var.EXECUTIONDATE }">
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-12 col-md-12 col-lg-3">
												<div class="jinjiule jinjiulb">
													<input type="hidden" name="ATTACHMENTNURL">
													<div class="jinjiultit2">上传附件<input id="myfiles${status.index + 1}" name="myfiles${ status.index + 1}" class="myfiles${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
													<div class="jinjiuze">
														<div class="jinjiddi" id="myfiles${status.index + 1}a">
														<c:forEach items="${var.ATTMAP }" var="att">
														 <c:forEach var="map" items="${att}">
															 <div class="jinjiuddd">
																<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
																<input type='hidden' value='${map.value}'/>
																</div>
																<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
															</div>
									                    </c:forEach>
									                    </c:forEach>
												
												
														</div>
													</div>
												</div>
											</div>
										</div>
			
										<div class="row">
											<div class="col-md-12 col-lg-12">
												<div class="jinjiuld jinjiulb">
													<p class="jinjiultit">预防措施</p>
													<div class="jinjiuze">
														<textarea name="MEASURESNAME">${var.MEASURESNAME }</textarea>
													</div>
												</div>
											</div>
			
										</div>
									</div>
								</div>
								<div class="jinji_divtitbot">
									<button class="pull-right zjbtna" type="button">新增+</button>
									<button class="pull-right jinjiscbtn" type="button">删除</button>
									<button class="pull-right jiushibtnxiu" type="button">修改</button>
								</div>
							</form>
						</div>
					</div>
					</c:forEach>
					<c:if test="${fn:length(mesList ) == 0}">
							<div class="jinji_div">
						<div class="xuhao_bocn">序号-<span>1</span></div>
						<div class="neibka_bor">
							<form action="">
							<input type="hidden" name="PREAVENTTYPE" value="1">
							<input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value="">
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
								<div class="jinjiul">
									<div class="container" style="width: 100%;">
										<div class="row">
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiula">
													<p class="jinjiultit">责任人</p>
													<div class="jinjiuze">
														<div class="baidssb">
															<input type="hidden" class="responsese" name="RESPONSIBLE" value="${handle.USERID }">
											                <input class="sowe_lse form-control" maxlength="6"  type="text" value="${handle.RSNAME }"/>
											                <div class="taocen_cn">
										                    <ul class="houxuciu"></ul>
										                	</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiulb">
													<p class="jinjiultit">计划时间</p>
													<div class="jinjiuze">
														<input type="date" class="jihuatame form-control" name="DOTIME">
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiulb">
													<p class="jinjiultit">执行时间</p>
													<div class="jinjiuze">
														<input type="date" class="jihuatame form-control" name="EXECUTIONDATE">
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-12 col-md-12 col-lg-3">
												<div class="jinjiule jinjiulb">
													<input type="hidden" name="ATTACHMENTNURL">
													<div class="jinjiultit2">上传附件<input id="myfiles" name="myfiles" class="myfiles" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
													<div class="jinjiuze">
														<div class="jinjiddi" id="myfilesa">
												
														</div>
													</div>
												</div>
											</div>
										</div>
			
										<div class="row">
											<div class="col-md-12 col-lg-12">
												<div class="jinjiuld jinjiulb">
													<p class="jinjiultit">预防措施</p>
													<div class="jinjiuze">
														<textarea name="MEASURESNAME"></textarea>
													</div>
												</div>
											</div>
			
										</div>
									</div>
								</div>
								<div class="jinji_divtitbot">
									<button class="pull-right zjbtna" type="button">新增+</button>
									<button class="pull-right jinjiscbtn" type="button">删除</button>
									<button class="pull-right jiushibtnxiu" type="button">保存</button>
								</div>
							</form>
						</div>
					</div>
					</c:if>
			        <!---验证证实--->
					<div class="d0_jinbox" style="padding: 0px;margin-top: 30px;">
						<div class="d0_shuru">
							<p class="d0_shurutit"><span>*</span>验证/证实</p>
							<div class="d0_shurut"><textarea name="VERIFICATION" id="VERIFICATION">${pds.VERIFICATION }</textarea></div>
							<button class="d0_8btnbc" type="button"><c:if test="${empty pds.VERIFICATION }">保存</c:if><c:if test="${not empty pds.VERIFICATION }">修改</c:if></button>
						</div>
					</div>
				</div>
				<!---新增体制整改预防措施---->
				<div class="jinji_box jinji_boxb">
					<div class="d7_dbots" style="width: 280px;">
					    <p>体制整改预防措施</p>
					    <a class="zjbtnb" href="javascript:;">新增+</a>
					</div>
					<c:forEach items="${tixList }" var="var" varStatus="status">
					<div class="jinji_div">
						<div class="xuhao_bocn">序号-<span>${status.index + 1}</span></div>
						<div class="neibka_bor">
							<form action="">
							<input type="hidden" name="PREAVENTTYPE" value="2">
							<input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value="${var.MEASURES_MESSAGE_PREVENT_ID }">
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
								<div class="jinjiul">
									<div class="container" style="width: 100%;">
										<div class="row">
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiula">
													<p class="jinjiultit">责任人</p>
													<div class="jinjiuze">
														<div class="baidssb">
															<input type="hidden" class="responsese" name="RESPONSIBLE" value="${var.RESPONSIBLE }">
											                <input class="sowe_lse form-control" maxlength="6"  type="text" <c:if test="${not empty var.NAME}"> value="${var.NAME }"</c:if><c:if test="${empty var.NAME}"> value="${var.RESPONSIBLE }"</c:if>/>
											                <div class="taocen_cn">
											                    <ul class="houxuciu"></ul>
											                </div>
											       		 </div>
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiulb">
													<p class="jinjiultit">计划时间</p>
													<div class="jinjiuze">
														<input type="date" class="form-control" name="DOTIME" value="${var.DOTIME }">
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiulb">
													<p class="jinjiultit">执行时间</p>
													<div class="jinjiuze">
														<input type="date" class="form-control" name="EXECUTIONDATE" value="${var.EXECUTIONDATE }">
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-12 col-md-12 col-lg-3">
												<div class="jinjiule jinjiulb">
												 	<input type="hidden" name="ATTACHMENTNURL">
													<div class="jinjiultit2">上传附件<input id="myfile${status.index + 1}" name="myfile${status.index + 1}" class="myfile${status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
													<div class="jinjiuze">
														<div class="jinjiddi" id="myfile${status.index + 1}a">
														<c:forEach items="${var.ATTMAP }" var="att" >
														 <c:forEach var="map" items="${att}">
															 <div class="jinjiuddd">
																<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
																<input type='hidden' value='${map.value}'/>
																</div>
																<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
															</div>
									                    </c:forEach>
									                    </c:forEach>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 col-lg-12">
												<div class="jinjiuld jinjiulb">
													<p class="jinjiultit">预防措施</p>
													<div class="jinjiuze">
														<textarea name="MEASURESNAME">${var.MEASURESNAME }</textarea>
													</div>
												</div>
											</div>
			
										</div>
									</div>
								</div>
								<div class="jinji_divtitbot">
									<button class="pull-right zjbtnb" type="button">新增+</button>
									<button class="pull-right jinjiscbtn" type="button">删除</button>
									<button class="pull-right jiushibtnxiu" type="button">修改</button>
								</div>
							</form>
						</div>
					</div>
					</c:forEach>
					
					<c:if test="${fn:length(tixList ) == 0}">
					<div class="jinji_div">
						<div class="xuhao_bocn">序号-<span>1</span></div>
						<div class="neibka_bor">
							<form action="">
							<input type="hidden" name="PREAVENTTYPE" value="2">
							<input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value="">
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
								<div class="jinjiul">
									<div class="container" style="width: 100%;">
										<div class="row">
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiula">
													<p class="jinjiultit">责任人</p>
													<div class="jinjiuze">
														<div class="baidssb">
															<input type="hidden" class="responsese" name="RESPONSIBLE" value="${handle.USERID }">
											                <input class="sowe_lse form-control" maxlength="6" type="text" value="${handle.RSNAME }"/>
											                <div class="taocen_cn">
											                    <ul class="houxuciu"></ul>
											                </div>
											       		 </div>
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiulb">
													<p class="jinjiultit">计划时间</p>
													<div class="jinjiuze">
														<input type="date" class="jihuatame form-control" name="DOTIME">
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">
												<div class="jinjiulb">
													<p class="jinjiultit">执行时间</p>
													<div class="jinjiuze">
														<input type="date" class="jihuatame form-control" name="EXECUTIONDATE">
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-12 col-md-12 col-lg-3">
												<div class="jinjiule jinjiulb">
												 	<input type="hidden" name="ATTACHMENTNURL">
													<div class="jinjiultit2">上传附件<input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
													<div class="jinjiuze">
														<div class="jinjiddi" id="myfilea">
												
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 col-lg-12">
												<div class="jinjiuld jinjiulb">
													<p class="jinjiultit">预防措施</p>
													<div class="jinjiuze">
														<textarea name="MEASURESNAME"></textarea>
													</div>
												</div>
											</div>
			
										</div>
									</div>
								</div>
								<div class="jinji_divtitbot">
									<button class="pull-right zjbtnb" type="button">新增+</button>
									<button class="pull-right jinjiscbtn" type="button">删除</button>
									<button class="pull-right jiushibtnxiu" type="button">保存</button>
								</div>
							</form>
						</div>
					</div>
					</c:if>
					
					
					
			        <!---验证证实--->
					<div class="d0_jinbox" style="padding: 0px;margin-top: 30px;">
						<div class="d0_shuru">
							<p class="d0_shurutit"><span>*</span>验证/证实</p> 
							<div class="d0_shurut"><textarea name="VERIFICATIONURE" id="VERIFICATIONURE">${pds.VERIFICATIONURE }</textarea></div>
							<button class="d0_8btnbc" type="button"><c:if test="${empty pds.VERIFICATIONURE }">保存</c:if><c:if test="${not empty pds.VERIFICATIONURE }">修改</c:if></button>
						</div>
					</div>
				</div>
				<!---文件更新--->
				<div class="d7_wenjian">
					<a class="d7_wentit" href="javascript:;">文件更新</a>
					<table class="d7table" cellspacing="0" cellpadding="0">
					<c:forEach items="${attList }" var="var" varStatus="status">
						<tr>
							<td>${var.LABEL }：</td>
							<td>
								<div class="d7_inputs">
									<label><input type="checkbox" value="1"/>是</label>
									<label><input type="checkbox" value="0"/>否</label>
								</div>
							</td>
							<td>
								<div class="d7_inodsi">
									<div class="shangchuan" title="上传文件"><input id="myfileb${ status.index + 1}" name="myfileb${ status.index + 1}" class="myfileb${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="uploads(this);"/></div>
									<div class="wenjianbox" id="myfileb${ status.index + 1}a">
									<input type="hidden" id="myfileb${ status.index + 1}b" value="${var.VALUE }">
										<c:forEach items="${machList }" var="ar">
											<c:if test="${var.VALUE == ar.VALUE }">
											<div class="jinjiuddd">
													<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
													<div class="jinjiudtits">
														<a href="${fns:getConfig('IMGURL')}/${ar.ATTACHMENURL}" title="${ar.ATTACHMENNAME }">${ar.ATTACHMENNAME }</a>
													</div>
													<input type="hidden" name="MEASURES_MESSAGE_ATTACHMENT_ID" value="${ar.MEASURES_MESSAGE_ATTACHMENT_ID }">
													<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
											</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</td>
						</tr>
						</c:forEach>
						
					<c:forEach items="${modelList }" var="modev" varStatus="statuss">
						<tr class="trcode">
							<td>
								<input type="text" class="inzidi" value="${modev.MODEL }"/>
								<input type="hidden"class="ATTACHMODEL_ID" name="ATTACHMODEL_ID"  value="${modev.ATTACHMODEL_ID }"/>
							</td>
							<td>
								<div class="d7_inputs">
									<label><input type="checkbox"  value="1"/>是</label>
									<label><input type="checkbox"  value="0"/>否</label>
								</div>
							</td>
							<td>
								<div class="d7_inodsi">
									<div class="shangchuan" title="上传文件"><input id="myfilec${ statuss.index + 1}" name="myfilec${ statuss.index + 1}"class="myfilec${ statuss.index + 1}" type="file"style="opacity: 0; filter: Alpha(opacity = 0);" /></div>
									<div class="wenjianbox" id="myfilec${ statuss.index + 1}a">
										<c:forEach items="${machList }" var="ara">
										<c:if test="${modev.ATTACHMODEL_ID eq ara.MODEL }">
										<div class="jinjiuddd">
												<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
												<div class="jinjiudtits">
													<a href="${fns:getConfig('IMGURL')}/${ara.ATTACHMENURL}" title="${ara.ATTACHMENNAME }">${ara.ATTACHMENNAME }</a>
												</div>
												<input type="hidden" name="MEASURES_MESSAGE_ATTACHMENT_ID" value="${ara.MEASURES_MESSAGE_ATTACHMENT_ID }">
												<em class="jinjiudddemr guanke"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
										</div>
										</c:if>
										</c:forEach>
									</div>
								</div>
								<button class="d7_scbtn pull-right" type="button">删除</button>
							</td>
						</tr>
						</c:forEach>
					</table>
					<a class="zidinbtn" href="javascript:;">自定义+</a>
					<div class="xiayibus"><a class="pull-left" href="${ctx}/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right nextSub"<c:if test="${handle.USTEP <DANGQJY-1}">href="${ctx}/process_eight/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if><c:if test="${handle.USTEP >=DANGQJY-1}">href="javaScript:;"</c:if> >下一步</a></div>
				</div>
			</div>
			
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script>
		$(document).on("click",".nextSub",function(){
			if(this.href == "javascript:;"){
				alert2("当前未完成，请先完成");
			}
		})
		//预防措施
		$(document).on("click",".jiushibtnxiu",function(){
			var MEASURESNAME = $(this).parents(".jinji_div").find("textarea[name='MEASURESNAME']");
			
			if(MEASURESNAME.val()==""){
				MEASURESNAME.tips({
					side:3,
		            msg:'请输入措施',
		            bg:'#AE81FF',
		            time:2
		        });
				MEASURESNAME.focus();
				return false;
				}
			//附件
			var accessory = "";
			var tis = $(this);
			console.log($(this));
			tis.parent().prev().find(".jinjiudtits").children("a").each(function(index,el){
				var realname = $(this).text();
				var name = $(this).next().val();
				var str = realname + "::" + name +";;";
				accessory += str;
			});
			tis.parents(".neibka_bor").find("input[name='ATTACHMENTNURL']").val(accessory); 
		
			  $.ajax({
				type : "POST",
				url : "${ctx}/process_seven/addAndEdit",
				data : tis.closest("form").serialize(),
				success : function(data) {
					tis.text("修改");
					tis.parents(".jinji_div").find("input[name='MEASURES_MESSAGE_PREVENT_ID']").val(data.MEASURES_MESSAGE_PREVENT_ID);
					alert2(data.mesage);
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});   
		});
		
		//验证/提交
		$(document).on("click",".d0_8btnbc",function(){
			
			if( $("#VERIFICATION").val()==""){
				$("#VERIFICATION").tips({
					side:3,
		            msg:'请输入验证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERIFICATION").focus();
				return false;
				}
			
				var PROCESS_SEVEN_ID = $("#PROCESS_SEVEN_ID").val();
				var VERIFICATION = $("#VERIFICATION").val();
				var VERIFICATIONURE = $("#VERIFICATIONURE").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				var tis =$(this);
				if(ISHANDLE == 0){
					return false;
				}
				$.ajax({
					type : "POST",
					url : "${ctx}/process_seven/symptom",
					data : {PROCESS_SEVEN_ID:PROCESS_SEVEN_ID,VERIFICATIONURE:VERIFICATIONURE,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,VERIFICATION:VERIFICATION},
					success : function(data) {
						$("#PROCESS_SEVEN_ID").val(data.PROCESS_SEVEN_ID);
						alert2(data.mesage);
						tis.text("修改");
						if($(".nextSub").attr("href")=="javaScript:;"){
							$(".nextSub").attr("href","${ctx}/process_eight/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
							tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_eight/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
						}
						
						//当前步棸完成状态
						//window.location.href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID="+CLIENT_PROBLEM_COLLECTION_ID;	
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
			});
		//删除
		$(document).on("click",".jinjiscbtn",function(){
			$.ajax({
				type : "POST",
				url : "${ctx}/process_seven/delet",
				data : $(this).closest("form").serialize(),
				success : function(data) {
					/*  window.location.reload(); */
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});
		})
		
		//上传附件
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		//附件上传
		function upload(target){
			var name=target.value;
		    var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
		    if(fileName !="doc" && fileName !="docx" && fileName !="mp3" && fileName !="xlsx"&& fileName !="zip"&& fileName !="xls"&& fileName !="pdf"&&fileName !="jpg" && fileName !="jpeg"&& fileName !="png" &&fileName !="gif"){
		       alert2("请选择正确格式的文件(doc,docx,mp3,xlsx,zip,pdf,xls,png,jpg,jpeg,gif)！");
		       target.value="";
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
				} catch (e) {
					alert2(e+"\n"+"如果错误为：Error:Automation 服务器不能创建对象；"+"\n"+"请按以下方法配置浏览器："+"\n"+"请打开【Internet选项-安全-Internet-自定义级别-ActiveX控件和插件-对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本（不安全）-点击启用-确定】");
					return;
				}
		    }else{    
		     fileSize = target.files[0].size;     
		    }
		    var size = fileSize / 1024;    
		    if(size>5120){  
		      alert2("文件大小不能超过5M");
		      target.value="";
		      return
		    } 
		    
		    DocAjaxFileUpload(target); 
		     
		}
		
		function DocAjaxFileUpload(target){
			
			var name=target.value;
			var fileName = name.substring(name.lastIndexOf("\\")+1);
			var $target = $(target);
			var classname = $target.attr('class');
			/* alert2(classname); */
			var myDate = new Date();
			var now = myDate.getTime();
			$.ajaxFileUpload({
				url: '${ctx}/pc/uploadfile', 
		        secureuri: false, 
		        fileElementId: classname, 
		        data:{"fileitem":"processSeven"},
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
		        		var str = "<div class='jinjiuddd'>"+"<em class='jinjiudddeml'><img src='${ctx }/static/fords/img/wenjian.png'/></em>";
						str +="<div class='jinjiudtits'>"
		        		str += "<a href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\">"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
		        		str += "</div>"
						str += "<em class='jinjiudddemr'><img src='${ctx }/static/fords/img/guanbi.png'/></em> </div>	";
						$("#"+classname+"a").append(str);
		        	}else if("oversize"==json.info){
		        		alert2("系统繁忙请稍后再试！");
		        	}
		        },
		        error:function(){
		        	alert2("上传失败");
		        }
			})
		}
		
		</script>
		<script>
		
		//自定义保存类型
		$(document).on("blur",".inzidi",function(){
		
   		 if($(this).val().length > 0){
   			 var MODEL = $(this).val();
   			 var ATTACHMODEL_ID = $(this).next().val();
   			 var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
   			 var tis = $(this);
   			$.ajax({
    			type : "POST",
    			url : "${ctx}/process_seven/modelAndEdit",
    			data : {MODEL:MODEL,ATTACHMODEL_ID:ATTACHMODEL_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID},
    			success : function(data) {
    				tis.next().val(data.ATTACHMODEL_ID);
    			},
    		 	error:function(){
    	        	alert2("上传失败");
    	        }
    		});
   			 
   			 
   		 }
   		 
			});
		$(function(){
			//删除文件事件
			$(document).on("click",".jinjiudddemr",function(){
				var MEASURES_MESSAGE_ATTACHMENT_ID= $(this).parents(".jinjiuddd").find("input[name='MEASURES_MESSAGE_ATTACHMENT_ID']").val();
				var tis = $(this);
				$.ajax({
					type : "POST",
					url : "${ctx}/process_seven/delets",
					data : {MEASURES_MESSAGE_ATTACHMENT_ID:MEASURES_MESSAGE_ATTACHMENT_ID},
					success : function(data) {
						/*  window.location.reload(); */
						tis.parents(".jinjiuddd").remove();
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
			})
			//开始的时候判断是否
			$(".d7table tr").each(function(){
				if($(this).find(".d7_inputs input:checked").val()==1){
					$(this).find(".d7_inodsi").removeClass("dis");
				}else if($(this).find(".d7_inputs input:checked").val()==0){
					$(this).find(".d7_inodsi").addClass("dis");
				}else{
					$(this).find(".d7_inodsi").children(".shangchuan").addClass("dis");
				}
			})
			$(".d7table").on("change",".d7_inputs input",function(){
				var a=$(this).val();
				if(a==1){
					if($(this).is(":checked")){
						$(this).parent().siblings("label").children("input").removeAttr("checked");
						$(this).parents("tr").find(".d7_inodsi").removeClass("dis").children(".shangchuan").removeClass("dis");
					}else{
						
						$(this).parents("tr").find(".d7_inodsi").children(".shangchuan").addClass("dis");//隐藏上传按钮（是被取消的时候）
					}
				}else if(a==0){
					if($(this).is(":checked")){
						$(this).parent().siblings("label").children("input").removeAttr("checked");
						$(this).parents("tr").find(".d7_inodsi").addClass("dis").children(".wenjianbox").html("");
						var tis =$(this);
						var ATTACHMODEL_ID = tis.parents("tr").find(".ATTACHMODEL_ID").val();
						$.ajax({
							type : "POST",
							url : "${ctx}/process_seven/delettes",
							data : {ATTACHMODEL_ID:ATTACHMODEL_ID},
							success : function(data) {
								tis.parents("tr").find(".d7_inodsi").addClass("dis").children(".wenjianbox").html("");
							},
						 	error:function(){
					        	alert2("上传失败");
					        }
						});
						
					}else{
						
						$(this).parents("tr").find(".d7_inodsi").removeClass("dis").children(".shangchuan").addClass("dis");
					}
				}
			})
			//删除按钮
			$(".d7table").on("click",".d7_scbtn",function(){
				var tis =$(this);
				var ATTACHMODEL_ID = tis.parents("tr").find(".ATTACHMODEL_ID").val();
				$.ajax({
					type : "POST",
					url : "${ctx}/process_seven/deletted",
					data : {ATTACHMODEL_ID:ATTACHMODEL_ID},
					success : function(data) {
						tis.parents("tr").remove();
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
			})
			//自定义按钮
			var str;
			$(document).on("click",".zidinbtn",function(){
				var timestamp=new Date().getTime();
				str='<tr class="trcode"><td><input type="text"class="inzidi"/><input type="hidden" class="ATTACHMODEL_ID" name="ATTACHMODEL_ID"/><td><div class="d7_inputs"><label><input type="checkbox"value="1"/>是</label><label><input type="checkbox"value="0"/>否</label></div></td><td><div class="d7_inodsi"><div class="shangchuan dis"title="上传文件"><input id="myfile'+timestamp+'" name="myfile'+timestamp+'" class="myfile'+timestamp+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" /></div><div class="wenjianbox" id="myfile'+timestamp+'a"></div></div><button class="d7_scbtn pull-right"type="button">删除</button></td></tr>';
				//文件循环
				$(".d7table").append(str);
				str="";
			})
			
			//保存按钮
			$(document).on("click",".d7_bcbtn",function(){
				var ass=$(this).parents("tr").find(".inzidi").val();
				$(this).parents("tr").find("td:first-child").html(ass)
			})
		})
			//自定义上传附件
			$(document).on("change",".shangchuan>input",function(){
				
				if($(this).parents(".trcode").find(".ATTACHMODEL_ID").val() == ""){
					alert2("类型不能为空")
					return false;
				}
				
				uploads(this);
			})
				//文件更新 附件上传
			function uploads(target){
				var b = $(target).parents(".trcode").find(".ATTACHMODEL_ID").val();
				var name=target.value;
			    var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
			    if(fileName !="doc" && fileName !="docx"&& fileName !="xlsx"&& fileName !="zip"&& fileName !="xls"&& fileName !="pdf"&&fileName !="jpg" && fileName !="jpeg"&& fileName !="png" &&fileName !="gif"){
			       alert2("请选择正确格式的文件(doc,docx,xlsx,zip,pdf,xls,png,jpg,jpeg,gif)！");
			       target.value="";
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
					} catch (e) {
						alert2(e+"\n"+"如果错误为：Error:Automation 服务器不能创建对象；"+"\n"+"请按以下方法配置浏览器："+"\n"+"请打开【Internet选项-安全-Internet-自定义级别-ActiveX控件和插件-对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本（不安全）-点击启用-确定】");
						return;
					}
			    }else{    
			     fileSize = target.files[0].size;     
			    }
			    var size = fileSize / 1024;    
			    if(size>5120){  
			      alert2("文件大小不能超过5M");
			      target.value="";
			      return
			    } 
			    
			    DocAjaxFileUploads(target,b); 
			     
			}
			
			function DocAjaxFileUploads(target,ATTACHMODEL_ID){
				
				var name=target.value;
				var fileName = name.substring(name.lastIndexOf("\\")+1);
				var $target = $(target);
				var classname = $target.attr('class');
				/* alert2(classname); */
				var myDate = new Date();
				var now = myDate.getTime();
				$.ajaxFileUpload({
					url: '${ctx}/pc/uploadfile', 
			        secureuri: false, 
			        fileElementId: classname, 
			        data:{"fileitem":"processSeven"},
			        /* dataType: 'JSON',   */ 
			        success:function(data){
			        	
			        	var str = $(data).find("body").text();  
			            var json = $.parseJSON(str);
			        	if("success"==json.info){
			        		var servername = json.imgurl;
			        		var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
			        		var namevalue = $("#"+classname+"b").val();
			        		$.ajax({
			        			type : "POST",
			        			url : "${ctx}/process_seven/fileAndEdit",
			        			data : {ATTACHMENNAME:fileName,ATTACHMENURL:json.url,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,VALUE:namevalue,MODEL:ATTACHMODEL_ID},
			        			success : function(data) {
			        				var str = "<div class=\"jinjiuddd\">\n"
						        		+"											<em class=\"jinjiudddeml\"><img src=\"${ctx}/static/fords/img/wenjian.png\"/></em>\n"
						        		+"											<div class=\"jinjiudtits\">\n"
						        		+"												<a href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\" title=\""+fileName+"\" title=\""+fileName+"\">"+fileName+"</a>\n"
						        		+"												<input type=\"hidden\" name=\"MEASURES_MESSAGE_ATTACHMENT_ID\" value=\""+data.MEASURES_MESSAGE_ATTACHMENT_ID+"\">"
						        		+"											</div>\n"
						        		+"											<em class=\"jinjiudddemr\"><img src=\"${ctx}/static/fords/img/guanbi.png\"/></em>\n"
						        		+"										</div>"
										$("#"+classname+"a").append(str);
			        			},
			        		 	error:function(){
			        	        	alert2("上传失败");
			        	        }
			        		});
			        		
			        		
			        		
			        		
			        	}else if("oversize"==json.info){
			        		alert2("系统繁忙请稍后再试！");
			        	}
			        },
			        error:function(){
			        	alert2("上传失败");
			        }
				})
			}
		</script>
	</body>
</html>
