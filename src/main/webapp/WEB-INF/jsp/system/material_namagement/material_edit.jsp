<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>物料管理</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
       <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
       <!-- 下拉框-->
		<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
       	<!--下拉框  -->
		<script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js"></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">物料管理</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">系统管理</a><span>/</span><a href="javascript:;">物料管理</a>
            </div>
        </div>
    </div>
    <form action=""  name="coreForm" id="coreForm">
    <!----问题采集---->
	<div class="wenti_box">
		<div class="container">
		   <div class="row">
		   <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>零件编码</p>
		      	  	 <input type="text" name="PARTCODING" id="PARTCODING" value="${pd.PARTCODING }"/>
		      	  </div>
		      </div>  
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>零件名称</p>
		      	  	 <input type="text" name="PARTNAME" id="PARTNAME" value="${pd.PARTNAME }"/>
		      	  	 <input type="hidden" name="MATERIAL_NAMAGEMENT_ID" id="MATERIAL_NAMAGEMENT_ID" value="${pd.MATERIAL_NAMAGEMENT_ID }"/>
		      	  </div>
		      </div>
		          
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>供应商名称</p>
		      	    <select name="CODE"> 
		      	    <c:forEach items="${supList }" var="var">
		      	    	<option value="${var.CODE }"  <c:if test="${pd.CODE eq var.CODE }">selected="selected"</c:if>>${var.NAME }</option>
		      	    </c:forEach>	
		      	    </select>
		      	  </div>
		      </div>
		   </div>
		</div>
		<div class="acq_boxtx">
			<button type="button" class="jxbutton"  onclick="window.location.href='${ctx}/material_namagement/list'">关闭</button>
			<button type="button" class="tibutton">提交</button>
			<c:if test="${pd. MATERIAL_NAMAGEMENT_ID == null}">
			<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/material_namagement/goAdd'">继续添加</button>
			</c:if>
		</div>
		
	</div>
</form>
</div>
<script>
    $(function(){
    	$(document).on("click",".tibutton",function(){
    		$.ajax({
				type : "POST",
				url : "${ctx}/material_namagement/save",
				data : $("#coreForm").serialize(),
				success : function(data) {
					$("#MATERIAL_NAMAGEMENT_ID").val(data.MATERIAL_NAMAGEMENT_ID);
					alert2("保存成功");
				},
			 	error:function(){
		        	alert2("操作无效");
		        }
			});   	
    		
    		
    	})
    })
</script>
</body>
</html>
