<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>供应商管理</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
    		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>

</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">供应商管理</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">系统管理</a><span>/</span><a href="javascript:;">供应商管理</a>
            </div>
        </div>
    </div>
    <!----问题采集---->
    		<form action="" name="coetForm" id="coetForm">
	<div class="wenti_box">
		<div class="container">
		   <div class="row">
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>供应商编码</p>
		      	  	 <input type="text" name="CODE" id="CODE" value="${pd.CODE}" />
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>供应商名称</p>
		      	  	 <input type="text"  name="NAME" id="NAME" value="${pd.NAME}"/>
		      	  </div>
		      </div>      
		      <div class="col-sm-6 col-md-4 col-lg-4">
		      	  <div class="inputboxa">
		      	  	 <p>供应商分类</p>
		      	     <input type="text"name="MODELCODE" id="MODELCODE" value="${pd.MODELCODE}"/>
		      	     <input type="hidden"name="SUPPLIERINVENTORY_ID" id="SUPPLIERINVENTORY_ID" value="${pd.SUPPLIERINVENTORY_ID}"/>
		      	  </div>
		      </div>
		       <div style="padding: 0px 15px;">
		<table cellpadding="0" cellspacing="0" class="sup_mantab">
		    <thead>
		    	<tr>
		    		<td  style="width: 30%;">联系人（一）</td>
		    		<td>邮箱</td>
		    		<td>电话</td>
		    		<!-- <td style="width: 80px;">操作</td> -->
		    	</tr>
		    </thead>
		    <tbody>
		    	<tr class="linkcal">
		    		<td><input type="text" name="LINKMAN" value="${pd.LINKMAN }"/></td>
		    		<td><input type="text" name="LINKEMAIL" value="${pd.LINKEMAIL }"/></td>
		    		<td><input type="text" name="LINKPHONE" value="${pd.LINKPHONE }"/></td>
		    		<!-- <td><button type="button" class="supzeng_btn">新增</button></td> -->
		    	</tr>
		    </tbody>
		</table>
		</div>
			       <div style="padding: 0px 15px;">
		<table cellpadding="0" cellspacing="0" class="sup_mantab">
		    <thead>
		    	<tr>
		    		<td style="width: 30%;">联系人（二）</td>
		    		<td>邮箱</td>
		    		<td>电话</td>
		    		<!-- <td style="width: 80px;">操作</td> -->
		    	</tr>
		    </thead>
		    <tbody>
		    	<tr class="linkcal">
		    		<td><input type="text" name="LINKMANT" value="${pd.LINKMANT }"/></td>
		    		<td><input type="text" name="LINKEMAILT" value="${pd.LINKEMAILT }"/></td>
		    		<td><input type="text" name="LINKPHONET" value="${pd.LINKPHONET }"/></td>
		    		<!-- <td><button type="button" class="supzeng_btn">新增</button></td> -->
		    	</tr>
		    </tbody>
		</table>
		</div>
		   </div>
		</div>
		<div class="acq_boxtx">
			<button type="button" class="jxbutton"onclick="window.location.href='${ctx}/supplierinventory/list'">关闭</button>
			<button type="button" class="tibutton"  id="tibutton">提交</button>
			<c:if test="${pd.SUPPLIERINVENTORY_ID == null }">
			<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/supplierinventory/goaddAndEdit'">继续添加</button>
			</c:if>
		</div>
		
	</div>
</form>
</div>

<script>

//删除事件
$(document).on("click",".supsc_btn",function(){
	$(this).parents("tr").remove();
})
//增加事件
$(document).on("click",".supzeng_btn",function(){
	var a=$(".sup_mantab tbody tr").length;//3
	//大于等于5的时候提示最多只能添加5个
	if(a>=5){
		/* parent.layer.open({
        	type:1,//类型
			title:"",//标题
			content:'<div class="pwalerttit">最多只能添加5个联系人？</div>',
			area:['500px','230px'],//宽高
			closeBtn: 0,//不显示右上角关闭按钮
			shadeClose:false,//是否点击遮罩关闭
			scrollbar: false,//是否允许浏览器出现滚动条
			btn:['确定'],
			btnAlign: 'c',//按钮居中
			yes:function(index,layero){
				parent.layer.close(index);//关闭弹
			}
        }) */
	}else{
		$(".sup_mantab tbody").append('<tr class="linkcal"><td><input type="text" name="xingmin"/></td><td><input type="text" name="email"/></td><td><input type="text" name="phone"/></td><td><button type="button"class="supsc_btn">删除</button></td></tr>');
	}
})

$(document).on("click", "#tibutton", function() {
	
if($("#CODE").val()==""){
	$("#CODE").tips({
		side:3,
        msg:'请输入供应商编码',
        bg:'#AE81FF',
        time:2
    });
	$("#CODE").focus();
	return false;
}
if($("#NAME").val()==""){
	$("#NAME").tips({
		side:3,
        msg:'请输入供应商名称',
        bg:'#AE81FF',
        time:2
    });
	$("#NAME").focus();
	return false;
}
if($("#MODELCODE").val()==""){
	$("#MODELCODE").tips({
		side:3,
        msg:'请输入供应商分类编码',
        bg:'#AE81FF',
        time:2
    });
	$("#MODELCODE").focus();
	return false;
}
if($("#SUPPLIER").val()==""){
	$("#SUPPLIER").tips({
		side:3,
        msg:'请输入供应类型',
        bg:'#AE81FF',
        time:2
    });
	$("#SUPPLIER").focus();
	return false;
} 
var str ="";
$(".linkcal").each(function(){
  str+=$(this).find("td").eq(0)
   
   
  });

$.ajax({
	type: "POST",
	url: "${ctx}/supplierinventory/addAndEdit",
	data: $("#coetForm").serialize(),
	success: function(data) {
		alert2("保存成功！");
$("#SUPPLIERINVENTORY_ID").val(data.SUPPLIERINVENTORY_ID);
	},
	error: function() {
		alert2("上传失败");
	}
});

/* $("#Form").submit();
$("#zhongxin").hide();
$("#zhongxin2").show(); */
})
</script>
</body>

</html>
