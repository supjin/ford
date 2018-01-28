$(function() {
	//活动回顾效果
	$(".actityribul>li").mouseover(function(){
		$(this).find("a").addClass("discolo").parents("li").siblings("li").find("a").removeClass("discolo");
		$(this).children(".ulliimgg").removeClass("dis").parent("li").siblings("li").children(".ulliimgg").addClass("dis");
	})
	//报名显示隐藏
	$(".actibtt").on("click", function() {
		$(".actibao").removeClass("dis");
		$(".baomin").show();
		$(".tiscg").hide();
	})
	$(".baotop>img").on("click", function() {
		$(".actibao").addClass("dis");

	})
	//评论添加
	/*$(".fabtn").on("click",function(){
		//得到评论内容a
		var a=$(".acitextarea").val();
		//判断内容是否为空
		if(a==""){
			$(".tishi").text("*评论区不能为空")
		}else{
			$(".tishi").text("")
			var strs="<div class='appt'><div class='appta'><p>用户名用户名</p><p>于2017-05-15-12.33.45：</p></div><div class='apptb'>"+a+"</div><p class='apptc'><a href='javascript:;'>点赞</a>(0)</p><div class='clex'></div></div>"
	        $(".appbox").append(strs);
	        $(".acitextarea").val("");
		}

	})*/

	/*$(".baobtn").on("click",function(){
		$(".baomin").hide();
		$(".tiscg").show();
	});*/

	$(".zhidaol").on("click",function(){
		$(".actibao").addClass("dis")
	});


});