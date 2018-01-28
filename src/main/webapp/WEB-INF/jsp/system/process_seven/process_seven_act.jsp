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
		<link rel="stylesheet" href="${ctx }/static/fords/css/d6.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d7.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<script src="${ctx }/static/fords/js/my.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d7.js" ></script>
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
		<!----d7预防措施---->
			<div class="d7_boxs">
				<div class="d7_tits">D7预防措施</div>
				<!---新增预防措施---->
				<div class="d7_yufang">
					<a class="d7_yubtn d7_zjbtna huanji" href="javascript:;">新增<span>预防措施</span>+<input type="hidden" name="PREAVENTTYPE" value="1"></a>
					<div class="d7_ul d7_ula">
					<c:forEach items="${mesList }" var="var" varStatus="status">
					<div class="jinji_div">
					<form action="" name="yinForm" class="yinForm" >
					<input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value="${var.MEASURES_MESSAGE_PREVENT_ID }">
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
							<div class="jinji_divtit">
								<div class="jinjixuh">序号</div>
								<div class="jinjixuh2"><span>${ status.index + 1}</span></div>
							</div>
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
								   <div class="row" style="margin-bottom: 15px;">
								      <div class="col-lg-5 col-lg-offset-1">
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
								      <div class="col-lg-3">
								      	    <div class="jinjiulb">
												<p class="jinjiultit">计划时间</p>
												<div class="jinjiuze">
										            <input type="date" class="form-control" name="DOTIME" value="${var.EXECUTIONDATE }" />
										        </div>
											</div>
								      </div>
								      <div class=" col-lg-3">
								      	    <div class="jinjiulb">
												<p class="jinjiultit">执行时间</p>
												<div class="jinjiuze">
										            <input type="date" class="form-control" name="EXECUTIONDATE" value="${var.EXECUTIONDATE }"/>
										        </div>
											</div>
								      </div>
								   </div>
								   <div class="row">
								   	  <div class="col-lg-8 col-lg-offset-1">
								   	  	   <div class="jinjiuld">
												<p class="jinjiultit">预防措施</p>
												<input type="hidden" name="PREAVENTTYPE" value="1">
												<div class="jinjiuze">
										            <textarea name="MEASURESNAME">${var.MEASURESNAME }</textarea>
										        </div>
											</div>
								   	  </div>
								   	  <div class="col-lg-3 ">
								   	  	   <div class="jinjiule">
								   	  	   <input type="hidden" name="ATTACHMENTNURL">
												<div class="jinjiultit2">上传附件<input id="myfile${status.index + 1}" name="myfile${ status.index + 1}" class="myfile${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi" id="myfile${ status.index + 1}a">
														<c:forEach items="${var.ATTMAP }" var="att">
														 <c:forEach var="map" items="${att}">
														 <div class="jinjiuddd">
																<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a href="${fns:getConfig('IMGURL')}/${map.value}" title="${map.key}">${map.key}</a>
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
								</div>
							</div>
							<div class="jinji_divtitbot">
								<button class="pull-right jinjiscbtn" type="button">删除</button>
								<button class="pull-right jiushibtnxiu" type="button">修改</button>
								<button class="pull-right d7_zjbtna" type="button">新增+</button>
							</div>
							</form>
						</div>
					</c:forEach>
					<c:if test="${fn:length(mesList ) == 0}">
				<div class="jinji_div">
				<form action="" name="yinForm" class="yinForm" >
					<input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value="${var.MEASURES_MESSAGE_PREVENT_ID }">
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
							<div class="jinji_divtit">
								<div class="jinjixuh">序号</div>
								<div class="jinjixuh2"><span>1</span></div>
							</div>
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
								   <div class="row" style="margin-bottom: 15px;">
								      <div class="col-lg-5 col-lg-offset-1">
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
								      <div class="col-lg-3">
								      	    <div class="jinjiulb">
												<p class="jinjiultit">计划时间</p>
												<div class="jinjiuze">
										            <input type="date" class="jihuatame form-control" name="DOTIME" />
										        </div>
											</div>
								      </div>
								      <div class=" col-lg-3">
								      	    <div class="jinjiulb">
												<p class="jinjiultit">执行时间</p>
												<div class="jinjiuze">
										            <input type="date" class="jihuatame form-control" name="EXECUTIONDATE" />
										        </div>
											</div>
								      </div>
								   </div>
								   <div class="row">
								   	  <div class="col-lg-8 col-lg-offset-1">
								   	  	   <div class="jinjiuld">
												<p class="jinjiultit">预防措施</p>
												<input type="hidden" name="PREAVENTTYPE" value="1">
												<div class="jinjiuze">
										            <textarea name="MEASURESNAME"></textarea>
										        </div>
											</div>
								   	  </div>
								   	  <div class="col-lg-3 ">
								   	  	   <div class="jinjiule">
								   	  	   <input type="hidden" name="ATTACHMENTNURL">
												<div class="jinjiultit2">上传附件<input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi" id="myfilea">
														
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
								<button class="pull-right d7_zjbtna" type="button">新增+</button>
							</div>
							</form>
						</div>
					</c:if>
					</div>
				</div>
				<!---新增体制整改预防措施---->
				<div class="d7_yufang">
					<a class="d7_yubtn2 d7_zjbtna" href="javascript:;">新增<span>体制整改预防措施</span>+<input type="hidden" name="PREAVENTTYPE" value="2"></a>
					<div class="d7_ul d7_ula">
					<c:forEach items="${tixList }" var="var" varStatus="status">
						<div class="jinji_div">
						<form action="" name="yinForm" class="yinForm" >
					<input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value="${var.MEASURES_MESSAGE_PREVENT_ID }">
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
							<div class="jinji_divtit">
								<div class="jinjixuh">序号</div>
								<div class="jinjixuh2"><span>${ status.index + 1}</span></div>
							</div>
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
								   <div class="row" style="margin-bottom: 15px;">
								      <div class="col-lg-5 col-lg-offset-1">
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
								      <div class="col-lg-3">
								      	    <div class="jinjiulb">
												<p class="jinjiultit">计划时间</p>
												<div class="jinjiuze">
										            <input type="date" class="jihuatame form-control" name="DOTIME" value="${var.DOTIME }" />
										        </div>
											</div>
								      </div>
								      <div class=" col-lg-3">
								      	    <div class="jinjiulb">
												<p class="jinjiultit">执行时间</p>
												<div class="jinjiuze">
										            <input type="date" class="jihuatame form-control" name="EXECUTIONDATE"  ${var.EXECUTIONDATE }/>
										        </div>
											</div>
								      </div>
								   </div>
								   <div class="row">
								   	  <div class="col-lg-8 col-lg-offset-1">
								   	  	   <div class="jinjiuld">
												<p class="jinjiultit">体制整改预防措施</p>
												<input type="hidden" name="PREAVENTTYPE" value="2">
												<div class="jinjiuze">
										            <textarea name="MEASURESNAME">${var.MEASURESNAME }</textarea>
										        </div>
											</div>
								   	  </div>
								   	  <div class="col-lg-3 ">
								   	  	   <div class="jinjiule">
												<div class="jinjiultit2">上传附件<input id="myfiles${status.index + 1}" name="myfiles${ status.index + 1}" class="myfiles${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi" id="myfiles${status.index + 1}a">
													<input type="hidden" name="ATTACHMENTNURL">
														<c:forEach items="${var.ATTMAP }" var="att">
														 <c:forEach var="map" items="${att}">
														 <div class="jinjiuddd">
																<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a href="${fns:getConfig('IMGURL')}/${map.value}" title="${map.key}">${map.key}</a>
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
								</div>
							</div>
							<div class="jinji_divtitbot">
								<button class="pull-right jinjiscbtn" type="button">删除</button>
								<button class="pull-right jiushibtnxiu" type="button">修改</button>
								<button class="pull-right d7_zjbtna" type="button">新增+</button>
							</div>
							</form>
						</div>
					</c:forEach>	
					<c:if test="${fn:length(tixList ) == 0}">
					<div class="jinji_div">
					<form action="" name="yinForm" class="yinForm" >
					<input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value="${var.MEASURES_MESSAGE_PREVENT_ID }">
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
							<div class="jinji_divtit">
								<div class="jinjixuh">序号</div>
								<div class="jinjixuh2"><span>1</span></div>
							</div>
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
								   <div class="row" style="margin-bottom: 15px;">
								      <div class="col-lg-5 col-lg-offset-1">
									      	<div class="jinjiula">
												<p class="jinjiultit">责任人</p>
												<div class="jinjiuze">
									            	<div class="baidssb">
										                <input class="sowe_lse form-control" name="RESPONSIBLE"  type="text" />
										                <div class="taocen_cn">
										                    <ul class="houxuciu"></ul>
										                </div>
									        		</div>
										        </div>
											</div>
								      </div>
								      <div class="col-lg-3">
								      	    <div class="jinjiulb">
												<p class="jinjiultit">计划时间</p>
												<div class="jinjiuze">
										            <input type="date" class="jihuatame form-control" name="DOTIME" />
										        </div>
											</div>
								      </div>
								      <div class=" col-lg-3">
								      	    <div class="jinjiulb">
												<p class="jinjiultit">执行时间</p>
												<div class="jinjiuze">
										            <input type="date" class="jihuatame form-control" name="EXECUTIONDATE" />
										        </div>
											</div>
								      </div>
								   </div>
								   <div class="row">
								   	  <div class="col-lg-8 col-lg-offset-1">
								   	  	   <div class="jinjiuld">
												<p class="jinjiultit">体制整改预防措施</p>
												<input type="hidden" name="PREAVENTTYPE" value="2">
												<div class="jinjiuze">
										            <textarea name="MEASURESNAME"></textarea>
										        </div>
											</div>
								   	  </div>
								   	  <div class="col-lg-3 ">
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
								<button class="pull-right d7_zjbtna" type="button">新增+</button>
							</div>
							</form>
						</div>
					
					</c:if>	
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
									<div class="shangchuan dis" title="上传文件"><input id="myfileb${ status.index + 1}" name="myfileb${ status.index + 1}" class="myfileb${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="uploads(this);"/></div>
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
							<td><input type="text" class="inzidi" value="${modev.MODEL }"/><input type="hidden"
								class="ATTACHMODEL_ID" name="ATTACHMODEL_ID"  value="${modev.ATTACHMODEL_ID }"/></td>
							<td><div class="d7_inputs">
									<label><input type="checkbox" value="1" />是</label><label><input
										type="checkbox" value="0" />否</label>
								</div></td>
							<td><div class="d7_btnos">
									<button class="d7_scbtn pull-right" type="button">删除</button>
								</div>
								<div class="d7_inodsi ">
									<div class="shangchuan dis" title="上传文件">
										<input id="myfilec${ statuss.index + 1}" name="myfilec${ statuss.index + 1}"class="myfilec${ statuss.index + 1}" type="file"style="opacity: 0; filter: Alpha(opacity = 0);" />
									</div>
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
								</div></td>
						</tr>
				
				
				</c:forEach>
		


				
					</table>
					<a class="zidinbtn" href="javascript:;">自定义+</a>
				</div>
				<div class="d6_btnbox"><a class="pull-left" href="${ctx}/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right" href="${ctx}/process_eight/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a></div>
			</div>
			
		</div>
				
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
	</body>
	<script type="text/javascript">
	//临时措施
	$(document).on("click",".jiushibtnxiu",function(){
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
		tis.parents(".jinji_div").find("input[name='ATTACHMENTNURL']").val(accessory); 
	
		  $.ajax({
			type : "POST",
			url : "${ctx}/process_seven/addAndEdit",
			data : tis.closest("form").serialize(),
			success : function(data) {
				tis.text("修改");
				tis.parents(".jinji_div").find("input[name='MEASURES_MESSAGE_PREVENT_ID']").val(data.MEASURES_MESSAGE_PREVENT_ID);
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
			url : "${ctx}/process_seven/delet",
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
		        data:{"fileitem":"processSeven"},
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
	<script>
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
				        	alert("上传失败");
				        }
					});
					
				})
				//开始的时候判断是否
				$(".d7table tr").each(function(){
					/* if($(this).find(".d7_inputs input:checked").val()==1){
						$(this).find(".d7_inodsi").removeClass("dis");
					}else{
						$(this).find(".d7_inodsi").addClass("dis");
					} */
				})
				$(".d7table").on("change",".d7_inputs input",function(){
					var a=$(this).val();
					if(a==1){
						$(this).parents("td").siblings("td").find(".shangchuan").removeClass("dis");
						if($(this).is(":checked")){
							$(this).parent().siblings("label").children("input").removeAttr("checked")
							$(this).parents("tr").find(".d7_inodsi").removeClass("dis");
						}else{
							/* $(this).parent().siblings("label").children("input").prop("checked","checked"); */
							$(this).parents("tr").find(".d7_inodsi").addClass("dis");
						} 
					}else{
						if($(this).is(":checked")){
							$(this).parent().siblings("label").children("input").removeAttr("checked")
							$(this).parents("tr").find(".d7_inodsi").addClass("dis");
						}/* else{
							$(this).parent().siblings("label").children("input").prop("checked","checked");
							$(this).parents("tr").find(".d7_inodsi").removeClass("dis");
						} */
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
				        	alert("上传失败");
				        }
					});
					
				})
				//自定义按钮
				var str;
				$(document).on("click",".zidinbtn",function(){
					var timestamp=new Date().getTime();
					str='<tr class="trcode"><td><input type="text"class="inzidi"/><input type="hidden" class="ATTACHMODEL_ID" name="ATTACHMODEL_ID"/></td><td><div class="d7_inputs"><label><input type="checkbox"value="1"/>是</label><label><input type="checkbox"value="0"/>否</label></div></td><td><div class="d7_btnos"><button class="d7_scbtn pull-right"type="button">删除</button></div><div class="d7_inodsi dis"><div class="shangchuan"title="上传文件"><input id="myfile'+timestamp+'" name="myfile'+timestamp+'" class="myfile'+timestamp+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" /></div><div class="wenjianbox" id="myfile'+timestamp+'a"></div></div></td></tr>';
					//文件循环
					$(".d7table").append(str);
					str="";
				})
				
				//保存按钮
				/* $(document).on("click",".d7_bcbtn",function(){
					var ass=$(this).parents("tr").find(".inzidi").val();
					$(this).parents("tr").find("td:first-child").html(ass)
				}) */
				
			
			});
			
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
        	        	alert("上传失败");
        	        }
        		});
       			 
       			 
       		 }
       		 
   			});
			
			//自定义上传附件
			$(document).on("change",".shangchuan>input",function(){
				
				if($(this).parents(".trcode").find(".ATTACHMODEL_ID").val() == ""){
					alert("类型不能为空")
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
				    
				    DocAjaxFileUploads(target,b); 
				     
				}
				
				function DocAjaxFileUploads(target,ATTACHMODEL_ID){
					
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
							        		+"												<a href=\""+servername+"\" title=\""+fileName+"\">"+fileName+"</a>\n"
							        		+"												<input type=\"hidden\" name=\"MEASURES_MESSAGE_ATTACHMENT_ID\" value=\""+data.MEASURES_MESSAGE_ATTACHMENT_ID+"\">"
							        		+"											</div>\n"
							        		+"											<em class=\"jinjiudddemr\"><img src=\"${ctx}/static/fords/img/guanbi.png\"/></em>\n"
							        		+"										</div>"
											$("#"+classname+"a").append(str);
				        			},
				        		 	error:function(){
				        	        	alert("上传失败");
				        	        }
				        		});
				        		
				        		
				        		
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
    