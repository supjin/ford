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
		<link rel="stylesheet" href="${ctx }/static/css/fen_navlis.css" />
		<script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
<script type="text/javascript">
	
function save(){
	if($("#PROBLEMSTATEMENT").val()==""){
		$("#PROBLEMSTATEMENT").tips({
			side:3,
	        msg:'请输入问题描述',
	        bg:'#AE81FF',
	        time:2
	    });
		$("#PROBLEMSTATEMENT").focus();
		return false;
	}
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
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
      data:{"fileitem":"processOne"},
      /* dataType: 'JSON',   */ 
      success:function(data){
      	
      	var str = $(data).find("body").text();  
          var json = $.parseJSON(str);
      	if("success"==json.info){
      		
      		var str = "<a href='"+json.imgurl+"' class='fujian'>"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
      			str +="<a class='del_but' style='margin-left:10px;' onclick='del(this);' href='javascript:void(0)'>删除</a></br>";
     		$("#submyfile").empty();
     		$("#ATTACHMENT_URL").val(fileName+":"+json.url);
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

function del(target){
	$("#ATTACHMENT_URL").val();
	$("#ATTACHMENT_NAME").val();
	$("#submyfile").empty();
}
</script>
	</head>
<body>
	<form action=" process_two/${msg}.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PROCESS_TWO_ID" id="PROCESS_TWO_ID" value="${pd.PROCESS_TWO_ID}"/>
		<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		<div id="zhongxin">
		<%@ include file="/setting/tdtop.jsp"%>
		
		<table id="table_report" class="table table-striped table-bordered table-hover" style="width: 1000px;margin:0 auto;">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">问题描述:</td>
				<td>
					<textarea rows="3" name="PROBLEMSTATEMENT" id="PROBLEMSTATEMENT" maxlength="200" style="width: 99%;">${pd.PROBLEMSTATEMENT}</textarea>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">Is/Is Not 附件:</td>
				<td>
					<input type="hidden" name="ATTACHMENT_URL" id="ATTACHMENT_URL" value="${fj.ATTACHMENT_NAME }:${fj.ATTACHMENT_URL} ">
					<input type="button" value="+ 上传附件" style="position: absolute;z-index: 0;width: 80px;height: 25px;"/> 
					<input id="myfile" name="myfile" type="file" class="myfile" style="opacity: 0; filter:Alpha(opacity=0);width: 72px;" onchange="upload(this);"/>
					<div id="submyfile">
						<c:if test="${!empty fj.ATTACHMENT_URL  }">
							<a href='"+json.imgurl+"' class='fujian'>${fj.ATTACHMENT_NAME }</a>
	      					<a class='del_but' style='margin-left:10px;' onclick='del(this);' href='javascript:void(0)'>删除</a></br>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-danger" href="${ctx}/process_one/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" onclick="">上一步</a>
					<c:if test="${handle.ISHANDLE eq 1 }">
						<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					</c:if>
					<a class="btn btn-mini btn-danger" href="${ctx}/process_three/goProcessThree?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" onclick="">下一步</a>
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
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>