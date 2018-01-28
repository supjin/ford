$(function() {
	//////头部导航事件
	$(".logotab>li").click(function() {
		$(this).addClass("top_active").siblings("li").removeClass("top_active");
	})
})