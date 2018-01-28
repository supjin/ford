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
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
	    <link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d0.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
		<script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/seek.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 20px;">
		<div class="oiswen_box">
		<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">零公里问题一</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;">HOME</a><span>></span><a href="javascript:;">零公里问题</a><span>></span><a href="javascript:;">零公里流程</a>
					</div>
				</div>
				<div class="oiswen_ss">
		            <span class="glyphicon glyphicon-search"></span>
		            <input type="text" class="form-control" placeholder="搜索">
		        </div>
			</div>
	<%@ include file="/setting/head.jsp"%>
			<!---d0紧急遏制--->
			<div class="d0_jinbox">
				<h3 class="d0_jintit">D0紧急遏制</h3>
				<div class="d0_shuru">
					<p class="d0_shurutit"><span>*</span>症状描述</p>
					<input type="hidden" name="PROCESS_ZERO_ID" id="PROCESS_ZERO_ID" value="${pds.PROCESS_ZERO_ID }">
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
					<div class="d0_shurut"><textarea name="SYSPTOMDESCRIPTION" id="SYSPTOMDESCRIPTION">${pds.SYSPTOMDESCRIPTION }</textarea></div>
				</div>
				<c:if test="${pds.SYSPTOMDESCRIPTION != null }">
				<button class="d0_btn" type="button">修改</button>
				</c:if>
				<c:if test="${pds.SYSPTOMDESCRIPTION == null }">
				<button class="d0_btn" type="button">保存</button>
				</c:if>
			</div>
			<!----紧急反应---->
			<div class="jinji_box">
				<div class="jinji_titbtn"><span>紧急反应</span><button class="zjbtn">新增+</button><button class="pull-right jinjipai" type="button">排查表</button></div>
				
				<c:if test="${varList != null }">
				<c:forEach items="${varList }" var="var" varStatus="status">
				
				<div class="jinji_div">
				<form action="" name="yinForm" class="yinForm" >
				<input type="hidden" name="ZEROEMERGENCY_ID" value="${var.ZEROEMERGENCY_ID }">
					<div class="jinji_divtit">
						<div class="jinjixuh">序号</div>
						<div class="jinjixuh2"><span>${ status.index + 1}</span></div>
					</div>
					<div class="jinjiul">
						<div class="container" style="width: 100%;">
						   <div class="row" style="margin-bottom: 15px;">
						      <div class="col-lg-4 col-lg-offset-1">
							      	<div class="jinjiula">
										<p class="jinjiultit">责任人</p>
										<div class="jinjiuze">
							            	<div class="baidssb">
							            		<input type="hidden" c name="RESPONSIBLE" value="${var.NAME }">
								                <input class="sowe_lse form-control"  type="text" value="${var.NAME }"/>
								                <div class="taocen_cn">
								                    <ul class="houxuciu"></ul>
								                </div>
									        </div>
									        
								        </div>
									</div>
						      </div>
						      <div class="col-lg-2">
						      	    <div class="jinjiulb">
										<p class="jinjiultit">计划时间</p>
										<div class="jinjiuze">
								            <input type="date" value="${var.PLANTIME }" class="form-control" name="PLANTIME">
								        </div>
									</div>
						      </div>
						      <div class=" col-lg-2">
						      	    <div class="jinjiulb">
										<p class="jinjiultit">执行时间</p>
										<div class="jinjiuze">
								            <input type="date" value="${var.EXECUTIONDATE }" class="form-control" name="EXECUTIONDATE" >
								        </div>
									</div>
						      </div>
						      <div class=" col-lg-3">
						      	    <div class="jinjiulc">
										<p class="jinjiultit">有效率</p>
										<div class="jinjiuze">
								            <select name="EFFCIENT">
								            <c:forEach items="${biaoList }" var="bi">
								            	<option  <c:if test="${bi.VALUE eq var.EFFCIENT }">selected="selected"</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
								            </c:forEach>	
								            	
								            </select>
								        </div>
									</div>
						      </div>
						   </div>
						   <div class="row">
						   	  <div class="col-lg-4 col-lg-offset-1">
						   	  	   <div class="jinjiuld">
										<p class="jinjiultit">应急反应</p>
										<div class="jinjiuze">
								            <textarea name="EMERGENCYRESPONSE">${var.EMERGENCYRESPONSE }</textarea>
								        </div>
									</div>
						   	  </div>
						      <div class="col-lg-4">
						      	    <div class="jinjiuld">
										<p class="jinjiultit">验证/证实</p>
										<div class="jinjiuze">
								            <textarea name="VERIFICATION">${var.VERIFICATION }</textarea>
								        </div>
									</div>
						      </div>
						      <div class="col-lg-3">
						      	    <div class="jinjiule">
						      	    	<input type="hidden" name="ATTACHMENTNURL">
										<div class="jinjiultit2">上传附件<!-- <input type="button"/> -->
										<input id="myfile${status.index + 1}" name="myfile${ status.index + 1}" class="myfile${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
										</div>
										<div class="jinjiuze">
											<div class="jinjiddi" id="myfile${ status.index + 1}a">
											<c:forEach items="${var.ATTMAP }" var="att">
											 <c:forEach var="map" items="${att}">
											 <div class="jinjiuddd">
													<em class="jinjiudddeml pull-left"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
													<div class="jinjiudtits">
													<a class="pull-left" href="${fns:getConfig('IMGURL')}/${map.value}" title="${map.key}">${map.key}</a>
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
					</div>
					<div class="jinji_divtitbot">
						<button class="pull-right jinjiscbtn" type="button">删除</button>
						<button class="pull-right jiushibtnxiu" type="button">修改</button>
						<button class="pull-right zjbtn" type="button">新增+</button>
					</div>
					</form>
				</div>
				
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(varList ) == 0}">
				
				<div class="jinji_div">
				<form action="" name="yinForm" class="yinForm">
				<input type="hidden" name="ZEROEMERGENCY_ID" value="">
				<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
					<div class="jinji_divtit">
						<div class="jinjixuh">序号</div>
						<div class="jinjixuh2"><span>1</span></div>
					</div>
					<div class="jinjiul">
						<div class="container" style="width: 100%;">
						   <div class="row" style="margin-bottom: 15px;">
						      <div class="col-lg-4 col-lg-offset-1">
							      	<div class="jinjiula">
										<p class="jinjiultit">责任人</p>
										<div class="jinjiuze">
							            	<div class="baidssb">
								                <input class="sowe_lse form-control" name="RESPONSIBLE"  type="text"/>
								                <div class="taocen_cn">
								                    <ul class="houxuciu"></ul>
								                </div>
									        </div>
								        </div>
									</div>
						      </div>
						      <div class="col-lg-2">
						      	    <div class="jinjiulb">
										<p class="jinjiultit">计划时间</p>
										<div class="jinjiuze">
								            <input type="date" value="" class="jihuatame form-control" name="PLANTIME" >
								        </div>
									</div>
						      </div>
						      <div class=" col-lg-2">
						      	    <div class="jinjiulb">
										<p class="jinjiultit">执行时间</p>
										<div class="jinjiuze">
								            <input type="date" value="" class="jihuatame form-control" name="EXECUTIONDATE" >
								        </div>
									</div>
						      </div>
						      <div class=" col-lg-3">
						      	    <div class="jinjiulc">
										<p class="jinjiultit">有效率</p>
										<div class="jinjiuze">
								            <select name="EFFCIENT">
								            	  <c:forEach items="${biaoList }" var="bi">
								            	<option  <c:if test="${bi.VALUE eq var.EFFCIENT }">selected</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
								            	</c:forEach>	
								            	
								            </select>
								        </div>
									</div>
						      </div>
						   </div>
						   <div class="row">
						   	  <div class="col-lg-4 col-lg-offset-1">
						   	  	   <div class="jinjiuld">
										<p class="jinjiultit">应急反应</p>
										<div class="jinjiuze">
								            <textarea name="EMERGENCYRESPONSE"></textarea>
								        </div>
									</div>
						   	  </div>
						      <div class="col-lg-4">
						      	    <div class="jinjiuld">
										<p class="jinjiultit">验证/证实</p>
										<div class="jinjiuze">
								            <textarea name="VERIFICATION"></textarea>
								        </div>
									</div>
						      </div>
						      <div class="col-lg-3">
						      	    <div class="jinjiule">
						      	   		<input type="hidden" name="ATTACHMENTNURL">
										<div class="jinjiultit2">上传附件<!-- <input type="button"/> -->
										<input id="myfiles" name="myfiles" class="myfiles" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
										</div>
										<div class="jinjiuze">
											<div class="jinjiddi" id="myfilesa">
											</div>
								        </div>
									</div>
						      </div>
						   </div>
						</div>
					</div>
					<div class="jinji_divtitbot">
						<button class="pull-right jinjiscbtn" type="button">删除</button>
						<button class="pull-right jiushibtnxiu" type="button">保存</button>
						<button class="pull-right zjbtn" type="button">新增+</button>
					</div>
					</form>
				</div>
				
				</c:if>
				<a class="oisbtns" href="${ctx}/process_one/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a>
			</div>
			
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script>
		
	//症状反应
	$(document).on("click",".d0_btn",function(){
			var SYSPTOMDESCRIPTION = $("#SYSPTOMDESCRIPTION").val();
			var PROCESS_ZERO_ID = $("#PROCESS_ZERO_ID").val();
			var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
			$.ajax({
				type : "POST",
				url : "${ctx}/dProcess/symptom",
				data : {SYSPTOMDESCRIPTION:SYSPTOMDESCRIPTION,PROCESS_ZERO_ID:PROCESS_ZERO_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID},
				success : function(data) {
					$("#PROCESS_ZERO_ID").val(data.PROCESS_ZERO_ID);
				},
			 	error:function(){
		        	alert("上传失败");
		        }
			});
		});
		
	//应急反应
	$(document).on("click",".jiushibtnxiu",function(){
		//附件
		var accessory = "";
		var tis = $(this);
		console.log($(this));
		tis.parent().prev().find("a.pull-left").each(function(index,el){
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
				//alert(data.ZEROEMERGENCY_ID);
				 alert(data.mesage); 
			},
		 	error:function(){
	        	alert("上传失败");
	        }
		});  
	});
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
	        	alert("上传失败");
	        }
		});
	})
		
	//上传附件
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		//附件上传
		function upload(target){
			var name=target.value;
		    var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
		    if(fileName !="doc" && fileName !="docx"&& fileName !="xlsx"&& fileName !="zip"&& fileName !="xls"&& fileName !="pdf"&&fileName !="jpg" && fileName !="jpeg"&& fileName !="png" &&fileName !="gif"){
		       alert("请选择正确格式的文件(doc,docx,xlsx,zip,pdf,xls,png,jpg,jpeg,gif)！");
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
					alert(e+"\n"+"如果错误为：Error:Automation 服务器不能创建对象；"+"\n"+"请按以下方法配置浏览器："+"\n"+"请打开【Internet选项-安全-Internet-自定义级别-ActiveX控件和插件-对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本（不安全）-点击启用-确定】");
					return;
				}
		    }else{    
		     fileSize = target.files[0].size;     
		    }
		    var size = fileSize / 1024;    
		    if(size>5120){  
		      alert("文件大小不能超过5M");
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
			/* alert(classname); */
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
		        		str += "<a class='pull-left' href='"+json.imgurl+"' title="+fileName+">"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
		        		str += "</div>"
						str += "<em class='jinjiudddemr pull-left'><img src='${ctx }/static/fords/img/guanbi.png'/></em> </div>	";
						$("#"+classname+"a").append(str);
		        	}else if("oversize"==json.info){
		        		alert("系统繁忙请稍后再试！");
		        	}
		        },
		        error:function(){
		        	alert("上传失败");
		        }
			})
		}
		</script>
	</body>
	
</html>
