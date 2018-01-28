<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>零公里问题一</title>
    <link rel="stylesheet" href="${ctx}/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/d8.css" />
     <link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/public_d08.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/d8.js" ></script>
      <script type="text/javascript" src="${ctx}/static/fords/js/seek.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 20px;">
<div class="oiswen_box">
    <!---顶部--->
    <div class="oiswen_titop">
        <div class="oiswen_titople">
            <div class="oiswen_titoplea">零公里问题一</div>
            <div class="oiswen_titopleb">
                <a href="javascript:;">HOME</a><span>></span><a href="javascript:;">客户问题</a><span>></span><a href="javascript:;">零公里问题</a>
            </div>
        </div>
        <div class="oiswen_ss">
            <span class="glyphicon glyphicon-search"></span>
            <input type="text" class="form-control" placeholder="搜索">
        </div>
    </div>
    <!---头部信息--->
    <%@ include file="/setting/head.jsp"%>
    <!-- d8团队认可 -->
    <form action="" name="eightForm" id="eightForm">
     <input  type="hidden" name="PROCESS_EIGHT_ID" id="PROCESS_EIGHT_ID" value="${pds.PROCESS_EIGHT_ID }"/>
     <input  type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }"/>
    <div class="renkebox">
        <div class="renke_leb">D8团队认可</div>
        <div class="neri_reny">
            <div class="row">
                <div class="col-lg-5">
                    <div class="zond_eyd">
                        <div class="gemiegle">报告人</div>
                        <input class="baogaor" type="text" name="REPORTMAN" value="${pds.REPORTMAN }"/>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="zond_eyd">
                        <div class="gemiegle">完成时间</div>
                        <c:if test="${empty pds.PROCESS_EIGHT_ID }">
                        <input class="baogaor jihuatame" type="date" name="FINISHTIME"  />
                        </c:if>
                         <c:if test="${not empty pds.PROCESS_EIGHT_ID }">
                        <input class="baogaor" type="date" name="FINISHTIME"  value="${pds.FINISHTIME }" />
                        </c:if>
                    </div>
                </div>
            </div>
           <!--  <div class="row">
                <div class="col-lg-12">
                    <div class="zond_eyd">
                        <div class="gemiegle">团队认可</div>
                        <textarea class="renkesip"></textarea>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
    <div>
        <div class="baidssb">
            <form action="">
                <input class="sowe_lse" type="text"/>
                <div class="taocen_cn">
                    <ul class="houxuciu">
                        <c:forEach items="${userList }" var="var">
                        <li>${var.NAME }</li>
                        </c:forEach>
                    </ul>
                </div>
            </form>
        </div>
    </div>
    <!-- 经验库 -->
    <div class="renkebox">
        <div class="renke_leb">经验库</div>
        <div class="jianyku">
            <a class="biaoqbt" href="javascript:">标签<i class="glyphicon glyphicon-tag"></i></a>
            <div class="zhegeshi">
                <ul class="bqianul">
                    <li>标签1</li>
                    <li>标签标签2</li>
                    <li>标签3</li>
                    <li>标签3</li>
                    <li>标签3</li>
                    <li>标签3</li>
                    <li>标签3</li>
                    <li>标签3</li>
      
                </ul>
                <a class="now_boaqi" href="javascript:">新增标签+</a>
            </div>

        </div>
        <div class="shaxbuxg">
            <a href="${ctx}/process_seven/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a>
           
           <c:if test="${empty pds.PROCESS_EIGHT_ID }">
            <a class="d0_btn">保存</a>
           </c:if>
            <c:if test="${not empty pds.PROCESS_EIGHT_ID }">
            <a class="d0_btn">修改</a>
           </c:if>
           
            <a href="${ctx }/client_problem_collection/list?TYPE=${pd.TYPE}">下一步</a>
        </div>
       
    </div>
 </form>
</div>
<!----右边部分---->
<%@ include file="/setting/right.jsp"%>
</body>
<script type="text/javascript">
$(function(){
    var hov = true;
    //触发索引
    $(".sowe_lse").on("input keydown focus",function(){
        if($(this).val() !== "" || $(this).val().length !== 0){
            //写这里
        	var user = $(this).val();
        	$.ajax({
    			type : "POST",
    			url : "${ctx}/process_eight/selectuser",
    			data : {USERNAME:user},
    			success : function(data) {
    				$(".houxuciu").html('');
    				var userlist = data.userList;
    				for (var i = 0; i < userlist.length; i++) {
	    				var str = " <li>"+userlist[i].NAME+"</li>"
	    				$(".houxuciu").append(str);
					}
    			},
    		 	error:function(){
    	        	alert("上传失败");
    	        }
    		});
        	
            $(this).siblings(".taocen_cn").show();
        }else{
            $(this).siblings(".taocen_cn").hide();
        }
    });
    $(".sowe_lse").blur(function(){
        if(hov){
            $(this).siblings(".taocen_cn").hide();
        }
    });
    //关键字click
    $(document).on("click",".houxuciu li",function(){
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
//症状反应
$(document).on("click",".d0_btn",function(){
		$.ajax({
			type : "POST",
			url : "${ctx}/process_eight/addAndEdit",
			data : $("#eightForm").serialize(),
			success : function(data) {
				$("#PROCESS_EIGHT_ID").val(data.PROCESS_EIGHT_ID);
				alert(data.mesage);
			},
		 	error:function(){
	        	alert("上传失败");
	        }
		});
	});
</script>
</html>
