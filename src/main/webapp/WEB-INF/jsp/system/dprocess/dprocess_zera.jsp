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
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_seach.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d0.js" ></script>
		<script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/seek.js" ></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_seach.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 20px;">
		<div class="oiswen_box">
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
	<!---d0紧急遏制--->
			<input type="hidden" name="PROCESS_ZERO_ID" id="PROCESS_ZERO_ID" value="${pds.PROCESS_ZERO_ID }">
			<input type="hidden" name="ISHANDLE" id="ISHANDLE" value="${handle.ISHANDLE }">
			<input type="hidden" name="DQUID" id="DQUID" value="${handle.DQUID }">
			<div class="d0_jinbox">
				<h3 class="d0_jintit">D0紧急遏制</h3>
				<div class="d0_shuru">
					<p class="d0_shurutit"><span>*</span>症状描述</p>
					
					<div class="d0_shurut"><textarea name="SYSPTOMDESCRIPTION" id="SYSPTOMDESCRIPTION"><c:if test="${empty pds.PROCESS_ZERO_ID }">${pd.TITLE }</c:if><c:if test="${not empty pds.PROCESS_ZERO_ID }">${pds.SYSPTOMDESCRIPTION }</c:if></textarea></div>
					<button class="d0_8btnbc" id="zenghuati" type="button"><c:if test="${empty pds.PROCESS_ZERO_ID }">保存</c:if><c:if test="${not empty pds.PROCESS_ZERO_ID }">修改</c:if></button>
				</div>
			</div>
			<!----应急反应---->
			<div class="jinji_box">
				<div class="jinji_titbtn">
					<div class="fay_tled">应急反应</div>
					<div class="npaicbxz">
						<a class="jinjipai" href="${ctx}/dProcess/goScreening?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID }&TYPE=${pd.TYPE}">排查表</a>
					</div>
				</div>
			<c:if test="${varList != null }">
			<c:forEach items="${varList }" var="var" varStatus="status">
			<div class="jinji_div">
					<div class="xuhao_bocn">序号-<span>${ status.index + 1}</span></div>
					<div class="neibka_bor">
						<form action="" name="yinForm" class="yinForm">
							<input type="hidden" name="ZEROEMERGENCY_ID" value="${var.ZEROEMERGENCY_ID }">
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="jinjiula">
												<p class="jinjiultit">责任人：</p>
												<div class="jinjiuze">
												<%-- <div class="baidssb">
													<input type="hidden" class="responsese"value="${var.RESPONSIBLE }">
									                <input class="sowe_lse form-control" maxlength="6" type="text" name="RESPONSIBLE" <c:if test="${not empty var.NAME}"> value="${var.NAME }"</c:if><c:if test="${empty var.NAME}"> value="${var.RESPONSIBLE }"</c:if>/>
									                <div class="taocen_cn">
									                    <ul class="houxuciu"></ul>
									                </div>
									       		 </div> --%>
									       		 <div class="pw_chaxun" style="height: 34px;">
									       				 <input type="hidden" class="responsese"value="${var.RESPONSIBLE }">
														<input type="text" class="pw_cha_input"  maxlength="6"   name="RESPONSIBLE"  <c:if test="${not empty var.NAME}"> value="${var.NAME }"</c:if><c:if test="${empty var.NAME}"> value="${var.RESPONSIBLE }"</c:if>/>
														<ul class="pw_cha_ul">
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="jinjiulb">
												<p class="jinjiultit">计划时间：</p>
												<div class="jinjiuze">
													<input type="date" class="form-control pw_datea" name="PLANTIME"  value="${var.PLANTIME }" >
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="jinjiulb">
												<p class="jinjiultit">执行时间：</p>
												<div class="jinjiuze">
													<input type="date" class="form-control pw_dateb" value="${var.EXECUTIONDATE }" name="EXECUTIONDATE"  >
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="jinjiulc jinjiulb">
												<p class="jinjiultit">有效率：</p>
												<div class="jinjiuze">
													 <select name="EFFCIENT">
										            	<c:forEach items="${biaoList }" var="bi">
										            	<option  <c:if test="${bi.VALUE eq var.EFFCIENT }">selected</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
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
																<a class="pull-left" href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
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
									</div>

									<div class="row">
										<div class="col-md-12 col-lg-12">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">应急反应：</p>
												<div class="jinjiuze">
													<textarea name="EMERGENCYRESPONSE">${var.EMERGENCYRESPONSE }</textarea>
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
							<input type="hidden" name="ZEROEMERGENCY_ID" value="">
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="jinjiula">
												<p class="jinjiultit">责任人：</p>
												<div class="jinjiuze">
													<div class="pw_chaxun" style="width: 200px;height: 30px;">
												 		<input type="hidden" class="responsese" value="${handle.USERID }">
														<input type="text" class="pw_cha_input"  maxlength="6"   name="RESPONSIBLE" value="${handle.RSNAME }"/>
														<ul class="pw_cha_ul">
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="jinjiulb">
												<p class="jinjiultit">计划时间：</p>
												<div class="jinjiuze">
													<input type="date" class="jihuatame form-control pw_datea" name="PLANTIME" >
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="jinjiulb">
												<p class="jinjiultit">执行时间：</p>
												<div class="jinjiuze">
													<input type="date" class="jihuatame form-control pw_dateb"name="EXECUTIONDATE"  >
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="jinjiulc jinjiulb">
												<p class="jinjiultit">有效率：</p>
												<div class="jinjiuze">
													 <select name="EFFCIENT">
										            	<c:forEach items="${biaoList }" var="bi">
										            	<option  <c:if test="${bi.VALUE eq var.EFFCIENT }">selected</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
										            	</c:forEach>	
								            	
								           			 </select>
												</div>
											</div>
										</div>
										<div class="col-xs-12 col-sm-8 col-md-12 col-lg-4">
											<div class="jinjiule jinjiulb">
											<input type="hidden" name="ATTACHMENTNURL">
												<div class="jinjiultit2">上传附件<input id="myfiles" name="myfiles" class="myfiles" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi" id="myfilesa">
														<!-- <div class="jinjiuddd">
															<em class="jinjiudddeml"><img src="img/wenjian.png"/></em>
															<div class="jinjiudtits">
																<a href="javascript:;" title="时间的客户刷都结束了文档1时间的客户刷都结束了文档1">时间的客户刷都结束了文档1时间的客户刷都结束了文档1.doc</a>
															</div>
															<em class="jinjiudddemr"><img src="img/guanbi.png"/></em>
														</div> -->
														
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12 col-lg-12">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">应急反应：</p>
												<div class="jinjiuze">
													<textarea name="EMERGENCYRESPONSE"></textarea>
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
			</div>
			<!---验证证实--->
			<div class="d0_jinbox">
				<div class="d0_shuru">
					<p class="d0_shurutit"><span>*</span>验证/证实</p>
					<div class="d0_shurut"><textarea name="VERIFICATION" id="VERIFICATION">${pds.VERIFICATION }</textarea></div>
					<button class="d0_8btnbc" id="yanzeti" type="button"><c:if test="${empty pds.PROCESS_ZERO_ID }">保存</c:if><c:if test="${not empty pds.PROCESS_ZERO_ID }">修改</c:if></button>
				</div>
				<a class="oisbtns"<c:if test="${handle.USTEP <DANGQJY-1}">href="${ctx}/process_one/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if><c:if test="${handle.USTEP >=DANGQJY-1}">href="javaScript:;"</c:if> >下一步</a>
			</div>
			
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script>
		
		function goPxtable(){
			window.location.href="${ctx}/pc/paicha";
		}
		
		
		
		$(function(){
			
			$(document).on("click",".oisbtns",function(){
				if(this.href == "javascript:;"){
					alert2("当前未完成，请先完成");
				}
			})

			
			//验证
			$(document).on("click","#yanzeti",function(){
				if($("#VERIFICATION").val()==""){
					$("#VERIFICATION").tips({
						side:3,
			            msg:'请输入验证',
			            bg:'#AE81FF',
			            time:2
			        });
					$("#VERIFICATION").focus();
					return false;
					}
				var PROCESS_ZERO_ID = $("#PROCESS_ZERO_ID").val();
				var VERIFICATION = $("#VERIFICATION").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				var DQUID = $("#DQUID").val();//是否是责任人
				var tis = $(this);
				if(ISHANDLE == 0){
					alert2("无权限");
					return false;
				}else{
				$.ajax({
					type : "POST",
					url : "${ctx}/dProcess/symptom",
					data : {PROCESS_ZERO_ID:PROCESS_ZERO_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,VERIFICATION:VERIFICATION},
					success : function(data) {
						$("#PROCESS_ZERO_ID").val(data.PROCESS_ZERO_ID);
						alert2("保存成功");
						tis.text("修改");
						if($(".oisbtns").attr("href")=="javaScript:;"){
						$(".oisbtns").attr("href","${ctx}/process_one/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
						tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_one/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
						}
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
				}
			})
			//症状描述
			$(document).on("click","#zenghuati",function(){

				if($("#SYSPTOMDESCRIPTION").val()==""){
				$("#SYSPTOMDESCRIPTION").tips({
					side:3,
		            msg:'请输入症状描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SYSPTOMDESCRIPTION").focus();
				return false;
				}
				var SYSPTOMDESCRIPTION = $("#SYSPTOMDESCRIPTION").val();
				var PROCESS_ZERO_ID = $("#PROCESS_ZERO_ID").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				var DQUID = $("#DQUID").val();//是否是责任人
				var tis = $(this);
				if(ISHANDLE == 0){
					alert2("无权限");
					return false;
				}else{
				$.ajax({
					type : "POST",
					url : "${ctx}/dProcess/symptom",
					data : {SYSPTOMDESCRIPTION:SYSPTOMDESCRIPTION,PROCESS_ZERO_ID:PROCESS_ZERO_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID},
					success : function(data) {
						$("#PROCESS_ZERO_ID").val(data.PROCESS_ZERO_ID);
						alert2("保存成功");
						tis.text("修改");
						if($(".oisbtns").attr("href")=="javaScript:;"){
						$(".oisbtns").attr("href","${ctx}/process_one/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
						}
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
				}
			})
			
		})
		//删除
		$(document).on("click",".jinjiscbtn",function(){
			$.ajax({
				type : "POST",
				url : "${ctx}/dProcess/delet",
				data : $(this).closest("form").serialize(),
				success : function(data) {
					/*  window.location.reload(); */
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});
		})
		//应急反应
		$(document).on("click",".jiushibtnxiu",function(){
			var tis = $(this);
			if(tis.parents(".jinji_div").find("textarea[name='EMERGENCYRESPONSE']").val()==""){
				tis.parents(".jinji_div").find("textarea[name='EMERGENCYRESPONSE']").tips({
					side:3,
		            msg:'请输入应急反应',
		            bg:'#AE81FF',
		            time:2
		        });
				tis.parents(".jinji_div").find("textarea[name='EMERGENCYRESPONSE']").focus();
				return false;
				}			
			//附件
			var accessory = "";
			var tis = $(this);
			tis.parent().prev().find(".jinjiddi").find("a").each(function(index,el){
				var realname = $(this).text();
				var name = $(this).next().val();
				var str = realname + "::" + name +";;";
				accessory += str;
			});
			$("input[name='ATTACHMENTNURL']").val(accessory); 
			 $.ajax({
				type : "POST",
				url : "${ctx}/dProcess/addAndEdit",
				data : tis.closest("form").serialize(),
				success : function(data) {
					 tis.text("修改");
					tis.parents(".jinji_div").find("input[name='ZEROEMERGENCY_ID']").val(data.ZEROEMERGENCY_ID);
					 alert2(data.mesage); 
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});  
		});
		
		
		
		
		//上传附件
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		//附件上传
		function upload(target){
			var name=target.value;
		    var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
		    if(fileName !="doc" && fileName !="docx"&& fileName !="xls"&& fileName !="xlsx"&& fileName !="pdf"&& fileName !="txt"&& fileName !="zip"&& fileName !="rar"&&fileName !="jpg" && fileName !="jpeg"&& fileName !="png" &&fileName !="gif"&& fileName !="avi"&& fileName !="mp3"){
		       alert2("请选择正确格式的文件(doc,docx,xls,xlsx,pdf,txt,zip,png,jpg,jpeg,gif,avi,mp3)！");
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
		    if(size>20480){  
		      alert2("文件大小不能超过20M");
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
		        data:{"fileitem":"processZero"},
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
		        		var str = "<div class='jinjiuddd'>"+"<em class='jinjiudddeml pull-left'><img src='${ctx }/static/fords/img/wenjian.png'/></em>";
						str +="<div class='jinjiudtits'>"
		        		str += "<a  href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\">"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
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
