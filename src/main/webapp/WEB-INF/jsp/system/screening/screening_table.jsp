<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>排查表</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/defect.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <style>
    	.inputboxa{max-width: 100%;}
    	.inputboxa>p>span{font-size: 12px;}
    </style>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">排查表</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">0公里问题</a><span>/</span><a href="javascript:;">排查表</a>
            </div>
        </div>
    </div>
    <form action="" id="sForm" name="sForm">
    <!----排查---->
	<div class="wenti_box">
		<div class="container">
		   <div class="row">
		   
		      <div class="col-sm-6 col-md-3 col-lg-3">
		      	  <div class="inputboxa">
		      	  	 <p>围堵措施实施日期<span>Implemention date of Containment Action</span></p>
		      	  	 <input type="date" name="IMPLEMENTION" id="IMPLEMENTION" value="${pds.IMPLEMENTION }"/>
		      	  	 <input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }"/>
		      	  	 <input type="hidden" name="INVESTIGATE_TABLE_ID" id="INVESTIGATE_TABLE_ID" value="${pds.INVESTIGATE_TABLE_ID }"/>	
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-3 col-lg-3">
		      	  <div class="inputboxa">
		      	  	 <p>零件截至日期<span>Part Cut off date</span></p>
		      	     <input type="date" name="PARTDATE" id="PARTDATE" value="${pds.PARTDATE }"/>
		      	  </div>
		      </div>      
		      <div class="col-sm-6 col-md-3 col-lg-3">
		      	  <div class="inputboxa">
		      	  	 <p>受影响零件总数量<span>Part Quantity affected：</span></p>
		      	     <input type="text" name="QUANTITY" id="QUANTITY" value="${pds.QUANTITY }"/>
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-3 col-lg-3">
		      	  <div class="inputboxa">
		      	  	 <p>围堵措施截至车号<span>Vehicle Cut off No.of Containment Action</span></p>
		      	     <input type="text" name="VEHICLECUT" id="VEHICLECUT" value="${pds.VEHICLECUT }"/>
		      	  </div>
		      </div>
		      <div class="col-sm-6 col-md-3 col-lg-3">
		      	  <div class="inputboxa">
		      	  	 <p>零件截至号<span>part cut off No.</span></p>
		      	  	 <input type="text" name="PARTCUT" id="PARTCUT" value="${pds.PARTCUT }"/>
		      	  </div>
		      </div> 
		   </div>
		</div>
	</div>
	<!--ta--->
	<div class="scr_tabox">
		<table cellpadding="0" cellspacing="0" class="scr_table">
			<thead>
				<tr>
					<td>检查地点<span>Inspection place</span></td>
					<td style="width: 14%;">日期<span>Date</span></td>
					<td style="width: 14%;">班次<span>shift</span></td>
					<td style="width: 14%;">检查人员<span>Inspector</span></td>
					<td style="width: 14%;">检查数量<span>Checked No.</span></td>
					<td style="width: 14%;">缺陷件数量<span>Defect No.</span></td>
					<td style="width: 130px;"></td>
				</tr>
			</thead>
			<c:forEach items="${map }" var="map">
			<tbody>
				<tr>
					<td colspan="6">${map.value.LARGETITLE }</td>
					<td><a class="addzengbtn" href="javascript:;">新增录入</a></td>
				</tr>
			
				
				<c:if test="${map.value.ISNOTDATE ==0}">
				<tr class="">
					<td rowspan="1000"><input type="text" class="scr_input scr_input2" name="ADDRESS" value=""/></td>
					<input type="hidden" name="INVESTIGATE_FUJIA_TABLE_ID" value=""/>
					<input type="hidden" name="TYPE" value="${map.key}"/>
					<td><input type="text" class="scr_input" name="DATESHIF"/></td>
					<td><input type="text" class="scr_input" name="SHIF"/></td>
					<td><input type="text" class="scr_input" name="INSPECTOR"/></td>
					<td><input type="text" class="scr_input" name="CHECKNO"/></td>
					<td><input type="text" class="scr_input"  name="DEFECTNO"/></td>
					<td><a href="javascript:;" class="scr_scbtn">删除</a></td>
				</tr>
				<tr class="">
					<input type="hidden" name="INVESTIGATE_FUJIA_TABLE_ID" value=""/>
					<input type="hidden" name="TYPE" value="${map.key}"/>
					<td><input type="text" class="scr_input" name="DATESHIF"/></td>
					<td><input type="text" class="scr_input" name="SHIF"/></td>
					<td><input type="text" class="scr_input" name="INSPECTOR"/></td>
					<td><input type="text" class="scr_input" name="CHECKNO"/></td>
					<td><input type="text" class="scr_input"  name="DEFECTNO"/></td>
					<td><a href="javascript:;" class="scr_scbtn">删除</a></td>
				</tr>
				<tr class="">
					<input type="hidden" name="INVESTIGATE_FUJIA_TABLE_ID" value=""/>
					<input type="hidden" name="TYPE" value="${map.key}"/>
					<td><input type="text" class="scr_input" name="DATESHIF"/></td>
					<td><input type="text" class="scr_input" name="SHIF"/></td>
					<td><input type="text" class="scr_input" name="INSPECTOR"/></td>
					<td><input type="text" class="scr_input" name="CHECKNO"/></td>
					<td><input type="text" class="scr_input"  name="DEFECTNO"/></td>
					<td><a href="javascript:;" class="scr_scbtn">删除</a></td>
				</tr>
				</c:if>
				<c:if test="${map.value.ISNOTDATE ==1}">
				<c:forEach items="${tpListAll }" var="var">
				<c:if test="${map.key ==var.TYPE}">
				<tr>
					<c:if test="${var.ISFIRST==1}">
						<td rowspan="1000"><input type="text" class="scr_input scr_input2" name="ADDRESS" value="${var.ADDRESS }"/></td>
					</c:if>
					<input type="hidden" name="INVESTIGATE_FUJIA_TABLE_ID" value="${var.INVESTIGATE_FUJIA_TABLE_ID }"/>
					<input type="hidden" name="TYPE" value="${var.TYPE }"/>
					<td><input type="text" class="scr_input" name="DATESHIF" value="${var.DATESHIF }"/></td>
					<td><input type="text" class="scr_input" name="SHIF" value="${var.SHIF }"/></td>
					<td><input type="text" class="scr_input" name="INSPECTOR" value="${var.INSPECTOR }"/></td>
					<td><input type="text" class="scr_input" name="CHECKNO" value="${var.CHECKNO }"/></td>
					<td><input type="text" class="scr_input"  name="DEFECTNO" value="${var.DEFECTNO }"/></td>
					<td><a href="javascript:;" class="scr_scbtn">删除</a></td>
				</tr>
				</c:if>
				</c:forEach>
				</c:if>
			</tbody>
			</c:forEach>
		</table>
	</div>
	<button type="button" class="scr_tijiaobtn">提交</button>
     </form> 
</div>
<script>
$(function() {
		//提交
		$(document).on("click", ".scr_tijiaobtn", function() {
			var tis = $(this);
			//上部分+下部分
			$.ajax({
				type: "POST",
				url: "${ctx}/dProcess/screenAndEdit",
				data: $("#sForm").serialize(),
				success: function(data) {
					alert2("保存成功");
					$("#INVESTIGATE_TABLE_ID").val(data.INVESTIGATE_TABLE_ID);
					var idList = data.idList;
					for(var a = 0; a < idList.length; a++) {
						$("tbody").each(function(index) {
							var tbo = $('tbody').length;
							for(var i = 0; i < tbo; i++) {
								var tis = $(this);
								tis.find("tr:gt(0)").each(function(index) {
									var te = $(this);
									te.find("input[name='INVESTIGATE_FUJIA_TABLE_ID']").val(idList[a]);
								});
							}

						});

					}
				},
				error: function() {
					alert2("操作无效");
				}
			});
		})
		//删除事件
    	var da;
    	var xiao;
	    $(document).on("click",".scr_scbtn",function(){
	    	da=$(this).parents("tr").index();
	    	xiao=$(this).parents("tbody").index();//body
	    	alert3("确定删除？");
	    })
	    $(document).on("click",".quebtn3",function(){
	    	//判断为1的时候，大框的html追加到后面一个
	    	var INVESTIGATE_FUJIA_TABLE_ID=$(".scr_table tbody").eq(xiao-1).children("tr").eq(da).children("input[name='INVESTIGATE_FUJIA_TABLE_ID']").val();
	    	$.ajax({
				type: "POST",
				url: "${ctx}/investigate_fujia_table/delete",
				data: {INVESTIGATE_FUJIA_TABLE_ID:INVESTIGATE_FUJIA_TABLE_ID},
				success: function(data) {
					if(da==1){
			    		var stzhi=$(".scr_table tbody").eq(xiao-1).find(".scr_input2").val();//得到大input值
			    		var str='<td rowspan="1000"><input type="text" class="scr_input scr_input2" value="'+stzhi+'"/></td>';
			    		$(".scr_table tbody").eq(xiao-1).children("tr").eq(da).next("tr").prepend(str);
			    		$(".scr_table tbody").eq(xiao-1).children("tr").eq(da).remove();//删除
			    		alertbg_g();
			    		$(".alert_1").remove();//删除弹窗
			    	}else{
			    		$(".scr_table tbody").eq(xiao-1).children("tr").eq(da).remove();//删除
			    		alertbg_g();
			    		$(".alert_1").remove();//删除弹窗
			    	}
				},
				error: function() {
					alert2("操作无效");
				}
			})
	    	
	    	
	    	
	    })
		     //打开弹
		/* 	 function alert1() {
			 	$(".alert_1").removeClass("dis");
			 }
			 //关闭弹
			 function guanbi() {
			 	$(".alert_1").addClass("dis");
			 }
			 //取消按钮关闭
			 $(document).on("click", ".qubtn", function() {
			 	guanbi();
			 }) */
	    	
		  //删除方法
/* 		    var b;
			var c;
		    $(document).on("click", ".scr_scbtn", function() {
		    	alert1();
		    	b = $(this).parents("tr").index();
		    	c = $(this).parents("tbody").index();
		    	//$(this).parents(".list_thta").remove();

		    })
		
		    
		    
			//点击确定
			$(".quebtn").click(function() {
				var INVESTIGATE_FUJIA_TABLE_ID = $("tbody:eq("+c+")").find("tr:eq("+b+")").find("input[name='INVESTIGATE_FUJIA_TABLE_ID']").val(); 
	    	 
	    	$.ajax({
				type: "POST",
				url: "${ctx}/investigate_fujia_table/delete",
				data: {INVESTIGATE_FUJIA_TABLE_ID:INVESTIGATE_FUJIA_TABLE_ID},
				success: function(data) {
					
			    	//var a=$(this).parents("tr").index();
			    	//判断为1的时候，大框的html追加到后面一个
			    	if(b==1){
			    		var stzhi=$("tbody:eq("+c+")").find("tr:eq("+b+")").children("td").eq(0).children("input").val();//得到大input值
			    		var str='<td rowspan="1000"><input type="text" class="scr_input scr_input2" value="'+stzhi+'"/></td>';
			    		$("tbody:eq("+c+")").find("tr:eq("+b+")").prepend(str);
			    		//$("tbody:eq("+c+")").find("tr:eq("+b+")").remove();//删除
			    	}else{
			    		//$("tbody:eq("+c+")").children[b].remove();//删除
			    	}
			    	console.log($("tbody:eq("+c+")").children[b].html());
				},
				error: function() {
					alert2("操作无效");
				}
			})
	    	}) */
	    	 
	    //新增事件
	    $(document).on("click",".addzengbtn",function(){
	    	var a=$(this).parents("tbody").children("tr").length;
	    	var t =$(this).parents("tr").next().find("input[name='TYPE']").val();
	    	//字符串拼接
	    	var str="";
	    	str+='<tr>';
	    	//判断为1的时候，新增包含大框的html结构，
	    	if(a==1){
	    		str+='<td rowspan="1000"><input type="text" class="scr_input scr_input2" name="ADDRESS" value=""/></td>';
	    	}
	    	str+='<input type="hidden" name="INVESTIGATE_FUJIA_TABLE_ID"/>';
	    	str+='<input type="hidden" name="TYPE" value="'+t+'"/>';
	    	str+='<td><input type="text" class="scr_input" name="DATESHIF"/></td>';
	    	str+='<td><input type="text" class="scr_input" name="SHIF"/></td>';
	    	str+='<td><input type="text" class="scr_input" name="INSPECTOR"/></td>';
	    	str+='<td><input type="text" class="scr_input" name="CHECKNO"/></td>';
	    	str+='<td><input type="text" class="scr_input" name="DEFECTNO"/></td>';
	    	str+='<td><a href="javascript:;" class="scr_scbtn">删除</a></td>';
	    	str+='</tr>';
	    	$(this).parents("tbody").append(str);
	    	str="";
	    })
    })
</script>
</body>
</html>
