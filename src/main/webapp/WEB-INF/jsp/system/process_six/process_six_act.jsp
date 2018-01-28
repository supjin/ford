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
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d6.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d6.js" ></script>
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
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
			<!---d6永久措施执行---->
			<div class="d6_boxs">
				<div class="d6_tits">D6永久措施执行</div>
				<div class="d6_contont">
				<c:forEach items="${varList }" var="var"  varStatus="status">
					<div class="container">
					<form action="" name="ptForm" id="ptForm">
					<input type="hidden" name="MEASURES_MESSAGE_DO_ID" value="${var.MEASURES_MESSAGE_DO_ID }">
					    <div class="row">
					        <div class="col-sm-1 d6_border_ri">
					      	    <div class="row">
					      	  	    <div class="col-sm-12 d6_border_bot"><div class="d6_xuhao">序号</div></div>
					      	  	    <div class="col-sm-12"><div class="d6_xu">${ status.index + 1}</div></div>
					      	    </div>
					        </div>
					        <div class="col-sm-11">
					            <div class="row">
					            	<div class="col-sm-12 d6_ptop">
					            		<div class="row d6_height35">
					            			<div class="col-sm-12 col-md-6 col-lg-3">
					            			    <div class="jinjiula">
													<p class="jinjiultit pull-left">责任人　：</p>
													<div class="jinjiuze pull-left" style="width: 175px;">
										            	<div class="baidssb">
											                <input class="sowe_lse form-control" name="RESPONSIBLE"  type="text" value="${var.RESPONSIBLE }"/>
											                <div class="taocen_cn">
											                    <ul class="houxuciu"></ul>
											                </div>
									        			</div>
											        </div>
												</div>
					            			    
					            			</div>
					            			<div class="col-sm-12 col-md-6 col-lg-3"><div class="d6_jhsj">计划时间：${var.DOTIME }</div></div>
					            			<div class="col-sm-12 col-md-6 col-lg-3">
					            				<div class="jinjiulb" style="overflow: hidden;">
											        <p class="jinjiultit pull-left">完成时间：</p>
													<div class="jinjiuze pull-left">
											            <input type="date" <c:if test="${empty var.EXECUTIONDATE }">class='jihuatame form-control'</c:if><c:if test="${not empty var.EXECUTIONDATE }">class="form-control" </c:if> value="${var.EXECUTIONDATE }" name="EXECUTIONDATE">
											        </div>
										        </div>
					            			</div>
					            			<input type="hidden" name="ATTACHMENTNURL" id="ATTACHMENTNURL">
					            			<div class="col-sm-12 col-md-6 col-lg-3"><div class="jinjiultit2">上传附件<input id="myfile${status.index + 1}" name="myfile${ status.index + 1}" class="myfile${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div></div>
					            		</div>
					            		<div class="row">
					            			<div class="col-sm-12 col-md-4 col-lg-4">
					            				<div class="d6_divo">
					            					<p>永久措施：</p>
					            				    <div>${var.MEASURESNAME }</div>
					            				</div>
					            			</div>
					            			<div class="col-sm-12 col-md-5 col-lg-5">
					            				<div class="d6_divo2">
					            					<p>证实：</p>
					            					<div><textarea name="VALIDATION">${var.VALIDATION }</textarea></div>
					            				</div>
					            			</div>
					            			<div class="col-sm-12 col-md-3 col-lg-3">
					            				<div class="jinjiddi" id="myfile${ status.index + 1}a">
													<c:forEach items="${var.ATTMAP }" var="att">
													<c:forEach var="map" items="${att}">
													<div class="jinjiuddd">
														<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
														<div class="jinjiudtits">
															<a href="${fns:getConfig('IMGURL')}/${map.value}" title="${map.value}">${map.key}</a>
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
					            <c:if test="${empty var.ATTACHMENTNAME}">
					                <div class="col-sm-12"><button class="d6_xbtn" type="button">保存</button></div>
					            </c:if>
					            <c:if test="${not empty var.ATTACHMENTNAME}">
					                <div class="col-sm-12"><button class="d6_xbtn" type="button">修改</button></div>
					            </c:if>
					            </div>
					        </div>      
					    </div>
			</form>
					    </div>
				</c:forEach>	
				<div class="d6_btnbox"><a class="pull-left" href="${ctx}/process_five/goProcess_five?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right" href="${ctx}/process_seven/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a></div>
			</div>
			</div>
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
	</body>
	<script type="text/javascript">
		//措施执行
		$(document).on("click",".d6_xbtn",function(){
			//附件
			var accessory = "";
			var tis = $(this);
			console.log($(this));
			tis.parents(".col-sm-11").find(".jinjiudtits>a").each(function(index,el){
				var realname = $(this).text();
				var name = $(this).next().val();
				var str = realname + "::" + name +";;";
				accessory += str;
			});
			tis.parents(".col-sm-11").find("input[name='ATTACHMENTNURL']").val(accessory); 
			 $.ajax({
				type : "POST",
				url : "${ctx}/process_six/addAndEdit",
				data : tis.closest("form").serialize(),
				success : function(data) {
					tis.text("修改");
					alert(data.mesage);
				},
			 	error:function(){
		        	alert("上传失败");
		        }
			});   
		});
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
</html>
