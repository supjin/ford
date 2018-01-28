$(function() {
		//点击删除文件
	$(".jinji_box").on("click", ".jinjiudddemr", function() {
			var s = $(this).parent().index();
			$(this).parent().remove();
		})
		//责任人选择
	$(document).on("click",".zerenren_tab li",function() {
		var a = $(this).children("a").html();
		$(this).parents(".input-group").children(".zerenren_tabin").val(a);
	})
	//获取今天时间
	var currentdate;
	var pw_minl;
	var pw_max;
	getNowFormatDate();
	//获取当前时间，格式YYYY-MM-DD
	function getNowFormatDate() {
		var date = new Date();
		var seperator1 = "-";
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		currentdate = year + seperator1 + month + seperator1 + strDate;
		$(".jihuatame").val(currentdate);
		//$(".pw_datea").prop("min",currentdate);//判断
		//$(".pw_dateb").prop("max",currentdate);//
		return currentdate;
	}
	//增加按钮
	$(".jinji_box").on("click", ".zjbtn", function() {
		//getNowFormatDate();
		var a= $(".jinji_box .jinji_div").length + 1;
		//时间插件会用到如下
		var b=$(".jinji_box .laydate-icon").length;
		var str='<div class="jinji_div"><div class="xuhao_bocn">序号-<span>'+a+'</span></div><div class="neibka_bor"><form action=""><div class="jinjiul"><div class="container"style="width: 100%;"><div class="row"><div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="jinjiula"><p class="jinjiultit">责任人：</p><div class="jinjiuze"><div class="input-group"><input type="text"id="text"class="zerenren_tabin form-control"><div class="input-group-btn"><button type="button"class="btn btn-default dropdown-toggle"data-toggle="dropdown"><span class="jinjiids glyphicon glyphicon-user"></span></button><ul class="zerenren_tab dropdown-menu pull-right"><li><a href="javascript:;">蒋忠良</a></li><li><a href="javascript:;">蓝侨</a></li><li><a href="javascript:;">蓝裘千仞</a></li></ul></div></div></div></div></div><div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="jinjiulb"><p class="jinjiultit">计划时间：</p><div class="jinjiuze"><input type="text"value="'+currentdate+'"class="jihuatame form-control laydate-icon" id="aaa'+(b+1)+'"></div></div></div><div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="jinjiulb"><p class="jinjiultit">执行时间：</p><div class="jinjiuze"><input type="text"value="'+currentdate+'"class="jihuatame laydate-icon form-control" id="aaa'+(b+1+1)+'"></div></div></div><div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="jinjiulc jinjiulb"><p class="jinjiultit">有效率：</p><div class="jinjiuze"><select><option>10%</option><option>20%</option></select></div></div></div><div class="col-xs-12 col-sm-8 col-md-12 col-lg-4"><div class="jinjiule jinjiulb"><div class="jinjiultit2">上传附件<input type="file"/></div><div class="jinjiuze"><div class="jinjiddi"><div class="jinjiuddd"><em class="jinjiudddeml"><img src="img/wenjian.png"/></em><div class="jinjiudtits"><a href="javascript:;"title="时间的客户刷都结束了文档1时间的客户刷都结束了文档1">时间的客户刷都结束了文档1时间的客户刷都结束了文档1.doc</a></div><em class="jinjiudddemr"><img src="img/guanbi.png"/></em></div><div class="jinjiuddd"><em class="jinjiudddeml"><img src="img/wenjian.png"/></em><div class="jinjiudtits"><a href="javascript:;"title="时间的客户刷都结束了文档1">时间的客户刷都结束了文档1.doc</a></div><em class="jinjiudddemr"><img src="img/guanbi.png"/></em></div><div class="jinjiuddd"><em class="jinjiudddeml"><img src="img/wenjian.png"/></em><div class="jinjiudtits"><a href="javascript:;"title="时间的客户刷都结束了文档1">时间的客户刷都结束了文档1.doc</a></div><em class="jinjiudddemr"><img src="img/guanbi.png"/></em></div></div></div></div></div></div><div class="row"><div class="col-md-12 col-lg-12"><div class="jinjiuld jinjiulb"><p class="jinjiultit">应急反应：</p><div class="jinjiuze"><textarea></textarea></div></div></div></div></div></div><div class="jinji_divtitbot"><button class="pull-right zjbtn"type="button">新增+</button><button class="pull-right jinjiscbtn"type="button">删除</button><button class="pull-right jiushibtnxiu"type="button">保存</button></div></form></div></div>';
		$(".jinji_box").append(str);
	})
    //删除按钮
	$(".jinji_box").on("click", ".jinjiscbtn", function() {
		var tis = $(this);
		var s=parseInt($(this).parents(".jinji_div").find(".xuhao_bocn span").html())-1;
		var ins=$(".jinji_box>.jinji_div").length;
		for(s;s<ins;s++){
			$(".jinji_div").eq(s).find(".xuhao_bocn span").html(s);
		}
		$(this).parents(".jinji_div").remove();
		if($(".jinji_div").length == 0){
			$(".npaicbxz .zjbtn").click();
		}
	})
})
