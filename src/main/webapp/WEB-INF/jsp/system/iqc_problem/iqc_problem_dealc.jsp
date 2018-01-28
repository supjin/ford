<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>领导确认</title>
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
				<div class="iqc_listbox clearfix">
				<div class="iqc_list" style="margin-left: 71%;">
					<p class="iqc_listtit">领导确认</p>
					<ul class="iqc_listul">
						<li>
							<div class="clearfix word_teme"><p>2017-12-30</p><p>已发送</p></div>
							<div class="clearfix word_box">
								<em class="word_img"></em>
								<div class="word_tit"><p>客户反馈8D报告</p><p>16MB</p></div>
								<a class="word_xiaimg" href="javascript:;"></a>
							</div>
							<div class="clearfix word_teme2"><p>2017-12-30</p><p>由于资料不齐，未通过审核</p></div>
						</li>
						<li>
							<div class="clearfix word_teme"><p>2017-12-30</p><p>已发送</p></div>
							<div class="clearfix word_box">
								<em class="word_img"></em>
								<div class="word_tit"><p>客户反馈8D报告</p><p>16MB</p></div>
								<a class="word_xiaimg" href="javascript:;"></a>
							</div>
							<div class="word_info2 clearfix"><a href="javascript:;" class="word_bobtn">驳回</a><a href="javascript:;" class="word_tongbtn">通过</a></div>
						</li>
					</ul>
				</div>
				</div>
			</div>

		</div>
		<script>
			$(function(){
				//驳回按钮事件
				$(document).on("click",".word_bobtn",function(){
					//prompt层
					parent.layer.prompt({
			        	formType:2,//输入框类型，支持0（文本）默认1（密码）2（多行文本）
						title:"请填写驳回原因",//标题
						area:['320px','295px'],//宽高
						shadeClose:false,//是否点击遮罩关闭
						scrollbar: true,//是否允许浏览器出现滚动条
						//btnAlign: 'c'//按钮居中
					},function(value,index){//value是输入值
						parent.layer.close(index);//关闭弹
					})
				})
			})
		</script>
	</body>

</html>