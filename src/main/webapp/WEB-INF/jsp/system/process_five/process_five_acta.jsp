<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>零公里问题一</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d5.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d5.js" ></script>
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
			<!---8d流程--->
			<input type="hidden" name="ISHANDLE" id="ISHANDLE" value="${handle.ISHANDLE }">
			<input type="hidden" name="DQUID" id="DQUID" value="${handle.DQUID }">
			<!---d5永久措施选择---->
			<div class="jinji_box">
				<div class="jinji_titbtn">
					<div class="fay_tled">D5永久措施选择</div>
					<div class="npaicbxz">
						<button class="jinjipai" type="button">验证/证实</button><button class="zjbtn">新增+</button>
					</div>
				</div>
				
					<c:if test="${varList != null }">
					<c:forEach items="${varList }" var="var" varStatus="status">
					<div class="jinji_div">
					<div class="xuhao_bocn">序号-<span>${status.index + 1 }</span></div>
					<div class="neibka_bor">
						<form action="" name="yinForm" class="yinForm">
							<input type="hidden" name="MEASURESD5_ID" value="${var.MEASURESD5_ID}" class="MEASURESD5_ID"> 
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
											<div class="jinjiula">
												<p class="jinjiultit">责任人</p>
												<div class="jinjiuze">
													<div class="baidssb">
										                <input type="hidden" class="responsese" value="${var.PRINCIPALNAME }"/>
											            <input class="sowe_lse form-control" maxlength="6"  name="PRINCIPALNAME" type="text" <c:if test="${not empty var.NAME}"> value="${var.NAME }"</c:if><c:if test="${empty var.NAME}"> value="${var.PRINCIPALNAME }"</c:if>/>
										                <div class="taocen_cn">
										                    <ul class="houxuciu"></ul>
										                </div>
									       			 </div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
											<div class="jinjiulb">
												<p class="jinjiultit">计划时间</p>
												<div class="jinjiuze">
													<input type="date" class="form-control" name="schedule_time" value="${var.schedule_time }" >
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
											<div class="jinjiulc jinjiulb">
												<p class="jinjiultit">有效率</p>
												<div class="jinjiuze">
													 <select name="efficient">
											            <c:forEach items="${biaoList }" var="bi">
											            	<option  <c:if test="${bi.VALUE eq var.efficient }">selected="selected"</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
											            </c:forEach>	
								           			 </select>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-12 col-md-3 col-lg-3">
											<div class="jinjiule jinjiulb">
											 <input type="hidden" name="ATTACHMENT">
												<div class="jinjiultit2">上传附件<input id="myfile${status.index + 1}" name="myfile${ status.index + 1}" class="myfile${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi" id="myfile${ status.index + 1}a">
													 <!-- 附件位置 -->
												     <c:forEach items="${var.ATTACHMENT}" var="vars">
												     <div class="jinjiuddd">
												      	<input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
															<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
															<div class="jinjiudtits">
																<a href="${ctx }/process_two/downWen.do?filepath=${vars.k_url}&filename=${vars.k_name}" title="${vars.k_name}">${vars.k_name}</a>
															</div>
															<em class="jinjiudddemr"><img src="${ctx}/static/fords/img/guanbi.png"/></em>
														</div>
												     </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12 col-lg-12">
											<div class="jinjiuld jinjiulb">
												<p class="jinjiultit">永久措施</p>
												<div class="jinjiuze">
													<textarea name="MEASURES">${var.MEASURES }</textarea>
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
							<input type="hidden" name="MEASURESD5_ID" value="${var.MEASURESD5_ID}" class="MEASURESD5_ID"> 
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"  value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
											<div class="jinjiula">
												<p class="jinjiultit">责任人</p>
												<div class="jinjiuze">
													<div class="baidssb">
										                <input type="hidden" class="responsese" maxlength="6"  name="PRINCIPALNAME" value="${handle.USERID }"/>
											            <input class="sowe_lse form-control"  type="text" value="${handle.RSNAME }"/>
										                <div class="taocen_cn">
										                    <ul class="houxuciu"></ul>
										                </div>
									       			 </div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
											<div class="jinjiulb">
												<p class="jinjiultit">计划时间</p>
												<div class="jinjiuze">
													<input type="date" class="jihuatame form-control" name="schedule_time" >
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
											<div class="jinjiulc jinjiulb">
												<p class="jinjiultit">有效率</p>
												<div class="jinjiuze">
													 <select name="efficient">
											            <c:forEach items="${biaoList }" var="bi">
											            	<option  <c:if test="${bi.VALUE eq var.efficient }">selected="selected"</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
											            </c:forEach>	
								           			 </select>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-12 col-md-3 col-lg-3">
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
												<p class="jinjiultit">永久措施</p>
												<div class="jinjiuze">
													<textarea name="MEASURES"></textarea>
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
					<div class="d0_shurut"><textarea name="VALIDATION" id="VALIDATION">${pds.VALIDATION }</textarea></div>
					<input type="hidden" name="PROCESS_FIVE_ID" id="PROCESS_FIVE_ID" value="${pds.PROCESS_FIVE_ID}" > 
					<button class="d0_8btnbc" type="button"><c:if test="${empty pds.VALIDATION }">保存</c:if><c:if test="${not empty pds.VALIDATION }">修改</c:if></button>
				</div>
				<div class="xiayibus"><a class="pull-left" href="${ctx}/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right nextSub"<c:if test="${handle.USTEP <DANGQJY-1}">href="${ctx}/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if><c:if test="${handle.USTEP >=DANGQJY-1}">href="javaScript:;"</c:if> >下一步</a></div>
			</div>
			
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script type="text/javascript">
		$(document).on("click",".nextSub",function(){
			if(this.href == "javascript:;"){
				alert2("当前未完成，请先完成");
			}
		})
		//保存
		$(document).on("click",".jiushibtnxiu",function(){
			var tis = $(this);
			var MEASURES = $(this).parents(".jinji_div").find("textarea[name='MEASURES']");
			
			if(MEASURES.val()==""){
				MEASURES.tips({
					side:3,
		            msg:'请输入措施',
		            bg:'#AE81FF',
		            time:2
		        });
				MEASURES.focus();
				return false;
				}
			
			
			//附件
			
			var str ="";
			//附件遍历
			tis.parent().prev().find("input[name='fileurl']").each(function(index,el){
				var realname = $(this).val();
				str += realname+";;";
			});
			
			$("input[name='ATTACHMENT']").val(str);
		  //提交数据
			 $.ajax({
				type : "POST",
				url : "${ctx}/process_five/addAndEdit",
				data : tis.closest("form").serialize(),
				success : function(data) {
					
					if(data.message=='1'){
						
						alert2("保存成功");
						tis.text("修改");
						tis.parents(".jinji_div").find("input[name='MEASURESD5_ID']").val(data.MEASURESD5_ID);
						
					}else{
						alert2("保存失败");
						
					}
					
					 
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});  
		});
		
		//验证/
		$(document).on("click",".d0_8btnbc",function(){
			if( $("#VALIDATION").val()==""){
				$("#VALIDATION").tips({
					side:3,
		            msg:'请输入验证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VALIDATION").focus();
				return false;
				}
			
			var VALIDATION = $("#VALIDATION").val();
				var PROCESS_FIVE_ID = $("#PROCESS_FIVE_ID").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				var tis = $(this);
				if(ISHANDLE == 0){
					return false;
				}
				$.ajax({
					type : "POST",
					url : "${ctx}/process_five/symptom",
					data : {PROCESS_FIVE_ID:PROCESS_FIVE_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,VALIDATION:VALIDATION},
					success : function(data) {
						$("#PROCESS_FIVE_ID").val(data.PROCESS_FIVE_ID);
						tis.text("修改");
						alert2("保存成功！");
						if($(".nextSub").attr("href")=="javaScript:;"){
							$(".nextSub").attr("href","${ctx}/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
							tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
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
				url : "${ctx}/measuresd5/delet",
				data : $(this).closest("form").serialize(),
				success : function(data) {
					/*  window.location.reload(); */
					
					if(data.message=="1"){
						
					
					
						
					}else{
						
						 alert2("删除失败");
					}
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
			        data:{"fileitem":"processFive"},
			        /* dataType: 'JSON',   */ 
			        success:function(data){
			        	
			        	var str = $(data).find("body").text();  
			            var json = $.parseJSON(str);
			        	if("success"==json.info){
			        		var str = "<div class=\"jinjiuddd\" id=\"\">\n"
			        			+"		<input type='hidden' name='fileurl' value='"+fileName+"::"+json.url+"'>"	
			        			+"			<em class=\"jinjiudddeml\"><img src=\"${ctx }/static/fords/img/wenjian.png\"/></em>\n"
			        			+"			<div class=\"jinjiudtits\">\n"
			        			+"			<a href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\" title=\""+fileName+"\">"+fileName+"</a>\n"
			        			+"		</div>\n"
			        			+"		<em class=\"jinjiudddemr\"><img src=\"${ctx }/static/fords/img/guanbi.png\"/></em>\n"
			        			+"	</div>"
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
