<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<style type="text/css">
			input, textarea, .uneditable-input {
				width: 400px;
			}
			body{
				width:70%;
			}
		</style>
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	//保存
	function save(){
		
		var text =UE.getEditor('editor').getContent();
		$("#CONTENT").val(text);
		
		var accessory = "";
		
		$(".fujian").each(function(index,el){
			var realname = $(this).text();
			var name = $(this).next().val();
			var str = realname + ":" + name +";";
			accessory += str;
		});
		
		$("#ACCESSORY").val(accessory);
		
		if($("#TITLE").val()==""){
			$("#TITLE").tips({
				side:3,
	            msg:'请输入标题',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TITLE").focus();
			return false;
		}
		if($("#COMPANY").val()==""){
			$("#COMPANY").tips({
				side:3,
	            msg:'请输入公司',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMPANY").focus();
			return false;
		}
		if($("#LINKMAN").val()==""){
			$("#LINKMAN").tips({
				side:3,
	            msg:'请输入联系人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LINKMAN").focus();
			return false;
		}
		if($("#TELEPHONE").val()==""){
			$("#TELEPHONE").tips({
				side:3,
	            msg:'请输入电话',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TELEPHONE").focus();
			return false;
		}
		if($("#CELLPHONE").val()==""){
			$("#CELLPHONE").tips({
				side:3,
	            msg:'请输入手机',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CELLPHONE").focus();
			return false;
		}
		if($("#ADDRESS").val()==""){
			$("#ADDRESS").tips({
				side:3,
	            msg:'请输入地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ADDRESS").focus();
			return false;
		}
		if($("#INTRO").val()==""){
			$("#INTRO").tips({
				side:3,
	            msg:'请输入简介',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INTRO").focus();
			return false;
		}
		if($("#CONTENT").val()==""){
			$("#editor").tips({
				side:3,
	            msg:'请输入内容',
	            bg:'#AE81FF',
	            time:2
	        });
			return false;
		}
		if($("#TYPE").val()==""){
			$("#TYPE").tips({
				side:3,
	            msg:'请输入类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
			return false;
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head> 
<body>
	<form action="demand/${msg}.do" name="Form" id="Form" method="post">
		<input type="hidden" name="DEMAND_ID" id="DEMAND_ID" value="${pd.DEMAND_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">标题:</td>
				<td><input style="width: 60%" type="text" name="TITLE" id="TITLE" value="<c:out value='${pd.TITLE}'/>" placeholder="" title="标题"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">公司:</td>
				<td><input style="width: 60%" type="text" name="COMPANY" id="COMPANY" value="${pd.COMPANY}"placeholder="" title="公司"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">类型:</td>
				<td>
					<select name="TYPE">
						<c:forEach var="var" items="${fns:getDictList('demandType')}">
							<option value="${var.value}" <c:if test="${pd.TYPE eq var.value}">selected</c:if> >${var.label}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:100px;text-align: left;padding-top: 13px;">是否启用:</td>
				<td>
					<select name="ISOPEN">
						<option value="2" <c:if test="${pd.ISOPEN ne 1}">selected='selected'</c:if> >禁用</option>
						<option value="1" <c:if test="${pd.ISOPEN eq 1}">selected='selected'</c:if> >启用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">联系人:</td>
				<td><input style="width: 60%" type="text" name="LINKMAN" id="LINKMAN" value="${pd.LINKMAN}" maxlength="32" placeholder="" title="联系人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">电话:</td>
				<td><input style="width: 60%" type="text" name="TELEPHONE" id="TELEPHONE" value="${pd.TELEPHONE}" maxlength="32" placeholder="" title="电话"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">手机:</td>
				<td><input style="width: 60%" type="text" name="CELLPHONE" id="CELLPHONE" value="${pd.CELLPHONE}" maxlength="32" placeholder="" title="手机"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">地址:</td>
				<td><input style="width: 60%" type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="32" placeholder="" title="地址"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">简介:</td>
				<td><textarea rows="3" name="INTRO" id="INTRO" maxlength="100" style="width: 99%;">${pd.INTRO}</textarea></td>
				<%-- <td><input type="text" name="INTRO" id="INTRO" value="${pd.INTRO}" maxlength="32" placeholder="这里输入简介" title="简介"/></td> --%>
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">内容:</td>
				<td><script id="editor" type="text/plain" style="height: 500px;width: 100%;">${pd.CONTENT}</script></td>
				<input type="hidden" id="CONTENT" name="CONTENT">
			</tr>
			<tr>
				<td style="width:70px;text-align: left;padding-top: 13px;">附件:</td>
				<td>
					<input type="hidden" name="ACCESSORY" id="ACCESSORY">
					<input type="button" value="选择文件" style="position: absolute;z-index: 0;width: 72px;height: 25px;"/> 
                    <input id="uploadfile" name="uploadfile" class="uploadfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);width: 72px;" onchange="upload(this);"/></br>
                    
                    <c:forEach var="var" items="${maps}">
                    	<a href="${fns:getConfig('IMGURL')}/${var.key}" class='fujian'>${var.value}</a><input type='hidden' value='${var.key}'>
                    	<a class='del_but' style='margin-left:10px;' onclick='del(this);' href='javascript:void(0)'>删除</a></br>
                    </c:forEach>
                    
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="history.go(-1);">取消</a>
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
		<!-- 文件上传 -->
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
		    if(fileName !="doc" && fileName !="docx"){
		       alert("请选择正确格式的图片文件(doc,docx)！");
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
		    
		    ajaxFileUpload(target); 
		     
		}
		
		function ajaxFileUpload(target){
			
			var name=target.value;
			var fileName = name.substring(name.lastIndexOf("\\")+1);
			var $target = $(target);
			var classname = $target.attr('class');
			var myDate = new Date();
			var now = myDate.getTime();
			
			$.ajaxFileUpload({
				url: '${ctx}/ps/uploadfile', 
		        secureuri: false, 
		        fileElementId: classname, 
		        data:{"fileitem":"demand"},
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
		        		
		        		var str = "<a href='"+json.imgurl+"' class='fujian'>"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
		        			str +="<a class='del_but' style='margin-left:10px;' onclick='del(this);' href='javascript:void(0)'>删除</a></br>";
		        		$("#uploadfile").next().after(str);
		        		
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