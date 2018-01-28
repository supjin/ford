 $(window).resize(function() {
 	var hei = $(this).height(); //得到网页高度
 	$(".index_main").height(hei - 50 + "px"); //赋予内容部分高度
 })
 $(function() {
 	var hei = $(this).height(); //得到网页高度
 	$(".index_main").height(hei - 50 + "px"); //赋予内容部分高度

 	//缩放左菜单导航
 	var flog = true;
 	$(".index_topcai").click(function() {
 		if (flog) {
 			$(".index_navbox").css("left", "-204px");
 			$(".index_box").css("margin-left", "0px");
 			flog = false;
 		} else {
 			$(".index_navbox").css("left", "0px");
 			$(".index_box").css("margin-left", "204px");
 			flog = true;
 		}
 	})
 	//左导航
 	$(".index_navlebox a").click(function() {
 		$(this).siblings(".index_namune").slideToggle();
 		$(this).children(".index_you").toggleClass("icon-angle-down");
 	})
 	$(".index_navlebox>li").click(function() {
 		$(this).addClass("index_navactive").siblings("li").removeClass("index_navactive").children(".index_namune").css("display","none").children("li").removeClass("index_navactive").parents("li").find(".index_you").removeClass("icon-angle-down");
 	})
 	$(".index_namune>li").click(function() {
 		$(this).addClass("index_navactive").siblings("li").removeClass("index_navactive");
 	})
 	//左导航js切换子页面----a标签里的href值赋值给iframe的src
 	$(".index_navlebox").on("click","a",function(){
 		var ai=$(this).attr("data-dizhi");
 		$(".index_main iframe").attr("src",ai);
 	})
 	
 	
 	
 })