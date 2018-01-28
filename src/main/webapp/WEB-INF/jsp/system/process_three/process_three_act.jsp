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
		<link rel="stylesheet" href="${ctx }/static/fords/css/d3.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d3.js" ></script>
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
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
			<!---d3临时措施---->
			<div class="d3_boxs">
				<a class="paicha" href="javascript:;">排查表</a>
				<div class="d3_botit">D3临时措施</div>
				<div class="jinji_box" style="border: none;padding: 0px;">
					<div class="d3_biton">
						<a class="pull-left" href="#d3liuul">浏览应急措施</a>
						<a class="pull-right zjbtn" id="ghtbtn" href="javascript:;">新增临时措施+</a>
					</div>
					<c:forEach items="${varList }" var="var" varStatus="status">
					<div class="jinji_div">
					<form action="" name="yinForm" class="yinForm" >
					<input type="hidden" name="MEASURES_MESSAGE_ID" value="${var.MEASURES_MESSAGE_ID }">
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
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
									                <input class="sowe_lse form-control" name="RESPONSIBLE"  type="text" value="${var.RESPONSIBLE }"/>
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
									            <input type="date" value="${var.DOTIME }" name="DOTIME"  class="form-control" >
									        </div>
										</div>
							      </div>
							      <div class=" col-lg-2">
							      	    <div class="jinjiulb">
											<p class="jinjiultit">执行时间</p>
											<div class="jinjiuze">
									            <input type="date" value="${var.EXECUTIONDATE }" name="EXECUTIONDATE" class="form-control" >
									        </div>
										</div>
							      </div>
							      <div class=" col-lg-3">
							      	    <div class="jinjiulc">
											<p class="jinjiultit">有效率</p>
											<div class="jinjiuze">
									           <select name="EFFICIENT">
									            <c:forEach items="${biaoList }" var="bi">
									            	<option  <c:if test="${bi.VALUE eq var.EFFICIENT }">selected="selected"</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
									            </c:forEach>	
								            	
								           		 </select>
									        </div>
										</div>
							      </div>
							   </div>
							   <div class="row">
							   	  <div class="col-lg-4 col-lg-offset-1">
							   	  	   <div class="jinjiuld">
											<p class="jinjiultit">临时措施</p>
											<div class="jinjiuze">
									            <textarea name="MEASURESNAME">${var.MEASURESNAME } </textarea>
									        </div>
										</div>
							   	  </div>
							      <div class="col-lg-4">
							      	    <div class="jinjiuld">
											<p class="jinjiultit">验证/证实</p>
											<div class="jinjiuze">
									            <textarea name="VALIDATION">${var.VALIDATION }</textarea>
									        </div>
										</div>
							      </div>
							      <div class="col-lg-3">
							      	    <div class="jinjiule">
							      	    <input type="hidden" name="ATTACHMENTNURL">
											<div class="jinjiultit2">上传附件<input id="myfile${status.index + 1}" name="myfile${ status.index + 1}" class="myfile${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
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
					
					
					
					
					<c:if test="${fn:length(varList ) == 0}">
					<div class="jinji_div">
					<form action="" name="yinForm" class="yinForm" >
					<input type="hidden" name="MEASURES_MESSAGE_ID" value="">
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
									                <input class="sowe_lse form-control" type="text"  name="RESPONSIBLE" value="${var.RESPONSIBLE }" />
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
									            <input type="date" value="" name="DOTIME" class="jihuatame form-control" >
									        </div>
										</div>
							      </div>
							      <div class=" col-lg-2">
							      	    <div class="jinjiulb">
											<p class="jinjiultit">执行时间</p>
											<div class="jinjiuze">
									            <input type="date" name="EXECUTIONDATE" class="jihuatame form-control" >
									        </div>
										</div>
							      </div>
							      <div class=" col-lg-3">
							      	    <div class="jinjiulc">
											<p class="jinjiultit">有效率</p>
											<div class="jinjiuze">
									           <select name="EFFICIENT">
									            <c:forEach items="${biaoList }" var="bi">
									            	<option  <c:if test="${bi.VALUE eq var.EFFICIENT }">selected="selected"</c:if> value="${bi.VALUE }">${bi.LABEL }</option>
									            </c:forEach>	
								            	
								           		 </select>
									        </div>
										</div>
							      </div>
							   </div>
							   <div class="row">
							   	  <div class="col-lg-4 col-lg-offset-1">
							   	  	   <div class="jinjiuld">
											<p class="jinjiultit">临时措施</p>
											<div class="jinjiuze">
									            <textarea name="MEASURESNAME"></textarea>
									        </div>
										</div>
							   	  </div>
							      <div class="col-lg-4">
							      	    <div class="jinjiuld">
											<p class="jinjiultit">验证/证实</p>
											<div class="jinjiuze">
									            <textarea name="VALIDATION"></textarea>
									        </div>
										</div>
							      </div>
							      <div class="col-lg-3">
							      	    <div class="jinjiule">
							      	    <input type="hidden" name="ATTACHMENTNURL">
											<div class="jinjiultit2">上传附件<input id="myfiles" name="myfiles" class="myfiles" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
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
					<a class="oisbtns" style="display: none;"></a>
				</div>
				<div class="d3_btnbox"><a class="pull-left" href="${ctx}/process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right" href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a></div>
			    <!---浏览应急措施--->
			    <div class="d3_liutit">浏览应急措施</div>
			    <c:forEach items="${merList }" var="var">
			    <div class="d3_liuul" id="d3liuul">
			    <form action="" class="yinForm">
			    <input type="hidden" name="ZEROEMERGENCY_ID" value="${var.ZEROEMERGENCY_ID }">
			    	<div class="d3_liuboxs">
			    		<div class="jinji_divtit">
							<div class="jinjixuh">序号</div>
							<div class="jinjixuh2"><span>${ status.index + 1}</span></div>
						</div>
						<div class="d3_liupore">
							<div class="xuanze_box"><button class="xuanze_btn pull-right pwselect" type="button">选择添加</button></div>
							<div class="zhixingtam"><p>执行时间：</p>${var.EXECUTIONDATE }</div>
							<div class="yingjitext">
								<p>应急反应：</p>
								<div>${var.EMERGENCYRESPONSE }</div>
							</div>
						</div>
			    	</div>
			    </form>
			    </div>
			   </c:forEach> 
			</div>
			
		</div>
		<!----右边部分---->
	<%@ include file="/setting/right.jsp"%>
	
	<script type="text/javascript">
	//临时措施
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
		tis.parents(".jinji_div").find("input[name='ATTACHMENTNURL']").val(accessory); 
	
		 $.ajax({
			type : "POST",
			url : "${ctx}/process_three/addAndEdit",
			data : tis.closest("form").serialize(),
			success : function(data) {
				tis.text("修改");
				tis.parents(".jinji_div").find("input[name='MEASURES_MESSAGE_ID']").val(data.MEASURES_MESSAGE_ID);
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
			url : "${ctx}/process_three/delet",
			data : $(this).closest("form").serialize(),
			success : function(data) {
				/*  window.location.reload(); */
			},
		 	error:function(){
	        	alert("上传失败");
	        }
		});
	})
	//选定
	$(document).on("click",".pwselect",function(){
		$.ajax({
			type : "POST",
			url : "${ctx}/process_three/checkAdd",
			data : $(this).closest("form").serialize(),
			success : function(data) {
			 /*  window.location.reload();   */
			// if(data.list.length != 0){ }
			var a= $(".jinji_box>.jinji_div").length + 1;
			var b = data.list;
			var RESPONSIBLE = b.RESPONSIBLE;
			if(typeof(RESPONSIBLE)=="undefined"){ 
				RESPONSIBLE = "";
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
			var VALIDATION = b.VALIDATION;
			if(typeof(VALIDATION)=="undefined"){ 
				VALIDATION = "";
			}
			
			var str = "	<div class=\"jinji_div\">\n"
				+"					<form action=\"\" name=\"yinForm\" class=\"yinForm\" >\n"
				+"					<input type=\"hidden\" name=\"MEASURES_MESSAGE_ID\" value=\""+b.MEASURES_MESSAGE_ID+"\">\n"
				+"					<input type=\"hidden\" name=\"CLIENT_PROBLEM_COLLECTION_ID\" value=\""+b.CLIENT_PROBLEM_COLLECTION_ID+"\">\n"
				+"						<div class=\"jinji_divtit\">\n"
				+"							<div class=\"jinjixuh\">序号</div>\n"
				+"							<div class=\"jinjixuh2\"><span>"+a+"</span></div>\n"
				+"						</div>\n"
				+"						<div class=\"jinjiul\">\n"
				+"							\n"
				+"							<div class=\"container\" style=\"width: 100%;\">\n"
				+"							   <div class=\"row\" style=\"margin-bottom: 15px;\">\n"
				+"							      <div class=\"col-lg-4 col-lg-offset-1\">\n"
				+"								      	<div class=\"jinjiula\">\n"
				+"											<p class=\"jinjiultit\">责任人</p>\n"
				+"											<div class=\"jinjiuze\">\n"
				+"								            	<div class=\"input-group\">\n"
				+"													<input type=\"text\" class=\"zerenren_tabin form-control\" name=\"RESPONSIBLE\" value="+RESPONSIBLE+">\n"
				+"													<div class=\"input-group-btn\">\n"
				+"														<button type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\">\n"
				+"															<span class=\"jinjiids glyphicon glyphicon-user\"></span>\n"
				+"														</button>\n"
				+"														<ul class=\"zerenren_tab dropdown-menu pull-right\">\n"
				+"															<li><a href=\"javascript:;\">蒋忠良</a></li>\n"
				+"															<li><a href=\"javascript:;\">蓝侨</a></li>\n"
				+"															<li><a href=\"javascript:;\">蓝裘千仞</a></li>\n"
				+"														</ul>\n"
				+"													</div>\n"
				+"												</div>\n"
				+"									        </div>\n"
				+"										</div>\n"
				+"							      </div>\n"
				+"							      <div class=\"col-lg-2\">\n"
				+"							      	    <div class=\"jinjiulb\">\n"
				+"											<p class=\"jinjiultit\">计划时间</p>\n"
				+"											<div class=\"jinjiuze\">\n"
				+"									            <input type=\"date\" value=\""+DOTIME+"\"  name=\"DOTIME\" class=\"jihuatame form-control\">\n"
				+"									        </div>\n"
				+"										</div>\n"
				+"							      </div>\n"
				+"							      <div class=\" col-lg-2\">\n"
				+"							      	    <div class=\"jinjiulb\">\n"
				+"											<p class=\"jinjiultit\">执行时间</p>\n"
				+"											<div class=\"jinjiuze\">\n"
				+"									            <input type=\"date\" class=\"form-control\" name=\"EXECUTIONDATE\" value=\""+EXECUTIONDATE+"\" >\n"
				+"									        </div>\n"
				+"										</div>\n"
				+"							      </div>\n"
				+"							      <div class=\" col-lg-3\">\n"
				+"							      	    <div class=\"jinjiulc\">\n"
				+"											<p class=\"jinjiultit\">有效率</p>\n"
				+"											<div class=\"jinjiuze\">\n"
				+"									            <select name=\"EFFICIENT\">\n"
				
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
				
			str +="									            </select>\n"
				+"									        </div>\n"
				+"										</div>\n"
				+"							      </div>\n"
				+"							   </div>\n"
				+"							   <div class=\"row\">\n"
				+"							   	  <div class=\"col-lg-4 col-lg-offset-1\">\n"
				+"							   	  	   <div class=\"jinjiuld\">\n"
				+"											<p class=\"jinjiultit\">临时措施</p>\n"
				+"											<div class=\"jinjiuze\">\n"
				+"									            <textarea name=\"MEASURESNAME\">"+b.MEASURESNAME+"</textarea>\n"
				+"									        </div>\n"
				+"										</div>\n"
				+"							   	  </div>\n"
				+"							      <div class=\"col-lg-4\">\n"
				+"							      	    <div class=\"jinjiuld\">\n"
				+"											<p class=\"jinjiultit\">验证/证实</p>\n"
				+"											<div class=\"jinjiuze\">\n"
				+"									            <textarea name=\"VALIDATION\">"+b.VALIDATION+"</textarea>\n"
				+"									        </div>\n"
				+"										</div>\n"
				+"							      </div>\n"
				+"							      <div class=\"col-lg-3\">\n"
				+"							      	    <div class=\"jinjiule\">\n"
				+"											<input type=\"hidden\" name=\"ATTACHMENTNURL\" >\n"
				+"											<div class=\"jinjiultit2\">上传附件<input id=\"myfile"+a+"\" name=\"myfile"+a+"\" class=\"myfile"+a+"\" type=\"file\" style=\"opacity: 0; filter:Alpha(opacity=0);\" onchange=\"upload(this);\"/></div>\n"
				+"											<div class=\"jinjiuze\">\n"
				+"                                                 <div class=\"jinjiddi\" id=\"myfile"+a+"a\">\n"
				var c = b.ATTACH;
				for (var i = 0; i < c.length; i++) {
					var zongurl = c[i]
					var realname = zongurl.substring(0,zongurl.indexOf("::"));
					var servername =zongurl.substring(zongurl.indexOf("::")+2,zongurl.length);
					
				
					str += "													<div class=\"jinjiuddd\">\n"
						+"														<em class=\"jinjiudddeml\"><img src=\"${ctx}/static/fords/img/wenjian.png\"/></em>\n"
						+"														<div class=\"jinjiudtits\">\n"
						+"															<a  class=\"pull-left\" href=\"${fns:getConfig('IMGURL')}/"+servername+"\" title=\""+realname+"\">"+realname+"</a>\n"
						+"														</div>\n"
						+"														<em class=\"jinjiudddemr\"><img src=\"${ctx}/static/fords/img/guanbi.png\"/></em>\n"
						+"													</div>\n"
					
					
				}
				
			str +="									        </div>\n"
				+"									        </div>\n"
				+"										</div>\n"
				+"							      </div>\n"
				+"							   </div>\n"
				+"							</div>\n"
				+"						</div>\n"
				+"						<div class=\"jinji_divtitbot\">\n"
				+"							<button class=\"pull-right jinjiscbtn\" type=\"button\">删除</button>\n"
				+"							<button class=\"pull-right jiushibtnxiu\" type=\"button\">保存</button>\n"
				+"							<button class=\"pull-right zjbtn\" type=\"button\">新增+</button>\n"
				+"						</div>\n"
				+"						</form>\n"
				+"					</div>"	  
				 
				
				
				$(".oisbtns").before(str)
			 
			 
			 
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
