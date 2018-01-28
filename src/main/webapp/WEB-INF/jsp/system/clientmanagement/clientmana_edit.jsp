<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>产品管理</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
    	<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <style>
    	.prodbtnsss{padding: 10px 0px;}
    	.prodbtns{
    		float: left;
    		width: 70px;
    		height: 30px;
    		line-height: 30px;
    		border-radius: 4px;
    		background-color: #24CAB2;
    		color: white;
    		text-align: center;
    		font-size: 14px;
    		position: relative;
    		margin-right: 20px;
    		cursor: pointer;
    	}
    	.prodbtns>input{
    		display: block;
    		position: absolute;
    		width: 100%;
    		height: 100%;
    		opacity: 0;
    		top: 0px;
    		left: 0px;
    	}
    	.prodimgs{
    		float: left;
    		width: 236px;
    		height: 156px;
    		/* border: 1px solid #dedede; */
    	}
    	.prodimgs img{
    		width: 100%;
    		height: 100%;
    		display: block;
    	}
    </style>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">客户管理</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">系统管理</a><span>/</span><a href="javascript:;">产品管理</a>
            </div>
        </div>
    </div>
    <!----问题采集---->
	<div class="wenti_box">
		<div class="container">
		   <div class="row">
		     <form action="" name="codeForm" id="codeForm">
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>工厂</p>
		      	  	 <input type="text" name="DEPARTMENT" id="DEPARTMENT" value="${pd.DEPARTMENT }"/>
		      	  	 <input type="hidden" name="CLIENTMANAGEMENT_ID" id="CLIENTMANAGEMENT_ID" value="${pd.CLIENTMANAGEMENT_ID }"/>
		      	  </div>
		      </div>   
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>地址</p>
		      	  	 <input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS }"/>
		      	  </div>
		      </div>      
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>部门</p>
		      	     <input type="text"  name="FACTORY" id="FACTORY" value="${pd.FACTORY }" />
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>姓名</p>
		      	  	<input type="text"  name="LINKSNAEM" id="LINKSNAEM" value="${pd.LINKSNAEM }"/>
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>职务</p>
		      	  	<input type="text" name="JOBWORKS" id="JOBWORKS" value="${pd.JOBWORKS}"/>
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>电话号</p>
		      	  	<input type="text" name="PHONES" id="PHONES" value="${pd.PHONES }"/>
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>邮箱</p>
		      	  	<input type="text" name="EMAILS" id="EMAILS" value="${pd.EMAILS }"/>
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>备注</p>
		      	  	<input type="text" name="REMARKS" id="REMARKS" value="${pd.REMARKS }"/>
		      	  </div>
		      </div>
		   </div>
		</div>
		<div class="acq_boxtx">
			<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/clientmanagement/list'">关闭</button>
			<button type="button" class="tibutton">提交</button>
			<c:if test="${pd.CLIENTMANAGEMENT_ID == null }">
			<button type="button" class="jxbutton"  onclick="window.location.href='${ctx}/clientmanagement/goAdd'">继续添加</button>
			</c:if>
		</div>
		</form>
	</div>

</div>
<script>
    $(function(){
    	$(document).on("click",".tibutton",function(){
    		$.ajax({
				type : "POST",
				url : "${ctx}/clientmanagement/save",
				data : $("#codeForm").serialize(),
				success : function(data) {
					$("#CLIENTMANAGEMENT_ID").val(data.CLIENTMANAGEMENT_ID);
					alert2("保存成功");
				},
			 	error:function(){
		        	alert2("操作无效");
		        }
			});   	
    		
    		
    	})
    	
    	
    	
    })
    //上传附件
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		 var fileName;
			//附件上传
			function upload(target){
				var name=target.value;
			    fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
			    if( fileName !="pdf"&&fileName !="jpg" && fileName !="jpeg"&& fileName !="png" &&fileName !="gif"){
			       alert2("请选择正确格式的文件(png,jpg,jpeg,gif)！");
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
			        data:{"fileitem":"product"},
			        /* dataType: 'JSON',   */ 
			        success:function(data){
			        	
			        	var str = $(data).find("body").text();  
			            var json = $.parseJSON(str);
			        	if("success"==json.info){
			        		//png,jpg,jpeg,gif
			        		var strs = $(data).find("body").text();
			        			strs = "<img src=\""+json.imgurl+"\" alt=\"\"/>\n";
			        		$(".prodimgs").html(strs)	
			        		$("#IMGURL").val(json.url);
			        			
			        		
			        
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
