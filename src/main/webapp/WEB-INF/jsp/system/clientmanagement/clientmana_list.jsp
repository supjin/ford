<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>客户管理</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/experience.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/system_tools.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.pagination.js" ></script>
    <script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">客户管理</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">系统管理</a><span>/</span><a href="javascript:;">客户管理</a>
            </div>
        </div>
    </div>
	<!--主体--->
	<form action="${ctx}/clientmanagement/list" name="souForm" id="souForm">
	<div class="content">
		<!--导出-->
		<div class="dao_box clearfix">
			<input type="text" placeholder="名称、编号"/>
			<a href="javascript:;" onclick="toExcel();">导出</a>
			<a href="javascript:;" style="margin-left: 20px;">导入<input onchange="upexcel(this);" id="clientexcel" name="file" type="file" class="daoru_boxinput"/></a>
		</div>
		<!--表--->
	    <table cellpadding="0" cellspacing="0" class="lins_table">
	    	<thead>
	    		<tr>
	    			<td style="width: 2%;"><input class="chebox pull-right" type="checkbox"/></td>
	    			<td style="width: 4%;">序号</td>
	    			<td style="width: 15%;">工厂</td>
	    			<td style="width: 10%;">部门</td>
	    			<td style="width: 15%;">地址</td>
	    			<td style="width: 10%;">姓名</td>
	    			<td style="width: 15%;">职务</td>
	    			<td style="width: 10%;">电话号</td>
	    			<td style="width: 15%;">邮箱</td>
	    			<td style="width: 15%;">备注</td>
	    			<td style="width: 15%;">操作</td>
	    		</tr>
	    	</thead>
	    	<tbody>
	    	<c:choose>
	    	<c:when test="${not empty varList}">
			<c:forEach items="${varList}" var="var" varStatus="vs">
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"  name='ids' value="${var.CLIENTMANAGEMENT_ID}" />
	    				<input type="hidden" name="CLIENTMANAGEMENT_ID" value="${var.CLIENTMANAGEMENT_ID }">
	    			</td>
	    			<td>${vs.index+1}</td>
	    			<td>${var.DEPARTMENT}</td>
					<td>${var.FACTORY}</td>
					<td>${var.ADDRESS}</td>
					<td>${var.LINKSNAEM}</td>
					<td>${var.JOBWORKS}</td>
					<td>${var.PHONES}</td>
					<td>${var.EMAILS}</td>
					<td>${var.REMARKS}</td>
	    			<td><div class="cuozuo_box clearfix"><a href="${ctx}/clientmanagement/goEdit?CLIENTMANAGEMENT_ID=${var.CLIENTMANAGEMENT_ID}" class="equi_bianji"></a><a href="javascript:;" class="equi_sc"></a></div></td>
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
	    <!---添加删除--->
	    <div class="equi_btn">
	    	<a href="${ctx }/clientmanagement/goAdd">添加+</a>
	    	<a href="javascript:;" class="anniu_scbtn">删除</a>
	    </div>
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

function upexcel(obj){
	
    var f=$(obj).val();
    if(f == null || f ==undefined || f == ''){
        return false;
    }else if(!/\.(?:xls|xlsx)$/.test(f))
    {
        alert("类型必须是图片(.xls|xlsx)");
        $(obj).val('');
        return false;
    }else{
        //批量上传图片
        $.ajaxFileUpload({
            url:"${ctx}/clientmanagement/readexcel",//需要链接到服务器地址   
            secureuri:false,
            fileElementId:"clientexcel",//文件选择框的id属性  ,//文件选择框的id属性  
            success: function (data){
            	var str = $(data).find("body").text();
	            var json = $.parseJSON(str);
	        	if("success"==json.info){
	        		
	        		parent.layer.open({
			        	type:1,//类型
						title:"",//标题
						content:'<div class="pwalerttit">导入成功！</div>',
						area:['500px','230px'],//宽高
						closeBtn: 0,//不显示右上角关闭按钮
						shadeClose:false,//是否点击遮罩关闭
						scrollbar: false,//是否允许浏览器出现滚动条
						btn:['确定'],
						btnAlign: 'c',//按钮居中
						yes:function(index,layero){
							parent.layer.close(index);//关闭弹
							location.reload();
						}
			        })
	        	}else{
	        		alert2("系统繁忙请稍后再试！");
	        	}
            }
        });
    }
}
	
</script>
<script>
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
		xuhao();
		//循环序号1-10
		function xuhao(){
			var xuhao=$(".lins_table tbody tr").length;
			for(var a=1;a<=xuhao;a++){
				$(".lins_table>tbody>tr").eq(a-1).children("td").eq(1).html(a);
			}
		}
		
		//图标删除功能
		$(document).on("click",".equi_sc",function(){
			var a=$(this).parents("tr").index();//得到下标
			//在父页面弹出一个弹窗
			parent.layer.open({
	        	type:1,//类型
				title:"",//标题
				content:'<div class="pwalerttit">你确定删除？</div>',
				area:['500px','230px'],//宽高
				closeBtn: 0,//不显示右上角关闭按钮
				shadeClose:false,//是否点击遮罩关闭
				scrollbar: true,//是否允许浏览器出现滚动条
				btn:['确定','取消'],
				btnAlign: 'c',//按钮居中
				yes:function(index,layero){
					var CLIENTMANAGEMENT_ID = $(".lins_table tbody tr").eq(a).find("input[name='CLIENTMANAGEMENT_ID']").val();
					$.ajax({
						type: "POST",
						url: "${ctx}/clientmanagement/delete",
						data: {
							CLIENTMANAGEMENT_ID: CLIENTMANAGEMENT_ID
						},
						success: function(data) {
							$(".lins_table tbody tr").eq(a).remove();
							xuhao();
							parent.layer.close(index);//关闭弹
						},
						error: function() {
							alert2("操作无效");
						}
					});
				},
				btn2:function(index){
					parent.layer.close(index);//关闭弹
				}
	        })
		})
		//按钮删除功能
		$(".anniu_scbtn").click(function(){
			var is=0;//用于判断选中没有
			$(".lins_table>tbody input[type='checkbox']").each(function(){
			    if($(this).is(":checked")){
			    	is++;
			    }
		    })
		     var str = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  }
			}
			if(is==0){//当没有选中的时候
				//在父页面弹出一个弹窗
				parent.layer.open({
		        	type:1,//类型
					title:"",//标题
					content:'<div class="pwalerttit">您没有选择任何内容</div>',
					area:['500px','230px'],//宽高
					closeBtn: 0,//不显示右上角关闭按钮
					shadeClose:false,//是否点击遮罩关闭
					scrollbar: true,//是否允许浏览器出现滚动条
					btn:['确定'],
					btnAlign: 'c',//按钮居中
					yes:function(index,layero){
						parent.layer.close(index);//关闭弹
					}
		        })
			}else{
				//在父页面弹出一个弹窗
				parent.layer.open({
		        	type:1,//类型
					title:"",//标题
					content:'<div class="pwalerttit">你确定删除？</div>',
					area:['500px','230px'],//宽高
					closeBtn: 0,//不显示右上角关闭按钮
					shadeClose:false,//是否点击遮罩关闭
					scrollbar: true,//是否允许浏览器出现滚动条
					btn:['确定','取消'],
					btnAlign: 'c',//按钮居中
					yes:function(index,layero){
						$.ajax({
							type: "POST",
							url: '${ctx}/clientmanagement/deleteAll.do?tm='+new Date().getTime(),
					    	data: {DATA_IDS:str},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								//遍历每一个复选框;把每一个选中的都删除
								$(".lins_table>tbody input[type='checkbox']").each(function(){
								    if($(this).is(":checked")){
								    	$(this).parents("tr").remove();
								    }
							    })
								xuhao();
								parent.layer.close(index);//关闭弹
							}
						});
					},
					btn2:function(index){
						parent.layer.close(index);//关闭弹
					}
		        })
			}
			
		})
		
	})
	
	function toExcel(){
		window.location.href='<%=basePath%>clientmanagement/excel.do';
	}
	
</script>

</body>

</html>
