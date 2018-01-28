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
		 <script type="text/javascript" src="${ctx}/static/laydate/laydate.js"></script><!-- 时间插件必备 -->
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#CLIENT_PROBLEM_COLLECTION_ID").val()==""){
			$("#CLIENT_PROBLEM_COLLECTION_ID").tips({
				side:3,
	            msg:'请输入问题',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLIENT_PROBLEM_COLLECTION_ID").focus();
			return false;
		}
		if($("#COMPANY_ID").val()==""){
			$("#COMPANY_ID").tips({
				side:3,
	            msg:'请输入公司',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMPANY_ID").focus();
			return false;
		}
		if($("#MEASURESNAME").val()==""){
			$("#MEASURESNAME").tips({
				side:3,
	            msg:'请输入措施',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MEASURESNAME").focus();
			return false;
		}
		if($("#CREATETIME").val()==""){
			$("#CREATETIME").tips({
				side:3,
	            msg:'请输入创建',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATETIME").focus();
			return false;
		}
		if($("#DOTIME").val()==""){
			$("#DOTIME").tips({
				side:3,
	            msg:'请输入计划时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DOTIME").focus();
			return false;
		}
		if($("#EFFICIENT").val()==""){
			$("#EFFICIENT").tips({
				side:3,
	            msg:'请输入有效率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EFFICIENT").focus();
			return false;
		}
		/* if($("#VALIDATION").val()==""){
			$("#VALIDATION").tips({
				side:3,
	            msg:'请输入验证',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VALIDATION").focus();
			return false;
		} */
		/* if($("#ATTACHMENTNURL").val()==""){
			$("#ATTACHMENTNURL").tips({
				side:3,
	            msg:'请输入附件路径',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ATTACHMENTNURL").focus();
			return false;
		} */
		if($("#RESPONSIBLE").val()==""){
			$("#RESPONSIBLE").tips({
				side:3,
	            msg:'请输入责任人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RESPONSIBLE").focus();
			return false;
		}
		/* if($("#ATTACHMENTNAME").val()==""){
			$("#ATTACHMENTNAME").tips({
				side:3,
	            msg:'请输入附件名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ATTACHMENTNAME").focus();
			return false;
		} */
		if($("#EXECUTIONDATE").val()==""){
			$("#EXECUTIONDATE").tips({
				side:3,
	            msg:'请输入完成时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXECUTIONDATE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="measures_message_do/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="MEASURES_MESSAGE_DO_ID" id="MEASURES_MESSAGE_DO_ID" value="${pd.MEASURES_MESSAGE_DO_ID}"/>
		<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">措施:</td>
				<td>
				<textarea rows="5" name="MEASURESNAME" id="MEASURESNAME"  maxlength="800" style="width: 90%;" placeholder="最多可输入800字">${pd.MEASURESNAME}</textarea>
				</td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">验证:</td>
				<td>
				<textarea rows="5" name="VALIDATION" id="VALIDATION"  maxlength="800" style="width: 90%;" placeholder="最多可输入800字">${pd.VALIDATION}</textarea></td>
			</tr>
			<tr>
				<td style="width:100px;text-align: left;padding-top: 13px;">初判责任人:</td>
			    <td>
				部门　　
				 <select class="select DEPT" name="DEPT" id="DEPT"  style="vertical-align:top;width: 26%;">
							
							
							<c:forEach items="${deptList}" var="var">
							   <option value="${var.DEPARTMENT_ID}" <c:if test="${pd.DEPARTMENT_ID == var.DEPARTMENT_ID }">selected</c:if>>${var.DEPARTMENT_NAME}</option>
							</c:forEach>
				</select>
			        　　人员　　
				<select  name="RESPONSIBLE" style="width: 26%"  id="RESPONSIBLE"  >
							<c:forEach items="${deptuser}" var="var">
							  <option value="${var.USER_ID}" <c:if test="${pd.RESPONSIBLE == var.USER_ID }">selected</c:if>>${var.NAME}</option>
							</c:forEach>
			    </select>
				</td> 
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">有效率:</td>
				<td>
				<select class="" name="EFFICIENT" style="width: 30%"  id="EFFICIENT"data-placeholder="" style="vertical-align: top;">
					<c:forEach items="${arryList }" var="var">
					<option value="${var.LABEL}" <c:if test="${var.LABEL eq pd.EFFICIENT}">selected</c:if> >${var.LABEL }</option>
					</c:forEach>
			    </select>
				</td>
			</tr>
			<tr>
				<td style="width:88px;text-align: left;padding-top: 13px;">计划时间:</td>
				<td>
				 <input style="width: 40%;float: left;" type="text"  name="DOTIME" id="DOTIME" class=" laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="<fmt:formatDate value="${pd.DOTIME }" pattern="yyyy-MM-dd HH:mm:ss"/>" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td style="width:88px;text-align: left;padding-top: 13px;">完成时间:</td>
				<td>
				 <input style="width: 40%;float: left;" type="text"  name="EXECUTIONDATE" id="EXECUTIONDATE" class=" laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="<fmt:formatDate value="${pd.EXECUTIONDATE }" pattern="yyyy-MM-dd HH:mm:ss"/>" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">上传附件</td>
				<td>
				<input type="hidden" name="ATTACHMENTNAME" id="ATTACHMENTNAME" value="${pd.ATTACHMENTNAME }">
					<input type="hidden" name="ATTACHMENTNURL" id="ATTACHMENTNURL" value="${pd.ATTACHMENTNURL }">
					<input type="button" value="+ 上传附件" style="position: absolute;z-index: 0;width: 80px;height: 25px;"/> 
					<input id="myfile" name="myfile" type="file" class="myfile" style="opacity: 0; filter:Alpha(opacity=0);width: 72px;" onchange="upload(this);"/>
					<a href="${fns:getConfig('IMGURL')}/${pd.ATTACHMENTNURL}" class='fujian'>${pd.ATTACHMENTNAME}</a>
					<div id="submyfile"></div>
				</td>
			</tr>
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
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
	        		var str = "<a href='"+json.imgurl+"' class='fujian'>"+fileName+"</a> <input type='hidden' value='"+json.url+"'>";
	        		/* 
	      			str +="<a class='del_but' style='margin-left:10px;' onclick='del(this);' href='javascript:void(0)'>删除</a></br>"; */
		     		$("#submyfile").empty();
		     	/* 	$("#ATTACHMENT").val(fileName+":"+json.url); */
		     	$("#ATTACHMENTNAME").val(fileName);
		     		$("#ATTACHMENTNURL").val(json.url);
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