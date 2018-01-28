<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>供应商问题清单</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/iqc.css" />
    <link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
    		<script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">供应商问题清单</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">供应商问题清单</a>
            </div>
        </div>
    </div>
    <!-- 新建 -->
     <form action="${ctx}/iqc_problem/list.do" id="souForm">
    <div class="goncsbox clearfix">
    	<div style="float: left;padding-right: 200px;">
		    <div class="list_divs clearfix">
						<div class="list_divin"><span>发生时间　：</span><input type="date" class="shidate" name="LTDATE" value="${pd.LTDATE }"/></div>
						<div class="list_divin"><span>至　</span><input type="date" class="shidate" name="GTDATE" value="${pd.GTDATE }"/></div>
						<div class="list_divin"><span>失效模式：</span>
							<select class="chzn-select" name="FALUREMODEL" id="FALUREMODEL" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
								<option value="">全部</option>
					        	<c:forEach items="${failureList }" var="var">
					        	<option ${var.FAILURENAME } <c:if test="${pd.FALUREMODEL == var.FAILURENAME }"> selected="selected"</c:if>>${var.FAILURENAME }</option>
					        	</c:forEach>
							</select>
						</div>
						<div class="list_divin"><span>责任人　：</span>
							<select class="chzn-select" name="RESPONSEBLEMAN" id="RESPONSEBLEMAN" data-placeholder="请选择" style="vertical-align:top; width: 160px; border: 1px solid #dedede;height: 29px;">
								<option value="">全部</option>
						     	<c:forEach items="${userList }" var="var">
					        	<option value="${var.USER_ID }" <c:if test="${pd.RESPONSEBLEMAN == var.USER_ID }"> selected="selected"</c:if>>${var.NAME }</option>
					        	</c:forEach>
							</select>
						</div>
					</div>
		  <div class="list_divs clearfix">
						<div class="list_divin"><span>供应商名称：</span>
							<select class="chzn-select" name="NAME" id="NAME" data-placeholder="请选择" style="vertical-align:top; width: 425px; border: 1px solid #dedede;height: 29px;">
								<option value="">全部</option>
								<c:forEach items="${suList }" var="var">
			                    	<option  value="${var.NAME }" <c:if test="${pd.NAME eq var.NAME }"> selected="selected"</c:if>>${var.NAME }</option>
			            		</c:forEach>
							</select>
						</div>
						<div class="list_divin"><span>零件名称：</span>
							<select class="chzn-select" name="INVENTNAME" id="INVENTNAME" data-placeholder="请选择" style="vertical-align:top; width: 425px; border: 1px solid #dedede;height: 29px;">
								<option value="">全部</option>
								<c:forEach items="${suList }" var="var">
			                    	<option  value="${var.INVENTNAME }" <c:if test="${pd.INVENTNAME eq var.INVENTNAME }"> selected="selected"</c:if>>${var.INVENTNAME }</option>
			            		</c:forEach>
							</select>
						</div>
					</div>
        </div>
        <div class="list_topbtns">
        	<button class="list_topbtnzeng" onclick="bca_lik()" type="button">新增录入</button>
        	<button class="list_topbtndao" type="button">导出</button>
        </div>
    </div>
    <!-- 问题列表 -->
    <div class="went_bxo">
    <c:choose>
	<c:when test="${not empty varList}">
		<c:forEach items="${varList}" var="var" varStatus="vs">
        <div class="list_thta">
        	<div class="list_tabxuhao">序号-<span>${vs.index+1}</span></div>
        	<table cellpadding="0" cellspacing="0" class="list_table">
        		<thead>
        			<tr>
		    	    	<td style="width: 10%;">发生日期</td>
		                <td style="width: 10%;">零件编码 </td>
		                <td style="width: 15%;">零件名称</td>
		                <td style="width: 15%;">供应商名称</td>
		                <td style="width: 10%;">失效模式</td>
		                <td style="width: 15%;">临时对策</td>
		                <td style="width: 10%;">责任人</td>
		                <td style="width: 60px;">关闭状态 </td>
		                <td style="width: 110px;">操作</td>
		    	   </tr>
        		</thead>
        	    <tbody>
        	    	<tr>
        	    		<td><fmt:formatDate value="${var.OCCURENTDATE }" pattern="yyyy-MM-dd" /></td>
        	    		<td>${var.PARTCODING }</td>
        	    		<td>${var.PARTNAME }</td>
        	    		<td>${var.GYNAME }</td>
        	    		<td>${var.FALUREMODEL }</td>
        	    		<td>${var.DUICELIN }</td>
        	    		<td>${var.USERNAMES }</td>
        	    		<td>
        	    		<c:if test="${var.FINISHSTATE eq 1}">
        	    		<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}&TYPE=1&NEWSTATE=1" class="iqc_yuan iqc_yuanbg4">发</a>
        	    		</c:if>
        	    		<c:if test="${var.FINISHSTATE eq 2 && var.ISEIGHTD eq 1}">
        	    		<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}&TYPE=2&NEWSTATE=1" class="iqc_yuan iqc_yuanbg4">反</a>
        	    		</c:if>
        	    		<c:if test="${var.FINISHSTATE eq 2 && var.ISEIGHTD eq 2}">
        	    		<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}&TYPE=4&NEWSTATE=1" class="iqc_yuan iqc_yuanbg4">反</a>
        	    		</c:if>
        	    		<%-- <c:if test="${var.FINISHSTATE eq 3}">
        	    		<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}&TYPE=5" class="iqc_yuan iqc_yuanbg4">审</a>
        	    		</c:if> --%>
        	    		<c:if test="${var.FINISHSTATE eq 5}">
        	    		<a href="javascript:;" class="iqc_yuan iqc_yuanbg1">无</a>
        	    		</c:if>
        	    		</td>
        	    		<td>
        	    			<div class="addsbox clearfix iqcbtnas">
        	    				<a class="liulanbtn" href="${ctx }/iqc_problem/goEyes?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}"><em></em><span>浏览</span></a>
        	    				<c:if test="${var.XIANQX eq 1}">
        	    				<a class="bianjibtn" href="${ctx }/iqc_problem/goandAddEdit?IQC_PROBLEM_ID=${var.IQC_PROBLEM_ID}"><em></em><span>编辑</span></a>
        	    				<a class="scbtn scbtns" href="javascript:;" ><em></em><span>删除</span></a>
        	    				</c:if>
        	    				<c:if test="${var.XIANQX eq 0}">
        	    				<a class="bianjibtn" href="javascript:;" style="background-color: #c6c6c6"><em></em><span>编辑</span></a>
        	    				<a class="scbtn" style="background-color: #c6c6c6" href="javascript:;"><em></em><span>删除</span></a>
        	    				</c:if>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    </tbody>
        	</table>
        </div>
       </c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="100" class="center">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
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
<script>
	!function(){
	    laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	    laydate({elem: '#demo1'});//绑定元素
	    laydate({elem: '#demo2'});//绑定元素
	}();
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
	//下拉框选择
	$(".chzn-select").chosen({
		search_contains:true,
		enable_split_word_search:true
	});
	//搜索
	$('select').change(function() {
		$("#souForm").submit();
	});
	$(".shidate").change(function() {
		$("#souForm").submit();
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
    //删除方法
    var a;
    $(document).on("click",".scbtns",function(){
    	a=$(this).parents(".went_bxo>.list_thta").index();
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
				$(".went_bxo>.list_thta").eq(a).remove();
				xuhao();
				parent.layer.close(index);//关闭弹
			},
			btn2:function(index){
				parent.layer.close(index);//关闭弹
			}
        })
    })
    function bca_lik(){
    	window.location.href = "${ctx }/iqc_problem/goandAddEdit";
    }
</script>
</body>
</html>
