<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>每日分析</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/personage_space.css" />
     <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/analysis.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/echarts.js" ></script>
     <style type="text/css">
     .dangsha{
		    text-decoration: none;
    		border-bottom: 1px solid #081417;
    	}
      tbody a{
			font-size: 14px;
			color: #666;
		}
     </style>
</head>
<script type="text/javascript">
function getpots(){
var myChart = echarts.init(document.getElementById('imgports'));
option = {
	    /* title: {
	        text: '产品合格率',
	        subtext: '纯属虚构'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	   
	    toolbox: {
	        show: true,
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        }
	    }, */
	    legend: {
	        data:['最高合格率','最低合格率']
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        data: ['环境灯光杯托','侧转向信号灯','中控环境灯','环境灯光 副驾驶位','左后排照脚灯','水坑灯低配','环境灯光 储物箱']
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} %'
	        }
	    },
	    series: [
	        {
	            name:'最高合格率',
	            type:'line',
	            data:[76, 65, 80, 50, 75, 90, 65],
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        },
	        {
	            name:'最低合格率',
	            type:'line',
	            data:[60, 35,70, 40, 60, 65,60],
	            markPoint: {
	                data: [
	                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'},
	                    [{
	                        symbol: 'none',
	                        x: '90%',
	                        yAxis: 'max'
	                    }, {
	                        symbol: 'circle',
	                        label: {
	                            normal: {
	                                position: 'start',
	                                formatter: '最大值'
	                            }
	                        },
	                        type: 'max',
	                        name: '最高点'
	                    }]
	                ]
	            }
	        }
	    ]
	};

myChart.setOption(option);
}
</script>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">个人空间</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">个人空间</a>
            </div>
        </div>
    </div>
    <!---任务--->
	<div class="renwubox clearfix">
		<div class="rendiv rendiva">
			<div class="rendivtit">我的待办任务<span>${pd.dataiqc}项</span></div>
			<ul class="rendivul">
				<li>
					<a href="javascript:;">客户问题(0)</a>
				</li>
				<li>
					<a href="${ctx }/iqc_problem/deallist">供应商问题(${pd.dataiqc})</a>
				</li>
				<li>
					<a href="javascript:;">现场问题(0)</a>
				</li>
			</ul>
		</div>
		<div class="rendiv rendivb">
			<div class="rendivtit">我的审批任务<span>${pd.leaderiqc }项</span></div>
			<ul class="rendivul">
				<li>
					<a href="javascript:;">客户问题(0)</a>
				</li>
				<li>
					<a href="javascript:;">供应商问题(0)</a>
				</li><%-- href="${ctx }/iqc_problem/deallist?oderleader=3" --%>
				<li>
					<a href="javascript:;">现场问题(0)</a>
				</li>
			</ul>
		</div>
		<div class="rendiv rendivc">
			<div class="rendivtit">我的已超期任务<span>0项</span></div>
			<ul class="rendivul">
				<li>
					<a href="javascript:;">客户问题(0)</a>
				</li>
				<li>
					<a href="javascript:;">供应商问题(0)</a>
				</li>
				<li>
					<a href="javascript:;">现场问题(0)</a>
				</li>
			</ul>
		</div>
		<div class="rendivimg"><img src="${ctx }/static/fords/img/prea.jpg"/></div>
	</div>
	<!---收藏-->
	<div class="shoucangbox">
		<em class="scimga"><img src="${ctx }/static/fords/img/rens.jpg"/></em><a class="sctita" href="javascript:;">我的收藏</a><span class="sctitb">4项</span><span class="sctitimgs"></span><span class="sctitimgss"></span><a class="sctitc" href="javascript:;">经验管理(20)</a><span class="sctitimgss sctitimgsss"></span><a class="sctitc" href="javascript:;">审核体系(17)</a>
	</div>
	
	
	<div class="went_bxo">
	 <c:forEach items="${varList }" var="var" varStatus="status">
        <div class="list_thta">
        	<div class="list_tabxuhao">序号-<span>${ status.index + 1}</span></div>
        	<table cellpadding="0" cellspacing="0" class="list_table">
        		<thead>
        			<tr>
		    	    	<td style="width: 8%;">当前步骤</td>
		                <td style="width: 10%;">发生日期</td>
		                <td style="width: 10%;">责任人</td>
		                <td style="width: 10%;">跟踪号</td>
		                <td style="width: 10%;">客户名称</td>
		                <td style="width: 10%;">产品名称</td>
		                <td style="width: 10%;">失效模式</td>
		                <td>问题描述</td>
		                <td style="width: 80px;">操作</td>
		    	   </tr>
        		</thead>
        	    <tbody>
        	    <c:forEach items="${map }" var="map">
                   <c:if test="${map.value.CLIENT_PROBLEM_COLLECTION_ID == var.CLIENT_PROBLEM_COLLECTION_ID }">
        	    	<tr>
        	    	
        	    		<td><c:if test="${fn:length(map.value.DANGQ ) == 0}">无需操作</c:if><c:if test="${fn:length(map.value.DANGQ ) != 0}"><a class="dangsha">D${map.value.DANGQ }</a></c:if></td>
        	    		<td><fmt:formatDate value="${var.CREATETIME }" pattern="yyyy-MM-dd" /></td>
        	    		<td>${var.NAME }</td>
        	    		<td>${var.TRACKINGNUMBER }</td>
        	    		<td>${var.CLIENTSNAME }</td>
        	    		<td>${var.PRODUCTNAME }</td>
        	    		<td>${var.FAILUREMODE }</td>
        	    		<td>${var.TITLE }</td>
        	    		<td rowspan="2">
        	    			<div class="addsbox">
        	    			<a class="liulanbtn" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn" href="${ctx }/client_problem_collection/goaddAndEdit?CLIENT_PROBLEM_COLLECTION_ID=${var.CLIENT_PROBLEM_COLLECTION_ID}"><em></em><span>编辑</span></a>
        	    				<a class="scbtn" href="javascript:;"><em></em><span>删除</span></a>
        	    			 <input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${var.CLIENT_PROBLEM_COLLECTION_ID}">
        	    			</div>
        	    		</td>
        	    	</tr>
        	    	</c:if>
        	    	</c:forEach>
        	    	<tr>
        	    		<td colspan="8">
        	    		<ul class="d_divul">
	                   <c:forEach items="${dicList }" var="dic">
                       <c:forEach items="${map }" var="map">
                       <c:if test="${map.value.CLIENT_PROBLEM_COLLECTION_ID == var.CLIENT_PROBLEM_COLLECTION_ID }">
                       
                      <c:if test="${fn:length(map.value.planList ) == 0}">
                      <li><a href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}&TYPE=${var.TYPE}">
									<div class="d_yys">
										<p>${dic.LABEL }</p>
										<p>${dic.REMARKS }</p>
									</div>
									<div class="d_yydd"></div>
						</a></li>
                      </c:if> 
                        <c:if test="${fn:length(map.value.planList ) != 0}">
                        <c:forEach items="${map.value.planList }" var="plan">
                        
	                        <c:if test="${plan.USTEP == dic.VALUE && plan.ISFINISH ==1 && plan.ISOUTIME !=2}">
	                        
	                        <li class="d_active22"><a href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}&TYPE=${var.TYPE}">
										<div class="d_yys">
											<p>${dic.LABEL }</p>
											<p>${dic.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
							</a></li>
	                        </c:if>
	                        <c:if test="${plan.USTEP == dic.VALUE && plan.ISOUTIME ==1}">
	                        
	                        <li class="d_active3"><a <c:if test="${map.value.DANGQJY<=plan.USTEP }">href="javaScript:;"</c:if> <c:if test="${map.value.DANGQJY>plan.USTEP}">href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}&TYPE=${var.TYPE}"</c:if>>
										<div class="d_yys">
											<p>${dic.LABEL }</p>
											<p>${dic.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
							</a></li>
	                        </c:if>
	                        <c:if test="${plan.USTEP == dic.VALUE && plan.ISFINISH ==1 && plan.ISOUTIME ==2}">
	                        
	                        <li class="d_active4"><a href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}&TYPE=${var.TYPE}">
										<div class="d_yys">
											<p>${dic.LABEL }</p>
											<p>${dic.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
							</a></li>
	                        </c:if>
	                         <c:if test="${plan.USTEP == dic.VALUE && plan.ISFINISH ==0 && plan.ISOUTIME !=1}">
	                        
	                        <li><a <c:if test="${map.value.DANGQJY<=plan.USTEP }">href="javaScript:;"</c:if> <c:if test="${map.value.DANGQJY>plan.USTEP}">href="${ctx}/${dic.PID}${var.CLIENT_PROBLEM_COLLECTION_ID}&TYPE=${var.TYPE}"</c:if>>
										<div class="d_yys">
											<p>${dic.LABEL }</p>
											<p>${dic.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
							</a></li>
	                        </c:if>
                        </c:forEach>
                      	</c:if> 
                       </c:if>
                       
                       </c:forEach>
                       </c:forEach>
	                        </ul>
        	    		</td>
        	    	</tr>
        	    </tbody>
        	</table>
        	<div class="beizhuos clearfix">
	    		<p>备注：</p>
	    	    <ul>
	    	    	<li><span></span><em>按时已完成</em></li>
	    	    	<li><span></span><em>超期已完成</em></li>
	    	    	<li><span></span><em>超期未完成</em></li>
	    	    	<li><span></span><em>待完成</em></li>
	    	    </ul>
	    	</div>
        </div>
        </c:forEach>
       
    </div>
    <!---表格--->
    <div class="container cont_box">
	    <div class="row">
	        <div class="col-md-7 col-lg-7">
	        	<!--当总数小于等于30的时候是黄色上升按钮；大于30红色上升按钮-->
	        	<div class="constona">
	        		<p class="constona_p">PPM TOP10</p>
	        		<table cellpadding="0" cellspacing="0" class="cons_table" style="border: none;">
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
	        				<tr>
	        					<td>1</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX012</td>
	        					<td>银光丝</td>
	        					<td>47</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX013</td>
	        					<td>螺钉生锈</td>
	        					<td>46</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX014</td>
	        					<td>缺料</td>
	        					<td>46</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX015</td>
	        					<td>卡脚断裂</td>
	        					<td>45</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX016</td>
	        					<td>杂质</td>
	        					<td>44</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX017</td>
	        					<td>亮印</td>
	        					<td>42</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX018</td>
	        					<td>漏打螺钉</td>
	        					<td>31</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX019</td>
	        					<td>卡脚变形</td>
	        					<td>30</td>
	        					<td><span class="conimgb shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX020</td>
	        					<td>螺钉上大下小</td>
	        					<td>20</td>
	        					<td><span class="conimgb shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-13</td>
	        					<td>SBEX021</td>
	        					<td>线插反</td>
	        					<td>10</td>
	        					<td><span class="conimgb shangbtn"></span></td>
	        				</tr>
	        				
	        			</tbody>
	        		</table>
	        	</div>
	        </div>
	        <div class="col-md-5 col-lg-5">
	        	<div class="constona">
	        		<p class="constona_p">TOP10</p>
	        		<div class="con_table">
	        			<img src="${ctx }/static/fords/img/wenti1.jpg"/>
	        			<ul class="con_tabul clearfix">
	        			     <li class="ana_bg1"><em></em><span>PCB混有叉板-混料</span></li>
	        			    <li class="ana_bg2"><em></em><span>异响-功能不良</span></li>
	        			    <li class="ana_bg3"><em></em><span>黑点-外观不良</span></li>
	        			    <li class="ana_bg4"><em></em><span>划伤-外观不良</span></li>
	        			    <li class="ana_bg5"><em></em><span>螺纹缺损-功能不良</span></li>
	        			    <li class="ana_bg6"><em></em><span>料花-外观不良</span></li>
	        			    <li class="ana_bg7"><em></em><span>碰伤-外观不良</span></li>
	        			    <li class="ana_bg8"><em></em><span>尺寸不良-尺寸不良</span></li>
	        			    <li class="ana_bg9"><em></em><span>多料-多料</span></li>
	        			    <li class="ana_bg10"><em></em><span>脏污-外观不良</span></li>
	        			</ul>
	        		</div>
	            </div>
	        </div>
	    </div>
	</div>
	<!---产品合格率-->
	<div class="hegebox" >
		<p class="hegep">产品合格率</p>
		<div class="hegeimg" id="imgports" style="height: 600px;width:100%;">
		<%-- 	<img class="img-responsive" src="${ctx }/static/fords/img/anas.jpg" /> --%>
		</div>
	</div>
	
</div>
<div class="alert_1 dis" id="shangbox">
	<div class="alert_1tit">你确定要上升该问题?</div>
	<div class="alert_1btn">
		<button class="quebtn" type="button">确定</button>
		<button class="qubtn" type="button">取消</button>
	</div>
</div>
<div class="alert_1 dis" id="scidbox">
	<div class="alert_1tit">你确定删除该问题?</div>
	<div class="alert_1btn">
		<button id="scid" class="quebtn" type="button">确定</button>
		<input type="hidden">
		<button class="qubtn" type="button">取消</button>
	</div>
</div>
<script>
	$(function(){
		
		$(document).on("click","li a",function(){
			console.log(this.href);
			if(this.href == "javascript:;"){
				/* alert2("上一步未完成，请先完成"); */
			}
		})
		
		getpots();
		//循环序号1-10
		for(var a=1;a<11;a++){
			/* console.log(a); */
			$(".cons_table>tbody>tr").eq(a-1).children("td").eq(0).html(a);
		}
		//序号循环方法123456
	    xuhao();
	    function xuhao(){
	    	var a=$(".went_bxo>.list_thta").length;
		    for(var i=1;i<=a;i++){
		    	console.log(i);
		    	$(".went_bxo>.list_thta").eq(i-1).find(".list_tabxuhao>span").html(i);
		    }
	    }
	    //上升按钮事件
		$(document).on("click",".shangbtn",function(){
			$("#shangbox").removeClass("dis");
		})
		//删除方法
	    var a;
	    $(document).on("click",".scbtn",function(){
	    	$("#scidbox").removeClass("dis");
	    	$("#scidbox").find("input").val($(this).next().val());
	    	a=$(this).parents(".went_bxo>.list_thta").index();
	    	console.log(a);
	    })
	    $("#scid").click(function(){
	    	var CLIENT_PROBLEM_COLLECTION_ID = $(this).next().val();
	    	$.ajax({
	    		type : "POST",
	    		url : "${ctx}/client_problem_collection/deletes",
	    		data : {CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID},
	    		success : function(data) {
	    			$(".went_bxo>.list_thta").eq(a).remove();
	    	    	xuhao();
	    		},
	    	 	error:function(){
	            	alert("操作无效");
	            }
	    	});
	    })
	    
	    
	    $(".list_thta").each(function(index){
	    	var tis = $(this);
	    	var dands = tis.find("tbody tr:eq(0) a:eq(0)");
	    	tis.find(".d_divul li").each(function(index){
	    		var ts = $(this);
	    		 if(dands.text() == $.trim(ts.find("p:eq(0)").text())){
	    			 dands.attr("href",ts.find("a").attr("href"));
	    		} 
	    });
		    
		})
	    
	})
</script>

</body>

</html>
