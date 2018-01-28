<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>统计报表</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/demo.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/defect.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/analysis.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/zTreeStyle.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.ztree.core.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery.ztree.excheck.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_ztree.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/echarts.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts8.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts9.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts7.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">统计报表</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">现场问题</a><span>/</span><a href="javascript:;">统计报表</a>
            </div>
        </div>
    </div>
    <!---内容--->
    <div class="defect_box">
    	<!--内容头-->
    	<div class="defect_top clearfix">
    		<div class="defect_date">
    			<span>生产日期：</span><input type="text" class="layui-input test-item pw_layimg"/><span class="defect_dains">至</span><input type="text" class="layui-input test-item pw_layimg"/>
    		</div>
    		<div class="defect_sele">
    			<span>车间：</span>
    			<select>
    				<option>吃鸡小队</option>
    				<option>扎堆2</option>
    			</select>
    		</div>
    		<div class="defect_sele">
    			<span>产品名称：</span>
    			<div style="width: 200px;height: 30px;display: inline-block;">
    				<input id="citySel" type="text" readonly value="" style="width:200px;height: 30px;box-sizing: border-box;border: 1px solid #dedede;border-radius: 5px;" onclick="showMenu();" />
			        <div id="menuContent" class="menuContent" style="display:none; position: absolute;z-index: 50;">
						<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
					</div>
    			</div>
    		</div>
    		<div class="defect_sele">
    			<span>报表类型：</span>
    			<select>
    				<option>季统计</option>
    				<option>月统计</option>
    				<option>周统计</option>
    			</select>
    		</div>
    	</div>
    </div>
    <!----统计图----->
	<div class="container cont_box">
	    <div class="row">
	        <div class="col-md-6">
	        	<!--当总数小于等于30的时候是黄色上升按钮；大于30红色上升按钮-->
	        	<div class="constona">
	        		<p class="constona_p">产品</p>
	        		<div id="azhe" class="con_tabbiao" style="height: 530px;"></div>
	        	</div>
	        </div>
	        <div class="col-md-6">
	        	<div class="constona">
	        		<p class="constona_p">设备</p>
	        		<div id="bzhe" class="con_tabbiao" style="height: 530px;"></div>
	            </div>
	        </div>
	        <div class="col-md-12">
	        	<div class="constona">
	        		<p class="constona_p">失效模式</p>
	        		<div id="czhe" class="con_tabbiao" style="height: 530px;"></div>
	            </div>
	        </div>
	    </div>
	</div>
</div>
<script>
	//同时绑定多个
	lay('.test-item').each(function(){
		laydate.render({
		    elem: this
		    ,trigger: 'click'//点击出发日期
		    ,type: 'date'//年月日
		    ,format: 'yyyy-MM-dd'//自定义格式
		    ,theme: 'molv'//墨绿色
		});
	});
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
</body>

</html>
