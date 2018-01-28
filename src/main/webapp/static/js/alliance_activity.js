jQuery(function(){

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


    $(".xiarig a").hover(function(){
        $(".zhebitt").css("margin-top",-(parseFloat($(this).find(".zhebitt").height()) / 2) + "px");
    });
    $(".zhebitt").each(function(){
        $(this).css({
            "margin-top": -(parseFloat($(this).height()) / 2) + "px"
        });
    });





});