<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
	<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
	<title>问题反馈</title>
	<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
	<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
	<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
	<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
	<link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
	<!-- 下拉框-->
	<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
	<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
	<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
	<!--下拉框  -->
	<script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/static/fords/js/jquery.pagination.js"></script>
	<script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js"></script>
	<style type="text/css">
		.list_topbtns>button {
			float: right;
			margin-right: 15px;
		}
	</style>
	<!--  下拉框-->
	<style>
		.chzn-container-single .chzn-single {
			line-height: 29px;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
		}
		.chzn-container {
    	 	font-size: 14px;
    	}
	</style>
</head>
<body style="background-color: #edeff5; margin: 15px;">
	<div class="oiswen_box oiswen_boxavite">
		<!---顶部--->
		<div class="oiswen_titop">
			<div class="oiswen_titople">
				<div class="oiswen_titoplea">问题反馈</div>
				<div class="oiswen_titopleb">
					<a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span>
					<a href="javascript:;">现场问题</a><span>/</span>
					<a href="javascript:;">问题反馈</a>
				</div>
			</div>
		</div>
		<!-- 新建 -->
		<form action="${ctx}/question_feedback/list.do" id="souForm">
			<div class="goncsbox">
				<div class="list_topbtns">
					<button class="list_topbtndao" type="button">导出</button>
				</div>
				<div class="list_divs clearfix">
					<div class="list_divin">
						<span>发生时间：</span><input type="text" class="shidate layui-input test-item pw_layimg" name="CREATESTART" value="${pd.CREATESTART }" /></div>
					<div class="list_divin">
						<span>至 </span><input type="text" class="shidate layui-input test-item pw_layimg" name="CREATEEND" value="${pd.CREATEEND }" /></div>
					<div class="list_divin">
						<span>客户名称：</span>
						<select class="chzn-select" name="CLIENTSNAME" id="CLIENTSNAME" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
							<option value="">全部</option>
							<c:forEach items="${clientList }" var="var">
								<option value="${var.DEPARTMENT }" <c:if test="${pd.CLIENTSNAME == var.DEPARTMENT }"> selected="selected"</c:if>>${var.DEPARTMENT }</option>
							</c:forEach>
						</select>
					</div>
					<div class="list_divin" name="CLIENTSDEPARTMENT">
						<span>客户部门：</span>
						<select class="chzn-select" name="PROBLEMSOURCE" id="PROBLEMSOURCE" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
							<option value="">全部</option>
							<c:forEach items="${sourceanduserList }" var="var">
								<option value="${var.PROBLEMSOURCE }" <c:if test="${pd.PROBLEMSOURCE == var.PROBLEMSOURCE }"> selected="selected"</c:if>>${var.PROBLEMSOURCE }</option>
							</c:forEach>
						</select>

					</div>

					<div class="list_divin">
						<span>接受者：</span>
						<select class="chzn-select" name="USERNAME" id="USERNAME" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
							<option value="">全部</option>
							<c:forEach items="${userList }" var="var">
								<option value="${var.USERNAME }" <c:if test="${pd.USERNAME == var.USERNAME }"> selected="selected"</c:if>>${var.USERNAME }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<!-- 问题列表 -->
			<div class="went_bxo">
				<c:forEach items="${varList }" var="var">
					<div class="list_thta">
						<div class="list_tabxuhao">
							序号-<span>3</span>
						</div>
						<table cellpadding="0" cellspacing="0" class="list_table">
							<thead>
								<tr>
									<td style="width: 10%;">当前步骤</td>
									<td style="width: 10%;">发生时间</td>
									<td style="width: 10%;">确认时间</td>
									<td style="width: 10%;">跟踪号</td>
									<td style="width: 10%;">客户名称</td>
									<td style="width: 10%;">客户部门</td>
									<td style="width: 10%;">投诉人</td>
									<td>接受者</td>
									<td>责任职能工程师</td>
									<td style="width: 10%;">关闭时间</td>
									<td style="width: 8%;">操作</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${var.TIMES}</td>
									<td>
										<fmt:formatDate value="${var.OCCURRENCEDATE }" pattern="yyyy-MM-dd" />
									</td>
									<td>
										<fmt:formatDate value="${var.CREATETIME }" pattern="yyyy-MM-dd" />
									</td>
									<td>${var.TRACKINGNUMBER }</td>
									<td>${var.CLIENTSNAME}</td>
									<td>${var.PROBLEMSOURCE}</td>
									<td>${var.COMPLAINANT }</td>
									<td>${var.USERNAME }</td>
									<td>${var.NAME }</td>
									<td>${var.CLOSED_TIME }</td>
									<td rowspan="2">
										<div class="addsbox">
											<a class="liulanbtn addsbox2" href="javascript:;"><em></em><span>浏览</span></a>
											<a class="bianjibtn addsbox2" href="${ctx }/question_feedback/goaddAndEdit?CLIENT_PROBLEM_COLLECTION_ID=${var.CLIENT_PROBLEM_COLLECTION_ID}"><em></em><span>编辑</span></a>
											<a class="scbtn addsbox2" href="javascript:;"><em></em><span>删除</span></a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:forEach>
				<div class="pages">
					<div id="Pagination"></div>
					<div class="searchPage">
						<span class="page-sum">共<strong class="allPage">${tolpage }</strong>页</span>
						<span class="page-go">跳转<input type="text">页</span>
						<a href="javascript:;" class="page-btn">GO</a>
						<input type="hidden" id="meiban" value="${meiban }">
						<input type="hidden" id="pages" name="pages" value="${pages }">
					</div>
				</div>
			</div>

	</div>
	</form>
	<style>
		.addsbox2 {
			float: left;
			margin-left: 18px;
		}
	</style>
	<script>
	
	//同时绑定多个
	lay('.test-item').each(function(){
		laydate.render({
		    elem: this
		    ,trigger: 'click'//点击出发日期
		    ,type: 'date'//年月日
		    ,format: 'yyyy-MM-dd'//自定义格式
		    ,theme: 'molv'//墨绿色
		});
	});
	$(".chzn-select").chosen({
		search_contains: true,
		enable_split_word_search: true
	});
	//分页
	var pages = $("#pages").val();
	$(document).ready(function() {
		$("#meiban").val(1);
		$("#Pagination").pagination($(".allPage").text(), {
			callback: PageCallback,
			showData: 1,
			current_page: pages,
		});
		$("#meiban").val(2);
	});

	function PageCallback(index, jq) {
		//alert("a");//前一个表示您当前点击的那个分页的页数索引值，后一个参数表示装载容器。  
		if($("#meiban").val() != 1) {
			Init(index);
		}
	}

	function Init(pageIndex) {
		$("#pages").val(pageIndex);
		$("#souForm").submit();
	}
	//搜索
	$('select').change(function() {
		$("#souForm").submit();
	});
	$(".shidate").change(function() {
		$("#souForm").submit();
	});
	//序号循环方法123456
	xuhao();

	function xuhao() {
		var a = $(".went_bxo>.list_thta").length;
		for(var i = 1; i <= a; i++) {
			console.log(i);
			$(".went_bxo>.list_thta").eq(i - 1).find(".list_tabxuhao>span")
				.html(i);
		}
	}
	//删除方法
	$(document).on("click", ".scbtn", function() {
		$(this).parents(".list_thta").remove();
		xuhao();
	})
</script>
</body>
</html>