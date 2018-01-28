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
    <title>5why</title>
    <link rel="stylesheet" href="${ctx}/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/d0.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/a_table.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js"></script>
    
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">5WHY</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">0公里问题</a><span>/</span><a href="javascript:;">5WHY</a>
            </div>
        </div>
    </div>
    <!----5WHY---->
    <form action="" name="whyForm" id="whyForm">
    <div class="w5_box">
    <input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value ="${pd.CLIENT_PROBLEM_COLLECTION_ID }"/>
    	<c:forEach items="${map }" var="map">
    	<table class="w5_tab" cellpadding="0" cellspacing="0">
    		<thead>
    			<tr>
    				<td colspan="2">${map.value.DINGTITLE }<button class="w5_xinzbtn" type="button">新增</button></td>
    			</tr>
    		</thead>
    		<tbody>
    		<c:if test="${pd.STATE  eq 0 }">
    			<tr>
    				<td>为何</td>
    				<td><input class="w5_input" type="text" name="type${map.key }"/><input name="WHY5_PROCESSFOUR_ID" type="hidden"></input><button type="button" class="w5_scbtn">删除</button></td>
    			</tr>
    				<tr>
    				<td>为何</td>
    				<td><input class="w5_input" type="text" name="type${map.key }"/><input name="WHY5_PROCESSFOUR_ID" type="hidden"></input><button type="button" class="w5_scbtn">删除</button></td>
    			</tr>
    			<tr>
    				<td>为何</td>
    				<td><input class="w5_input" type="text" name="type${map.key }"/><input name="WHY5_PROCESSFOUR_ID" type="hidden"></input><button type="button" class="w5_scbtn">删除</button></td>
    			</tr>
    			<tr>
    				<td>为何</td>
    				<td><input class="w5_input" type="text" name="type${map.key }"/><input name="WHY5_PROCESSFOUR_ID" type="hidden"></input><button type="button" class="w5_scbtn">删除</button></td>
    			</tr>
    			<tr>
    				<td>为何</td>
    				<td><input class="w5_input" type="text" name="type${map.key }"/><input name="WHY5_PROCESSFOUR_ID" type="hidden"></input><button type="button" class="w5_scbtn">删除</button></td>
    			</tr>
    			</c:if>
    			<c:if test="${pd.STATE  eq 1 }">
    			<c:forEach items="${pds }" var="var">
    			<c:if test="${map.key == var.TYPE }">
    			<tr>
    				<td>为何</td>
    				<td><input class="w5_input" type="text" name="type${map.key }" value="${var.WHY }"/><input name="WHY5_PROCESSFOUR_ID" type="hidden" value="${var.WHY5_PROCESSFOUR_ID }"></input><button type="button" class="w5_scbtn">删除</button></td>
    			</tr>
    			</c:if>
    			</c:forEach>
    			</c:if>
    		</tbody>
    	</table>
    	</c:forEach>
    </div>
	<button type="button" class="scr_tijiaobtn">提交</button>
    </form>
</div>
<script>
    $(function(){
	    //新增事件
	    $(document).on("click",".w5_xinzbtn",function(){
	    	var str='<tr><td>为何</td><td><input class="w5_input"type="text"/><button type="button"class="w5_scbtn">删除</button></td></tr>';
	    	$(this).parents(".w5_tab").children("tbody").append(str);
	    })
	    //删除事件
	    $(document).on("click",".w5_scbtn",function(){
/* 	    	if($("#5WHYTYPE").val().equal("1")){
	    	}
	    	else{ */
	    		$(this).parents("tr").remove();
	/*     	} */
	    })
	    $(document).on("click",".scr_tijiaobtn",function(){
/* 	    	if($("#5WHYTYPE").val().equal("1")){
	    	}
	    	else{ */
	    	 $.ajax({
					type : "POST",
					url : "${ctx}/why5_processfour/addAndEdit",
					data :$("#whyForm").serialize(),
					success : function(data) {
						alert2("保存成功");
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});  
/* 	    	} */
	    })
    })
</script>
</body>
</html>
