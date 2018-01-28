<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>${DINGTILE }</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/d8.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/seek.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/d8.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/seek.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 20px;">
<div class="oiswen_box">
    <!---头部信息--->
   <%@ include file="/setting/head.jsp"%>
    <!-- d8团队认可 -->
    <form action="" name="eightForm" id="eightForm">
     <input  type="hidden" name="PROCESS_EIGHT_ID" id="PROCESS_EIGHT_ID" value="${pds.PROCESS_EIGHT_ID }"/>
     <input  type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }"/>
    <div class="renkebox">
        <div class="renke_leb">D8团队认可</div>
        <div class="neri_reny">
            <div class="d8_cons clearfix">
            	<div class="jinjiula clearfix">
					<p class="jinjiultit pull-left">责任人</p>
					<div class="jinjiuze pull-left">
						<div class="baidssb">
	                      	<input type="hidden" class="responsese"  value="${handle.USERID }">
			                <input class="sowe_lse form-control" maxlength="6"  name="REPORTMAN" type="text" <c:if test="${not empty pds}"> value="${pds.REPORTMAN }"</c:if><c:if test="${empty pds}"> value="${handle.RSNAME }"</c:if>/>
			                <div class="taocen_cn">
			                <ul class="houxuciu"></ul>
			                </div>
			       		 </div>
					</div>
				</div>
				<div class="jinjiulb clearfix">
					<p class="jinjiultit pull-left">完成时间</p>
					<div class="jinjiuze pull-left">
					 	<c:if test="${empty pds }">
                        <input class="jihuatame form-control" type="date" name="FINISHTIME"  />
                        </c:if>
                         <c:if test="${not empty pds}">
                        <input class="form-control" type="date" name="FINISHTIME"  value="${pds.FINISHTIME }" />
                        </c:if>
					</div>
				</div>
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
	                </ul>
	                <a class="now_boaqi" href="javascript:">新增标签+</a>
	            </div>
	
	        </div>
	    </div>
	    <button class="d0_8btnbc" type="button"> <c:if test="${empty pds}">保存</c:if><c:if test="${not empty pds }">修改</c:if></button>
	    <div class="xiayibus">
	    	<a class="pull-left" href="${ctx}/process_seven/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a>
	    	<a class="pull-right" href="${ctx }/client_problem_collection/list?TYPE=${pd.TYPE}">下一步</a>
	    </div>
    </div>
    </form>
    <!---杨鹏飞写的----->
    <!--<div>
        <div class="baidssb">
            <form action="">
                <input class="sowe_lse" type="text"/>
                <div class="taocen_cn">
                    <ul class="houxuciu">
                        <li>aaaa</li>
                        <li>bbb</li>
                        <li>bbbb</li>
                        <li>szo</li>
                        <li>aaaa</li>
                    </ul>
                </div>
            </form>
        </div>
    </div>-->

</div>
<!----右边部分---->
<%@ include file="/setting/right.jsp"%>
</body>
<script type="text/javascript">
//症状反应
$(document).on("click",".d0_8btnbc",function(){
	var tis = $(this);
		$.ajax({
			type : "POST",
			url : "${ctx}/process_eight/addAndEdit",
			data : $("#eightForm").serialize(),
			success : function(data) {
				$("#PROCESS_EIGHT_ID").val(data.PROCESS_EIGHT_ID);
				tis.text("修改")
				alert2(data.mesage);
			},
		 	error:function(){
	        	alert2("上传失败");
	        }
		});
	});
</script>
</html>
