<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>供应商反馈8D报告</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/iqc.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
	</head>

	<body style="background-color:#edeff5;margin: 15px;">
		<div class="oiswen_box oiswen_boxavite">
			<%@ include file="/setting/iqchead.jsp"%>
			<!---表---->
			<div class="iqc_listbot">
				<div class="container" style="width: 100%;">
				    <div class="row">
				    	<div class="col-sm-4">
				        	<div class="iqc2div clearfix">
				        		<em>实际回复日期：</em><input class="laydate-icon" type="text" id="demo1"/>
				        	</div>
				        </div>
				        <div class="col-sm-4">
				        	<div class="iqc2div clearfix">
				        		<em>完成日期：</em><input class="laydate-icon" type="text" id="demo2"/>
				        	</div>
				        </div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>临时对策：</em><textarea></textarea>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>发生原因：</em><textarea></textarea>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>流出原因：</em><textarea></textarea>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>根本对策：</em><textarea></textarea>
				        	</div>
				        </div>
				    </div>
				</div>
				<button type="button" class="iqcbtna">提交</button>
			</div>
			
		</div>
		<script>
			!function(){
			    laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
			    laydate({elem: '#demo1'});//绑定元素
			    laydate({elem: '#demo2'});//绑定元素
			}();
		    //点击删除文件
			$(".jinjiule").on("click", ".jinjiudddemr", function() {
			    var s = $(this).parent().index();
				$(this).parent().remove();
			})
		</script>
	</body>

</html>