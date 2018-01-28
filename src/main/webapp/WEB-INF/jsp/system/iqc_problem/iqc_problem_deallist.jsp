<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>供应商问题${pd.TITLE }</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/iqc.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.pagination.js" ></script>
      <script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
<style type="text/css">
		tbody a {
			font-size: 14px;
			color: #666;
		}
		.list_topbtns>button{
			float: right;
		}
		.list_topbtnzeng{
			background-color: #24cab2;
			margin-right: 40px;
		}
		.list_topbtndao{
			background-color: #21b0d0;
			margin-right: 40px;
		}
		.dangsha{
		    text-decoration: none;
    		border-bottom: 1px solid #081417;
    	}
    	.chzn-container {
    	 font-size: 14px;
    	}
	</style>

</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">供应商问题${pd.TITLE }</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">供应商问题${pd.TITLE }</a>
            </div>
        </div>
    </div>
    <form action="${ctx}/iqc_problem/deallist" id="souForm">
    <!-- 问题列表 -->
    <div class="went_bxo">
<c:if test="${not empty iqcList}">
        <div class="list_thta">
        	<table cellpadding="0" cellspacing="0" class="list_table">
        		<thead>
        			<tr>
        			<td style="width: 5%;">序号</td>
		    	    	<td style="width: 10%;">进行状态</td>
		                <td style="width: 10%;">责任人</td>
		                <td style="width: 10%;">发生日期</td>
		                <td style="width: 10%;">零件编码 </td>
		                <td style="width: 15%;">零件名称</td>
		                <td style="width: 10%;">供应商名称</td>
		                <td style="width: 10%;">失效模式</td>
		                <td style="width: 10%;">临时对策</td>
		                <td style="width: 10%;">操作</td>
		    	   </tr>
        		</thead>
        		
        	    <tbody>
        	    		<c:forEach items="${iqcList}" var="var" varStatus="vs">
        	    	<tr>
        	    		<td>${vs.index+1}</td>
        	    		<td>
        	    		<c:choose>
        	    			<c:when test="${var.FINISHSTATE eq 1}">
        	    			<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}&TYPE=1&NEWSTATE=1" class="list_bgdiv list_bgdiv0"><em></em>
        	    			<span>	发送供应商问题通知</span>
        	    			</a>
        	    			</c:when>
        	    			<c:when test="${var.FINISHSTATE eq 2}">
        	    			<c:if test="${var.isExtended eq 2 }">
        	    			<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}&TYPE=2&NEWSTATE=1"class="list_bgdiv list_bgdiv0"><em></em>
        	    				<span>供应商反馈8d报告</span>
        	    				</a>
        	    			</c:if>
        	    			 <c:if test="${var.isExtended eq 1 }">
        	    			<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}&TYPE=2&NEWSTATE=1" class="list_bgdiv list_bgdiv3"><em></em>
        	    				<span>供应商反馈8d报告</span>
        	    				</a>
        	    			</c:if>
        	    			<c:if test="${var.isExtended eq 0 }">
        	    			<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}&TYPE=2&NEWSTATE=1" class="list_bgdiv list_bgdiv2"><em></em>
        	    				<span>供应商反馈8d报告</span>
        	    				</a>
        	    			</c:if>
        	    			</c:when>
        	    			<c:when test="${var.FINISHSTATE eq 5}">
        	    			<a href="javascript:;" class="list_bgdiv list_bgdiv1"><em></em>
        	    			<span>已完成</span>
        	    			</a>
        	    			</c:when>
        	    			</c:choose>
        	    		</td>
        	    		<td>${var.USERNAMES }</td>
        	    		<td><fmt:formatDate value="${var.OCCURENTDATE }" pattern="yyyy-MM-dd" /></td>
        	    		<td>${var.PARTCODING }</td>
        	    		<td>${var.PARTNAME }</td>
        	    		<td>${var.GYNAME }</td>
        	    		<td>${var.FALUREMODEL }</td>
        	    		<td>${var.DUICELIN }</td>
        	    		<td>
        	    			<div class="addsbox list_addsbox clearfix">
        	    				<a class="bianjibtn pull-left" href="${ctx }/iqc_problem/goandAddEdit?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}"><em></em><span>处理</span></a>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    	</c:forEach>
        	    </tbody>
        	</table>
        	</div>
        	
	    	<div class="beizhuos clearfix">
	    		<p>备注：</p>
	    	    <ul>
	    	    	<li><span></span><em>按时已完成</em></li>
	    	    	<li><span></span><em>即将超期</em></li>
	    	    	<li><span></span><em>超期未完成</em></li>
	    	    	<li><span></span><em>待完成</em></li>
	    	    </ul>
	    	</div>
        
        <div style="height: 30px;"></div>
        </c:if>
    </div>
      <!-----分页--->
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
    
 </form>
</div>
<script>
//分页
var pages = $("#pages").val();
//分页
$(document).ready(function() {
	$("#meiban").val(1);
	$("#Pagination").pagination($(".allPage").text(), {
		callback: PageCallback,
		showData: 1,
		current_page: pages,
	});
	$("#meiban").val(3);
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
    //序号循环方法123456
    xuhao();
    function xuhao(){
    	var a=$(".went_bxo>.list_thta").length;
	    for(var i=1;i<=a;i++){
	    	console.log(i);
	    	$(".went_bxo>.list_thta").eq(i-1).find(".list_tabxuhao>span").html(i);
	    }
    }
    
    function bca_lik(){
    	window.location.href="${ctx }/iqc_problem/goandAddEdit";
    }
</script>
</body>
</html>
