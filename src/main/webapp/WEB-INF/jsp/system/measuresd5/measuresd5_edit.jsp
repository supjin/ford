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
		<title></title>
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
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#MEASURES").val()==""){
			$("#MEASURES").tips({
				side:3,
	            msg:'请输入措施',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MEASURES").focus();
			return false;
		}
		if($("#VALIDATION").val()==""){
			$("#VALIDATION").tips({
				side:3,
	            msg:'请输入验证',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VALIDATION").focus();
			return false;
		}
		if($("#ATTACHMENT").val()==""){
			$("#ATTACHMENT").tips({
				side:3,
	            msg:'请输入附件',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ATTACHMENT").focus();
			return false;
		}
		if($("#PROCESS_FIVE_ID").val()==""){
			$("#PROCESS_FIVE_ID").tips({
				side:3,
	            msg:'请输入步骤id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCESS_FIVE_ID").focus();
			return false;
		}
		if($("#CLIENT_PROBLEM_COLLECTION_ID").val()==""){
			$("#CLIENT_PROBLEM_COLLECTION_ID").tips({
				side:3,
	            msg:'请输入事件id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLIENT_PROBLEM_COLLECTION_ID").focus();
			return false;
		}
		if($("#COMPANY_ID").val()==""){
			$("#COMPANY_ID").tips({
				side:3,
	            msg:'请输入公司id',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMPANY_ID").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="measuresd5/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="MEASURESD5_ID" id="MEASURESD5_ID" value="${pd.MEASURESD5_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">措施:</td>
				<td>
				
				<textarea rows="5" name="MEASURES" id="MEASURES"  maxlength="500" style="width: 90%;" placeholder="最多可输入500字">${pd.MEASURES}</textarea>
				
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">验证:</td>
				<td><input type="text" name="VALIDATION" id="VALIDATION" value="${pd.VALIDATION}" maxlength="32" placeholder="这里输入验证" title="验证"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">有效率:</td>
				<td><input type="text" name="efficient" id="efficient" value="${pd.efficient}" maxlength="32" placeholder="这里输入有效率" title="有效率"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">附件:</td>
				
				<td>
					<input type="hidden" name="ATTACHMENT" id="ATTACHMENT" value="${pd.ATTACHMENT }">
					<input type="button" value="+ 上传附件" style="position: absolute;z-index: 0;width: 80px;height: 25px;"/> 
					<input id="myfile" name="myfile" type="file" class="myfile" style="opacity: 0; filter:Alpha(opacity=0);width: 72px;" onchange="upload(this);"/>
					<a href="${fns:getConfig('IMGURL')}/${pd.serverName}" class='fujian'>${pd.realName}</a>
					<div id="submyfile"></div>
				</td>
			  
				
			
			</tr>
			    <input type="hidden" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}" maxlength="32" placeholder="这里输入公司id" title="公司id"/></td>
				<input type="hidden" name="PROCESS_FIVE_ID" id="PROCESS_FIVE_ID" value="${pd.PROCESS_FIVE_ID}" maxlength="32" placeholder="这里输入步骤id" title="步骤id"/>
				<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}" maxlength="32" placeholder="这里输入事件id" title="事件id"/>
		  <!-- <tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">步骤id:</td>
				<td></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">事件id:</td>
				<td>
				</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">公司id:</td>
				<td>
				</td>
			</tr>	
			 -->
			
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
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
		        data:{"fileitem":"processd5"},
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
	        		var str = "<a href='"+json.imgurl+"' class='fujian'>"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
	      			str +="<a class='del_but' style='margin-left:10px;' onclick='del(this);' href='javascript:void(0)'>删除</a></br>";
		     		$("#submyfile").empty();
		     		$("#ATTACHMENT").val(fileName+":"+json.url);
		      		$("#submyfile").append(str);
		        		
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