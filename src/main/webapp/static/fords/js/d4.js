$(function(){
	//责任人选择
	$(document).on("click",".zerenren_tab li",function() {
		var a = $(this).children("a").html();
		$(this).parents(".input-group").children(".zerenren_tabin").val(a);
	})
	
    //发生原因新增click
    $(document).on("click",".zjbtna",function(){
    	var a= $(".jinji_boxa .jinji_div").length + 1;
    	var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
		var str='<div class="jinji_div"><div class="xuhao_bocn">序号-<span>'+a+'</span></div><div class="neibka_bor"><form action=""><input type="hidden" class="type" name="type" value="1"><input type="hidden" name="CAUSED4_ID" value="" class="CAUSED4_ID"><input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="'+CLIENT_PROBLEM_COLLECTION_ID+'"/><div class="jinjiul"><div class="container"style="width: 100%;"><div class="row"><div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="jinjiula"><p class="jinjiultit">是否重复发生</p><div class="jinjiuze"><div class="shitou"><label><input type="checkbox"value="1" name="ISREPEAT"/><span>是</span></label><label><input type="checkbox"value="0" name="ISREPEAT"/><span>否</span></label></div></div></div></div><div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="jinjiulb"><p class="jinjiultit">发生次数</p><div class="jinjiuze"><input type="number"class="jihuatame form-control" name="occurrences"></div></div></div><div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="jinjiulc jinjiulb"><p class="jinjiultit">发生原因分类</p><div class="jinjiuze"><select  name="causes"><option value="1">发生原因1</option><option value="2">发生原因2</option><option value="3">发生原因3</option></select></div></div></div><div class="col-xs-6 col-sm-4 col-md-3 col-lg-2"><div class="jinjiulc jinjiulb"><p class="jinjiultit">贡献</p><div class="jinjiuze"><input type="text" name="contribution"/></div></div></div><div class="col-xs-12 col-sm-8 col-md-12 col-lg-4"><div class="jinjiule jinjiulb"><input type="hidden" name="ATTACHMENT"><div class="jinjiultit2">上传附件<input id="myfile'+a+'" name="myfile'+a+'" class="myfile'+a+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div><div class="jinjiuze"><div class="jinjiddi" id="myfile'+a+'a"></div></div></div></div></div><div class="row"><div class="col-md-12 col-lg-12"><div class="jinjiuld jinjiulb"><p class="jinjiultit">发生原因</p><div class="jinjiuze"><textarea name="OCCUR"></textarea></div></div></div></div></div></div><div class="jinji_divtitbot"><button class="pull-right zjbtna"type="button">新增+</button><button class="pull-right jinjiscbtn"type="button">删除</button><button class="pull-right jiushibtnxiu"type="button">保存</button></div></form></div></div>';
		$(".jinji_boxa").children(".d0_jinbox").before(str);//在验证证实前面增加
    });
    //发生原因删除按钮
	$(".jinji_boxa").on("click", ".jinjiscbtn", function() {
		var tis = $(this);
		var s=parseInt($(this).parents(".jinji_div").find(".xuhao_bocn span").html())-1;
		var ins=$(".jinji_boxa>.jinji_div").length;
		for(s;s<ins;s++){
			$(".jinji_boxa>.jinji_div").eq(s).find(".xuhao_bocn span").html(s);
		}
		$(this).parents(".jinji_div").remove();
		if($(".jinji_boxa>.jinji_div").length == 0){
			$(".npaicbxz .zjbtna").click();
		}
	})
	
    //逃逸点新增click
    $(document).on("click",".zjbtnb",function(){
    	var a= $(".jinji_boxb .jinji_div").length + 1;
    	var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
		var str='<div class="jinji_div"><div class="xuhao_bocn">序号-<span>'+a+'</span></div><div class="neibka_bor"><form action=""><input type="hidden" class="type" name="type" value="2"><input type="hidden" name="CAUSED4_ID" value="" class="CAUSED4_ID"><input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="'+CLIENT_PROBLEM_COLLECTION_ID+'"/><div class="jinjiul"><div class="container"style="width: 100%;"><div class="row"><div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="jinjiuld jinjiulb"><p class="jinjiultit">逃逸点</p><div class="jinjiuze"><textarea name="ESCAPE"></textarea></div></div></div><div class="col-xs-6 col-sm-6 col-md-4 col-lg-4"><div class="jinjiule jinjiulb"> <input type="hidden" name="ATTACHMENT"><div class="jinjiultit2">上传附件<input id="myfiles'+a+'" name="myfiles'+a+'" class="myfiles'+a+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div><div class="jinjiuze"><div class="jinjiddi" id="myfiles'+a+'a"></div></div></div></div><div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"><div class="jinjiulc jinjiulb"><p class="jinjiultit">贡献</p><div class="jinjiuze"><input type="text"  name="contribution"/></div></div></div></div></div></div><div class="jinji_divtitbot"><button class="pull-right zjbtnb"type="button">新增+</button><button class="pull-right jinjiscbtn"type="button">删除</button><button class="pull-right jiushibtnxiu"type="button">保存</button></div></form></div></div>';
		$(".jinji_boxb").children(".d0_jinbox").before(str);//在验证证实前面增加
    });
    //逃逸点删除按钮
	$(".jinji_boxb").on("click", ".jinjiscbtn", function() {
		var tis = $(this);
		var s=parseInt($(this).parents(".jinji_div").find(".xuhao_bocn span").html())-1;
		var ins=$(".jinji_boxb>.jinji_div").length;
		for(s;s<ins;s++){
			$(".jinji_boxb>.jinji_div").eq(s).find(".xuhao_bocn span").html(s);
		}
		$(this).parents(".jinji_div").remove();
		if($(".jinji_boxb>.jinji_div").length == 0){
			$(".npaicbxz .zjbtnb").click();
		}
	})
	//体系新增click
    $(document).on("click",".zjbtnc",function(){
    	var a= $(".jinji_boxc .jinji_div").length + 1;
    	var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
		var str='<div class="jinji_div"><div class="xuhao_bocn">序号-<span>'+a+'</span></div><div class="neibka_bor"><form action=""><input type="hidden" class="type" name="type" value="3"><input type="hidden" name="CAUSED4_ID" value="" class="CAUSED4_ID"><input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="'+CLIENT_PROBLEM_COLLECTION_ID+'"/><div class="jinjiul"><div class="container"style="width: 100%;"><div class="row"><div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="jinjiuld jinjiulb"><p class="jinjiultit">体系原因</p><div class="jinjiuze"><textarea name="SYSTEMS"></textarea></div></div></div><div class="col-xs-6 col-sm-6 col-md-4 col-lg-4"><div class="jinjiule jinjiulb"> <input type="hidden" name="ATTACHMENT"><div class="jinjiultit2">上传附件<input id="myfilec'+a+'" name="myfilec'+a+'" class="myfilec'+a+'" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div><div class="jinjiuze"><div class="jinjiddi" id="myfilec'+a+'a"></div></div></div></div><div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"><div class="jinjiulc jinjiulb"><p class="jinjiultit">贡献</p><div class="jinjiuze"><input type="text" name="contribution"/></div></div></div></div></div></div><div class="jinji_divtitbot"><button class="pull-right zjbtnc"type="button">新增+</button><button class="pull-right jinjiscbtn"type="button">删除</button><button class="pull-right jiushibtnxiu"type="button">保存</button></div></form></div></div>';
		$(".jinji_boxc").children(".d0_jinbox").before(str);//在验证证实前面增加
    });
    //体系删除按钮
	$(".jinji_boxc").on("click", ".jinjiscbtn", function() {
		var tis = $(this);
		var s=parseInt($(this).parents(".jinji_div").find(".xuhao_bocn span").html())-1;
		var ins=$(".jinji_boxc>.jinji_div").length;
		for(s;s<ins;s++){
			$(".jinji_boxc>.jinji_div").eq(s).find(".xuhao_bocn span").html(s);
		}
		$(this).parents(".jinji_div").remove();
		if($(".jinji_boxc>.jinji_div").length == 0){
			$(".npaicbxz .zjbtnc").click();
		}
	})
	
	//根本原因判断是否
	$(".yanyun").on("change",".shitou input",function(){
		var a=$(this).val();
		if(a==1){
			if($(this).is(":checked")){
				$(this).parent().siblings("label").children("input").removeAttr("checked");
			}else{
				
			}
		}else if(a==0){
			if($(this).is(":checked")){
				$(this).parent().siblings("label").children("input").removeAttr("checked");
			}else{
				
			}
		}
	})
	
	//发生原因判断是否（开始的时候）
	$(".jinji_boxa .jinji_div").each(function(){
		if($(this).find(".shitou input:checked").val()==1){
			
		}else{
			
		}
	})
	//发生原因判断是否
	$(".jinji_boxa").on("change",".shitou input",function(){
		var a=$(this).val();
		if(a==1){
			if($(this).is(":checked")){
				$(this).parent().siblings("label").children("input").removeAttr("checked");
				//$(this).parents(".jinjiula").parent().next().removeClass("dis");//选择是显示人数
			}else{
				
			}
		}else if(a==0){
			if($(this).is(":checked")){
				$(this).parent().siblings("label").children("input").removeAttr("checked");
				//$(this).parents(".jinjiula").parent().next().addClass("dis");//选择否隐藏人数
			}else{
				
			}
		}
	})
	
    //附件删除
    $(document).on("click",".jinjiudddemr",function(){
        $(this).parents(".jinjiuddd").remove();
    });
   
});