$(function(){
    $(".liyige a").click(function(){
        $(this).addClass("nowzc").siblings().removeClass("nowzc");
        $(".xihlxw").eq($(this).index()).addClass("show").siblings().removeClass("show");
    });
    function heikz(){
        var shle = $(".shblef").height() + parseInt($(".shblef").css("padding-bottom")) + parseInt($(".shblef").css("padding-top"));
        var shrig = $(".shbfrig").height() + parseInt($(".shbfrig").css("padding-bottom")) + parseInt($(".shbfrig").css("padding-top"));
        if($(".shblef").height() > $(".shbfrig").height()){
            $(".shbfrig").css("height",shle - parseInt($(".shbfrig").css("padding-bottom")) - parseInt($(".shbfrig").css("padding-top")) + "px");
        }else{
            $(".shblef").css("height",shrig - parseInt($(".shblef").css("padding-bottom")) - parseInt($(".shblef").css("padding-top")) + "px");
        }
    }
    heikz();

    $(".jijdxt a").click(function(){
        $(this).addClass("newad").siblings().removeClass("newad");
        $(".xianxd").eq($(this).index()).addClass("show").siblings().removeClass("show");
        $(".shblef").removeAttr("style");
        $(".shbfrig").removeAttr("style");
        heikz();
    });

});
