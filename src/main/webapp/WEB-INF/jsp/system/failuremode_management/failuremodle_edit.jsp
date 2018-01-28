<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>缺陷管理</title>
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
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">缺陷管理</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">系统管理</a><span>/</span><a href="javascript:;">缺陷管理</a>
            </div>
        </div>
    </div>
        <form action="" method="post" name="coreForm" id="coreForm">
    <!----问题采集---->
	<div class="wenti_box">
		<div class="container">
		   <div class="row">
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>失效模式</p>
		      	  	 <input type="text" name="FAILURENAME"  id="FAILURENAME" value="${pd.FAILURENAME }"/>
		      	  	  <input type="hidden" name="FAILUREMODE_MANAGEMENT_ID"  id="FAILUREMODE_MANAGEMENT_ID" value="${pd.FAILUREMODE_MANAGEMENT_ID }"/>
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>失效编码</p>
		      	  	 <input type="text" name="FAILURECODE"  id="FAILURECODE" value="${pd.FAILURECODE }"/>
		      	  </div>
		      </div>      
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>原因分类</p>
		      	     <input type="text" name="FAILUREMODEL"  id="FAILUREMODEL" value="${pd.FAILUREMODEL }">
		      	  </div>
		      </div>
		   </div>
		</div>
		<div class="acq_boxtx">
			<button type="button" class="jxbutton"  onclick="window.location.href='${ctx}/failuremode_management/list'">关闭</button>
			<button type="button" class="tibutton">提交</button>
			<c:if test="${pd.FAILUREMODE_MANAGEMENT_ID == null }">
			<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/failuremode_management/goAdd'">继续添加</button>
			</c:if>
		</div>
		
	</div>
    <form action="" method="post" name="coreForm" id="coreForm">
</div>
<script>
    $(function(){
    	$(document).on("click",".tibutton",function(){
    		$.ajax({
				type : "POST",
				url : "${ctx}/failuremode_management/save",
				data : $("#coreForm").serialize(),
				success : function(data) {
					$("#FAILUREMODE_MANAGEMENT_ID").val(data.FAILUREMODE_MANAGEMENT_ID);
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
