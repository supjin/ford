<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>D0</title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/css/fen_navlis.css" /><!-- 菜单 -->
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
</head>
<body>
	<form action="" name="zeroForm" id="zeroForm" method="post">
		<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		<input type="hidden" name="PROCESS_ZERO_ID" id="PROCESS_ZERO_ID"  value="${pds.PROCESS_ZERO_ID}"  title="d0ID"/>
		<div id="zhongxin">
		<%@ include file="/setting/tdtop.jsp"%>
		<table id="table_report" class="table table-striped table-bordered table-hover"  style="width: 80%;margin:0 auto;">
			<thead>
			       <tr>
					    <th class="center" colspan="4" >D0症状</th>
					</tr>
			</thead>
			
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">症状描述:</td>
				 <td>
					<textarea rows="4" name="SYSPTOMDESCRIPTION" id="SYSPTOMDESCRIPTION" maxlength="800" placeholder="请输入800字以内" style="width: 99%;">${pds.SYSPTOMDESCRIPTION}</textarea>
				</td>
			</tr>
			
			<%-- <tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">上传附件</td>
				<td>
				<input type="hidden" name="ATTACHMENT_URL" id="ATTACHMENT_URL">
					<input type="button" value="+ 上传附件" style="position: absolute;z-index: 0;width: 80px;height: 25px;"/> 
					<input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);width: 72px;" onchange="upload(this);"/>
					
					 <c:forEach var="var" items="${attList}">
                    	<a href="${fns:getConfig('IMGURL')}/${var.ATTACHMENT_URL}" class='fujian'>${var.ATTACHMENT_NAME}</a><input type='hidden' value='${var.ATTACHMENT_URL}'>
                    	<a class='del_but' style='margin-left:10px;' onclick='dels(this);' href='javascript:void(0)'>删除</a></br>
                    </c:forEach>
			
			</tr> --%>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	<form name="threeForm" id="threeForm" method="post">
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover" style="width: 80%;margin:0 auto;">
			<thead>
					<tr>
						<th class="center">序号</th>
						<th class="center">应急反应</th>
						<th class="center">验证</th>
						<th class="center">附件</th>
						<th class="center">有效率</th>
						<th class="center">责任人</th>
						<th class="center">计划时间</th>
						<th class="center">完成时间</th>
						<th class="center">操作</th>
					</tr>
			</thead>
			<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty arrList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${arrList}" var="var" varStatus="vs">
							<tr>
										<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td class='center'>${var.EMERGENCYRESPONSE}</td>
										<td class='center'>${var.VERIFICATION}</td>
										<th class="center"><a href="${fns:getConfig('IMGURL')}/${var.ATTACHMENTNURL}">${var.ATTACHMENTNAME}</a></th>
										<td class='center'> ${var.EFFCIENT}</td>
										<td class='center'>${var.RESPONSIBLE}</td>
										<td class='center'>${var.PLANTIME}</td>
										<td class='center'>${var.EXECUTIONDATE}</td>
								<td style="width:14%;" class="center">
								<a style="cursor:pointer;" title="查看" onclick="take('${var.ZEROEMERGENCY_ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span style="color: #08c"><i class="icon-edit"></i>&nbsp;查看&nbsp;&nbsp;</span></a>
								<c:if test="${handle.ISHANDLE eq 1 }">
								<a style="cursor:pointer;" title="编辑" onclick="edit('${var.ZEROEMERGENCY_ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green"><i class="icon-edit"></i>&nbsp;编辑&nbsp;&nbsp;</span></a>
								<a style="cursor:pointer;" title="删除" onclick="del('${var.ZEROEMERGENCY_ID}');" class="tooltip-error" data-rel="tooltip" title="" data-placement="left"><span class="red"><i class="icon-trash"></i>&nbsp;删除</span> </a>
								</c:if>
								</td>
							</tr>
						
						</c:forEach>
						</c:if>
					<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="100" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
					
				
				</tbody>

			<tr>
			<c:if test="${handle.ISHANDLE eq 1 }">
				<td colspan="10">
				<a class="btn btn-small btn-success" onclick="add();">新增</a>
				</td>
				</c:if>
			</tr>
			
			<tr>
			
				<td style="text-align: center;" colspan="10">
				
				<a class="btn btn-mini btn-primary" href="${ctx }/process_zero/goDprocess.do?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a>　　
				<c:if test="${handle.ISHANDLE eq 1 }">
				<c:if test="${STATE == 1}">
				<a class="btn btn-mini btn-danger" id="editBtn">修改</a>　　
				</c:if>
				<c:if test="${STATE != 1}">
				<a class="btn btn-mini btn-danger" id="submitBtn">保存</a>　　
				</c:if>
				</c:if>	
					<a class="btn btn-mini btn-primary" href="${ctx }/process_one/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 编辑框-->
		<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
		<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
		<!-- 编辑框-->
		<script type="text/javascript" src="static/js/myjs/headEmail.js"></script>
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});	

			
			
			
			
		$("#submitBtn").click(function(){
			
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
			if($("#EMERGENCYRESPONSE").val()==""){
				$("#EMERGENCYRESPONSE").tips({
					side:3,
		            msg:'请输入应急反应',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMERGENCYRESPONSE").focus();
				return false;
			}
			if($("#EFFCIENT").val()==""){
				$("#EFFCIENT").tips({
					side:3,
		            msg:'请输入有效率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EFFCIENT").focus();
				return false;
			}
			if($("#VERIFICATION").val()==""){
				$("#VERIFICATION").tips({
					side:3,
		            msg:'请输入验证/证实',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERIFICATION").focus();
				return false;
			}
			if($("#VALIDITY").val()==""){
				$("#VALIDITY").tips({
					side:3,
		            msg:'请输入截止日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VALIDITY").focus();
				return false;
			}
			//附件
			var accessory = "";
			
			$(".fujian").each(function(index,el){
				var realname = $(this).text();
				var name = $(this).next().val();
				var str = realname + ":" + name +";";
				accessory += str;
			});
			$("#ATTACHMENT_URL").val(accessory);
			
			saveProcess();
		});
		
		function saveProcess() {
			//根据ID赋值城市首字母
			$.ajax({
				type : "POST",
				url : "${ctx}/dProcess/save",
				data : $("#zeroForm").serialize(),// 你的formid
				success : function(data) {
					alert(data.mesage);
				},
			 	error:function(){
		        	alert("上传失败");
		        }
			});
		}
		$("#editBtn").click(function(){
			
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
			if($("#EMERGENCYRESPONSE").val()==""){
				$("#EMERGENCYRESPONSE").tips({
					side:3,
		            msg:'请输入应急反应',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMERGENCYRESPONSE").focus();
				return false;
			}
			if($("#EFFCIENT").val()==""){
				$("#EFFCIENT").tips({
					side:3,
		            msg:'请输入有效率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EFFCIENT").focus();
				return false;
			}
			if($("#VERIFICATION").val()==""){
				$("#VERIFICATION").tips({
					side:3,
		            msg:'请输入验证/证实',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERIFICATION").focus();
				return false;
			}
			if($("#VALIDITY").val()==""){
				$("#VALIDITY").tips({
					side:3,
		            msg:'请输入截止日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VALIDITY").focus();
				return false;
			}
			//附件
			var accessory = "";
			
			$(".fujian").each(function(index,el){
				var realname = $(this).text();
				var name = $(this).next().val();
				var str = realname + ":" + name +";";
				accessory += str;
			});
			$("#ATTACHMENT_URL").val(accessory);
			
			editProcess();
		});
		
		function editProcess() {
			//根据ID赋值城市首字母
			$.ajax({
				type : "POST",
				url : "${ctx}/dProcess/edit",
				data : $("#zeroForm").serialize(),// 你的formid
				success : function(data) {
					alert(data.mesage);
				},
			 	error:function(){
		        	alert("上传失败");
		        }
			});
		}
		var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>zeroemergency/goAdd.do?CLIENT_PROBLEM_COLLECTION_ID='+CLIENT_PROBLEM_COLLECTION_ID;
			 diag.Width = 700;
			 diag.Height = 650;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				/* 	 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 } */
				}
				diag.close();
				location.reload();
			 };
			 diag.show();
		}
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>zeroemergency/goEdit.do?ZEROEMERGENCY_ID='+Id;
			 diag.Width = 700;
			 diag.Height = 650;
			 diag.CancelEvent = function(){ //关闭事件
				/*  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				} */
				diag.close();
				location.reload();
			 };
			 diag.show();
		}
			
		//查看
		function take(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>zeroemergency/goEdit.do?ZEROEMERGENCY_ID='+Id;
			 diag.Width = 700;
			 diag.Height = 650;
			 diag.CancelEvent = function(){ //关闭事件
				/*  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				} */
				diag.close();
				location.reload();
			 };
			 diag.show();
		}
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>zeroemergency/delete.do?ZEROEMERGENCY_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						location.reload();
					});
				}
			});
		}
		
		
		function dels(target){
			$(target).prev().prev().remove();
			$(target).prev().remove();
			$(target).next().remove();
			$(target).remove();
		}
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
		        		
		        		var str = "<a href='"+json.imgurl+"' class='fujian'>"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
		        			str +="<a class='del_but' style='margin-left:10px;' onclick='dels(this);' href='javascript:void(0)'>删除</a></br>";
		        		$(".myfile").after(str);
		        		
		        	}else if("oversize"==json.info){
		        		alert("系统繁忙请稍后再试！");
		        	}
		        },
		        error:function(){
		        	alert("上传失败");
		        }
			});
		}
		
		</script>
</body>
</html>