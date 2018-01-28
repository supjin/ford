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
		<link rel="stylesheet" href="${ctx }/static/fords/css/d3.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d3.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
	    <script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/seek.js" ></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 20px;">
		<div class="oiswen_box">
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
			<input type="hidden" name="ISHANDLE" id="ISHANDLE" value="${handle.ISHANDLE }">
			<input type="hidden" name="DQUID" id="DQUID" value="${handle.DQUID }">
			<!---d3临时措施---->
			<div class="d3_boxs">
				<div class="jinji_box" style="border: none;padding: 0px;">
					<div class="jinji_titbtn">
						<div class="fay_tled">D3临时措施</div>
						<div class="npaicbxz">
							<button class="jinjipai"  onclick="window.location.href='${ctx}/dProcess/goScreening?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID }&TYPE=${pd.TYPE}'"  type="button">排查表</button><button type="button" class="zjbtn">新增+</button>
						</div>
					</div>
					<c:if test="${varList != null }">
					<c:forEach items="${varList }" var="var" varStatus="status">
					<div class="jinji_div">
						<div class="xuhao_bocn">序号-<span>${status.index + 1}</span></div>
						<div class="neibka_bor">
							<form action="" name="yinForm" class="yinForm">
								<input type="hidden" name="MEASURES_MESSAGE_ID" value="${var.MEASURES_MESSAGE_ID }">
								<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
								<div class="jinjiul">
									<div class="container" style="width: 100%;">
										<div class="row">
											<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
												<div class="jinjiula">
													<p class="jinjiultit">责任人</p>
													<div class="jinjiuze">
														<div class="baidssb">
															<input type="hidden" class="responsese"  value="${var.RESPONSIBLE }">
											                <input class="sowe_lse form-control" maxlength="6"  name="RESPONSIBLE"  type="text" <c:if test="${not empty var.NAME}"> value="${var.NAME }"</c:if><c:if test="${empty var.NAME}"> value="${var.RESPONSIBLE }"</c:if>/>
											                <div class="taocen_cn">
										                    <ul class="houxuciu"></ul>
										                	</div>
										                </div>
										             </div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
												<div class="jinjiulb">
													<p class="jinjiultit">计划时间</p>
													<div class="jinjiuze">
														<input type="date" class="form-control" name="DOTIME" value="${var.DOTIME }" >
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
												<div class="jinjiulb">
													<p class="jinjiultit">执行时间</p>
													<div class="jinjiuze">
														<input type="date" class="form-control" name="EXECUTIONDATE"value="${var.EXECUTIONDATE }"  >
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
												<div class="jinjiulc jinjiulb">
													<p class="jinjiultit">有效率</p>
													<div class="jinjiuze">
														 <select name="EFFICIENT">
											            	<c:forEach items="${biaoList }" var="bi">
											            	<option  <c:if test="${bi.VALUE eq var.EFFICIENT }">selected</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
											            	</c:forEach>	
								           			 	</select>
													</div>
												</div>
											</div>
											<div class="col-xs-12 col-sm-8 col-md-12 col-lg-4">
												<div class="jinjiule jinjiulb">
												 <input type="hidden" name="ATTACHMENTNURL">
													<div class="jinjiultit2">上传附件<input id="myfile${status.index + 1}" name="myfile${ status.index + 1}" class="myfile${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
													<div class="jinjiuze">
														<div class="jinjiddi" id="myfile${ status.index + 1}a">
														 <c:forEach items="${var.ATTMAP }" var="att">
														 <c:forEach var="map" items="${att}">
															 <div class="jinjiuddd">
																<em class="jinjiudddeml pull-left"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
																<input type='hidden' value='${map.value}'/>
																</div>
																<em class="jinjiudddemr pull-left"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
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
													<p class="jinjiultit">临时措施</p>
													<div class="jinjiuze">
														<textarea name="MEASURESNAME">${var.MEASURESNAME }</textarea>
													</div>
												</div>
											</div>
	
										</div>
									</div>
								</div>
								<div class="jinji_divtitbot">
									<button class="pull-right zjbtn" type="button">新增+</button>
									<button class="pull-right jinjiscbtn" type="button">删除</button>
									<button class="pull-right jiushibtnxiu" type="button">修改</button>
								</div>
							</form>
						</div>
					</div>
					
					
					</c:forEach>
					</c:if>
					
					
					<c:if test="${fn:length(varList ) == 0}">
					<div class="jinji_div">
						<div class="xuhao_bocn">序号-<span>1</span></div>
						<div class="neibka_bor">
							<form action="" name="yinForm" class="yinForm">
								<input type="hidden" name="MEASURES_MESSAGE_ID" value="">
								<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
								<div class="jinjiul">
									<div class="container" style="width: 100%;">
										<div class="row">
											<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
												<div class="jinjiula">
													<p class="jinjiultit">责任人</p>
													<div class="jinjiuze">
														<div class="baidssb">
															<input type="hidden" class="responsese" name="RESPONSIBLE" value="${handle.USERID }"/>
											                <input class="sowe_lse form-control" maxlength="6"   type="text" value="${handle.RSNAME }"/>
											                <div class="taocen_cn">
											                    <ul class="houxuciu"></ul>
											                </div>
											       		 </div>
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
												<div class="jinjiulb">
													<p class="jinjiultit">计划时间</p>
													<div class="jinjiuze">
														<input type="date" class="jihuatame form-control" name="DOTIME" >
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
												<div class="jinjiulb">
													<p class="jinjiultit">执行时间</p>
													<div class="jinjiuze">
														<input type="date" class="jihuatame form-control" name="EXECUTIONDATE" >
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
												<div class="jinjiulc jinjiulb">
													<p class="jinjiultit">有效率</p>
													<div class="jinjiuze">
														 <select name="EFFICIENT">
											            	<c:forEach items="${biaoList }" var="bi">
											            	<option  <c:if test="${bi.VALUE eq var.EFFICIENT }">selected</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
											            	</c:forEach>	
								           			 	</select>
													</div>
												</div>
											</div>
											<div class="col-xs-12 col-sm-8 col-md-12 col-lg-4">
												<div class="jinjiule jinjiulb">
												 <input type="hidden" name="ATTACHMENT">
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
													<p class="jinjiultit">临时措施</p>
													<div class="jinjiuze">
														<textarea name="MEASURESNAME"></textarea>
													</div>
												</div>
											</div>
	
										</div>
									</div>
								</div>
								<div class="jinji_divtitbot">
									<button class="pull-right zjbtn" type="button">新增+</button>
									<button class="pull-right jinjiscbtn" type="button">删除</button>
									<button class="pull-right jiushibtnxiu" type="button">保存</button>
								</div>
							</form>
						</div>
					</div>
					</c:if>
					<a class="oisbtns" style="display: none;"></a>
				</div>
				
			</div>
			<!---验证证实--->
			<div class="d0_jinbox">
				<div class="d0_shuru">
					<p class="d0_shurutit"><span>*</span>验证/证实</p>
					<div class="d0_shurut"><textarea name="VALIDATION" id="VALIDATION">${pds.VALIDATION}</textarea></div>
					<input type="hidden" name="PROCESS_THREE_ID"  id="PROCESS_THREE_ID" value="${pds.PROCESS_THREE_ID }">
					<button class="d0_8btnbc" type="button"><c:if test="${empty pds.PROCESS_THREE_ID }">保存</c:if><c:if test="${not empty pds.PROCESS_THREE_ID }">修改</c:if></button>
				</div>
				
				<!---浏览应急措施--->
				<div class="d3_liutit">浏览应急措施</div>
				 <c:forEach items="${merList }" var="var">
				<div class="d3_liuyingbox">
					<form action="">
					 <input type="hidden" name="ZEROEMERGENCY_ID" value="${var.ZEROEMERGENCY_ID }">
						<div class="xuhao_bocn">序号-<span>${ status.index + 1}</span></div>
						<div class="d3_ddcc">
							<div class="container" style="width: 100%;">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-3 col-lg-2">
										<div class="d3_liua"><p>执行时间：</p><div>${var.EXECUTIONDATE }</div></div>
									</div>
									<div class="col-xs-12  col-sm-12 col-md-6 col-lg-8">
										<div class="d3_liua"><p>应急反应：</p><div>${var.EMERGENCYRESPONSE }</div></div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-3 col-lg-2">
										<button class="d3_liubtn" type="button">选择添加</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
					 </c:forEach> 
				<div class="d3_btnbox"><a class="pull-left" href="${ctx}/process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right ansnis" <c:if test="${handle.USTEP <DANGQJY-1}">href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if><c:if test="${handle.USTEP >=DANGQJY-1}">href="javaScript:;"</c:if> >下一步</a></div>
			</div>
			
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script>
/* 		
		function goPxtable(){
			
			window.location.href="${ctx}/dProcess/goScreening?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID }&TYPE=${pd.TYPE}";
		} */
		$(document).on("click",".ansnis",function(){
			if(this.href == "javascript:;"){
				alert2("当前未完成，请先完成");
			}
		})
		//临时措施
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
			tis.parent().prev().find(".jinjiddi").find("a").each(function(index,el){
				var realname = $(this).text();
				var name = $(this).next().val();
				var str = realname + "::" + name +";;";
				accessory += str;
			});
			tis.parents(".jinji_div").find("input[name='ATTACHMENTNURL']").val(accessory); 
		
			 $.ajax({
				type : "POST",
				url : "${ctx}/process_three/addAndEdit",
				data : tis.closest("form").serialize(),
				success : function(data) {
					tis.text("修改");
					tis.parents(".jinji_div").find("input[name='MEASURES_MESSAGE_ID']").val(data.MEASURES_MESSAGE_ID);
					alert2(data.mesage);
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});  
		});
		
		
		//验证/提交
		$(document).on("click",".d0_8btnbc",function(){
			if($("#VALIDATION").val()==""){
				$("#VALIDATION").tips({
					side:3,
		            msg:'请输入验证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VALIDATION").focus();
				return false;
				}
			
				var PROCESS_THREE_ID = $("#PROCESS_THREE_ID").val();
				var VALIDATION = $("#VALIDATION").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				var tis = $(this);
				if(ISHANDLE == 0){
					alert2("无权限");
					return false;
				}
				$.ajax({
					type : "POST",
					url : "${ctx}/process_three/symptom",
					data : {PROCESS_THREE_ID:PROCESS_THREE_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,VALIDATION:VALIDATION},
					success : function(data) {
						$("#PROCESS_THREE_ID").val(data.PROCESS_THREE_ID);
						tis.text("修改");
						alert2("保存成功！")
						if($(".ansnis").attr("href")=="javaScript:;"){
							$(".ansnis").attr("href","${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
							tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");	
						}
						//当前步棸完成状态
						//window.location.href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID="+CLIENT_PROBLEM_COLLECTION_ID;	
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
			});
		
		//选定
		$(document).on("click",".d3_liubtn",function(){
			$.ajax({
				type : "POST",
				url : "${ctx}/process_three/checkAdd",
				data : $(this).closest("form").serialize(),
				success : function(data) {
				 /*  window.location.reload();   */
				// if(data.list.length != 0){ }
				var a= $(".jinji_box>.jinji_div").length + 1;
				var b = data.list;
				var NAME = b.NAME;
				if(typeof(NAME)=="undefined"){ 
					NAME = "";
				} 
				var DOTIME = b.DOTIME;
				if(typeof(DOTIME)=="undefined"){ 
					DOTIME = "";
				} 
				var EXECUTIONDATE = b.EXECUTIONDATE;
				if(typeof(EXECUTIONDATE)=="undefined"){ 
					EXECUTIONDATE = "";
				}
				var MEASURESNAME = b.MEASURESNAME;
				if(typeof(MEASURESNAME)=="undefined"){ 
					MEASURESNAME = "";
				}
				
				var str = "<div class=\"jinji_div\">\n"
				+"						<div class=\"xuhao_bocn\">序号-<span>"+a+"</span></div>\n"
				+"						<div class=\"neibka_bor\">\n"
				+"							<form action=\"\">\n"
				+"								<form action=\"\" name=\"yinForm\" class=\"yinForm\">\n"
				+"								<input type=\"hidden\" name=\"MEASURES_MESSAGE_ID\" value=\""+b.MEASURES_MESSAGE_ID+"\">\n"
				+"								<input type=\"hidden\" name=\"CLIENT_PROBLEM_COLLECTION_ID\" value=\""+b.CLIENT_PROBLEM_COLLECTION_ID+"\">\n"
				+"								<div class=\"jinjiul\">\n"
				+"									<div class=\"container\" style=\"width: 100%;\">\n"
				+"										<div class=\"row\">\n"
				+"											<div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n"
				+"												<div class=\"jinjiula\">\n"
				+"													<p class=\"jinjiultit\">责任人</p>\n"
				+"													<div class=\"jinjiuze\">\n"
				+"														<div class=\"baidssb\">\n"
				+"															<input type=\"hidden\" class=\"responsese\" name=\"RESPONSIBLE\" value=\""+b.RESPONSIBLE+"\" />\n"
				+"											                <input class=\"sowe_lse form-control\" maxlength=\"6\"   type=\"text\" value=\""+NAME+"\"/>\n"
				+"											                <div class=\"taocen_cn\">\n"
				+"											                    <ul class=\"houxuciu\"></ul>\n"
				+"											                </div>\n"
				+"											       </div>\n"
				+"													</div>\n"
				+"												</div>\n"
				+"											</div>\n"
				+"											<div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n"
				+"												<div class=\"jinjiulb\">\n"
				+"													<p class=\"jinjiultit\">计划时间</p>\n"
				+"													<div class=\"jinjiuze\">\n"
				+"														<input type=\"date\" class=\"jihuatame\"  name=\"DOTIME\" value=\""+DOTIME+"\">\n"
				+"													</div>\n"
				+"												</div>\n"
				+"											</div>\n"
				+"											<div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n"
				+"												<div class=\"jinjiulb\">\n"
				+"													<p class=\"jinjiultit\">执行时间</p>\n"
				+"													<div class=\"jinjiuze\">\n"
				+"														<input type=\"date\" class=\"jihuatame\" name=\"EXECUTIONDATE\" value=\""+EXECUTIONDATE+"\">\n"
				+"													</div>\n"
				+"												</div>\n"
				+"											</div>\n"
				+"											<div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n"
				+"												<div class=\"jinjiulc jinjiulb\">\n"
				+"													<p class=\"jinjiultit\">有效率</p>\n"
				+"													<div class=\"jinjiuze\">\n"
				+"														<select name=\"EFFICIENT\">\n"
				if(b.EFFICIENT == 1){
					str +="									            	<option value=\"1\" selected=\"selected\">25%</option>\n"
						+"									            	<option value=\"2\">50%</option>\n"
						+"													<option value=\"3\">75%</option>\n"
						+"									            	<option value=\"4\">100%</option>\n"
						}

					if(b.EFFICIENT == 2){
					str +="									            	<option value=\"1\">25%</option>\n"
						+"									            	<option value=\"2\" selected=\"selected\">50%</option>\n"
						+"													<option value=\"3\">75%</option>\n"
						+"									            	<option value=\"4\">100%</option>\n"
						}	
						
					if(b.EFFICIENT == 3){
						str +="									            	<option value=\"1\">25%</option>\n"
							+"									            	<option value=\"2\">50%</option>\n"
							+"													<option value=\"3\" selected=\"selected\">75%</option>\n"
							+"									            	<option value=\"4\">100%</option>\n"
							}		
					if(b.EFFICIENT == 4){
						str +="									            	<option value=\"1\">25%</option>\n"
							+"									            	<option value=\"2\">50%</option>\n"
							+"													<option value=\"3\">75%</option>\n"
							+"									            	<option value=\"4\" selected=\"selected\">100%</option>\n"
							}	
					if(typeof(b.EFFICIENT)=="undefined"){ 
						str +="									            	<option value=\"1\">25%</option>\n"
							+"									            	<option value=\"2\">50%</option>\n"
							+"													<option value=\"3\">75%</option>\n"
							+"									            	<option value=\"4\">100%</option>\n"
							}
				str +="														</select>\n"
				+"													</div>\n"
				+"												</div>\n"
				+"											</div>\n"
				+"											<div class=\"col-xs-12 col-sm-8 col-md-12 col-lg-4\">\n"
				+"												<div class=\"jinjiule jinjiulb\">\n"
				+"													<input type=\"hidden\" name=\"ATTACHMENTNURL\">\n"
				+"													<div class=\"jinjiultit2\">上传附件<input id=\"myfile"+a+"\" name=\"myfile"+a+"\" class=\"myfile"+a+"\" type=\"file\" style=\"opacity: 0; filter:Alpha(opacity=0);\" onchange=\"upload(this);\"/></div>\n"
				+"													<div class=\"jinjiuze\">\n"
				+"														<div class=\"jinjiddi\" id=\"myfile"+a+"a\">\n"
				var c = b.ATTACH;
				for (var i = 0; i < c.length; i++) {
					var zongurl = c[i]
					var realname = zongurl.substring(0,zongurl.indexOf("::"));
					var servername =zongurl.substring(zongurl.indexOf("::")+2,zongurl.length);
					
				
					str +="<div class=\"jinjiuddd\">\n"
					+"																<em class=\"jinjiudddeml\"><img src=\"${ctx}/static/fords/img/wenjian.png\"/></em>\n"
					+"																<div class=\"jinjiudtits\">\n"
					+"																	<a href=\"${ctx }/process_two/downWen.do?filepath="+servername+"&filename="+realname+"\" title=\""+realname+"\">"+realname+"</a><input type='hidden' value='"+servername+"'>\n"
					+"																</div>\n"
					+"																<em class=\"jinjiudddemr\"><img src=\"${ctx}/static/fords/img/guanbi.png\"/></em>\n"
					+"															</div>"
				}
				
				str +="															\n"
				+"														</div>\n"
				+"													</div>\n"
				+"												</div>\n"
				+"											</div>\n"
				+"										</div>\n"
				+"										<div class=\"row\">\n"
				+"											<div class=\"col-md-12 col-lg-12\">\n"
				+"												<div class=\"jinjiuld jinjiulb\">\n"
				+"													<p class=\"jinjiultit\">临时措施</p>\n"
				+"													<div class=\"jinjiuze\">\n"
				+"														<textarea name=\"MEASURESNAME\">"+MEASURESNAME+"</textarea>\n"
				+"													</div>\n"
				+"												</div>\n"
				+"											</div>\n"
				+"	\n"
				+"										</div>\n"
				+"									</div>\n"
				+"								</div>\n"
				+"								<div class=\"jinji_divtitbot\">\n"
				+"									<button class=\"pull-right zjbtn\" type=\"button\">新增+</button>\n"
				+"									<button class=\"pull-right jinjiscbtn\" type=\"button\">删除</button>\n"
				+"								<button class=\"pull-right jiushibtnxiu\" type=\"button\">保存</button>\n"
				+"								</div>\n"
				+"							</form>\n"
				+"						</div>\n"
				+"					</div>"
				
				$(".oisbtns").before(str)
				
				},
			error:function(){
	        	alert2("上传失败");
	        }
		});
	})
		
		//删除
		$(document).on("click",".jinjiscbtn",function(){
			$.ajax({
				type : "POST",
				url : "${ctx}/process_three/delet",
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
		        data:{"fileitem":"processThree"},
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
		        		var str = "<div class='jinjiuddd'>"+"<em class='jinjiudddeml pull-left'><img src='${ctx }/static/fords/img/wenjian.png'/></em>";
						str +="<div class='jinjiudtits'>"
		        		str += "<a href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\">"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
		        		str += "</div>"
						str += "<em class='jinjiudddemr pull-left'><img src='${ctx }/static/fords/img/guanbi.png'/></em> </div>	";
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
	</body>
</html>

