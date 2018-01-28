<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
<meta name="format-detection"
	content="telephone=no,email=no,date=no,address=no">
<title>问题反馈</title>
<link rel="stylesheet"
	href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
<link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
<link rel="stylesheet"
	href="${ctx }/static/fords/css/font-awesome.min.css" />
<script type="text/javascript"
	src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
<script type="text/javascript"
	src="${ctx }/static/fords/js/jquery.pagination.js"></script>
</head>
<body style="background-color: #edeff5; margin: 15px;">
	<div class="oiswen_box oiswen_boxavite">
		<!---顶部--->
		<div class="oiswen_titop">
			<div class="oiswen_titople">
				<div class="oiswen_titoplea">问题反馈</div>
				<div class="oiswen_titopleb">
					<a href="javascript:;"><span
						class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a
						href="javascript:;">现场问题</a><span>/</span><a href="javascript:;">问题反馈</a>
				</div>
			</div>
		</div>
		<!-- 新建 -->
		<div class="goncsbox">
			<div class="list_topbtns">
				<button class="list_topbtnzeng" type="button">新增录入+</button>
				<button class="list_topbtndao" type="button">导出</button>
			</div>
			<div class="list_divs clearfix">
				<div class="list_divin">
					<span>发生时间：</span><input type="date" />
				</div>
				<div class="list_divin">
					<span>至 </span><input type="date" />
				</div>
				<div class="list_divin">
					<span>客户部门：</span><select><option></option></select>
				</div>
				<div class="list_divin">
					<span>客户名称：</span><select><option></option></select>
				</div>
				<div class="list_divin">
					<span>接受者：</span><select><option></option></select>
				</div>
			</div>
		</div>
		<!-- 问题列表 -->
		<div class="went_bxo">
			<c:forEach items="${varList }" var="var" >
				<div class="list_thta">
					<div class="list_tabxuhao">
						序号-<span>3</span>
					</div>
					<table cellpadding="0" cellspacing="0" class="list_table">
						<thead>
							<tr>
								<td style="width: 10%;">发生时间</td>
								<td style="width: 10%;">确认时间</td>
								<td style="width: 10%;">跟踪号</td>
								<td style="width: 10%;">客户部门</td>
								<td style="width: 10%;">客户名称</td>
								<td style="width: 10%;">投诉人</td>
								<td>接受者</td>
								<td>责任职能工程师</td>
								<td style="width: 10%;">关闭时间</td>
								<td style="width: 8%;">操作</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${var.OCCURRENCEDATE}</td>
								<td>2017-11-12</td>
								<td>${var.TRACKINGNUMBER }</td>
								<td></td>
								<td>${var.CLIENTSNAME}</td>
								<td>王小丫</td>
								<td>张三</td>
								<td>李能</td>
								<td>2017-11-12</td>
								<td rowspan="2">
									<div class="addsbox">
										<a class="liulanbtn addsbox2" href="javascript:;"><em></em><span>浏览</span></a>
										<a class="bianjibtn addsbox2" href="javascript:;"><em></em><span>编辑</span></a>
										<a class="scbtn addsbox2" href="javascript:;"><em></em><span>删除</span></a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:forEach>
			<!--	
		<div class="list_thta">
        	<div class="list_tabxuhao">序号-<span>2</span></div>
        	<table cellpadding="0" cellspacing="0" class="list_table">
        		<thead>
        			<tr>
		    	    	<td style="width: 10%;">发生时间</td>
		                <td style="width: 10%;">确认时间</td>
		                <td style="width: 10%;">跟踪号</td>
		                <td style="width: 10%;">客户部门</td>
		                <td style="width: 10%;">客户名称</td>
		                <td style="width: 10%;">投诉人</td>
		                <td>接受者</td>
						<td>责任职能工程师</td>
		                <td style="width: 10%;">关闭时间</td>
						<td style="width: 8%;">操作</td>
		    	   </tr>
        		</thead>
        	    <tbody>
        	    	<tr>
        	    		<td>2017-11-12</td>
        	    		<td>2017-11-12</td>
        	    		<td>HGF1234567893</td>
        	    		<td>质量检测部</td>
        	    		<td>福特重庆工厂</td>
        	    		<td>王小丫</td>
        	    		<td>张三</td>
        	    		<td>李能</td>
						<td>2017-11-12</td>
        	    		<td rowspan="2">
        	    			<div class="addsbox">
        	    				<a class="liulanbtn addsbox2" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn addsbox2" href="javascript:;"><em></em><span>编辑</span></a>
        	    				<a class="scbtn addsbox2" href="javascript:;"><em></em><span>删除</span></a>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    </tbody>
        	</table>
        </div>
		
		
		<div class="list_thta">
        	<div class="list_tabxuhao">序号-<span>3</span></div>
        	<table cellpadding="0" cellspacing="0" class="list_table">
        		<thead>
        			<tr>
		    	    	<td style="width: 10%;">发生时间</td>
		                <td style="width: 10%;">确认时间</td>
		                <td style="width: 10%;">跟踪号</td>
		                <td style="width: 10%;">客户部门</td>
		                <td style="width: 10%;">客户名称</td>
		                <td style="width: 10%;">投诉人</td>
		                <td>接受者</td>
						<td>责任职能工程师</td>
		                <td style="width: 10%;">关闭时间</td>
						<td style="width: 8%;">操作</td>
		    	   </tr>
        		</thead>
        	    <tbody>
        	    	<tr>
        	    		<td>2017-11-12</td>
        	    		<td>2017-11-12</td>
        	    		<td>HGF1234567893</td>
        	    		<td>质量检测部</td>
        	    		<td>福特重庆工厂</td>
        	    		<td>王小丫</td>
        	    		<td>张三</td>
        	    		<td>李能</td>
						<td>2017-11-12</td>
        	    		<td rowspan="2">
        	    			<div class="addsbox">
        	    				<a class="liulanbtn addsbox2" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn addsbox2" href="javascript:;"><em></em><span>编辑</span></a>
        	    				<a class="scbtn addsbox2" href="javascript:;"><em></em><span>删除</span></a>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    </tbody>
        	</table>
        </div>
        --->
			<!-----分页--->
			<div class="pages">
				<div id="Pagination"></div>
				<div class="searchPage">
					<span class="page-sum">共<strong class="allPage">15</strong>页
					</span> <span class="page-go">跳转<input type="text">页
					</span> <a href="javascript:;" class="page-btn">GO</a>
				</div>
			</div>
		</div>

	</div>
	<style>
.addsbox2 {
	float: left;
	margin-left: 18px;
}
</style>
	<script>
		//分页
		$(document).ready(function() {
			$("#Pagination").pagination("15");
		});
		//序号循环方法123456
		xuhao();
		function xuhao() {
			var a = $(".went_bxo>.list_thta").length;
			for (var i = 1; i <= a; i++) {
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