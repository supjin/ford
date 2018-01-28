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
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d6.js" ></script>
		<script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/seek.js" ></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 15px;">
		<div class="oiswen_box">
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
			<!----应急反应---->
			<div class="jinji_box">
				<div class="jinji_titbtn">
					<h3 class="d0_jintit" style="margin-top: 0px;">D6永久措施执行</h3>
				</div>
				<c:forEach items="${varList }" var="var"  varStatus="status">
				<div class="jinji_div">
					<div class="xuhao_bocn">序号-<span>1</span></div>
					<div class="neibka_bor">
						<form action="">
							<input type="hidden" name="MEASURES_MESSAGE_DO_ID" value="${var.MEASURES_MESSAGE_DO_ID }">
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"  value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
							<div class="jinjiul">
								<div class="container" style="width: 100%;">
									<div class="row">
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
											<div class="jinjiula">
												<p class="jinjiultit">责任人</p>
												<div class="jinjiuze">
													<div class="baidssb">
											                <input type="hidden" class="responsese"  value="${var.RESPONSIBLE }"/>
												            <input class="sowe_lse form-control" maxlength="6" name="RESPONSIBLE" type="text" <c:if test="${not empty var.NAME}"> value="${var.NAME }"</c:if><c:if test="${empty var.NAME}"> value="${var.RESPONSIBLE }"</c:if>/>
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
													<div class="jinjiuzediv">${var.DOTIME }</div>
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
											<div class="jinjiulb">
												<p class="jinjiultit">执行时间</p>
												<div class="jinjiuze">
													<input type="date" <c:if test="${empty var.EXECUTIONDATE }">class='jihuatame form-control'</c:if><c:if test="${not empty var.EXECUTIONDATE }">class="form-control" </c:if> value="${var.EXECUTIONDATE }" name="EXECUTIONDATE" >
												</div>
											</div>
										</div>
										<div class="col-xs-6 col-sm-12 col-md-3 col-lg-3">
											<div class="jinjiule jinjiulb">
											<input type="hidden" name="ATTACHMENTNURL" id="ATTACHMENTNURL">
												<div class="jinjiultit2">上传附件<input id="myfile${status.index + 1}" name="myfile${ status.index + 1}" class="myfile${ status.index + 1}" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
												<div class="jinjiuze">
													<div class="jinjiddi" id="myfile${ status.index + 1}a">
														
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
												<p class="jinjiultit">永久措施</p>
												<div class="jinjiuze">
													<div class="jinjiuzetext">${var.MEASURESNAME }</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="jinji_divtitbot">
								<button class="pull-right jiushibtnxiu" type="button">保存</button>
							</div>
						</form>
					</div>
				</div>
			</c:forEach>
			</div>
			<!---验证证实--->
			<div class="d0_jinbox">
				<div class="d0_shuru">
					<p class="d0_shurutit"><span>*</span>验证/证实</p>
					<input type="hidden" name="PROCESS_SIX_ID" id="PROCESS_SIX_ID" value="${pds.PROCESS_SIX_ID }">
					<div class="d0_shurut"><textarea name="COMGIRMED" id="COMGIRMED">${pds.COMGIRMED }</textarea></div>
					<button class="d0_8btnbc" type="button"><c:if test="${empty pds.COMGIRMED }">保存</c:if><c:if test="${not empty pds.COMGIRMED  }">修改</c:if></button>
				</div>
				<div class="xiayibus"><a class="pull-left" href="${ctx}/process_five/goProcess_five?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right nextSub" <c:if test="${handle.USTEP <DANGQJY-1}">href="${ctx}/process_seven/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if><c:if test="${handle.USTEP >=DANGQJY-1}">href="javaScript:;"</c:if>>下一步</a></div>
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
		//措施执行
		$(document).on("click",".jiushibtnxiu",function(){
			
			//附件
			var accessory = "";
			var tis = $(this);
			console.log($(this));
			tis.parents(".neibka_bor").find(".jinjiudtits>a").each(function(index,el){
				var realname = $(this).text();
				var name = $(this).next().val();
				var str = realname + "::" + name +";;";
				accessory += str;
			});
			tis.parents(".neibka_bor").find("input[name='ATTACHMENTNURL']").val(accessory); 
			 $.ajax({
				type : "POST",
				url : "${ctx}/process_six/addAndEdit",
				data : tis.closest("form").serialize(),
				success : function(data) {
					tis.text("修改");
					alert2(data.mesage);
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});   
		});

		//验证/提交
		$(document).on("click",".d0_8btnbc",function(){
			if($("#COMGIRMED").val()==""){
				$("#COMGIRMED").tips({
					side:3,
		            msg:'请输入验证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMGIRMED").focus();
				return false;
				}
				var PROCESS_SIX_ID = $("#PROCESS_SIX_ID").val();
				var COMGIRMED = $("#COMGIRMED").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				if(ISHANDLE == 0){
					return false;
				}
				var tis = $(this);
				$.ajax({
					type : "POST",
					url : "${ctx}/process_six/symptom",
					data : {PROCESS_SIX_ID:PROCESS_SIX_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,COMGIRMED:COMGIRMED},
					success : function(data) {
						$("#PROCESS_SIX_ID").val(data.PROCESS_SIX_ID);
						tis.text("修改");
						alert2("保存成功");
						if($(".nextSub").attr("href")=="javaScript:;"){
							$(".nextSub").attr("href","${ctx}/process_seven/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
							tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_seven/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
						}
						//当前步棸完成状态
						//window.location.href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID="+CLIENT_PROBLEM_COLLECTION_ID;	
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
			});
		
		
		
		$(function(){
        //当键盘键被松开时发送Ajax获取数据
		$('#text').keyup(function(){
			var keywords = $(this).val();
			if (keywords=='') { $('#word').hide(); return };
			$.ajax({
				url: 'http://suggestion.baidu.com/su?wd=' + keywords,
				dataType: 'jsonp',
				jsonp: 'cb', //回调函数的参数名(键值)key
				// jsonpCallback: 'fun', //回调函数名(值) value
				beforeSend:function(){
					$('#word').append('<div>正在加载。。。</div>');
				},
				success:function(data){
					$('#word').empty().show();
					if (data.s=='')
					{
						$('#word').append('<div class="error">Not find  "' + keywords + '"</div>');
					}
					$.each(data.s, function(){
						$('#word').append('<div class="click_work">'+ this +'</div>');
					})
				},
				error:function(){
					$('#word').empty().show();
					$('#word').append('<div class="click_work">Fail "' + keywords + '"</div>');
				}
			})
		})
        //点击搜索数据复制给搜索框
		$(document).on('click','.click_work',function(){
			var word = $(this).text();
			$('#text').val(word);
			$('#word').hide();
			// $('#texe').trigger('click');触发搜索事件
		})

	    })
	    
	    //上传附件
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		//附件上传
		function upload(target){
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
		        data:{"fileitem":"processSix"},
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
		        		var str = "<div class='jinjiuddd'>"+"<em class='jinjiudddeml'><img src='${ctx }/static/fords/img/wenjian.png'/></em>";
						str +="<div class='jinjiudtits'>"
		        		str += "<a class='pull-left' href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\" title="+fileName+">"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
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
	</body>
</html>
