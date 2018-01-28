<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>经验管理</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pagination.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/experience.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.pagination.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">经验管理</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">经验管理</a>
            </div>
        </div>
    </div>
	<!--主体--->
	<div class="content">
		<!--<div class="screen">
			<span>
				<label>产品类别:</label>
				<select name="">
					<option value=""></option>
				</select>
			</span>
			<span>
				<label>产品名称:</label>
				<select name="">
					<option value=""></option>
				</select>
			</span>
			<span>
				<label>失效模式:</label>
				<select name="">
					<option value=""></option>
				</select>
			</span>
			<span>
				<label>创建时间：</label>
				<input type="date" />
				<i>至</i>
				<input type="date" />
			</span>
			<p>查询</p>
		</div>-->
		<div class="list_divs clearfix" style="padding-top: 20px;">
        	<div class="list_divin"><span>产品类别：</span><select><option></option></select></div>
        	<div class="list_divin"><span>产品名称：</span><select><option></option></select></div>
        	<div class="list_divin"><span>失效模式：</span><select><option></option></select></div>
        	<div class="list_divin"><span>创建时间：</span><input type="date" /></div>
        	<div class="list_divin"><span>至　</span><input type="date" /></div>
        	<a class="exp_btn" href="javascript:;">查询</a>
        </div>
		<div class="handle">
			<button>添加+</button>
			<button>删除</button>
			<button>导出</button>
			<button>导入</button>
		</div>
		<!--表--->
	    <table cellpadding="0" cellspacing="0" class="lins_table">
	    	<thead>
	    		<tr>
	    			<td style="width: 40px;"><input class="chebox pull-right" type="checkbox"/></td>
	    			<td style="width: 40px;">序号</td>
	    			<td style="width: 20%;">产品名称</td>
	    			<td style="15%">产品类别</td>
	    			<td style="width: 200px;">创建时间</td>
	    			<td>问题描述</td>
	    			<td style="width: 200px;">失效模式</td>
	    			<td style="10%">失效原因</td>
	    		</tr>
	    	</thead>
	    	<tbody>
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"/></td>
	    			<td>1</td>
	    			<td>侧门门槛坚强件前支架（右）</td>
	    			<td>冲压移位 </td>
	    			<td>2017-11-9</td>
	    			<td>没有采用设计的卷料生产 </td>
	    			<td>增加外型定位</td>
	    			<td>系统自动创建</td>
	    		</tr>
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"/></td>
	    			<td>2</td>
	    			<td>侧门门槛坚强件前支架（右）</td>
	    			<td>冲压移位 </td>
	    			<td>2017-11-9</td>
	    			<td>没有采用设计的卷料生产 </td>
	    			<td>增加外型定位</td>
	    			<td>系统自动创建</td>
	    		</tr>
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"/></td>
	    			<td>3</td>
	    			<td>侧门门槛坚强件前支架（右）</td>
	    			<td>冲压移位 </td>
	    			<td>2017-11-9</td>
	    			<td>没有采用设计的卷料生产 </td>
	    			<td>增加外型定位</td>
	    			<td>系统自动创建</td>
	    		</tr>
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"/></td>
	    			<td>4</td>
	    			<td>侧门门槛坚强件前支架（右）</td>
	    			<td>冲压移位 </td>
	    			<td>2017-11-9</td>
	    			<td>没有采用设计的卷料生产 </td>
	    			<td>增加外型定位</td>
	    			<td>系统自动创建</td>
	    		</tr>
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"/></td>
	    			<td>5</td>
	    			<td>侧门门槛坚强件前支架（右）</td>
	    			<td>冲压移位 </td>
	    			<td>2017-11-9</td>
	    			<td>没有采用设计的卷料生产 </td>
	    			<td>增加外型定位</td>
	    			<td>系统自动创建</td>
	    		</tr>
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"/></td>
	    			<td>6</td>
	    			<td>侧门门槛坚强件前支架（右）</td>
	    			<td>冲压移位 </td>
	    			<td>2017-11-9</td>
	    			<td>没有采用设计的卷料生产 </td>
	    			<td>增加外型定位</td>
	    			<td>系统自动创建</td>
	    		</tr>
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"/></td>
	    			<td>7</td>
	    			<td>侧门门槛坚强件前支架（右）</td>
	    			<td>冲压移位 </td>
	    			<td>2017-11-9</td>
	    			<td>没有采用设计的卷料生产 </td>
	    			<td>增加外型定位</td>
	    			<td>系统自动创建</td>
	    		</tr>
	    		<tr>
	    			<td><input class="pull-right" type="checkbox"/></td>
	    			<td>8</td>
	    			<td>侧门门槛坚强件前支架（右）</td>
	    			<td>冲压移位 </td>
	    			<td>2017-11-9</td>
	    			<td>没有采用设计的卷料生产 </td>
	    			<td>增加外型定位</td>
	    			<td>系统自动创建</td>
	    		</tr>
	    	</tbody>
	    </table>	
        <!-----分页--->
    	<div class="pages">
	        <div id="Pagination"></div>
	        <div class="searchPage">
	          <span class="page-sum">共<strong class="allPage">15</strong>页</span>
	          <span class="page-go">跳转<input type="text">页</span>
	          <a href="javascript:;" class="page-btn">GO</a>
	        </div>
	    </div>		
		
	</div>
</div>
<script>
    //分页
	$(document).ready(function() {
	    $("#Pagination").pagination("15");
    });
	
</script>
<script>
	$(function(){
		$(document).on("change",".chebox",function(){
			if($(this).is(':checked')){
				
			}
		})
	})
</script>
</body>

</html>
