$(function(){
    //自适应rem
    var scale = $(window).width() / 750;
    $('html').css('font-size', (100 * scale)>102.4?102.4:(100 * scale) + 'px');
    $(window).resize(function(){
        setTimeout(function(){
            var scale = $(window).width() / 750;
            $('html').css('font-size', (100 * scale)>102.4?102.4:(100 * scale) + 'px');
        },50);
    });

    //自定义tap事件
    $(document).on("touchstart", function(e) {
        var $target = $(e.target);
        if(!$target.hasClass("disable")) $target.data("isMoved", 0);
    });
    $(document).on("touchmove", function(e) {
        var $target = $(e.target);
        if(!$target.hasClass("disable")) $target.data("isMoved", 1);
    });
    $(document).on("touchend", function(e) {
        var $target = $(e.target);
        if(!$target.hasClass("disable") && $target.data("isMoved") == 0) $target.trigger("tap");
    });
    
 



});
//弹窗方法
function alerts(s){
	layer.open({
	    content: s
	    ,skin: 'msg'
	    ,time: 2 //2秒后自动关闭
	});
}
