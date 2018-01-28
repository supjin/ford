<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title>Is & Is Not</title>
    <link rel="stylesheet" href="${ctx}/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/d0.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/isnot.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/pw_alert.css" />
    <script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/pw_alert.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">Is & Is Not</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">0公里问题</a><span>/</span><a href="javascript:;">Is & Is Not</a>
            </div>
        </div>
    </div>
    <!----Is & Is Not---->
    <div class="is_notbox">
    
    	<div class="is_notdis clearfix">
    		<div class="is_notdisle clearfix"><p>问题的描述</p><textarea></textarea></div>
    		<div class="is_notdisri">
    			<div class="in_liluntit">检测理论</div>
    			<table cellpadding="0" cellspacing="0" class="lilun_tab">
    				<thead>
    					<tr>
    						<td colspan="1000"><span>Capacity/Demand/Combination</span></td>
    					</tr>
    				</thead>
    				<tbody>
    					<tr>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td></td>
    						<td rowspan="3" style="width: 66px;"><a class="lilun_zjbtn" href="javascript:;">新增</a></td>
    					</tr>
    					<tr>
    						<td>A</td>
    						<td>B</td>
    						<td>C</td>
    						<td>D</td>
    					</tr>
    					<tr>
    						<td><input class="lilun_input" type="text"/></td>
    						<td><input class="lilun_input" type="text"/></td>
    						<td><input class="lilun_input" type="text"/></td>
    						<td><input class="lilun_input" type="text"/></td>
    					</tr>
    				</tbody>
    			</table>
    		</div>
    	</div>
    	<div class="">
    		<!---what---->
    		<table class="is_nottable">
    			<thead>
    				<tr>
    					<td style="width: 10%;"></td>
    					<td style="width: 10%;">IS是</td>
    					<td style="width: 10%;">IS NOT 不是</td>
    					<td style="width: 10%;">Need Information</td>
    					<td></td>
    					<td></td>
    					<td></td>
    					<td></td>
    					<td style="width: 66px;"></td>
    				</tr>
    			</thead>
    			<tbody>
    				<tr>
    					<td colspan="1000"><span>WHAT</span><a class="is_zengbtn" href="javascript:;">新增</a></td>
    				</tr>
    				<tr>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    					    <div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td><a class="is_scbtn" href="javascript:;">删除</a></td>
    				</tr>
    				<tr>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    					    <div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td><a class="is_scbtn" href="javascript:;">删除</a></td>
    				</tr>
    			</tbody>
    			<tbody>
    				<tr>
    					<td colspan="1000"><span>WHAT</span><a class="is_zengbtn" href="javascript:;">新增</a></td>
    				</tr>
    				<tr>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    					    <div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td><a class="is_scbtn" href="javascript:;">删除</a></td>
    				</tr>
    				<tr>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    					    <div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td><a class="is_scbtn" href="javascript:;">删除</a></td>
    				</tr>
    			</tbody>
    			<tbody>
    				<tr>
    					<td colspan="1000"><span>WHAT</span><a class="is_zengbtn" href="javascript:;">新增</a></td>
    				</tr>
    				<tr>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    					    <div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td><a class="is_scbtn" href="javascript:;">删除</a></td>
    				</tr>
    				<tr>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    					    <div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td><a class="is_scbtn" href="javascript:;">删除</a></td>
    				</tr>
    			</tbody>
    			<tbody>
    				<tr>
    					<td colspan="1000"><span>WHAT</span><a class="is_zengbtn" href="javascript:;">新增</a></td>
    				</tr>
    				<tr>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    					    <div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td><a class="is_scbtn" href="javascript:;">删除</a></td>
    				</tr>
    				<tr>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td><input class="is_input" type="text"/></td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    						<div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td>
    					    <div class="is_selebox">
    							<input type="hidden" class="hahin" pw-activebox=""/><!--隐藏的输入框-->
    							<div class="is_seletit">请选择</div>
    							<ul class="is_seleul dis">
    								<li pw-active="1"><a class="is_notbtna is_nob" href="javascript:;"></a></li>
    								<li pw-active="2"><a class="is_notbtna is_noc" href="javascript:;"></a></li>
    							</ul>
    						</div>
    					</td>
    					<td><a class="is_scbtn" href="javascript:;">删除</a></td>
    				</tr>
    			</tbody>
    		</table>
    		
    		<button class="is_not_ti" type="button">提交</button>
    		<div class="beizhu clearfix">
    			<div class="beizhutit">备注：</div>
    			<ul class="beizhuul clearfix"><li>Theory Holds with Is/Is-Not info</li><li>Theory Fails with Is/Is-Not info</li><li>Need more Info for Theory compare</li></ul>
    		</div>
    	</div>
    	
    </div>
    
</div>
<script>
    $(function(){
    	//下拉点击事件
    	$(document).on("click",".is_selebox",function(event){
    		event.stopPropagation();
    		$(this).children(".is_seleul").toggleClass("dis");
    		//解决下拉框重复出现问题
    		$(this).parents("td").siblings("td").find(".is_seleul").addClass("dis").parents("tr").siblings("tr").find(".is_seleul").addClass("dis").parents("tbody").siblings("tbody").find(".is_seleul").addClass("dis");
    	})
    	//下拉选择
    	$(document).on("click",".is_seleul li",function(){
    		var a=$(this).html();
    		$(this).parent().siblings(".is_seletit").html(a);
    		//点击得到1还是2，（1,2赋值给隐藏的输入框，用于区别显示加号或减号，还可以用于判断G）
    		var zhi=$(this).attr("pw-active");
    		$(this).parent("ul").siblings(".hahin").attr("pw-activebox",zhi);
    	})
    	//点击任何地方都隐藏选择框
    	$(document).click(function(){
    		$(".is_seleul").addClass("dis");
    	})
    	//加载页面的时候判断输入框里的值是1还是2，1为加号，2为减号。
    	$(".is_nottable .hahin").each(function(){
    		if($(this).attr("pw-activebox")==1){
    			$(this).siblings(".is_seletit").html('<a class="is_notbtna is_nob" href="javascript:;"></a>');//加号
    		}else if($(this).attr("pw-activebox")==2){
    			$(this).siblings(".is_seletit").html('<a class="is_notbtna is_noc" href="javascript:;"></a>');//减号
    		}
    	})
    	var scbtn;//定义删除按钮（用于判断哪个删除按钮点击）
    	//横排删除事件
    	var sca;
    	$(document).on("click",".is_scbtn",function(){
    		sca=$(this).parents("tr").index();
    		scbtn=1;
    		alert3("确定删除？");
    	})
    	$(document).on("click",".quebtn3",function(){
    		//横排删除事件
    		if(scbtn==1){
    			$(".is_nottable tbody tr").eq(sca).remove();
    			alertbg_g();
	            $(this).parents(".alert_1").remove();//删除弹窗
    		}else if(scbtn==2){//列删除事件
    			//检测列删除
	    		var j=$(".lilun_tab tbody tr").length;
	    		for(var i=0;i<j;i++){
	    			$(".lilun_tab tbody tr").eq(i).children("td").eq(a).remove();
	    		}
	    		//is not列删除
	    		var k=$(".is_nottable tr").length;
	    		for(var i=0;i<k;i++){
	    			$(".is_nottable tr").eq(i).children("td").eq(a+4).remove();
	    		}
	    		alertbg_g();
	            $(this).parents(".alert_1").remove();//删除弹窗
    		}
    	})
    	//横排新增事件
    	$(document).on("click",".is_zengbtn",function(){
    		var st=$(".lilun_tab tbody tr").eq(1).children("td").length;//解决列增加过后的问题
    		var strings="";
    		strings+='<tr>';
    		strings+='<td><input class="is_input"type="text"/></td><td><input class="is_input"type="text"/></td><td><input class="is_input"type="text"/></td><td><input class="is_input"type="text"/></td>';
    		//根据列数循环多少次
    		for(var i=0;i<st;i++){
    		    strings+='<td><div class="is_selebox"><input type="hidden"class="hahin"pw-activebox=""/><!--隐藏的输入框--><div class="is_seletit">请选择</div><ul class="is_seleul dis"><li pw-active="1"><a class="is_notbtna is_nob"href="javascript:;"></a></li><li pw-active="2"><a class="is_notbtna is_noc"href="javascript:;"></a></li></ul></div></td>';
    		}
    		strings+='<td><a class="is_scbtn" href="javascript:;">删除</a></td>';
    		strings+='</tr>';
    		$(this).parents("tbody").append(strings);
    	})
    	//列删除事件
    	var a;
    	$(document).on("click",".lilun_scbtn",function(){
    		scbtn=2;
    		a=$(this).parent().index();//得到下标
    		alert3("确定删除？");
    	})
    	//排序数组(检测表会用到)
    	var arrays=["E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    	//列新增事件
    	var ss=0;
    	$(document).on("click",".lilun_zjbtn",function(){
    		//检测表字符串
    		var stra='<td><a class="lilun_scbtn" href="javascript:;">删除</a></td>';
    		var strb='<td>'+arrays[ss]+'</td>';
    		var strc='<td><input class="lilun_input" type="text"/></td>';
    		//检测表增加
    		$(".lilun_zjbtn").parent("td").before(stra);
    		$(".lilun_tab tbody tr").eq(1).append(strb);
    		$(".lilun_tab tbody tr").eq(2).append(strc);
    		ss++;
    		//is not表字符串
    		var strd='<td></td>';
    		var stre='<td><div class="is_selebox"><input type="hidden"class="hahin"pw-activebox=""/><!--隐藏的输入框--><div class="is_seletit">请选择</div><ul class="is_seleul dis"><li pw-active="1"><a class="is_notbtna is_nob"href="javascript:;"></a></li><li pw-active="2"><a class="is_notbtna is_noc"href="javascript:;"></a></li></ul></div></td>';
    		//is not表添加
    		$(".is_nottable thead tr td:last").before(strd);
    		var sd=$(".is_nottable tbody tr").length;//得到长度
    		for(var i=1;i<sd;i++){
    			$(".is_nottable tbody tr").eq(i).children("td:last").before(stre);
    		}
    	})
    })
</script>
</body>
</html>