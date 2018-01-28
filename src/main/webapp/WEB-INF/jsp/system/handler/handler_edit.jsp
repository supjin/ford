<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>操作者管理</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
    	<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <style>
    	.prodbtnsss{padding: 10px 0px;}
    	.prodbtns{
    		float: left;
    		width: 70px;
    		height: 30px;
    		line-height: 30px;
    		border-radius: 4px;
    		background-color: #24CAB2;
    		color: white;
    		text-align: center;
    		font-size: 14px;
    		position: relative;
    		margin-right: 20px;
    		cursor: pointer;
    	}
    	.prodbtns>input{
    		display: block;
    		position: absolute;
    		width: 100%;
    		height: 100%;
    		opacity: 0;
    		top: 0px;
    		left: 0px;
    	}
    	.prodimgs{
    		float: left;
    		width: 236px;
    		height: 156px;
    		/* border: 1px solid #dedede; */
    		position: relative;
    	}
    	.prodimgs:hover .prodsc_btn{
    		display: block;
    	}
    	.prodimgs img{
    		width: 100%;
    		height: 100%;
    		display: block;
    	}
    	.prodsc_btn{
    		display: none;
    		position: absolute;
    		top: 50%;
    		left: 50%;
    		transform: translateX(-50%) translateY(-50%);
    		width: 70px;
    		height: 30px;
    		border-radius: 4px;
    		border: none;
    		background-color: #fa6262;
    		opacity: 0.9;
    		color: white;
    		outline: none;
    	}
    </style>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">操作者管理</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">操作者管理</a><span>/</span><a href="javascript:;">操作者管理</a>
            </div>
        </div>
    </div>
    <!----问题采集---->
	<div class="wenti_box">
		<div class="container">
		   <div class="row">
		     <form action="" name="codeForm" id="codeForm">
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>部门</p>
		      	  	 <input type="text" name="DEPARTMENT" id="DEPARTMENT" value="${pd.DEPARTMENT }"/>
		      	  	 <input type="hidden" name="HANDLER_ID" id="HANDLER_ID" value="${pd.HANDLER_ID }"/>
		      	  </div>
		      </div>      
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>岗位</p>
		      	     <input type="text"  name="STATION" id="STATION" value="${pd.STATION }" />
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>姓名</p>
		      	  	<input type="text"  name="USERNAME" id="USERNAME" value="${pd.USERNAME }"/>
		      	  </div>
		      </div>
		     
		   </div>
		</div>
		<div class="acq_boxtx">
			<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/handler/list'">关闭</button>
			<button type="button" class="tibutton">提交</button>
			<c:if test="${pd. HANDLER_ID == null}">
			<button type="button" class="jxbutton"  onclick="window.location.href='${ctx}/handler/goAdd'">继续添加</button>
			</c:if>
		</div>
		</form>
	</div>

</div>
<script>
    $(function(){
    	$(document).on("click",".tibutton",function(){
    		$.ajax({
				type : "POST",
				url : "${ctx}/handler/save",
				data : $("#codeForm").serialize(),
				success : function(data) {
					$("#HANDLER_ID").val(data.HANDLER_ID);
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
