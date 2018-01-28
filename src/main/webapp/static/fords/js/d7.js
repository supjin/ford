$(function() {
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
	//预防措施新增click
    $(document).on("click",".zjbtna",function(){
    	getNowFormatDate();
    	var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
		var FIRSTDEPARTMENT = $("#FIRSTDEPARTMENT").val();
		var FIRNAME = $("#FIRNAME").val();
		var RESPONSIBLE = $("#RESPONSIBLE").val();
    	var a= $(".jinji_boxa .jinji_div").length + 1;
		var str='<div class="jinji_div"><div class="xuhao_bocn">序号-<span>'+a+'</span></div><div class="neibka_bor"><form action=""><input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value=""><input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value = "'+CLIENT_PROBLEM_COLLECTION_ID+'"><input type="hidden" name="PREAVENTTYPE" value="1"><div class="jinjiul"><div class="container"style="width: 100%;"><div class="row"><div class="col-xs-6 col-sm-4 col-md-4 col-lg-3"><div class="jinjiula"><p class="jinjiultit">责任人</p><div class="jinjiuze"><div class="baidssb"><input type="hidden" class="responsese" name="RESPONSIBLE" value="'+RESPONSIBLE+'"/><input class="sowe_lse form-control" maxlength="6" value="'+FIRNAME+'"  type="text"/><div class="taocen_cn"><ul class="houxuciu"></ul></div></div></div></div></div><div class="col-xs-6 col-sm-4 col-md-4 col-lg-3"><div class="jinjiulb"><p class="jinjiultit">计划时间</p><div class="jinjiuze"><input type="date"value="'+currentdate+'"class="jihuatame form-control" name="DOTIME"></div></div></div><div class="col-xs-6 col-sm-4 col-md-4 col-lg-3"><div class="jinjiulb"><p class="jinjiultit">执行时间</p><div class="jinjiuze"><input type="date"value="'+currentdate+'"class="jihuatame form-control" name="EXECUTIONDATE"></div></div></div><div class="col-xs-6 col-sm-12 col-md-12 col-lg-3"><div class="jinjiule jinjiulb"><input type="hidden" name="ATTACHMENTNURL"><div class="jinjiultit2">上传附件<input id="myfiles'+a+'" name="myfiles'+a+'" class="myfiles'+a+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div><div class="jinjiuze"><div class="jinjiddi" id="myfiles'+a+'a"></div></div></div></div></div><div class="row"><div class="col-md-12 col-lg-12"><div class="jinjiuld jinjiulb"><p class="jinjiultit">预防措施</p><div class="jinjiuze"><textarea name="MEASURESNAME" > </textarea></div></div></div></div></div></div><div class="jinji_divtitbot"><button class="pull-right zjbtna"type="button">新增+</button><button class="pull-right jinjiscbtn"type="button">删除</button><button class="pull-right jiushibtnxiu"type="button">保存</button></div></form></div></div>';
		$(".jinji_boxa").children(".d0_jinbox").before(str);//在验证证实前面增加
    });
    //预防措施删除按钮
	$(".jinji_boxa").on("click", ".jinjiscbtn", function() {
		var tis = $(this);
		var s=parseInt($(this).parents(".jinji_div").find(".xuhao_bocn span").html())-1;
		var ins=$(".jinji_boxa>.jinji_div").length;
		for(s;s<ins;s++){
			$(".jinji_boxa>.jinji_div").eq(s).find(".xuhao_bocn span").html(s);
		}
		$(this).parents(".jinji_div").remove();
		if($(".jinji_boxa>.jinji_div").length == 0){
			$(".jinji_box .zjbtna").click();
		}
	})
	
	//////体制整改预防措施增加按钮
	$(document).on("click",".zjbtnb",function(){
		var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
		var FIRSTDEPARTMENT = $("#FIRSTDEPARTMENT").val();
		var FIRNAME = $("#FIRNAME").val();
		var RESPONSIBLE = $("#RESPONSIBLE").val();
		getNowFormatDate();
    	var a= $(".jinji_boxb .jinji_div").length + 1;
		var str='<div class="jinji_div"><div class="xuhao_bocn">序号-<span>'+a+'</span></div><div class="neibka_bor"><form action=""><input type="hidden" name="MEASURES_MESSAGE_PREVENT_ID" value=""><input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value = "'+CLIENT_PROBLEM_COLLECTION_ID+'"><input type="hidden" name="PREAVENTTYPE" value="2"><div class="jinjiul"><div class="container"style="width: 100%;"><div class="row"><div class="col-xs-6 col-sm-4 col-md-4 col-lg-3"><div class="jinjiula"><p class="jinjiultit">责任人</p><div class="jinjiuze"><div class="baidssb"><input type="hidden" class="responsese" name="RESPONSIBLE" value="'+RESPONSIBLE+'"/><input class="sowe_lse form-control" maxlength="6" value="'+FIRNAME+'"  type="text"/><div class="taocen_cn"><ul class="houxuciu"></ul></div></div></div></div></div><div class="col-xs-6 col-sm-4 col-md-4 col-lg-3"><div class="jinjiulb"><p class="jinjiultit">计划时间</p><div class="jinjiuze"><input type="date"class="jihuatame form-control" value="'+currentdate+'" name="DOTIME"></div></div></div><div class="col-xs-6 col-sm-4 col-md-4 col-lg-3"><div class="jinjiulb"><p class="jinjiultit">执行时间</p><div class="jinjiuze"><input type="date"value="'+currentdate+'"class="jihuatame form-control" name="EXECUTIONDATE"></div></div></div><div class="col-xs-6 col-sm-12 col-md-12 col-lg-3"><div class="jinjiule jinjiulb"><input type="hidden" name="ATTACHMENTNURL"><div class="jinjiultit2">上传附件<input id="myfile'+a+'" name="myfile'+a+'" class="myfile'+a+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div><div class="jinjiuze"><div class="jinjiddi" id="myfile'+a+'a"></div></div></div></div></div></div><div class="row"><div class="col-md-12 col-lg-12"><div class="jinjiuld jinjiulb"><p class="jinjiultit">体制整改预防措施</p><div class="jinjiuze"><textarea name="MEASURESNAME"></textarea></div></div></div></div></div><div class="jinji_divtitbot"><button class="pull-right zjbtnb"type="button">新增+</button><button class="pull-right jinjiscbtn"type="button">删除</button><button class="pull-right jiushibtnxiu"type="button">保存</button></div></form></div></div>';
		$(".jinji_boxb").children(".d0_jinbox").before(str);//在验证证实前面增加
    });
    //体制整改预预防措施删除按钮
	$(".jinji_boxb").on("click", ".jinjiscbtn", function() {
		var tis = $(this);
		var s=parseInt($(this).parents(".jinji_div").find(".xuhao_bocn span").html())-1;
		var ins=$(".jinji_boxb>.jinji_div").length;
		for(s;s<ins;s++){
			$(".jinji_boxb>.jinji_div").eq(s).find(".xuhao_bocn span").html(s);
		}
		$(this).parents(".jinji_div").remove();
		if($(".jinji_boxb>.jinji_div").length == 0){
			$(".jinji_box .zjbtnb").click();
		}
	})
})