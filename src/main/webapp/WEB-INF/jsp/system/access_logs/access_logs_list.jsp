<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
 <title>访问日志</title>
  <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/experience.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/system_tools.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
         <!-- 下拉框-->
	<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js" ></script>
    
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
             <div class="oiswen_titoplea">访问日志</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">系统工具</a><span>/</span><a href="javascript:;">物料管理</a>
            </div>
        </div>
    </div>
	<!--主体--->
	<form action="${ctx}/access_logs/list.do" name="souForm" id="souForm">
	<div class="content">
		<!--导出-->
		<div class="list_divs clearfix" style="float:left;padding-top: 22px;width: 100%;">
        	<div class="list_divin"><span>操作时间：</span><input type="date" class = "shidate"  name="CREATESTART" value="${pd.CREATESTART }"/></div>
        	<div class="list_divin"><span>至　</span><input type="date" class = "shidate"  name="CREATEEND" value="${pd.CREATEEND }"/></div>
        	<div class="list_divin"><span>用户名：</span>
        	<select class="chzn-select" name="USERNAME" id="USERNAME" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
						<option value="">全部</option>
				     	<c:forEach items="${userList }" var="var">
			        	<option value="${var.USERNAME }" <c:if test="${pd.USERNAME == var.USERNAME }"> selected="selected"</c:if>>${var.USERNAME }</option>
			        	</c:forEach>
				</select>
				</div>
        	<!-- <div class="list_divin"><span>访问对象：</span><select><option></option></select></div> -->
        	<div class="dao_box clearfix" style="float: left;padding-top: 0px;">
				<a href="javascript:;" style="margin-top: -2px;">导出</a>
			</div>
        </div>
		<!--表--->
	    <table cellpadding="0" cellspacing="0" class="lins_table">
	    	<thead>
	    		<tr>
	    			<td style="width: 30px;">序号</td>
	    			<td style="width: 100px;">用户名</td>
	    			<td style="width: 180px;">操作对象</td>
	    			<td style="width: 180px;">操作</td>
	    			<td style="width: 65px;">操作时间</td>
	    		</tr>
	    	</thead>
	    	<tbody>
	    	<c:choose>
	    	<c:when test="${not empty varList}">
	    	<c:if test="${QX.cha==1 }">
			<c:forEach items="${varList}" var="var" varStatus="vs">
	    		<tr>
					<td>${vs.index+1}</td>
	    			<td>${var.USERNAME }</td>
	    			<td>${var.OBJECTNAME }</td>
	    			<td>${var.OPERATIONNAME }</td>
	    			<td>${var.CREATETIME }</td>
	    		</tr>
	    		</c:forEach>
	    		</c:if>
	    		<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="10" class="center">您无权查看</td>
							</tr>
						</c:if>
				</c:when>
				<c:otherwise>
					<tr class="main_info">
						<td colspan="100" class="center" >没有相关数据</td>
					</tr>
				</c:otherwise>
				</c:choose>
	    	</tbody>
	    </table>
	   <%--  <!---添加删除--->
	    <div class="equi_btn">
	    	<a href="${ctx }/material_namagement/goAdd">添加+</a>
	    	<a href="javascript:;" class="anniu_scbtn">删除</a>
	    </div> --%>
        <!-----分页--->
    	<div class="pages">
	        <div id="Pagination"></div>
	        <div class="searchPage">
	          <span class="page-sum">共<strong class="allPage">${tolpage}</strong>页</span>
	          <span class="page-go">跳转<input type="text">页</span>
	          <a href="javascript:;" class="page-btn">GO</a>
	           <input type="hidden" id="meiban" value="${meiban }">
	          <input type="hidden" id="pages" name="pages" value="${pages }">
	        </div>
		
	</div>
	</div>
	</form>
</div>

<script>
var pages = $("#pages").val();
//分页
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
	
</script>
<script>
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

	$(function(){
		//判断大全选
		$(document).on("change",".chebox",function(){
			if($(this).is(':checked')){
				$(".lins_table>tbody input[type='checkbox']").each(function(){
					$(this).prop("checked","checked");
				})
			}else{
				$(".lins_table>tbody input[type='checkbox']").each(function(){
					$(this).removeAttr("checked");
				})
			}
		})
		//判断小全选
		var i=0;
		var len=$(".lins_table>tbody input[type='checkbox']").length;
		$(document).on("change",".lins_table>tbody input[type='checkbox']",function(){
			i=0;
			//遍历input;
			$(".lins_table>tbody input[type='checkbox']").each(function(){
			    if($(this).is(":checked")){
			    	i++;
			    }
		    })
			//判断i
			if(i==len){
				$(".chebox").prop("checked","checked");
				
			}else{
				$(".chebox").removeAttr("checked");
			}
			
		})
		//xuhao();
		//循环序号1-10
		function xuhao(){
			var xuhao=$(".lins_table tbody tr").length;
			for(var a=1;a<=xuhao;a++){
				$(".lins_table>tbody>tr").eq(a-1).children("td").eq(1).html(a);
			}
		}
		
	

	})
</script>
</body>

</html>
