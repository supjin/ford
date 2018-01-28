$(function() {
	//轮播js
	//每个宽度
	var liwidth = $(".bannera").width();
	//个数
	var lilen = $(".bannerlis").children().length;
	//ul总宽度
	var ulwidth = lilen * liwidth;
	var luna = 0;
	var ina = 1;
	//小圆点循环
	for (var i = 0; i < lilen; i++) {
		$(".banindex").append("<span></span>");
	}
	$(".bannerlis").width(ulwidth + "px");
	$(".banindex>span").eq(0).addClass("addban");
	//右边
	$(".banri").click(function() {
			if (!$(".bannerlis").is(":animated")) {
				if (ina == lilen) {
					luna = 0;
					$(".bannerlis").animate({
						left: luna + "px"
					}, 300);
					ina = 1;
					$(".banindex>span").eq(ina - 1).addClass("addban").siblings().removeClass("addban");
				} else {
					luna -= liwidth;
					$(".bannerlis").animate({
						left: luna + "px"
					}, 300);
					ina++;
					$(".banindex>span").eq(ina - 1).addClass("addban").siblings().removeClass("addban");
				}
			} else {

			}

		});
		//左边
	$(".banle").click(function() {
			if (!$(".bannerlis").is(":animated")) {
				if (ina == 1) {
					luna = -(lilen - 1) * liwidth;
					$(".bannerlis").animate({
						left: luna + "px"
					}, 300);
					ina = 3;
					$(".banindex>span").eq(ina - 1).addClass("addban").siblings().removeClass("addban");
				} else {
					luna += liwidth;
					$(".bannerlis").animate({
						left: luna + "px"
					}, 300);
					ina--;
					$(".banindex>span").eq(ina - 1).addClass("addban").siblings().removeClass("addban");
				}
			} else {

			}

		});
		//小圆点几点切换
	$(".banindex>span").click(function() {
			ina = $(this).index() + 1;
			$(".banindex>span").eq(ina - 1).addClass("addban").siblings().removeClass("addban");
			luna = -(ina - 1) * liwidth;
			$(".bannerlis").animate({
				left: luna + "px"
			}, 300);
		});
		//轮播自动动
	var fata;
	fata = setInterval(function() {
		$(".banri").click();
	}, 4000);
	$(".banner").hover(function() {
		clearInterval(fata);
	}, function() {
		fata = setInterval(function() {
			$(".banri").click();
		}, 4000)
	});
	//左右按钮隐藏
	$(document).on("mouseover",".banner",function(){
		$(".banle,.banri").removeClass("dis")
	});
	$(document).on("mouseout",".banner",function(){
		$(".banle,.banri").addClass("dis")
	});

	//最新动态轮播
	setInterval(function(){
		$(".tuandw").animate({
			"margin-top": -($(".tongbox").height()) + "px"
		},800,function(){
			$(".tuandw").css("margin-top","0px");
			$(".tuandw").append($(".tuandw a").slice(0,2));
		})
	},5000);



});