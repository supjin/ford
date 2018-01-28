$(function() {
	//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    var paths = localhostPaht + projectName;
	////////////////模糊查询
	//键盘事件
	$(document).on("keyup", ".pw_cha_input", function() {
		var inval = $(this).val(); //得到输入框的值
		if(inval == "") {
			$(this).siblings(".pw_cha_ul").children("li").show();
		} else {
			$(this).siblings(".pw_cha_ul").children("li").hide().filter(":contains('" + inval + "')").show();
		}
	})
	//输入框点击事件
	$(document).on("click",".pw_cha_input",function(event) {
		event.stopPropagation();
		var _this = $(this);
		//获取数据
		$.ajax({
			url: localhostPaht+"/process_eight/selectuser",
			//data:{name:25},
			async: false,
			dataType: "json",
			success: function(data) {
				var userlist = data.userList;
				$(_this).siblings(".pw_cha_ul").html(""); //清空ul
				//循环数据
				for(var a = 0; a < userlist.length; a++) {
					$(_this).siblings(".pw_cha_ul").append("<li data-id="+userlist[a].USER_ID+">" + userlist[a].NAME + "</li>");
				}
				$(_this).siblings(".pw_cha_ul").show(); //显示下拉
				var inval = $(_this).val(); //得到输入框的值
				if(inval == "") {
					$(_this).siblings(".pw_cha_ul").children("li").show();
				} else {
					$(_this).siblings(".pw_cha_ul").children("li").hide().filter(":contains('" + inval + "')").show();
				}
			},
			error: function() {
				console.log("数据获取失败")
			}
		});

	})
	$(document).click(function(event) {
		event.stopPropagation();
		$(".pw_cha_ul").hide(); //隐藏下拉
	})
	//点击复制给输入框
	$(document).on("click", ".pw_cha_ul li", function() {
		var inhtml = $(this).html();
		$(this).parents(".pw_cha_ul").siblings(".pw_cha_input").val(inhtml);
		$(this).parents(".pw_cha_ul").hide(); //隐藏下拉
	})
})