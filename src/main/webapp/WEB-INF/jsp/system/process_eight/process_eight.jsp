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
 <script type="text/javascript" src="${ctx}/static/laydate/laydate.js"></script><!-- 时间插件必备 -->
<script type="text/javascript">
	

	
</script>
</head>
<body>
	<form action="" name="eightForm" id="eightForm" method="post">
		<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		<input type="hidden" name="PROCESS_EIGHT_ID" id="PROCESS_EIGHT_ID"  value="${pds.PROCESS_EIGHT_ID}"  title="d0ID"/>
		<div id="zhongxin">
		<%@ include file="/setting/tdtop.jsp"%>
		<table id="table_report" class="table table-striped table-bordered table-hover"  style="width: 80%;margin:0 auto;">
			
			<thead>
			       <tr>
					    <th class="center" colspan="4" >D8团队</th>
					</tr>
			</thead>
			<tr colspan="4">
				<td style="width:120px;text-align: left;padding-top: 13px;">团队认可:</td>
				<td>
				<textarea rows="4" name="TEAM" id="TEAM" maxlength="800" placeholder="请输入800字以内" style="width: 99%;">${pds.TEAM}</textarea>
				</td>
			</tr>
				<tr>
				<td style="width:120px;text-align: left;padding-top: 13px;">报告人:</td>
				<td>
				<select class="" name="REPORTMAN" style="width: 10%"  id="REPORTMAN"data-placeholder="" style="vertical-align: top;">
							
							<option value="1"  <c:if test="${pds.REPORTMAN eq 1}">selected</c:if>>张三</option>
							<option value="0" <c:if test="${pds.REPORTMAN eq 0}">selected</c:if>>李四</option>
			    </select>
				</td>
			</tr>
			<tr>
				<td style="width: 6%;" >完成时间:</td>
				<td  colspan="4" class='center'>
	                   <input style="width: 20%;float: left;" type="text"  name="FINISHTIME" id="FINISHTIME" class=" laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="<fmt:formatDate value="${pds.FINISHTIME }" pattern="yyyy-MM-dd HH:mm:ss"/>" pattern="yyyy-MM-dd HH:mm:ss"/>
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
                    	<a class='del_but' style='margin-left:10px;' onclick='del(this);' href='javascript:void(0)'>删除</a></br>
                    </c:forEach>
			
			</tr> --%>
			<tr>
			
				<td style="text-align: center;" colspan="10">
				
				<a class="btn btn-mini btn-primary" href="${ctx }/process_eight/goProcessSeven?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a>　　
				<c:if test="${handle.ISHANDLE eq 1 }">
				<c:if test="${STATE == 1}">
				<a class="btn btn-mini btn-danger" id="editBtn">修改</a>　　
				</c:if>
				<c:if test="${STATE != 1}">
				<a class="btn btn-mini btn-danger" id="submitBtn">保存</a>　　
				</c:if>
				</c:if>
					<a class="btn btn-mini btn-primary" href="${ctx }/client_problem_collection/list.do">去列表页</a>
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
				url : "${ctx}/process_eight/save",
				data : $("#eightForm").serialize(),// 你的formid
				success : function(data) {
					alert(data.mesage);
				},
			 	error:function(){
		        	alert("上传失败");
		        }
			});
		}
		$("#editBtn").click(function(){
			
			
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
				url : "${ctx}/process_eight/edit",
				data : $("#eightForm").serialize(),// 你的formid
				success : function(data) {
					alert(data.mesage);
				},
			 	error:function(){
		        	alert("上传失败");
		        }
			});
		}
		
		function del(target){
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
		        data:{"fileitem":"processEight"},
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
		        		
		        		var str = "<a href='"+json.imgurl+"' class='fujian'>"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
		        			str +="<a class='del_but' style='margin-left:10px;' onclick='del(this);' href='javascript:void(0)'>删除</a></br>";
		        		$(".myfile").after(str);
		        		
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