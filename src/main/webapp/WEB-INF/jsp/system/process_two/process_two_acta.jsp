<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<title>${DINGTILE }</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d2.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		 <script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 20px;">
		<div class="oiswen_box">
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
			<input type="hidden" name="ISHANDLE" id="ISHANDLE" value="${handle.ISHANDLE }">
			<input type="hidden" name="DQUID" id="DQUID" value="${handle.DQUID }">
			<!---d2问题描述---->
			<div class="d2_wentibox">
				<div class="isbtnbox">D2问题描述(5W/2H's)</div>
				<div class="isbtnbox2"><a class="isbtn pull-right" onclick="goisNot()"  href="javascript:;">Is&Is Not</a></div>
				<form action="" name="yinForm" class="yinForm" id="ptForm">
				<input type="hidden" name="PROCESS_TWO_ID" id="PROCESS_TWO_ID" value="${pds.PROCESS_TWO_ID }">
				<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
				<div class="d2_div">
					<p class="d2_p"><span>*</span>问题陈述</p>
					<div class="d2_textbox"><textarea class="d2_text" name="PROBLEMSTATEMENT" id="PROBLEMSTATEMENT">${pds.PROBLEMSTATEMENT }</textarea></div>
				</div>
				<div class="d2_div">
					<p class="d2_p"><span>*</span>问题分类</p>
					<div class="d2_4p">
						<select name="PROBLEMMOLD">
								<option value="1"<c:if test="${pds.PROBLEMMOLD ==1}">selected</c:if>>外观问题</option>
								<option value="2"<c:if test="${pds.PROBLEMMOLD ==2}">selected</c:if>>功能问题</option>
							<%-- <c:forEach items="${problemList }" var="var">
								<option value="${var.MOLDNAME }" <c:if test="${pds.PROBLEMMOLD == var.MOLDNAME}">selected</c:if>>${var.MOLDNAME }</option>
						    </c:forEach> --%>
						</select>
					</div>
				</div>
				<div class="container d2_4pdcon">
				    <div class="row">
				        <div class="col-lg-6">
				        	<div class="d2_4pbox">
				        		<div class="d2_4pb">
				        			<p>发生了什么问题?</p>
				        			<!-- <p>What is the problem?</p> -->
				        		</div>
				        		<div class="d2_4text">
				        			<textarea name="WHATS">${pds.WHATS }</textarea>
				        		</div>
				        	</div>
				        </div>
				        <div class="col-lg-6">
				        	<div class="d2_4pbox">
				        		<div class="d2_4pb">
				        			<p>为什么是问题?</p>
				        			<!-- <p>Why is it a problem?</p> -->
				        		</div>
				        		<div class="d2_4text">
				        			<textarea name="WHYS">${pds.WHYS }</textarea>
				        		</div>
				        	</div>
				        </div>
				        <div class="col-lg-6">
				        	<div class="d2_4pbox">
				        		<div class="d2_4pb">
				        			<p>何时发生的?何时问题被提出的?</p>
				        			<!-- <p>When the problem happened? When was the problem created?</p> -->
				        		</div>
				        		<div class="d2_4text">
				        			<textarea name="WHENS">${pds.WHENS }</textarea>
				        		</div>
				        	</div>
				        </div>
				        <div class="col-lg-6">
				        	<div class="d2_4pbox">
				        		<div class="d2_4pb">
				        			<p>谁发现的?谁提出的?</p>
				        			<!-- <p>Who found the problem? Who created the problem?</p> -->
				        		</div>
				        		<div class="d2_4text">
				        			<textarea name="WHOS">${pds.WHOS }</textarea>
				        		</div>
				        	</div>
				        </div>
				    </div>
				    <div class="row">
			    	    <div class="col-lg-6">
				        	<div class="d2_4pbox">
				        		<div class="d2_4pb">
				        			<p>在哪发现的?哪被提出的?</p>
				        			<!-- <p>Where was the problem found? Where was the created?</p> -->
				        		</div>
				        		<div class="d2_4text">
				        			<textarea name="WHERES">${pds.WHERES }</textarea>
				        		</div>
				        	</div>
				        </div>
				         <div class="col-lg-6">
				        	<div class="d2_4pbox">
				        		<div class="d2_4pb">
				        			<p>如何被发现的?</p>
				        			<!-- <p>How the problem was found?</p> -->
				        		</div>
				        		<div class="d2_4text">
				        			<textarea name="HOWFOUNDS">${pds.HOWFOUNDS }</textarea>
				        		</div>
				        	</div>
				        </div>
				    </div>
				    <div class="row">
			    	   
				        <div class="col-lg-6">
				        	<div class="d2_4pbox">
				        		<div class="d2_4pb">
				        			<p>数量是多少?</p>
				        			<!-- <p>How many?</p> -->
				        		</div>
				        		<div class="d2_4text">
				        			<textarea name="HOWMANY">${pds.HOWMANY }</textarea>
				        		</div>
				        	</div>
				        </div>
				    </div>
				</div>
				<div class="d2_div2">
					<p class="d2_p2">上传附件</p>
					<div class="d2_divppt">
						<div class="d2_divbtns">
						<input type="hidden" name="ATTACHMENTNURL" id="ATTACHMENTNURL">
							<div class="d2_divbtn">上传<span class="icon-cloud-upload"></span><input id="d2_btnin" name="d2_btnin" class="d2_btnin" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
							<p class="d2_divp">(可以上传图片、音频、视频文件)</p>
						</div>
						<!---图片-->
						<div class="container" style="width: 100%;">
						   <div class="row" id="tupian">
						      <c:forEach items="${list }" var="maps">
						   <c:forEach var="map" items="${maps}">
						    <div class="col-md-6 col-lg-4 imel">
						    <div class="pe_bao">
								      	<div class="d2_ulimgcon"><img src="${fns:getConfig('IMGURL')}/${map.value}" alt=""/></div>
										<div class="d2_ultit">
											<img class="d2_ultita" src="${ctx }/static/fords/img/imgs.png"/>
											<a class="d2_ultitb ans" href="javascript:;">${map.key }</a>
											<input type='hidden' value='${map.value}'/>
											<img class="d2_ultitc" src="${ctx }/static/fords/img/guanbi.png"/>
											<a class="d2_ultitd" href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}"><img src="${ctx }/static/fords/img/xiaa.png"/></a>
										</div>
							</div>
						      </div>
						      </c:forEach>
						      </c:forEach> 
						   </div>
						</div>
						 <!----文件（包括音频）--->
						<div class="container" style="width: 100%;">
						   <div class="row" id="wenjian">
						      <c:forEach items="${lists }" var="map">
							   <c:forEach var="maps" items="${map}">
								 <div class="col-md-6 col-lg-4 wemk">
								      	<div class="pe_bao">
									      	<div class="d2_ultit">
												<img class="d2_ultita" src="${ctx }/static/fords/img/wenjian.png"/>
												<a class="d2_ultitb  ans" href="javascript:;">${maps.key }</a>
												<input type='hidden' value='${maps.value}'/>
												<img class="d2_ultitc" src="${ctx }/static/fords/img/guanbi.png"/>
												<a class="d2_ultitd" href="${ctx }/process_two/downWen.do?filepath=${maps.value}&filename=${maps.key}"><img src="${ctx }/static/fords/img/xiaa.png"/></a>
											</div>
											
										</div>
							      </div>
							      </c:forEach>
							   </c:forEach> 
						   </div>
						 </div>
					</div>
					<a class="d2_xiugai" href="javascript:;"><c:if test="${empty pds.PROCESS_TWO_ID }">保存</c:if><c:if test="${not empty pds.PROCESS_TWO_ID }">修改</c:if></a>
				</div>
				<!----按钮组---->
				<div class="d2_btnboxs">
					<a href="${ctx}/process_one/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="pull-left">上一步</a>
					
					<a  <c:if test="${handle.USTEP <DANGQJY-1}">href="${ctx}/process_three/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if><c:if test="${handle.USTEP >=DANGQJY-1}">href="javaScript:;"</c:if> class="pull-right nextSub">下一步</a>
				</div>
			</form>
			</div>
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script>
	function goisNot(){
			window.location.href="${ctx}/process_two/goIsnot";
		}
	$(document).on("click",".nextSub",function(){
		if(this.href == "javascript:;"){
			alert2("当前未完成，请先完成");
		}
	})
		$(function(){
			//删除文件
				$(".d2_divppt").on("click",".d2_ultitc",function(){
					$(this).parents(".col-lg-4").remove();
				})
		})
		//修改
		$(".d2_div2").on("click",".d2_xiugai",function(){
			if($("#PROBLEMSTATEMENT").val()==""){
				$("#PROBLEMSTATEMENT").tips({
					side:3,
		            msg:'请输入问题陈述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROBLEMSTATEMENT").focus();
				return false;
				}
			
			
			var accessory="";
			$(".imel").each(function(index,el){
				var realname = $(this).find(".ans").text();
				var name =  $(this).find(".ans").next().val();
				var str = realname + "::" + name +";;";
				accessory += str;
			});
			$("input[name='ATTACHMENTNURL']").val(accessory); 
			var attachword="";
			$(".wemk").each(function(index,el){
				var realname = $(this).find(".ans").text();
				var name =  $(this).find(".ans").next().val();
				var strs = realname + "::" + name +";;";
				attachword += strs;
			});
			var amsting = $("input[name='ATTACHMENTNURL']").val(); 
			$("input[name='ATTACHMENTNURL']").val(amsting+",,,"+attachword);
			var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
			var tis = $(this);
			$.ajax({
				type : "POST",
				url : "${ctx}/process_two/addAndEdit",
				data : $("#ptForm").serialize(),
				success : function(data) {
					$("#PROCESS_TWO_ID").val(data.PROCESS_TWO_ID);
					alert2("保存成功");
					tis.text("修改");
					
					if($(".nextSub").attr("href")=="javaScript:;"){
						$(".nextSub").attr("href","${ctx}/process_three/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
						tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_three/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");	
					}
				},
			 	error:function(){
		        	alert2("操作无效");
		        }
			});   
			
		});
		
		//上传附件
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		 var fileName;
			//附件上传
			function upload(target){
				var name=target.value;
			    fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
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
			    
			    DocAjaxFileUpload(target); 
			     
			}
			
			function DocAjaxFileUpload(target){
				
				var name=target.value;
				var fileName = name.substring(name.lastIndexOf("\\")+1);
				var $target = $(target);
				var classname = $target.attr('class');
				filesName=fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
			 	/* alert2(fileName);  */
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
			        		//png,jpg,jpeg,gif
			        		var strs = $(data).find("body").text();
			        		if(filesName == "png" || filesName == "jpg"|| filesName == "jpeg" || filesName == "gif"){
			        			strs = "<div class=\"col-md-6 col-lg-4 imel\">\n"
			        			+"						      	    <div class=\"pe_bao\">\n"
			        			+"								      	<div class=\"d2_ulimgcon\"><img src=\""+json.imgurl+"\" alt=\"\"/></div>\n"
			        			+"										<div class=\"d2_ultit\">\n"
			        			+"											<img class=\"d2_ultita\" src=\"${ctx }/static/fords/img/imgs.png\"/>\n"
			        			+"											<a class=\"d2_ultitb  ans\" href=\"javascript:;\">"+fileName+"</a><input type=\"hidden\" value='"+json.url+"'>\n"
			        			+"											<img class=\"d2_ultitc\" src=\"${ctx }/static/fords/img/guanbi.png\"/>\n"
			        			+"											<a class=\"d2_ultitd\" href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\"><img src=\"${ctx }/static/fords/img/xiaa.png\"/></a>\n"
			        			+"										</div>\n"
			        			+"									</div>\n"
			        			+"						      </div>"
			        			
			        			
			        		
			        		$("#tupian").append(strs);
			        		}else{
			        			 
			        			strs ="<div class=\"col-md-6 col-lg-4 wemk\" >\n"
			        				+"						      	    <div class=\"pe_bao\">\n"
			        				+"										<div class=\"d2_ultit\">\n"
			        				+"											<img class=\"d2_ultita\" src=\"${ctx }/static/fords/img/wenjian.png\"/>\n"
			        				+"											<a class=\"d2_ultitb  ans\" href=\"javascript:;\">"+fileName+"</a>\n"
			        				+"											<input type=\"hidden\" value='"+json.url+"'>\n"
			        				+"											<img class=\"d2_ultitc\" src=\"${ctx }/static/fords/img/guanbi.png\"/>\n"
			        				+"											<a class=\"d2_ultitd\" href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\"><img src=\"${ctx }/static/fords/img/xiaa.png\"/></a>\n"
			        				+"										</div>\n"
			        				+"									</div>\n"
			        				+"						      </div>"
			        			
			        			
			        			
			        		$("#wenjian").append(strs);
			        		}
			        		
			        
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
