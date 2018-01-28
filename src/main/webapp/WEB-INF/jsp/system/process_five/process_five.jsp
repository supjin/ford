<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>零公里问题一</title>
		<link rel="stylesheet" href="${ctx}/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/d0.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/d3.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/d5.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
		<script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
	    <script type="text/javascript" src="${ctx}/static/fords/js/d5.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/public_d08.js" ></script>
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
			<!---8d流程--->
		
			<!---d5临时措施---->
			<div class="d3_boxs">
				<div class="d3_botit">D5永久措施选择</div>
				<div class="jinji_box" style="border: none;padding: 0px;">
				<a class="d5btna zjbtn" href="javascript:;">新增措施+</a>
				<div class="d5_zjbis">
				<!-- 为新增 -->
				<c:if test="${fn:length(varList ) == 0}">
					<div class="jinji_div">
				
					<form action="" name="yinForm" class="yinForm">
					<input type="hidden" name="MEASURESD5_ID" value="${var.MEASURESD5_ID}" class="MEASURESD5_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		            <input type="hidden" name="PROCESS_FIVE_ID" id="PROCESS_FIVE_ID" value="${sj.PROCESS_FIVE_ID}"/>
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
									                <input class="sowe_lse form-control"  type="text" name="PRINCIPALNAME" value="${var.PRINCIPALNAME }"/>
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
									            <input type="date" name="schedule_time" class="jihuatame form-control schedule_time" >
									        </div>
										</div>
							      </div>
							      <div class=" col-lg-2">
							      	    <div class="jinjiulb">
											<div class="jinjiuze"></div>
										</div>
							      </div>
							      <div class=" col-lg-3">
							      	    <div class="jinjiulc">
											<p class="jinjiultit">有效率</p>
											<div class="jinjiuze">
									            <select name="efficient" class="efficient">
									            	<option value="1">25%</option>
									            	<option value="2">50%</option>
									            	<option value="3">75%</option>
									            	<option value="4">100%</option>
									            </select>
									        </div>
										</div>
							      </div>
							   </div>
							   <div class="row">
							   	  <div class="col-lg-4 col-lg-offset-1">
							   	  	   <div class="jinjiuld">
											<p class="jinjiultit">永久措施</p>
											<div class="jinjiuze">
									            <textarea name="MEASURES" class="MEASURES"></textarea>
									        </div>
										</div>
							   	  </div>
							      <div class="col-lg-4">
							      	    <div class="jinjiuld">
											<p class="jinjiultit">验证</p>
											<div class="jinjiuze">
									            <textarea name="VALIDATION" class="VALIDATION"></textarea>
									        </div>
										</div>
							      </div>
							      <div class="col-lg-3">
							      	    <div class="jinjiule">
							      	 <!-- 附件 -->
							      	    
											<div class="jinjiultit2">上传附件
                                              <input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>

                                            </div>
											<div class="jinjiuze">
											  <div class="jinjiddi">
											    <!-- 附件位置 -->
												
											  </div>
												
									        </div>
										</div>
							      </div>
							   </div>
							</div>
						</div>
						<div class="jinji_divtitbot">
						    <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
							<button class="pull-right jinjiscbtn" type="button">删除</button>
							
							<button class="pull-right jiushibtnxiu" type="button">保存</button>
							<button class="pull-right zjbtn" type="button">新增+</button>
						</div>
						</form>
					
					</div>	
					</c:if>
		<!-- 为遍历 ------------>
		            <c:if test="${!empty sj}">
		            <c:forEach items="${varList}" var="var" varStatus="vs">
		            
					<div class="jinji_div">
					
					<form action="" name="yinForm" class="yinForm">
					<input type="hidden" name="MEASURESD5_ID" value="${var.MEASURESD5_ID}" class="MEASURESD5_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		            <input type="hidden" name="PROCESS_FIVE_ID" id="PROCESS_FIVE_ID" value="${sj.PROCESS_FIVE_ID}"/>
						<div class="jinji_divtit">
							<div class="jinjixuh">序号</div>
							<div class="jinjixuh2"><span>${vs.index+1}</span></div>
						</div>
						<div class="jinjiul">
							<div class="container" style="width: 100%;">
							   <div class="row" style="margin-bottom: 15px;">
							      <div class="col-lg-4 col-lg-offset-1">
								      	<div class="jinjiula">
											<p class="jinjiultit">责任人</p>
											<div class="jinjiuze">
								            	<div class="baidssb">
									                <input class="sowe_lse form-control"  type="text" name="PRINCIPALNAME" value="${var.PRINCIPALNAME }"/>
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
									            <input type="date" name="schedule_time" value="${var.schedule_time}"/> 
									        </div>
										</div>
							      </div>
							      <div class=" col-lg-2">
							      	    <div class="jinjiulb">
											<div class="jinjiuze"></div>
										</div>
							      </div>
							      <div class=" col-lg-3">
							      	    <div class="jinjiulc">
											<p class="jinjiultit">有效率</p>
											<div class="jinjiuze">
									            <select name="efficient" class="efficient">
									            	<option value="1">25%</option>
									            	<option value="2">50%</option>
									            	<option value="3">75%</option>
									            	<option value="4">100%</option>
									            </select>
									        </div>
										</div>
							      </div>
							   </div>
							   <div class="row">
							   	  <div class="col-lg-4 col-lg-offset-1">
							   	  	   <div class="jinjiuld">
											<p class="jinjiultit">永久措施</p>
											<div class="jinjiuze">
									            <textarea name="MEASURES" class="MEASURES">${var.MEASURES}</textarea>
									        </div>
										</div>
							   	  </div>
							      <div class="col-lg-4">
							      	    <div class="jinjiuld">
											<p class="jinjiultit">验证</p>
											<div class="jinjiuze">
									            <textarea name="VALIDATION" class="VALIDATION">${var.VALIDATION}</textarea>
									        </div>
										</div>
							      </div>
							      <div class="col-lg-3">
							      	    <div class="jinjiule">
							      	 <!-- 附件 -->
							      	    
											<div class="jinjiultit2">上传附件
                                              <input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>

                                            </div>
											<div class="jinjiuze">
											  <div class="jinjiddi">
											    <!-- 附件位置 -->
											     <c:forEach items="${var.ATTACHMENT}" var="vars">
											       <div class="jinjiuddd">
											       <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
														<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
														<div class="jinjiudtits">
															<a href="${fns:getConfig('IMGURL')}/${vars.k_url}" title="${vars.k_name}">${vars.k_name}</a>
														</div>
														<em class="jinjiudddemr"><img src="${ctx}/static/fords/img/guanbi.png"/></em>
													</div>
											     
											     </c:forEach>
												
											  </div>
												
									        </div>
										</div>
							      </div>
							   </div>
							</div>
						</div>
						<div class="jinji_divtitbot">
						    <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
							<button class="pull-right jinjiscbtn" type="button">删除</button>
							
							<button class="pull-right jiushibtnxiu" type="button">修改</button>
							<button class="pull-right zjbtn" type="button">新增+</button>
						</div>
						</form>
					
					</div>	
					
					</c:forEach>
					</c:if>
					
					 </div>
					<a class="oisbtns" style="display: none;"></a>
				</div>
				<div class="d3_btnbox"><a class="pull-left" href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right" href="${ctx}/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a></div>
			    
			    
			</div>
			
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script type="text/javascript">
	
	//保存
	$(document).on("click",".jiushibtnxiu",function(){
		//附件
		var tis = $(this);
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
			url : "${ctx}/measuresd5/updated",
			data : tis.closest("form").serialize(),
			success : function(data) {
				
				if(data.message=='1'){
					
					alert("保存成功");
					tis.text("修改");
					tis.parents(".jinji_div").find("input[name='MEASURESD5_ID']").val(data.MEASURESD5_ID);
					
				}else{
					alert("保存失败");
					
				}
				
				 
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
			url : "${ctx}/measuresd5/delet",
			data : $(this).closest("form").serialize(),
			success : function(data) {
				/*  window.location.reload(); */
				
				if(data.message=="1"){
					
				  alert("删除成功");
				
					
				}else{
					
					 alert("删除失败");
				}
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
			var myfilediv=$(target).parent().siblings().children(".jinjiddi");
			//alert(myfilediv.html());
			var name=target.value;
			var fileName = name.substring(name.lastIndexOf("\\")+1);
			var $target = $(target);
			var classname = $target.attr('class');
			//alert(classname);
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
		        		var str =
		        		"<div class=\"jinjiuddd\">\n" +
		        		"<input type='hidden' name='fileurl' value='"+fileName+"::"+json.url+"'>"+
		        		"		    <em class=\"jinjiudddeml\"><img src=\"${ctx}/static/fords/img/wenjian.png\"/></em>\n" +
		        		"				<div class=\"jinjiudtits\">\n" +
		        		"					<a href=\""+json.imgurl+"\" title=\""+fileName+"\">"+fileName+"</a>\n" +
		        		"				</div>\n" +
		        		"           <em class=\"jinjiudddemr\"><img src=\"${ctx}/static/fords/img/guanbi.png\"/></em>\n" +
		        		"		</div>";
		        		//alert(str);
		        		myfilediv.append(str);
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
