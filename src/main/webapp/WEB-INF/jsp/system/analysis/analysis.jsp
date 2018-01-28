<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>数据分析</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/defect.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/analysis.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
     <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/echarts.min.js" ></script>

    <script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">数据分析</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">现场问题</a><span>/</span><a href="javascript:;">每日分析</a>
            </div>
        </div>
    </div>
    <!---内容--->
    <div class="defect_box">
    	<!--内容头-->
    	<form action="${ctx }/analysis/list" id="souForm">
    	<div class="defect_top clearfix">
    		<div class="defect_date">
    			<span>录入日期：</span><input type="text" class="layui-input test-item pw_layimg" name="CREATESTART" value="${pd.CREATESTART }"/><span class="defect_dains">至</span><input type="text" class="layui-input test-item pw_layimg" name="CREATEEND" value="${pd.CREATEEND}"/>
    		</div>
    		<div class="defect_sele">
    			<span>车间：</span>
    			<select>
    				<option>第一车间</option>
    				<option>扎堆2</option>
    			</select>
    		</div>
    		<div class="defect_sele">
    			<span>产品名称：</span>
    			<select>
    				<option>中控环境灯</option>
    				<option>扎堆2</option>
    			</select>
    		</div>
    	</div>
    	</form>
    </div>
    <!----统计图----->
	<div class="container cont_box">
	    <div class="row">
	        <div class="col-md-7 col-lg-7">
	        	<!--当总数小于等于30的时候是黄色上升按钮；大于30红色上升按钮-->
	        	<div class="constona">
	        		<p class="constona_p">PPM TOP10</p>
	        		<table cellpadding="0" cellspacing="0" class="cons_table">
	        			<thead>
	        				<tr>
	        					<td style="width: 70px;">序号</td>
	        					<td>日期</td>
	        					<td>缺陷代码</td>
	        					<td>缺陷名称</td>
	        					<td>总数</td>
	        					<td style="width:100px;">是否上升</td>
	        				</tr>
	        			</thead>
	        			<tbody>
	        			<c:forEach items="${imeList }" var="var" varStatus="vs">
	        				<tr>
	        					<td>${vs.index+1 }</td>
	        					<td><fmt:formatDate value="${var.CREATION_TIME }" pattern="yyyy-MM-dd" /></td>
	        					<td>${var.IMPERFECTION_CODE }</td>
	        					<td>${var.IMPERFECTION_NAME }</td>
	        					<td>${var.NONMBER }</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        			</c:forEach>	
	        			</tbody>
	        		</table>
	        	</div>
	        </div>
	        <div class="col-md-5 col-lg-5">
	        	<div class="constona">
	        		<p class="constona_p">失效模式TOP10</p>
	        		<div class="con_table">
	        			<div id="main" class="con_tabbiao"></div><!---柱状图表---->
	        			<ul class="con_tabul clearfix">
	        			 <c:forEach items="${imvList }" var="var" varStatus="vs">
	        			    <li class="ana_bg${vs.index+1 }"><em></em><span>${var.IMPERFECTION_NAME }</span></li>
	        			</c:forEach>    
	        			</ul>
	        		</div>
	            </div>
	        </div>
	        <div class="col-md-7 col-lg-7">
	        	<div class="constona">
	        		<p class="constona_p">产品TOP10</p>
	        		<div class="con_table2">
	        		    <div id="huan" class="huancss"></div><!---环形图--->
	        		</div>
	            </div>
	        </div>
	        <div class="col-md-5 col-lg-5">
	        	<div class="constona">
	        		<p class="constona_p">设备TOP10</p>
	        		<div class="con_table2">
	        			<div id="shan" class="shancss"></div><!---扇型图--->
	        		</div>
	            </div>
	        </div>
	          <div class="col-md-7 col-lg-7">
	        	<div class="constona">
	        		<p class="constona_p">工序TOP10</p>
	        		<div class="con_table2">
	        		    <div id="huangx" class="huancss"></div>
	        		</div>
	            </div>
	        </div>
	        <div class="col-md-5 col-lg-5">
	        	<div class="constona">
	        		<p class="constona_p">零件TOP10</p>
	        		<div class="con_table2">
	        			<div id="shangx" class="shancss"></div>
	        		</div>
	            </div>
	        </div>
	    </div>
	</div>
</div>
<script type="text/javascript">
var imlist = '${json}';
var jsonObj =  eval("("+imlist+")");//转换为json对象
var proimlist = '${projson}';
var projsonObj = eval("("+proimlist+")");//转换为json对象
var equimlist = '${equjson}';
var equjsonObj =   eval("("+equimlist+")");//转换为json对象
var procimlist = '${procjson}';
var procjsonObj =   eval("("+procimlist+")");//转换为json对象

	//同时绑定多个
	lay('.test-item').each(function(){
		laydate.render({
		    elem: this
		    ,trigger: 'click'//点击出发日期
		    ,type: 'date'//年月日
		    ,format: 'yyyy-MM-dd'//自定义格式
		    ,theme: 'molv'//墨绿色
	    	,done: function(value, date){
			    $("#souForm").submit();
			  }
		});
	});
	/* $(".layui-input").change(function() {
		$("#souForm").submit();
	}); */
	$(function(){
		//循环序号1-10
		for(var a=1;a<11;a++){
			//console.log(a);
			$(".cons_table>tbody>tr").eq(a-1).children("td").eq(0).html(a);
		}
		//上升按钮事件
		$(document).on("click",".shangbtn",function(){
			var _this=this;
			parent.layer.open({
	        	type:1,//类型
				title:"",//标题
				content:'<div class="pwalerttit">是否上升该问题？</div>',
				area:['500px','230px'],//宽高
				closeBtn: 0,//不显示右上角关闭按钮
				shadeClose:false,//是否点击遮罩关闭
				scrollbar: false,//是否允许浏览器出现滚动条
				btn:['是','否'],
				btnAlign: 'c',//按钮居中
				yes:function(index,layero){
					
					parent.layer.close(index);//关闭弹
				},
				btn2:function(index){
					parent.layer.close(index);//关闭弹
				}
	        })
	        
		})
	})
	
</script>

<script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts1.js" ></script>
<script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts2.js" ></script>
<script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts3.js" ></script>
<script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts5.js" ></script>
<script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts6.js" ></script>
</body>

</html>
