//打开弹
function alert1(){
	$(".alert_1").removeClass("dis");
}
//关闭弹
function guanbi(){
	$(".alert_1").addClass("dis");
}
//取消按钮关闭
$(document).on("click",".qubtn",function(){
	guanbi();
})
//确定按钮关闭
$(document).on("click",".quebtn",function(){
	guanbi();
})



//弹窗背景
window.onload=function(){
	$("body").append("<div class='pw_alert_bg dis'></div>");
}
//弹窗背景打开
function alertbg_k(){
	$("body .pw_alert_bg").removeClass("dis");
}
//关闭弹背景
function alertbg_g(){
	$("body .pw_alert_bg").addClass("dis");
}
//第二种弹窗打开(一个按钮)
function alert2(alert2_str){
	alertbg_k();
	var alert2='<div class="alert_1"><div class="alert_1tit">'+alert2_str+'</div><div class="alert_1btn"><button class="qubtn2" type="button">确定</button></div></div>';
    $("body").append(alert2);
}
//第二种确定按钮事件
$(document).on("click",".qubtn2",function(){
	alertbg_g();
	$(this).parents(".alert_1").remove();//删除弹窗
})
//第三种弹窗（2个按钮）
function alert3(alert2_str){
	alertbg_k();
	var alert3='<div class="alert_1"><div class="alert_1tit">'+alert2_str+'</div><div class="alert_1btn"><button class="quebtn3" type="button">确定</button><button class="qubtn3" type="button">取消</button></div></div>';
    $("body").append(alert3);
}
//关闭第三种弹窗按钮事件
$(document).on("click",".qubtn3",function(){
	alertbg_g();
	$(this).parents(".alert_1").remove();//删除弹窗
})

