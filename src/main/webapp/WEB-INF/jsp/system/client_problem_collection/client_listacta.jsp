<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>${pd.DINGTILE }</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
     <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
     <!-- 下拉框-->
	<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js" ></script>
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
            <div class="oiswen_titoplea">${pd.DINGTILE }</div>
            <div class="oiswen_titopleb">
                <a href="${ctx}/userspace/list"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="${ctx }/client_problem_collection/list?TYPE=${pd.TYPE}">${pd.DALEIBIE }</a><span>/</span><a href="javascript:;">${pd.DINGTILE }</a>
            </div>
        </div>
    </div>
    <!-- 新建 -->
    <form action="${ctx}/client_problem_collection/list.do" id="souForm">
    <div class="goncsbox clearfix">
        <div class="list_topbtns" style="float:right;width: 150px;">
        	<button class="list_topbtnzeng" type="button" onclick='window.location.href="${ctx }/client_problem_collection/goaddAndEdit?TYPE=${pd.TYPE}"'>新增录入</button>
        	<button class="list_topbtndao" type="button">　导出　</button>
        </div>
        <input type="hidden" name="TYPE" value="${pd.TYPE}">
        <div style="float:left;">
        <div class="list_divs clearfix">
        	<div class="list_divin"><span>发生时间：</span><input type="date" class="shidate" name="CREATESTART" value="${pd.CREATESTART }"/></div>
        	<div class="list_divin"><span>至　</span><input type="date" class="shidate" name="CREATEEND" value="${pd.CREATEEND }"/></div>
        	<div class="list_divin"><span>责任人：</span>
        		<select class="chzn-select" name="NAME" id="NAME" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
						<option value="">全部</option>
				     	<c:forEach items="${userList }" var="var">
			        	<option value="${var.NAME }" <c:if test="${pd.NAME == var.NAME }"> selected="selected"</c:if>>${var.NAME }</option>
			        	</c:forEach>
				</select>
        	</div>
        	
        	<div class="list_divins"><span>失效模式：</span>
	        	<select class="chzn-select" name="FAILUREMODE" id="FAILUREMODE" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
					<option value="">全部</option>
		        	<c:forEach items="${failureList }" var="var">
		        	<option ${var.FAILURENAME } <c:if test="${pd.FAILUREMODE == var.FAILURENAME }"> selected="selected"</c:if>>${var.FAILURENAME }</option>
		        	</c:forEach>
				</select>
        	</div>
        </div>
        <div class="list_divs clearfix">
        <div class="list_divin" ><span>客户名称：</span>
	             <select class="chzn-select" style="width: 338px" name="CLIENTSNAME" id="CLIENTSNAME" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
						<option value="">全部</option>
				     	<c:forEach items="${clientList }" var="var">
                    	<option value="${var.DEPARTMENT }" <c:if test="${pd.CLIENTSNAME == var.DEPARTMENT }"> selected="selected"</c:if>>${var.DEPARTMENT }</option>
            			</c:forEach>
				</select>
            </div>
        	<div class="list_divin"><span>产品名称：</span>
		         <select class="chzn-select" style="width: 400px"  name="PRODUCTNAME" id="PRODUCTNAME" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
					<option value="">全部</option>
			     	<c:forEach items="${productList }" var="var">
                    <option value="${var.PRODUCTNAME }" <c:if test="${pd.PRODUCTNAME == var.PRODUCTNAME }"> selected="selected"</c:if>>${var.PRODUCTNAME }</option>
                 	</c:forEach>
				</select>
            </div>
        </div>
        </div>
    </div>
    <!-- 问题列表 -->
    <div class="went_bxo">
    <c:forEach items="${varList }" var="var" varStatus="status">
        <div class="list_thta">
        	<div class="list_tabxuhao">序号-<span>${ status.index + 1}</span></div>
        	<table cellpadding="0" cellspacing="0" class="list_table">
        		<thead>
        			<tr>
		   				 <td style="width: 5%;">当前步骤</td>
		                <td style="width: 6%;">发生日期</td>
		                <td style="width: 5%;">责任人</td>
		                <td style="width: 10%;">跟踪号</td>
		                <td style="width: 14%;"><c:if test="${pd.TYPE == 5 }">供应商名称</c:if><c:if test="${pd.TYPE != 5 }">客户名称</c:if></td>
		                <td style="width: 17%;">产品名称</td>
		                <td style="width: 10%;">失效模式</td>
		                <td>问题描述</td>
		                <td style="width: 80px;">操作</td>

		    	   </tr>
        		</thead>
        	    <tbody>
        	    
                  <c:forEach items="${map }" var="map">
                   <c:if test="${map.value.CLIENT_PROBLEM_COLLECTION_ID == var.CLIENT_PROBLEM_COLLECTION_ID }">
        	    	<tr>
        	    		<td><c:if test="${fn:length(map.value.DANGQ ) == 0}">无需操作 </c:if><c:if test="${fn:length(map.value.DANGQ) > 0}"><a class="dangsha">D${map.value.DANGQ }</a></c:if></td>
        	    		<td><fmt:formatDate value="${var.OCCURRENCEDATE }" pattern="yyyy-MM-dd" /></td>
        	    		<td>${var.NAME }</td>
        	    		<td>${var.TRACKINGNUMBER }</td>
        	    		<td>${var.CLIENTSNAME }</td>
        	    		<td>${var.PRODUCTNAME }</td>
        	    		<td>${var.FAILUREMODE }</td>
        	    		<td>${var.TITLE }</td>
        	    		<td rowspan="2">
        	    			<div class="addsbox">
        	    				<a class="liulanbtn" href="${ctx }/client_problem_collection/goBrows?CLIENT_PROBLEM_COLLECTION_ID=${var.CLIENT_PROBLEM_COLLECTION_ID}"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn" href="${ctx }/client_problem_collection/goaddAndEdit?TYPE=1&CLIENT_PROBLEM_COLLECTION_ID=${var.CLIENT_PROBLEM_COLLECTION_ID}"><em></em><span>编辑</span></a>
        	    				<a class="scbtn" href="javascript:;"><em></em><span>删除</span></a>
        	    			 <input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${var.CLIENT_PROBLEM_COLLECTION_ID}">
        	    			</div>
        	    		</td>
        	    		
        	    	</tr>
        	    	</c:if>
        	    	</c:forEach>
        	    	<tr>
        	    		<td colspan="8">
        	    			<ul class="d_divul">
        	    		<c:forEach items="${map }" var="map">
	                   <c:forEach items="${dicList }" var="dic">
                       <c:if test="${map.value.CLIENT_PROBLEM_COLLECTION_ID == var.CLIENT_PROBLEM_COLLECTION_ID }">
                       
                      <c:if test="${fn:length(map.value.planList ) == 0}">
                      <li><a  <c:if test="${map.value.DANGQJY>map.value.DANGQ }">href="javaScript:;"</c:if> <c:if test="${map.value.DANGQJY==map.value.DANGQ  }">href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}"</c:if>>
                     
									<div class="d_yys">
										<p>${dic.LABEL }</p>
										<p>${dic.REMARKS }</p>
									</div>
									<div class="d_yydd"></div>
					</a></li>
                      </c:if> 
                        <c:if test="${fn:length(map.value.planList ) != 0}">
                        <c:forEach items="${map.value.planList }" var="plan">
                        
	                        <c:if test="${plan.USTEP == dic.VALUE && plan.ISFINISH ==1 && plan.ISOUTIME != 2}">
	                        
	                        <li class="d_active2"><a href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}">
										<div class="d_yys">
											<p>${dic.LABEL }</p>
											<p>${dic.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
							</a></li>
	                        </c:if>
	                        <c:if test="${plan.USTEP == dic.VALUE && plan.ISOUTIME ==1}">
	                        
	                        <li class="d_active3"><a  <c:if test="${map.value.DANGQJY<=plan.USTEP }">href="javaScript:;"</c:if> <c:if test="${map.value.DANGQJY>plan.USTEP  }">href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}"</c:if>">
										<div class="d_yys">
											<p>${dic.LABEL }</p>
											<p>${dic.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
							</a></li>
	                        </c:if>
	                        <c:if test="${plan.USTEP == dic.VALUE && plan.ISFINISH ==0 && plan.ISOUTIME ==2}">
	                        
	                        <li class="d_active4"><a href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}">
										<div class="d_yys">
											<p>${dic.LABEL }</p>
											<p>${dic.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
							</a></li>
	                        </c:if>
	                         <c:if test="${plan.USTEP == dic.VALUE && plan.ISFINISH ==0 && empty plan.ISOUTIME }">
	                        
	                        <li><a <c:if test="${map.value.DANGQJY<=plan.USTEP }">href="javaScript:;"</c:if> <c:if test="${map.value.DANGQJY>plan.USTEP}">href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}"</c:if>>
										<div class="d_yys">
											<p>${dic.LABEL }</p>
											<p>${dic.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
							</a></li>
	                        </c:if>
                        </c:forEach>
                      	</c:if> 
                       </c:if>
                          </c:forEach>
                       </c:forEach>
                     
	                           
	                        </ul>
        	    		</td>
        	    	</tr>
        	    	 
                    
        	    </tbody>
        	</table>
        	<div class="beizhuos clearfix">
	    		<p>备注：</p>
	    	    <ul>
	    	    	<li><span></span><em>按时已完成</em></li>
	    	    	<li><span></span><em>超期已完成</em></li>
	    	    	<li><span></span><em>超期未完成</em></li>
	    	    	<li><span></span><em>待完成</em></li>
	    	    </ul>
	    	</div>
        </div>
	</c:forEach>
    </div>
        <!-----分页--->
    	<div class="pages">
	        <div id="Pagination"></div>
	        <div class="searchPage">
	          <span class="page-sum">共<strong class="allPage">${tolpage }</strong>页</span>
	          <span class="page-go">跳转<input type="text">页</span>
	          <a href="javascript:;" class="page-btn">GO</a>
	          <input type="hidden" id="meiban" value="${meiban }">
	          <input type="hidden" id="TYPE" value="${pd.TYPE }">
	          <input type="hidden" id="pages" name="pages" value="${pages }">
	        </div>
	    </div>
    </div>
 </form>   
<div class="alert_1 dis">
	<div class="alert_1tit">你确定删除该条问题?</div>
	<div class="alert_1btn">
		<input type="hidden" id="xixha">
		<button class="quebtn" type="button">确定</button>
		<input type="hidden">
		<button class="qubtn" type="button">取消</button>
	</div>
</div>

<script>
//当前步棸加上链接
$(function(){
    $(".list_thta").each(function(index){
    	var tis = $(this);
    	var dands = tis.find("tbody tr:eq(0) a:eq(0)");
    	tis.find(".d_divul li").each(function(index){
    		var ts = $(this);
    		 if(dands.text() == $.trim(ts.find("p:eq(0)").text())){
    			 dands.attr("href",ts.find("a").attr("href"));
    		} 
    	});
    });
    
})

//下拉框选择
$(".chzn-select").chosen({
	search_contains:true,
	enable_split_word_search:true
});

var TYPE = $("#TYPE").val();
//搜索
$('select').change(function() {
	$("#souForm").submit();
});
$(".shidate").change(function() {
	$("#souForm").submit();
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

$(document).on("click", "li a", function() {
	if(this.href == "javascript:;") {
		alert2("上一步未完成，请先完成");
	}
})

xuhao();

function xuhao() {
	var a = $(".went_bxo>.list_thta").length;
	for(var i = 1; i <= a; i++) {
		$(".went_bxo>.list_thta").eq(i - 1).find(".list_tabxuhao>span").html(i);
	}
}

//打开弹
function alert1() {
	$(".alert_1").removeClass("dis");
}
//关闭弹
function guanbi() {
	$(".alert_1").addClass("dis");
}
//取消按钮关闭
$(document).on("click", ".qubtn", function() {
	guanbi();
})

//删除方法
var a;
$(document).on("click", ".scbtn", function() {
	$(".alert_1").find("input:eq(1)").val($(this).next().val());
	alert1();
	a = $(this).parents(".went_bxo>.list_thta").index();
	//$(this).parents(".list_thta").remove();

})
//删除
$(".quebtn").click(function() {

	var CLIENT_PROBLEM_COLLECTION_ID = $(this).next().val();
	$.ajax({
		type: "POST",
		url: "${ctx}/client_problem_collection/deletes",
		data: {
			CLIENT_PROBLEM_COLLECTION_ID: CLIENT_PROBLEM_COLLECTION_ID
		},
		success: function(data) {
			$(".went_bxo>.list_thta").eq(a).remove();
			xuhao();
			guanbi();
		},
		error: function() {
			alert("操作无效");
		}
	});

})

</script>
</body>
</html>
