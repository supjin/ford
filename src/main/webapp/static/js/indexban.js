$(function() {

	//banner图
	$(".dbnnul li").css("width",$(".bannctn").css("width"));
	$(window).resize(function(){
		$(".dbnnul li").css("width",$(".bannctn").css("width"));
	});

	var now = 0,clc = true;
	var don = setInterval(function(){
	    now+=1;
	    if(now>2){
	        now=0;
	    }
	    $(".banbhct li").eq(now).addClass("dnow_li").siblings().removeClass("dnow_li");
	    $(".dbnnul").animate({
	        "margin-left":-$(".bannctn").width() + "px"
	    },500,function(){
	        $(".dbnnul").css("margin-left","0px");
	        $(".dbnnul").append($(".dbnnul li:first-child"));
	    });
	},5000);

	$(".banbhct").hover(function(){
	    clearInterval(don);
	},function(){
	    clearInterval(don);
	    don = setInterval(function(){
	        now+=1;
	        if(now>2){
	            now=0;
	        }
	        $(".banbhct li").eq(now).addClass("dnow_li").siblings().removeClass("dnow_li");
	        $(".dbnnul").animate({
	            "margin-left":-$(".bannctn").width() + "px"
	        },500,function(){
	            $(".dbnnul").css("margin-left","0px");
	            $(".dbnnul").append($(".dbnnul li:first-child"));
	        });
	    },5000);
	});
	$(".banbhct li").click(function(){
	    if(clc==true){
	        clc=false;
	        var tis = $(this).index();
	        var zds = tis - now;
	        $(this).addClass("dnow_li").siblings().removeClass("dnow_li");
	        if(tis>now){
	            now = tis;
	            $(".dbnnul").animate({
	                "margin-left": -zds * $(".bannctn").width() + "px"
	            },500,function(){
	                $(".dbnnul").css("margin-left","0px");
	                $(".dbnnul").append($(".dbnnul li").slice(0,zds));
	                clc=true;
	            });
	        }else{
	            now = tis;
	            $(".dbnnul").prepend($(".dbnnul li").slice(zds));
	            $(".dbnnul").css("margin-left",zds * $(".bannctn").width() + "px");
	            $(".dbnnul").animate({
	                "margin-left": "0px"
	            },500,function(){
	                $(".dbnnul").css("margin-left","0px");
	                clc=true;
	            });
	        }

	    }
	});

	// 联盟单位
	var zdhezd = 0;
	var hezpt = setInterval(function(){
		var dyged = parseInt($(".hezuld li:first-child").css("width")) + parseInt($(".hezuld li").css("margin-right"));
		zdhezd-=0.25;
		$(".hezuld").css("margin-left", zdhezd + "px");
		if(zdhezd <= -dyged){
			zdhezd=0;
			$(".hezuld").append($(".hezuld li:first-child"));
			$(".hezuld").css("margin-left", "0px");
		}
	},5);
	$(".hezuld").hover(function(){
		clearInterval(hezpt);
	},function(){
		clearInterval(hezpt);
		hezpt = setInterval(function(){
			var dyged = parseInt($(".hezuld li:first-child").css("width")) + parseInt($(".hezuld li").css("margin-right"));
			zdhezd-=0.25;
			$(".hezuld").css("margin-left", zdhezd + "px");
			if(zdhezd <= -dyged){
				zdhezd=0;
				$(".hezuld").append($(".hezuld li:first-child"));
				$(".hezuld").css("margin-left", "0px");
			}
		},5);
	});


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
		$(".banindex").append("<span>"+(i+1)+"</span>");
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

		})
		//左边
	$(".banle").click(function() {
			if (!$(".bannerlis").is(":animated")) {
				if (ina == 1) {
					luna = -(lilen - 1) * liwidth;
					$(".bannerlis").animate({
						left: luna + "px"
					}, 300);
					ina = lilen;
					
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

		})
		//小圆点几点切换
	$(".banindex>span").mouseover(function() {
			ina = $(this).index() + 1;
			$(".banindex>span").eq(ina - 1).addClass("addban").siblings().removeClass("addban");
			luna = -(ina - 1) * liwidth;
			$(".bannerlis").animate({
				left: luna + "px"
			}, 300);
		})
		//轮播自动动
	var fata;
	fata = setInterval(function() {
		$(".banri").click();
	}, 3000);
	$(".banner").hover(function() {
		clearInterval(fata);
	}, function() {
		fata = setInterval(function() {
			$(".banri").click();
		}, 3000)
	})
	//左右按钮隐藏
//	$(document).on("mouseover",".banner",function(){
//		$(".banle,.banri").removeClass("dis")
//	})
//	$(document).on("mouseout",".banner",function(){
//		$(".banle,.banri").addClass("dis")
//	})
});