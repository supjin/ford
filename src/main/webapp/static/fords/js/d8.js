$(function(){
	//责任人选择
	$(document).on("click",".zerenren_tab li",function() {
		var a = $(this).children("a").html();
		$(this).parents(".input-group").children(".zerenren_tabin").val(a);
	})
    var currentdate;
    getNowFormatDate();
    //获取当前时间，格式YYYY-MM-DD
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        currentdate = year + seperator1 + month + seperator1 + strDate;
        $(".jihuatame").val(currentdate)
        return currentdate;
    }


});