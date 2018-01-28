<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>沟通解决</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
     <!-- 下拉框-->
	<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
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
    		/* border-bottom: 1px solid #081417; */
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
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">现场问题</a><span>/</span><a href="javascript:;">沟通解决</a>
            </div>
        </div>
    </div>
     <form action="${ctx}/imper_troble/list.do" id="souForm">
    <!-- 新建 -->
    <div class="goncsbox clearfix">
        <div class="container list_divbox">
		    <div class="row">
		        <div class="col-md-6">
		        	<div class="list_divtop">
		        		<span class="list_divtoptit">创建时间：</span>
		        		<div class="list_divtopmin clearfix">
		        			<input type="text" class="layui-input test-item pull-left pw_layimg shidate" name="CREATESTART" value="${pd.CREATESTART }"/>
			        		<span class="fl">　至　</span>
			        		<input type="text" class="layui-input test-item pull-left pw_layimg shidate" name="CREATEEND" value="${pd.CREATEEND }"/>
		        		</div>
		        	</div>
		        </div>
		        <div class="col-md-6">
		        	<div class="list_divtop">
		        		<!-- <span class="list_divtoptit">责任人：</span> -->
		        		<div class="list_divtopmin clearfix">
		        			<%-- <select class="chzn-select" name="NAME" id="NAME" data-placeholder="请选择" style="vertical-align:top; width: 33%;float:left; border: 1px solid #dedede;height: 29px;">
								<option value="">全部</option>
						     	<c:forEach items="${userList }" var="var">
					        	<option value="${var.NAME }" <c:if test="${pd.NAME == var.NAME }"> selected="selected"</c:if>>${var.NAME }</option>
					        	</c:forEach>
							</select> --%>
		        			
			        		<span style="width: 22%;float: left;">失效模式：</span>
			        		<select class="chzn-select" name="FAILUREMODE" id="FAILUREMODE" data-placeholder="请选择" style="vertical-align:top; float:left; width: 38%; border: 1px solid #dedede;height: 29px;">
					<option value="">全部</option>
		        	<c:forEach items="${failureList }" var="var">
		        	<option ${var.FAILURENAME } <c:if test="${pd.FAILUREMODE == var.FAILURENAME }"> selected="selected"</c:if>>${var.FAILURENAME }</option>
		        	</c:forEach>
				</select>
		        		</div>
		        	</div>
		        </div>      
		    </div>
		    <div class="row">
		        <div class="col-sm-6">
		        	<div class="list_divtop">
		        		<span class="list_divtoptit">产品名称：</span>
		        		<div class="list_divtopmin">
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
		 </div>
		 <!---按钮组--->
		 <div class="list_btns">
		 	<button type="button"  onclick='window.location.href="${ctx }/imper_troble/goAndandEdit"'>新增录入</button>
		 	<button type="button">导出</button>
		 </div>
    </div>
    <!-- 问题列表 -->
    <div class="went_bxo">
        <div class="list_thta">
        	<table cellpadding="0" cellspacing="0" class="list_table">
        		<thead>
        			<tr>
        				<td style="width: 5%;">序号</td>
		    	    	<td style="width: 10%;">当前步骤</td>
		                <td style="width: 15%;">当前处理人员</td>
		                <td style="width: 10%;">检查日期</td>
		                <td style="width: 15%;">零件名称</td>
		                <td style="width: 15%;">缺陷名称</td>
		                <td style="width: 10%;">工序名称</td>
		                <td style="width: 10%;">处置意见</td>
		                <td style="width: 144px;">操作</td>
		    	   </tr>
        		</thead>
        	    <tbody>
        	    <c:choose>
			    	<c:when test="${not empty varList}">
					<c:forEach items="${varList}" var="var" varStatus="vs">
        	    	<tr>
        	    		<td>${vs.index+1}</td><!----list_bgdiv0,1,2,3是状态样式---->
        	    		<td>
        	    		<c:if test="${fn:length(var.DANGQ ) == 0}"><a href="javascript:;" class="list_bgdiv list_bgdiv1"><em></em><span>已完成</span></a></c:if>
        	    		<c:if test="${fn:length(var.DANGQ) > 0}">
        	    		<c:if test="${var.ISOUTIME eq 1}"><a  class="list_bgdiv list_bgdiv2 dangsha" href="${ctx }/${var.PID}${var.IMPER_TROBLE_ID}"><em>D${var.DANGQ }</em><span>${var.LABELS }</span></a></c:if>
        	    		<c:if test="${var.ISOUTIME eq 2}"><a  class="list_bgdiv list_bgdiv3 dangsha"  href="${ctx }/${var.PID}${var.IMPER_TROBLE_ID}"><em>D${var.DANGQ }</em><span>${var.LABELS }</span></a></c:if>
        	    		<c:if test="${empty var.ISOUTIME}"><a  class="list_bgdiv list_bgdiv0 dangsha"  href="${ctx }/${var.PID}${var.IMPER_TROBLE_ID}"><em>D${var.DANGQ }</em><span>${var.LABELS }</span></a></c:if>
        	    		
        	    		</c:if>
        	    		</td>
        	    		<td>${var.CHUNAME }</td>
        	    		<td><fmt:formatDate value="${var.CHECKDATE }" pattern="yyyy-MM-dd" /></td>
        	    		<td>${var.PRODUCTS_NUMBERING }</td>
        	    		<td>${var.IMPERFECTION_NAME }</td>
        	    		<td>${var.PROCESS_NAME }</td>
        	    		<td>${var.DISPOSAL }</td>
        	    		<td>
        	    			<div class="addsbox list_addsbox clearfix">
        	    				<a class="liulanbtn pull-left" href="${ctx }/imper_troble/goBrows?IMPER_TROBLE_ID=${var.IMPER_TROBLE_ID}"><em></em><span>浏览</span></a>
        	    				<c:choose>
        	    				<c:when test="${var.PROCESSTATE >0}">
        	    				<a class="bianjibtn_as pull-left"><em></em><span>编辑</span></a>
        	    				<a class="scbtn_as pull-left" href="javascript:;"><em></em><span>删除</span></a>
        	    				</c:when>
        	    				<c:otherwise>
        	    				<a class="bianjibtn pull-left" href="${ctx }/imper_troble/goAndandEdit?IMPER_TROBLE_ID=${var.IMPER_TROBLE_ID}"><em></em><span>编辑</span></a>
        	    				<a class="scbtn pull-left" href="javascript:;"><em></em><span>删除</span></a>
        	    				 <input type="hidden" name="IMPER_TROBLE_ID" value="${var.IMPER_TROBLE_ID}">
        	    				</c:otherwise>
        	    				</c:choose>
        	    				
        	    			</div>
        	    		</td>
        	    	</tr>
        	    	</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="100" class="center" >没有相关数据</td>
				</tr>
			</c:otherwise>
			</c:choose>
        	    </tbody>
        	</table>
	    	<div class="beizhuos clearfix">
	    		<p>备注：</p>
	    	    <ul>
	    	    	<li><span></span><em>已完成</em></li>
	    	    	<li><span></span><em>即将超期</em></li>
	    	    	<li><span></span><em>超期未完成</em></li>
	    	    	<li><span></span><em>待完成</em></li>
	    	    </ul>
	    	</div>
        </div>
        <div style="height: 30px;"></div>
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
</div>

</body>
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
/**
$(".shidate").change(function() {
	$("#souForm").submit();
});**/
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
	
	
    //序号循环方法123456
    xuhao();
    function xuhao(){
    	var s=$(".list_table>tbody tr").length;
	    //循环序号1-10
		for(var a=1;a<=s;a++){
			//console.log(a);
			$(".list_table>tbody>tr").eq(a-1).children("td").eq(0).html(a);
		}
    }
    //删除方法
    $(document).on("click",".scbtn",function(){
    	var _this=$(this);
    	parent.layer.open({
        	type:1,//类型
			title:"",//标题
			content:'<div class="pwalerttit">你确定删除该问题？</div>',
			area:['500px','230px'],//宽高
			closeBtn: 0,//不显示右上角关闭按钮
			shadeClose:false,//是否点击遮罩关闭
			scrollbar: false,//是否允许浏览器出现滚动条
			btn:['确定','取消'],
			btnAlign: 'c',//按钮居中
			yes:function(index,layero){
			var IMPER_TROBLE_ID = _this.next().val();
					$.ajax({
						type: "POST",
						url: "${ctx}/imper_troble/deletes",
						data: {
							IMPER_TROBLE_ID: IMPER_TROBLE_ID
						},
						success: function(data) {
							$(_this).parents("tr").remove();
							xuhao();
							parent.layer.close(index);//关闭弹
						},
						error: function() {
							alert("操作无效");
						}
					});
				
			},
			btn2:function(index){
				parent.layer.close(index);//关闭弹
			}
        })
    	
    })
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
</script>
</html>
