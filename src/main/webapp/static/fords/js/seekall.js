$(function(){
		    var hov = true;
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
		    
		    var num = $(".quename").val();
            //触发索引
		    $(document).on("input keydown focus",".sowe_lse",function(){
		    	 // if($(this).val() !== "" || $(this).val().length !== 0){
		            //写这里
		    	if(num ==1){
		        	var FAILURENAME = $(this).val();
		        	$.ajax({
		    			type : "POST",
		    			url : localhostPaht+"/imperfection_entry/getProcesF",
		    			data : {FAILURENAME:FAILURENAME},
		    			success : function(data) {
		    				$(".houxuciu").html('');
		    				var failList = data.failList;
		    				for (var i = 0; i < failList.length; i++) {
			    				var str = " <li>"+failList[i].FAILURENAME+"</li>"
			    				$(".houxuciu").append(str);
							}
		    			},
		    		 	error:function(){
		    	        	alert("上传失败");
		    	        }
		    		});
		    	}
		            $(this).siblings(".taocen_cn").show();
		    	  //}
		    });
		  
		    $(document).on("blur",".sowe_lse",function(){
		        if(hov){
		            $(this).siblings(".taocen_cn").hide();
		        }
		    });
		    //关键字click
		    $(document).on("click",".houxuciu li",function(){
		    	//$(this).parents(".taocen_cn").siblings(".responsese").val($(this).attr("data-id"));
		        $(this).parents(".taocen_cn").siblings(".sowe_lse").val($(this).text());
		        $(this).parents(".taocen_cn").hide();
		    });
		    $(document).on("mouseover",".houxuciu",function(){
		        hov = false;
		    });
		    $(document).on("mouseout",".houxuciu",function(){
		        hov = true;
		    });

		});