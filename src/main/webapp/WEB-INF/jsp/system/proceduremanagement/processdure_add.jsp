<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>工序添加</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/js/jquery.tips.js"></script>
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <!-- 弹窗js -->
	<script type="text/javascript" src="${ctx}/static/fords/layer/layer.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">工序管理</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">系统管理</a><span>/</span><a href="javascript:;">工序添加</a>
            </div>
        </div>
    </div>
    <form id="Form" action="${msg }.do" method="post">
	    <!----问题采集---->
		<div class="wenti_box">
			<div class="container">
			   <div class="row">
			   	  <input id="PROCEDUREMANAGEMENT_ID" name="PROCEDUREMANAGEMENT_ID" type="hidden" value="${pd.PROCEDUREMANAGEMENT_ID }" />
			      <div class="col-sm-6 col-md-4 col-lg-4">
			      	  <div class="inputboxa">
			      	  	 <p>工序</p>
			      	  	 <input id="PROCEDURE" name="PROCEDURE" type="text" value="${pd.PROCEDURE }" />
			      	  </div>
			      </div>
			      <div class="col-sm-6 col-md-4 col-lg-4">
			      	  <div class="inputboxa">
			      	  	 <p>工序编号</p>
			      	  	 <input id="PROCODE" name="PROCODE" type="text" value="${pd.PROCODE }"  />
			      	  </div>
			      </div>
			   </div>
			</div>
			<div class="acq_boxtx">
				<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/proceduremanagement/list'">关闭</button>
				<button type="button" class="tibutton" onclick="save(1);">提交</button>
				
				<c:if test="${pd. PROCEDUREMANAGEMENT_ID == null}">
				<button type="button" class="jxbutton" onclick="save(2);">继续添加</button>
				</c:if>
			</div>
			
		</div>
	</form>
</div>
<script type="text/javascript">
    function save(isgo){
		if($("#PROCEDURE").val()==""){
			$("#PROCEDURE").tips({
				side:3,
	            msg:'请输入工序',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCEDURE").focus();
			return false;
		}
		if($("#PROCODE").val()==""){
			$("#PROCODE").tips({
				side:3,
	            msg:'请输入排序',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCODE").focus();
			return false;
		}	
		
		saveProcess();
		//$("#Form").submit();
	}
    
    function saveProcess(isgo) {
    	var PROCEDURE = $("#PROCEDURE").val();
    	var PROCODE = $("#PROCODE").val();
		//根据ID赋值城市首字母
		$.ajax({
			type : "POST",
			url : "${ctx}/proceduremanagement/ajaxsave",
			data : $("#Form").serialize(),// 你的formid
			success : function(data) {
				if(data.status==1){
					parent.layer.open({
			        	type:1,//类型
						title:"",//标题
						content:'<div class="pwalerttit">添加成功！</div>',
						area:['500px','230px'],//宽高
						closeBtn: 0,//不显示右上角关闭按钮
						shadeClose:false,//是否点击遮罩关闭
						scrollbar: false,//是否允许浏览器出现滚动条
						btn:['确定'],
						btnAlign: 'c',//按钮居中
						yes:function(index,layero){
							parent.layer.close(index);//关闭弹
							if(isgo == 1){
								window.location.href="${ctx}/proceduremanagement/list.do";
							}else{
								window.location.href="${ctx}/proceduremanagement/goAdd.do";
							}
							
						}
			        })
					
				}else{
					alert2("添加失败");
				}
			},
		 	error:function(){
	        	alert("上传失败");
	        }
		});
	}
    
    
    
</script>
</body>

</html>
