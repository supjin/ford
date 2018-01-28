<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>缺陷录入</title>
    <link rel="stylesheet" href="${ctx}/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/defect.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/pagination.css" />
     <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
    	<!-- 下拉框-->
	<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
    <script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/defect.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/jquery.pagination.js" ></script>
    	<!--下拉框  -->
	<script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js"></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">缺陷录入</div>
            <div class="oiswen_titopleb">
			<a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">现场问题</a><span>/</span><a href="javascript:;">缺陷录入</a>
            </div>
        </div>
    </div>
    <!---内容--->
    <form action="${ctx}/imperfection_entry/list.do" id="souForm">
    <div class="defect_box">
    	<!--内容头-->
    	<div class="defect_top clearfix">
    		<button class="defectzj_btn" type="button" onclick="window.location.href='${ctx}/imperfection_entry/goAndandEdit'">新增录入</button>
    		<div class="defect_date">
    			<span>检查日期：</span><input type="text" class="layui-input test-item pw_layimg" name="CREATESTART" value="${pd.CREATESTART }"/><span class="defect_dains">至</span><input type="text" class="layui-input test-item pw_layimg" name="CREATEEND" value="${pd.CREATEEND }"/>
    		</div>
    		<div class="defect_sele">
    			<span>缺陷名称：</span>
    			<select class="chzn-select" name="IMPERFECTION_NAME" id="IMPERFECTION_NAME" data-placeholder="请选择" style="vertical-align:top; width: 200px; border: 1px solid #dedede;height: 29px;">
					<option value="">全部</option>
					<c:forEach items="${failureList }" var="var">
		        	<option ${var.FAILURENAME } <c:if test="${pd.IMPERFECTION_NAME == var.FAILURENAME }"> selected="selected"</c:if>>${var.FAILURENAME }</option>
		        	</c:forEach>
				</select>
    		</div>
 <%--    		<div class="defect_sele">
    			<span>产品名称：</span>
    			<select>
    				<c:forEach items="${productList }" var="var">
                    <option >${var.PRODUCTNAME }</option>
                 </c:forEach></select>
    		</div> --%>
    		
    		<div class="list_divin">
						<span>产品名称：</span>
						<select class="chzn-select" name="PRODUCTNAME" id="PRODUCTNAME" data-placeholder="请选择" style="vertical-align:top; width: 360px; border: 1px solid #dedede;height: 29px;">
							<option value="">全部</option>
							<c:forEach items="${productList }" var="var">
								<option value="${var.PRODUCTMANGEMENT_ID }" <c:if test="${pd.PRODUCTNAME == var.PRODUCTMANGEMENT_ID }"> selected="selected"</c:if>>${var.PRODUCTNAME }</option>
							</c:forEach>
						</select>
					</div>
    		
    	</div>
    	<!--表-->
    	<table class="defect_table">
    		<thead>
    			<tr>
    				<td style="width: 80px;">缺陷编号</td>
    				<td>产品编号(内)</td>
    				<td>产品名称</td>
    				<td>缺陷代码</td>
    				<td>缺陷名称</td>
    				<td>不合格数</td>
    				<td>设备编号</td>
    				<td>设备名称</td>
    				<td>原因分类</td>
    				<td>处置意见</td>
    				<td>工序代码</td>
    				<td>工序名称</td>
    				<td>备注</td>
    				<td style="width: 60px;">操作</td>
    			</tr>
    		</thead>
    		<tbody>
    			<c:forEach items="${varList }" var="var">
    			<tr>
    				<td><div class="fe1">${var.IMPERFECTION_NUMBERING }</div></td>
    				<td><div class="fe2">${var.PRODUCTS_NAME }</div></td>
    				<td><div class="fe3">${var.PRODUCTS_NUMBERING }</div></td>
    				<td><div class="fe4">${var.IMPERFECTION_CODE }</div></td>
    				<td><div class="fe5">${var.IMPERFECTION_NAME }</div></td>
    				<td><div class="fe6">${var.NONCONFORMITY }</div></td>
    				<td><div class="fe7">${var.EQUIPMENT }</div></td>
    				<td><div class="fe8">${var.EQUIPMENT_NAME }</div></td>
    				<td><div class="fe9">${var.LABEL }</div></td>
    				<td><div class="fe10">${var.DISPOSAL }</div></td>
    				<td><div class="fe11">${var.PROCESS_CODE }</div></td>
    				<td><div class="fe12">${var.PROCESS_NAME }</div></td>
    				<td><div class="de13">${var.REMARK }</div></td>
    				<td><div class="defect_xxss"><a class="defect_xg" href="${ctx}/imperfection_entry/goAndandEdit?IMPERFECTION_ENTRY_ID=${var.IMPERFECTION_ENTRY_ID}"></a>
    				<a class="defect_sc" href="javascript:;"></a>
    				<input type="hidden" id="${var.IMPERFECTION_ENTRY_ID }" value="${var.IMPERFECTION_ENTRY_ID }">
    				</div></td>
    			</tr>
    			</c:forEach>
    			
    		</tbody>
    	</table>
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
    </div>
    </form>
</div>

<div class="alert_1 dis">
	<div class="alert_1tit">你确定删除该条问题?</div>
	<div class="alert_1btn">
		<button class="quebtn" type="button">确定</button>
		<input type="hidden">
		<button class="qubtn" type="button">取消</button>
	</div>
</div>
<script>
//同时绑定多个
lay('.test-item').each(function(){
	laydate.render({
	    elem: this
	    ,trigger: 'click'//点击出发日期
	    ,type: 'date'//年月日
	    ,format: 'yyyy-MM-dd'//自定义格式
	    ,theme: 'molv'//墨绿色
    	,done: function(value, date){
		    $("#souForm").submit();
		  }
	});
});
$(".chzn-select").chosen({
	search_contains: true,
	enable_split_word_search: true
});
//搜索
$('select').change(function() {
	$("#souForm").submit();
});
/* $(".shidate").change(function() {
	$("#souForm").submit();
}); */
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
	//打开弹
	function alert1(){
		$(".alert_1").removeClass("dis");
	}
	//关闭弹
	function guanbi(){
		$(".alert_1").addClass("dis");
	}
	//取消按钮关闭
	$(document).on("click",".qubtn",function(){
		guanbi();
	})

	//删除方法
    $(document).on("click",".defect_sc",function(){
    	$(".alert_1").find("input").val($(this).next().val());
    	alert1();
    	
    })
    $(".quebtn").click(function(){
    	var IMPERFECTION_ENTRY_ID = $(this).next().val();
    	$.ajax({
    		type : "POST",
    		url : "${ctx}/imperfection_entry/delete",
    		data : {IMPERFECTION_ENTRY_ID:IMPERFECTION_ENTRY_ID},
    		success : function(data) {
    			$("#"+IMPERFECTION_ENTRY_ID).parents("tr").remove();
    	    	guanbi();
    		},
    	 	error:function(){
            	alert2("操作无效");
            }
    	});
    	
    	
    	
    })
</script>
</body>

</html>
