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
	var currentdate;
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
		$(".jihuatame").val(currentdate)
		return currentdate;
	}
	//增加按钮
	$(".jinji_box").on("click", ".zjbtn", function() {
		var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
		var FIRNAME = $("#FIRNAME").val();
		var RESPONSIBLE = $("#RESPONSIBLE").val();
		getNowFormatDate();
		var a= $(".jinji_box .jinji_div").length + 1;
		var str='<div class="jinji_div"><div class="xuhao_bocn">序号-<span>'+a+'</span></div><div class="neibka_bor"><form action=""><input type="hidden" name="MEASURESD5_ID" > 	<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"  value="'+CLIENT_PROBLEM_COLLECTION_ID+'"/><div class="jinjiul"><div class="container"style="width: 100%;"><div class="row"><div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><div class="jinjiula"><p class="jinjiultit">责任人</p><div class="jinjiuze"><div class="baidssb"><input type="hidden" class="responsese" name="PRINCIPALNAME" value="'+RESPONSIBLE+'"/><input class="sowe_lse form-control" maxlength="6"  value="'+FIRNAME+'"  type="text"/><div class="taocen_cn"><ul class="houxuciu"></ul></div></div></div></div></div><div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><div class="jinjiulb"><p class="jinjiultit">计划时间</p><div class="jinjiuze"><input type="date"value="'+currentdate+'"class="jihuatame form-control" name="schedule_time"></div></div></div><div class="col-xs-6 col-sm-4 col-md-3 col-lg-3"><div class="jinjiulc jinjiulb"><p class="jinjiultit">有效率</p><div class="jinjiuze"><select name="efficient"><option value="1">25%</option><option value="2">50%</option><option value="3">75%</option><option value="4">100%</option></select></div></div></div><div class="col-xs-6 col-sm-12 col-md-3 col-lg-3"><div class="jinjiule jinjiulb"> <input type="hidden" name="ATTACHMENT"><div class="jinjiultit2">上传附件<input id="myfile'+a+'" name="myfile'+a+'" class="myfile'+a+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div><div class="jinjiuze"><div class="jinjiddi" id="myfile'+a+'a"></div></div></div></div></div><div class="row"><div class="col-md-12 col-lg-12"><div class="jinjiuld jinjiulb"><p class="jinjiultit">永久措施</p><div class="jinjiuze"><textarea name="MEASURES"></textarea></div></div></div></div></div></div><div class="jinji_divtitbot"><button class="pull-right zjbtn"type="button">新增+</button><button class="pull-right jinjiscbtn"type="button">删除</button><button class="pull-right jiushibtnxiu"type="button">保存</button></div></form></div></div>';
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