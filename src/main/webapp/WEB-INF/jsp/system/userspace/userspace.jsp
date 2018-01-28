<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>个人空间</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/personage_space.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/analysis.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/echarts.min.js" ></script>

</head>
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
	<div class="renwubox">
		<!---新增盒子包裹---->
		<div class="rendiv_box clearfix">
			<div class="rendiv rendiva">
				<div class="rendivtit">我的待办任务<span>${pd.dataiqc}项</span></div>
				<ul class="rendivul">
					<li>
						<a href="javascript:;">客户问题(0)</a>
					</li>
					<li>
						<a  href="${ctx }/iqc_problem/deallist">供应商问题(${pd.dataiqc})</a>
					</li>
					<li>
						<a href="javascript:;">现场问题(0)</a>
					</li>
				</ul>
			</div>
			<div class="rendiv rendivb">
				<div class="rendivtit">我的审批任务<span>0项</span></div>
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
		</div>
		<div class="rendivimg">
			<div class="rendivle"><canvas id="canvasa" width="200" height="200"></canvas></div>
			<div class="rendivri"><canvas id="canvasb" width="200" height="200"></canvas></div>
		</div>
	</div>
	<!---收藏-->
	<div class="shoucangbox">
		<em class="scimga"><img src="img/rens.jpg"/></em><a class="sctita" href="javascript:;">我的收藏</a><span class="sctitb">4项</span><span class="sctitimgs"></span><span class="sctitimgss"></span><a class="sctitc" href="javascript:;">经验知识库(20)</a><span class="sctitimgss sctitimgsss"></span><a class="sctitc" href="javascript:;">审核体系(17)</a>
	</div>
	
	
	<div class="went_bxo">
        <div class="list_thta">
        	<table cellpadding="0" cellspacing="0" class="list_table">
        		<thead>
        			<tr>
        				<td style="width: 5%;">序号</td>
		    	    	<td style="width: 5%;">当前步骤</td>
		                <td style="width: 10%;">发生日期</td>
		                <td style="width: 10%;">责任人</td>
		                <td style="width: 10%;">跟踪号</td>
		                <td style="width: 10%;">客户名称</td>
		                <td style="width: 10%;">产品名称</td>
		                <td style="width: 10%;">失效模式</td>
		                <td>问题描述</td>
		                <td style="width: 144px;">操作</td>
		    	   </tr>
        		</thead>
        	    <tbody>
        	    	<tr>
        	    		<td>1</td><!----list_bgdiv0,1,2,3是状态样式---->
        	    		<td><a href="javascript:;" class="list_bgdiv list_bgdiv0"><em>D2</em><span>问题描述</span></a></td>
        	    		<td>2017-11-12</td>
        	    		<td>系统管理员</td>
        	    		<td>HGF1234567893</td>
        	    		<td>客户名称客户名称</td>
        	    		<td>产品名称产品名称</td>
        	    		<td>失效模式失效模式</td>
        	    		<td>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</td>
        	    		<td>
        	    			<div class="addsbox list_addsbox clearfix">
        	    				<a class="liulanbtn pull-left" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn pull-left" href="acquisition_able.html"><em></em><span>编辑</span></a>
        	    				<a class="scbtn pull-left" href="javascript:;"><em></em><span>删除</span></a>
        	    				<!----下面的编辑、删除按钮是灰色，点击没效果--->
        	    				<!--<a class="bianjibtn_as pull-left"><em></em><span>编辑</span></a>
        	    				<a class="scbtn_as pull-left" href="javascript:;"><em></em><span>删除</span></a>-->
        	    			</div>
        	    		</td>
        	    	</tr>
        	    	<tr>
        	    		<td>1</td><!----list_bgdiv0,1,2,3是状态样式---->
        	    		<td><a href="javascript:;" class="list_bgdiv list_bgdiv1"><em>D2</em><span>问题描述</span></a></td>
        	    		<td>2017-11-12</td>
        	    		<td>系统管理员</td>
        	    		<td>HGF1234567893</td>
        	    		<td>客户名称客户名称</td>
        	    		<td>产品名称产品名称</td>
        	    		<td>失效模式失效模式</td>
        	    		<td>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</td>
        	    		<td>
        	    			<div class="addsbox list_addsbox clearfix">
        	    				<a class="liulanbtn pull-left" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn pull-left" href="acquisition_able.html"><em></em><span>编辑</span></a>
        	    				<a class="scbtn pull-left" href="javascript:;"><em></em><span>删除</span></a>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    	<tr>
        	    		<td>1</td><!----list_bgdiv0,1,2,3是状态样式---->
        	    		<td><a href="javascript:;" class="list_bgdiv list_bgdiv2"><em>D2</em><span>问题描述</span></a></td>
        	    		<td>2017-11-12</td>
        	    		<td>系统管理员</td>
        	    		<td>HGF1234567893</td>
        	    		<td>客户名称客户名称</td>
        	    		<td>产品名称产品名称</td>
        	    		<td>失效模式失效模式</td>
        	    		<td>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</td>
        	    		<td>
        	    			<div class="addsbox list_addsbox clearfix">
        	    				<a class="liulanbtn pull-left" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn pull-left" href="acquisition_able.html"><em></em><span>编辑</span></a>
        	    				<a class="scbtn pull-left" href="javascript:;"><em></em><span>删除</span></a>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    	<tr>
        	    		<td>1</td><!----list_bgdiv0,1,2,3是状态样式---->
        	    		<td><a href="javascript:;" class="list_bgdiv list_bgdiv3"><em>D2</em><span>问题描述</span></a></td>
        	    		<td>2017-11-12</td>
        	    		<td>系统管理员</td>
        	    		<td>HGF1234567893</td>
        	    		<td>客户名称客户名称</td>
        	    		<td>产品名称产品名称</td>
        	    		<td>失效模式失效模式</td>
        	    		<td>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</td>
        	    		<td>
        	    			<div class="addsbox list_addsbox clearfix">
        	    				<a class="liulanbtn pull-left" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn pull-left" href="acquisition_able.html"><em></em><span>编辑</span></a>
        	    				<a class="scbtn pull-left" href="javascript:;"><em></em><span>删除</span></a>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    	<tr>
        	    		<td>1</td><!----list_bgdiv0,1,2,3是状态样式---->
        	    		<td><a href="javascript:;" class="list_bgdiv list_bgdiv0"><em>D2</em><span>问题描述</span></a></td>
        	    		<td>2017-11-12</td>
        	    		<td>系统管理员</td>
        	    		<td>HGF1234567893</td>
        	    		<td>客户名称客户名称</td>
        	    		<td>产品名称产品名称</td>
        	    		<td>失效模式失效模式</td>
        	    		<td>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</td>
        	    		<td>
        	    			<div class="addsbox list_addsbox clearfix">
        	    				<a class="liulanbtn pull-left" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn pull-left" href="acquisition_able.html"><em></em><span>编辑</span></a>
        	    				<a class="scbtn pull-left" href="javascript:;"><em></em><span>删除</span></a>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    </tbody>
        	</table>
        </div>
        <!--<div class="list_thta">
        	<div class="list_tabxuhao">序号-<span>2</span></div>
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
        	    	<tr>
        	    		<td>无需操作</td>
        	    		<td>2017-11-12</td>
        	    		<td>系统管理员</td>
        	    		<td>HGF1234567893</td>
        	    		<td>客户名称客户名称</td>
        	    		<td>产品名称产品名称</td>
        	    		<td>失效模式失效模式</td>
        	    		<td>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</td>
        	    		<td rowspan="2">
        	    			<div class="addsbox">
        	    				<a class="liulanbtn" href="javascript:;"><em></em><span>浏览</span></a>
        	    				<a class="bianjibtn" href="javascript:;"><em></em><span>编辑</span></a>
        	    				<a class="scbtn" href="javascript:;"><em></em><span>删除</span></a>
        	    			</div>
        	    		</td>
        	    	</tr>
        	    	<tr>
        	    		<td colspan="8">
        	    			<ul class="d_divul">
	                            <li class="d_active22">
	                                <a href="d0.html">
	                                    <div class="d_yys">
	                                        <p>D0</p>
	                                        <p>紧急遏制</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                            <li class="d_active22">
	                                <a href="d1.html">
	                                    <div class="d_yys">
	                                        <p>D1</p>
	                                        <p>团队</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                            <li class="d_active3">
	                                <a href="d2.html">
	                                    <div class="d_yys">
	                                        <p>D2</p>
	                                        <p>问题陈述</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                            <li class="d_active4">
	                                <a href="d3.html">
	                                    <div class="d_yys">
	                                        <p>D3</p>
	                                        <p>临时措施</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="d4.html">
	                                    <div class="d_yys">
	                                        <p>D4</p>
	                                        <p>根本原因</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="d5.html">
	                                    <div class="d_yys">
	                                        <p>D5</p>
	                                        <p>永久措施选择</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="d6.html">
	                                    <div class="d_yys">
	                                        <p>D6</p>
	                                        <p>永久措施执行</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="d7.html">
	                                    <div class="d_yys">
	                                        <p>D7</p>
	                                        <p>预防措施</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="d8.html">
	                                    <div class="d_yys">
	                                        <p>D8</p>
	                                        <p>团队认定</p>
	                                    </div>
	                                    <div class="d_yydd"></div>
	                                </a>
	                            </li>
	                        </ul>
        	    		</td>
        	    	</tr>
        	    </tbody>
        	</table>
        </div>-->
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
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>47</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>46</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>46</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>45</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>44</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>42</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>31</td>
	        					<td><span class="conimga shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>30</td>
	        					<td><span class="conimgb shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
	        					<td>20</td>
	        					<td><span class="conimgb shangbtn"></span></td>
	        				</tr>
	        				<tr>
	        					<td>2</td>
	        					<td>2017-12-22</td>
	        					<td>SBEX012</td>
	        					<td>破坏性试验</td>
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
	        			<div id="main" class="con_tabbiao"></div><!---柱状图表---->
	        			<ul class="con_tabul clearfix">
	        			    <li class="ana_bg1"><em></em><span>端部成型表面不良成型表面不良水电费-分裂</span></li>
	        			    <li class="ana_bg2"><em></em><span>端部成型表面不良成型表面不良水电费-分裂</span></li>
	        			    <li class="ana_bg3"><em></em><span>端部成型表面不良成型表面分裂</span></li>
	        			    <li class="ana_bg4"><em></em><span>端部成型表面不良成型表面分裂</span></li>
	        			    <li class="ana_bg5"><em></em><span>端部成型表面不良成型表面不良水电费-分裂</span></li>
	        			    <li class="ana_bg6"><em></em><span>端部成型表面不良成型表面不良水电费-分裂</span></li>
	        			    <li class="ana_bg7"><em></em><span>端部成型表面不良成型表面分裂</span></li>
	        			    <li class="ana_bg8"><em></em><span>端部成型表面不良成型表面分裂</span></li>
	        			    <li class="ana_bg9"><em></em><span>端部成型表面不良成型表面不良水电费-分裂</span></li>
	        			    <li class="ana_bg10"><em></em><span>端部成型表面不良成型表面不良水电费-分裂</span></li>
	        			</ul>
	        		</div>
	            </div>
	        </div>
	    </div>
	</div>
	<!---产品合格率-->
	<div class="hegebox">
		<p class="hegep">产品合格率</p>
		<div class="hegeimg">
			<div id="zhe" class="zhecss"></div>
		</div>
	</div>
	
</div>
<script>
var imlist = '${json}';
var jsonObj =  eval("("+imlist+")");//转换为json对象
	$(function(){
		
		
        //第一个canvas
        var cana=document.getElementById("canvasa");
        var ctc=cana.getContext("2d");
        //第二个canvas
        var canb=document.getElementById("canvasb");
        var ctx=canb.getContext("2d");
        //pwfun("项目","完成度","50","#24cab2");
        function pwfun(tit,title,n,color){
        	///////////绘制文字
	        ctc.font="20px microsoft yahei";
	        ctc.textAlign="center";
	        ctc.textBaseline="middle";
	        ctc.fillStyle=color;
	        ctc.fillText(tit,100,170);
	        ///绘制”完成度“
	        ctc.font="18px microsoft yahei";
	        ctc.textAlign="center";
	        ctc.textBaseline="middle";
	        ctc.fillStyle="#d9d9d9";
	        ctc.fillText(title,100,70);
	        ///绘制”百分比分号“
	        ctc.font="18px microsoft yahei";
	        ctc.textAlign="center";
	        ctc.textBaseline="middle";
	        ctc.fillStyle=color;
	        ctc.fillText("%",130,110);
	        ///绘制”百分比数字“
	        ctc.font="30px microsoft yahei";
	        ctc.textAlign="center";
	        ctc.textBaseline="middle";
	        ctc.fillStyle=color;
	        
	        draw(60,155,80,30,5,color,"stroke");
	        
	        ///////绘制灰色圆
	        ctc.beginPath();//设置起始路径
	        ctc.lineWidth=20;//线宽
	        ctc.strokeStyle="#d9d9d9";//线颜色
	        ctc.arc(100,100,90,0.75*Math.PI,0.25*Math.PI,false);//圆
	        ctc.stroke();//绘制图
	        ///////绘制动态环
	        ctc.strokeStyle=color;//线颜色
	        ctc.lineWidth=20;//线宽岁
            ctc.beginPath();//设置起始路径
        }
        function pwfuns(tit,title,n,color){
        	///////////绘制文字
	        ctx.font="20px microsoft yahei";
	        ctx.textAlign="center";
	        ctx.textBaseline="middle";
	        ctx.fillStyle=color;
	        ctx.fillText(tit,100,170);
	        ///绘制”完成度“
	        ctx.font="18px microsoft yahei";
	        ctx.textAlign="center";
	        ctx.textBaseline="middle";
	        ctx.fillStyle="#d9d9d9";
	        ctx.fillText(title,100,70);
	        ///绘制”百分比分号“
	        ctx.font="18px microsoft yahei";
	        ctx.textAlign="center";
	        ctx.textBaseline="middle";
	        ctx.fillStyle=color;
	        ctx.fillText("%",130,110);
	        ///绘制”百分比数字“
	        ctx.font="30px microsoft yahei";
	        ctx.textAlign="center";
	        ctx.textBaseline="middle";
	        ctx.fillStyle=color;
	        
	        draws(60,155,80,30,5,color,"stroke");
	        
	        ///////绘制灰色圆
	        ctx.beginPath();//设置起始路径
	        ctx.lineWidth=20;//线宽
	        ctx.strokeStyle="#d9d9d9";//线颜色
	        ctx.arc(100,100,90,0.75*Math.PI,0.25*Math.PI,false);//圆
	        ctx.stroke();//绘制图
	        ///////绘制动态环
	        ctx.strokeStyle=color;//线颜色
	        ctx.lineWidth=20;//线宽岁
            ctx.beginPath();//设置起始路径
        }
        //圆角矩形方法
        function draw(x, y, width, height, radius, color, type){
		    ctc.beginPath();
		    ctc.lineWidth=1;//线宽
		    ctc.moveTo(x, y+radius);
		    ctc.lineTo(x, y+height-radius);
		    ctc.quadraticCurveTo(x, y+height, x+radius, y+height);
		    ctc.lineTo(x+width-radius, y+height);
		    ctc.quadraticCurveTo(x+width, y+height, x+width, y+height-radius);
		    ctc.lineTo(x+width, y+radius);
		    ctc.quadraticCurveTo(x+width, y, x+width-radius, y);
		    ctc.lineTo(x+radius, y);
		    ctc.quadraticCurveTo(x, y, x, y+radius);
		    ctc[type + 'Style'] = color || params.color;
		    ctc.closePath();
		    ctc[type]();
		}
        //圆角矩形方法
        function draws(x, y, width, height, radius, color, type){
		    ctx.beginPath();
		    ctx.lineWidth=1;//线宽
		    ctx.moveTo(x, y+radius);
		    ctx.lineTo(x, y+height-radius);
		    ctx.quadraticCurveTo(x, y+height, x+radius, y+height);
		    ctx.lineTo(x+width-radius, y+height);
		    ctx.quadraticCurveTo(x+width, y+height, x+width, y+height-radius);
		    ctx.lineTo(x+width, y+radius);
		    ctx.quadraticCurveTo(x+width, y, x+width-radius, y);
		    ctx.lineTo(x+radius, y);
		    ctx.quadraticCurveTo(x, y, x, y+radius);
		    ctx[type + 'Style'] = color || params.color;
		    ctx.closePath();
		    ctx[type]();
		}
        
        //设置开始处为0点钟方向(-90 * Math.PI / 180)
        //x为百分比值(0-100)
        var x=20;//////第一个完成度（可设置的）
        var y=18;//////第二个延期度（可设置的）
        var i=0;
        var d=0;
        var pwdate=setInterval(function(){
        	if(i>=x){
        		i=0;
        		clearInterval(pwdate);
        	}else{
        		i++;
        		ctc.clearRect(0,0,cana.width,cana.height);//清空
        		pwfun("项目","完成度",i,"#24cab2");
        		ctc.fillText(i,95,105);
        		ctc.arc(100,100,90,-225 * Math.PI / 180,(i * 2.7 - 225) * Math.PI / 180,false);//圆
        		ctc.stroke();//绘制图
        	}
        },20)
        var pwdates=setInterval(function(){
        	if(d>=y){
        		d=0;
        		clearInterval(pwdates);
        	}else{
        		d++;
        		ctx.clearRect(0,0,canb.width,canb.height);//清空
        		pwfuns("项目","延期度",d,"#fc7a7a");
        		ctx.fillText(d,95,105);
        		ctx.arc(100,100,90,-225 * Math.PI / 180,(d * 2.7 - 225) * Math.PI / 180,false);//圆
        		ctx.stroke();//绘制图
        	}
        },20)
        
        
		//循环序号1-10
		for(var a=1;a<11;a++){
			$(".cons_table>tbody>tr").eq(a-1).children("td").eq(0).html(a);
		}
		//序号循环方法123456
	    xuhao();
	    function xuhao(){
	    	var s=$(".list_table>tbody tr").length;
		    //循环序号1-10
			for(var a=1;a<=s;a++){
				//console.log(a);
				$(".list_table>tbody>tr").eq(a-1).children("td").eq(0).html(a);
			}
	    }
		//上升按钮事件
		$(document).on("click",".shangbtn",function(){
			var _this=this;
			parent.layer.open({
	        	type:1,//类型
				title:"",//标题
				content:'<div class="pwalerttit">你确定要上升该问题？</div>',
				area:['500px','230px'],//宽高
				closeBtn: 0,//不显示右上角关闭按钮
				shadeClose:false,//是否点击遮罩关闭
				scrollbar: false,//是否允许浏览器出现滚动条
				btn:['确定','取消'],
				btnAlign: 'c',//按钮居中
				yes:function(index,layero){
					parent.layer.close(index);//关闭弹
				},
				btn2:function(index){
					parent.layer.close(index);//关闭弹
				}
	        })
			
		})
		//删除方法
	    $(document).on("click",".scbtn",function(){
	    	var _this=this;
	    	parent.layer.open({
	        	type:1,//类型
				title:"",//标题
				content:'<div class="pwalerttit">你确定删除该问题？</div>',
				area:['500px','230px'],//宽高
				closeBtn: 0,//不显示右上角关闭按钮
				shadeClose:false,//是否点击遮罩关闭
				scrollbar: false,//是否允许浏览器出现滚动条
				btn:['确定','取消'],
				btnAlign: 'c',//按钮居中
				yes:function(index,layero){
					$(this).parents("tr").remove();
					xuhao();
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
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_eharts4.js" ></script>
</body>

</html>
