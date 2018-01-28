$(function() {
	//缩放右边菜单
	/*var flog = true;
	$(".tight_guanbi").click(function() {
			if (flog) {
				$(".right_zhineng").css("right", "-250px");
				$(".oiswen_box").css("margin-right", "0px");
				$(this).children("span").removeClass("icon-angle-right").addClass("icon-angle-left");
				flog = false;
			} else {
				$(".right_zhineng").css("right", "-1px");
				/*$(".oiswen_box").css("margin-right", "280px");
				$(this).children("span").removeClass("icon-angle-left").addClass("icon-angle-right");
				flog = true;
			}
		})*/
	$(".tight_guanbi").click(function(){
		$(this).parent(".right_zhineng").toggleClass("right_zhineng_activ");
		$(".oiswen_box").toggleClass("oiswen_boxavite");
	})
	
	$(document).on("click",".d_divul li a",function(){
	if(this.href == "javascript:;"){
		alert2("上一步未完成，请先完成");
	}
})
})