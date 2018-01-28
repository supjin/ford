<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>d2_is ont</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/isnot.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/isnot2.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 15px;">
      <form action="j">
<div class="oiswen_box oiswen_boxavite">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">Is & Is Not</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">0公里问题</a><span>/</span><a href="javascript:;">d2</a>
            </div>
        </div>
    </div>
    <!----Is & Is Not---->

    <div class="is_notbox">
    	<ul class="is_nottopul">
    		<li>5W/2H's</li>
    		<li>是什么</li>
    		<li>不是什么</li>
    		<li>备注</li>
    	</ul>
    	<div class="is_notboxhaha">
	    	<div class="is_not2bot">
	    		<div class="is_not2tit">
	    			<p>发生了什么问题？</p>
	    			<p>What is the problem?</p>
	    		</div>
	    		<ul class="is_not2ul clearfix" id = "jjj">
	    			<li><input type="text" class="is_not2input" name = "good" /></li>
	    			<li><input type="text" class="is_not2input"name = "good" /></li>
	    			<li><input type="text" class="is_not2input"name = "good" /></li>
	    			<li><input type="text" class="is_not2input"name = "good" /></li>
	    		</ul>
	    	</div>
	    	<div class="is_not2bot">
	    		<div class="is_not2tit">
	    			<p>为什么是问题？</p>
	    			<p>Why is it a problem?</p>
	    		</div>
	    		<ul class="is_not2ul clearfix"  id="jjj">
	    			<li><input type="text" class="is_not2input" name = "good"/></li>
	    			<li><input type="text" class="is_not2input" name  = "good"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    		</ul>
	    	</div>
	    	<div class="is_not2bot">
	    		<div class="is_not2tit">
	    			<p>何时发生的？何时问题被提出的？</p>
	    			<p>When the problem happened? When was the problem created?</p>
	    		</div>
	    		<ul class="is_not2ul clearfix">
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    		</ul>
	    	</div>
	    	<div class="is_not2bot">
	    		<div class="is_not2tit">
	    			<p>谁发现的?谁提出的?</p>
					<p>Who found the problem? Who created the problem?</p>
	    		</div>
	    		<ul class="is_not2ul clearfix">
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    		</ul>
	    	</div>
	    	<div class="is_not2bot">
	    		<div class="is_not2tit">
	    			<p>在哪发现的?哪被提出的?</p>
					<p>Where was the problem found? Where was the created?</p>
	    		</div>
	    		<ul class="is_not2ul clearfix">
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    		</ul>
	    	</div>
	    	<div class="is_not2bot">
	    		<div class="is_not2tit">
	    			<p>如何被发现的?</p>
					<p>How the problem was found?</p>
	    		</div>
	    		<ul class="is_not2ul clearfix">
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    		</ul>
	    	</div>
	    	<div class="is_not2bot">
	    		<div class="is_not2tit">
	    			<p>数量是多少?</p>
					<p>How many?</p>
	    		</div>
	    		<ul class="is_not2ul clearfix">
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    		</ul>
	    	</div>
	    	<div class="is_not2bot">
	    		<div class="is_not2tit">
	    			<p><input type="text" placeholder="自定义" class="insttt"/><button class="is_not2btnsc" type="button">删除</button></p>
	    			<p></p>
	    		</div>
	    		<ul class="is_not2ul clearfix">
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    			<li><input type="text" class="is_not2input"/></li>
	    		</ul>
	    	</div>
    	</div>
    	<!---按钮-->
    	<div><a class="is_not2btn" href="javascript:;">新增</a></div>
    	<button class="is_not2bao" type="button" type="button">保存</button><button class="is_not2qu" type="button" type="button">取消</button></div>

</div>
</form>  


<script>
    $(function(){
    	//新增事件
    	$(document).on("click",".is_not2btn",function(){
    		var str='<div class="is_not2bot"><div class="is_not2tit"><p><input type="text"placeholder="自定义"class="insttt"/><button class="is_not2btnsc" type="button">删除</button></p><p></p></div><ul class="is_not2ul clearfix"><li><input type="text"class="is_not2input"/></li><li><input type="text"class="is_not2input"/></li><li><input type="text"class="is_not2input"/></li><li><input type="text"class="is_not2input"/></li></ul></div>';
    	    $(".is_notboxhaha").append(str);
    	})
    	//删除事件
    	$(document).on("click",".is_not2btnsc",function(){
    		$(this).parents(".is_not2bot").remove();
    	})
    	//取消返回d2
    	$(".is_not2qu").click(function(){
    		window.location.href="d2.html";
    	})
    	
    	$(document).on("click",".is_not2bao",function(){
    		var tis = $(this);
			var ud = {};
			$("form").each(function(index){
				var ts =$(this);
				
				
				
			})
    		
    	})
    })
</script>
</body>
</html>
