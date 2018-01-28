<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>${DINGTILE }</title>
		<link rel="stylesheet" href="${ctx}/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/d1.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		
		<link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
		<script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/public_d08.js" ></script>
		   <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 20px;">
		<div class="oiswen_box">
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
			<!---d1分析小组---->
			<div class="fenxi_d1box">
				<div class="fenxi_d1tit">D1分析小组</div>
				<table class="tenxi_tab tenxi_tab1">
					<thead>
						<tr>
							<td>序号</td>
							<td>角色</td>
							<td>部门</td>
							<td>姓名</td>
							<td>职务</td>
							<td>电话</td>
							<td>操作</td>
						</tr>
					</thead>
                    <tbody>
                    	<tr>
                    		<td>1</td>
                    		<td>责任人</td>
                    		<td>
                    			<select class="fenxi_sea DEPT" onchange="empchang(this,'${pdfz.RESPONSIBILITY}')" name="DEPT">
                    			<c:forEach items="${deptList }" var="va" >
                    				<option at="${va.DEPARTMENT_ID}" <c:if test="${pdfz.DEPARTMENT_ID eq va.DEPARTMENT_ID }">selected="selected"</c:if> value="${va.DEPARTMENT_ID }">${va.DEPARTMENT_NAME }</option>
                    			</c:forEach>
                    			</select>
                    			<input type="hidden" name="PROCESS_ONE_ID" value="${pdfz.PROCESS_ONE_ID }">
                    			<input type="hidden" name="TYPE" value="${pdfz.TYPE }">
                    			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
                    			
                    		</td>
                    		<td>
                    			<select class="fenxi_sea" name="RESPONSIBILITY" onchange="myuser(this)">
                    				<c:forEach items="${deptuser }" var="vu">
                    				<option uid="${vu.USER_ID}" <c:if test="${vu.USER_ID eq pdfz.RESPONSIBILITY }">selected="selected"</c:if> value="${vu.USER_ID }">${vu.NAME }</option>
                    				</c:forEach>
                    			</select>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${pdfz.position }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${pdfz.PHONES }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs">
                    			<button class="fenxi_btn fenxi_btnxg" type="button">修改</button>
                    			</div>
                    		</td>
                    	</tr>
                    	
                    	<tr>
                    		<td>2</td>
                    		<td>团队领导</td>
                    		<td>
                    			<select class="fenxi_sea" onchange="empchang(this,'${ldfz.RESPONSIBILITY}')" name="DEPT">
                    				<c:forEach items="${deptList }" var="dep" >
                    				<option at="${dep.DEPARTMENT_ID}" <c:if test="${dep.DEPARTMENT_ID eq ldfz.DEPARTMENT_ID }">selected="selected"</c:if>>${dep.DEPARTMENT_NAME }</option>
                    				</c:forEach>
                    			</select>
                    			<input type="hidden" name="PROCESS_ONE_ID" value="${ldfz.PROCESS_ONE_ID }">
                    			<input type="hidden" name="TYPE" value="${ldfz.TYPE }">
                    			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
                    		</td>
                    		<td>
                    			<select class="fenxi_sea" name="RESPONSIBILITY" onchange="myuser(this)">
                    				<c:forEach items="${ldeptuser }" var="vu">
                    				<option  uid="${vu.USER_ID}" <c:if test="${vu.USER_ID eq ldfz.RESPONSIBILITY }">selected="selected"</c:if> value="${vu.USER_ID }">${vu.NAME }</option>
                    				</c:forEach>
                    			</select>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${ldfz.position }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${ldfz.PHONES }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs">
                    			<button class="fenxi_btn fenxi_btnxg" type="button"><c:if test="${empty ldfz.RESPONSIBILITY  }">保存</c:if><c:if test="${not empty ldfz.RESPONSIBILITY  }">修改</c:if></button>
                    			</div>
                    		</td>
                    	</tr>
                    	<%--  <c:if test="${fn:length(ldList ) == 0}">
                    	                  	<tr>
                    		<!-- <td>2</td> -->
                    		<td>团队领导</td>
                    		<td>
                    			<select class="fenxi_sea" onchange="empchang(this,'')" name="DEPT">
                    				<option></option>
                    				<c:forEach items="${deptList }" var="dep">
                    				<option value="${dep.DEPARTMENT_ID}">${dep.DEPARTMENT_NAME }</option>
                    				</c:forEach>
                    			</select>
                    			<input type="hidden" name="PROCESS_ONE_ID" value="">
                    		</td>
                    		<td>
                    			<select class="fenxi_sea" name="RESPONSIBILITY" onchange="myuser(this)">
                    				<option></option>
                    				<c:forEach items="${userAllList }" var="vu">
                    				<option value="${vu.USER_ID }">${vu.NAME }</option>
                    				</c:forEach>
                    			</select>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi"></div>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi"></div>
                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs">
                    			<button class="fenxi_btn fenxi_btnxg" type="button">保存</button>
                    			</div>
                    		</td>
                    	</tr>
                    	 </c:if> --%>
                    		
                    	<c:forEach items="${dyList }" var="var" varStatus="status">
                    	<tr>
                    		<td>${status.index+3 }</td>
                    		<td>团队成员</td>
                    		<td>
                    			<select class="fenxi_sea" onchange="empchang(this,'${var.RESPONSIBILITY}')" name="DEPT">
                    				<c:forEach items="${deptList }" var="dep">
                    				<option at="${dep.DEPARTMENT_ID}"  <c:if test="${dep.DEPARTMENT_ID eq var.DEPARTMENT_ID }">selected="selected"</c:if>>${dep.DEPARTMENT_NAME }</option>
                    				
                    				</c:forEach>
                    			</select>
                    			<input type="hidden" name="PROCESS_ONE_ID" value="${var.PROCESS_ONE_ID }">
                    			<input type="hidden" name="TYPE" value="${var.TYPE }">
                    			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
                    		</td>
                    		<td>
                    			<select class="fenxi_sea" name="RESPONSIBILITY" onchange="myuser(this)">
                    				<c:forEach items="${userAllList }" var="vu">
                    				<c:if test="${vu.DEPARTMENT_ID eq var.DEPARTMENT_ID }">
                    				<option  uid="${vu.USER_ID}" <c:if test="${vu.USER_ID eq var.RESPONSIBILITY }">selected="selected"</c:if> value="${vu.USER_ID }">${vu.NAME }</option>
                    				</c:if>
                    				</c:forEach>
                    			</select>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${var.position }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${var.PHONES }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs">
                    			<button class="fenxi_btn fenxi_btnxg" type="button">修改</button>
                    			<button class="fenxi_btn fenxi_btnsc" type="button">删除</button>
                    			<button class="fenxi_btn xinze_r" type="button">新增</button>
                    			</div>
                    		</td>
                    	</tr>
                    </c:forEach>	
                    <c:if test="${fn:length(dyList ) == 0}">
                           	<tr class="trid" >
                    		<td>3</td>
                    		<td>团队成员</td>
                    		<td>
                    			<select class="fenxi_sea" onchange="empchang(this,'')" name="DEPT">
                    				<!-- <option></option> -->
                    				<c:forEach items="${deptList }" var="dep">
                    				<option at="${dep.DEPARTMENT_ID}" value="${dep.DEPARTMENT_ID}">${dep.DEPARTMENT_NAME }</option>
                    				</c:forEach>
                    			</select>
                    			<input type="hidden" name="PROCESS_ONE_ID" value="">
                    			<input type="hidden" name="TYPE" value="3">
                    			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
                    		</td>
                    		<td>
                    			<select class="fenxi_sea" name="RESPONSIBILITY" onchange="myuser(this)">
                    				<!-- <option></option> -->
                    				<c:forEach items="${deptuser }" var="vu">
                    				<option uid="${vu.USER_ID}" <c:if test="${vu.USER_ID eq pdfz.RESPONSIBILITY }">selected="selected"</c:if> value="${vu.USER_ID }">${vu.NAME }</option>
                    				</c:forEach>
                    			</select>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${pdfz.position }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${pdfz.PHONES }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs">
                    			<button class="fenxi_btn fenxi_btnxg" type="button">保存</button>
                    			<button class="fenxi_btn fenxi_btnsc" type="button">删除</button>
                    			<button class="fenxi_btn xinze_r" type="button">新增</button>
                    			</div>
                    		</td>
                    	</tr>
                    </c:if>	
                    	<tr class="trid dis" >
                    		<td>3</td>
                    		<td>团队成员</td>
                    		<td>
                    			<select class="fenxi_sea" onchange="empchang(this,'')" name="DEPT">
                    				<!-- <option></option> -->
                    				<c:forEach items="${deptList }" var="dep">
                    				<option at="${dep.DEPARTMENT_ID}" value="${dep.DEPARTMENT_ID}">${dep.DEPARTMENT_NAME }</option>
                    				</c:forEach>
                    			</select>
                    			<input type="hidden" name="PROCESS_ONE_ID" value="">
                    			<input type="hidden" name="TYPE" value="3">
                    			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
                    		</td>
                    		<td>
                    			<select class="fenxi_sea" name="RESPONSIBILITY" onchange="myuser(this)">
                    				<!-- <option></option> -->
                    				<c:forEach items="${deptuser }" var="vu">
                    				<option uid="${vu.USER_ID}" <c:if test="${vu.USER_ID eq pdfz.RESPONSIBILITY }">selected="selected"</c:if> value="${vu.USER_ID }">${vu.NAME }</option>
                    				</c:forEach>
                    			</select>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${pdfz.position }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">${pdfz.PHONES }</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs">
                    			<button class="fenxi_btn fenxi_btnxg" type="button">保存</button>
                    			<button class="fenxi_btn fenxi_btnsc" type="button">删除</button>
                    			<button class="fenxi_btn xinze_r" type="button">新增</button>
                    			</div>
                    		</td>
                    	</tr>
                    </tbody>
				</table>
				<!-- <button class="fenxi_baocun">保存</button> -->
				<!---步骤分配-->
				<div class="buzhou_fen">
					<div class="dreds"></div>
					<div class="buzhoufen_tit">步骤分配</div>
					<div class="container d1_listbox">
					    <div class="row">
					    <c:forEach items="${paList }" var="var" varStatus="status">
					        <div class="col-md-6 col-lg-4 xunhuanl">
					        <form action="">
					        	<input type="hidden" name="PLAN_ID" value="${var.PLAN_ID }">
					        	<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID"value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
					        	<div class="d1_lista">
					        		<div class="d1_lisle">
					        			<div class="d1_buifo">
					        				<p>负责人</p>
					        				<input type="hidden" name="USERID">
					        				<div class="d1_buinbox"><select name="USERIDS">
					        				<c:forEach items="${kxList }" var="kx">
					        				<option uid="${kx.RESPONSIBILITY}"  <c:if test="${kx.RESPONSIBILITY == var.USERID }" >selected="selected" </c:if>>${kx.NAME }</option>
					        				</c:forEach>
					        				</select></div>
					        			</div>
					        			<div class="d1_buifo">
					        				<p>计划时间</p>
					        				<div class="d1_buinbox"><input  type="date" name="PLANTIME" value="<fmt:formatDate value='${var.PLANTIME}' type='date' pattern="yyyy-MM-dd"/>"/></div>
					        			</div>
					        		</div>
					        		<div class="d1_lisri">
					        			<div>D${status.index }</div>
					        			<button type="button" class="xiugaibu">修改</button>
					        		</div>
					        	</div>
					        	</form>
					        </div>
					        </c:forEach>
					    </div>
					</div>
				</div>
				<div class="shangxia_box">
					<a href="${ctx}/dProcess/goProcess.do?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a>
					
					
					<a class="ansnis" <c:if test="${handle.USTEP <DANGQJY-1}">href="${ctx}/process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if><c:if test="${handle.USTEP >=DANGQJY-1}">href="javaScript:;"</c:if>>下一步</a>
				</div>
			</div>
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script>
		$(document).on("click",".ansnis",function(){
			if(this.href == "javascript:;"){
				alert2("当前未完成，请先完成");
			}
		})
		//步棸修改
		
		$(document).on("click",".xiugaibu",function(){
			var tis = $(this);
			/* var PLAN_ID = tis.parents("tr").find("input[name='PLAN_ID']").val();
			var USERID = tis.parents("tr").find("select[name='USERID']").val();
			var PLANTIME = tis.parents("tr").find("input[name='PLANTIME']").val(); */
			var uid = tis.parents(".xunhuanl").find("select[name='USERIDS']").children('option:selected').attr("uid");
			var USERID = tis.parents(".xunhuanl").find("input[name='USERID']").val(uid);
			 $.ajax({
					type : "POST",
					url : "${ctx}/process_one/addAndEdit",
					data :  tis.closest("form").serialize(),
					success : function(data) {
							alert2("保存成功");
							tis.parents(".d1_listbox").find("input[name='USERID']").val("");
							if($(".ansnis").attr("href")=="javaScript:;"){
								$(".ansnis").attr("href","${ctx}/process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
								tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");		
							}
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});  
		})
		//责任人
		
		$(document).on("click",".fenxi_btnxg",function(){
			var tis = $(this);
		    var PROCESS_ONE_ID = tis.parents("tr").find("input[name='PROCESS_ONE_ID']").val();
			var RESPONSIBILITY = tis.parents("tr").find("select[name='RESPONSIBILITY']").val();
			var TYPE = tis.parents("tr").find("input[name='TYPE']").val(); 
			var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
			 $.ajax({
					type : "POST",
					url : "${ctx}/process_one/syspom",
					data :  {PROCESS_ONE_ID:PROCESS_ONE_ID,RESPONSIBILITY:RESPONSIBILITY,TYPE:TYPE,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID},
					success : function(data) {
							alert2("保存成功");
							tis.text("修改");
							if($(".ansnis").attr("href")=="javaScript:;"){
								$(".ansnis").attr("href","${ctx}/process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
								}
							/* 
							$("select[name='USERIDS']").find("option").after(strs) */
						/* 	var dy = data.dyList;
							var strs = "";
							for (var i = 0; i < dy.length; i++) {
								 strs += "<option uid='"+dy[i].USER_ID+"'>"+dy[i].NAME+"</option>"	
							}
							$("select[name='USERIDS']").html("");
							$("select[name='USERIDS']").append(strs);
							tis.parents("tr").find("input[name='PROCESS_ONE_ID']").val(data.PROCESS_ONE_ID); */
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});  
		})
		//部门联动
		 function empchang(thi,userid){
			
			 var peptid=$(thi).children('option:selected').attr("at")
		     var thi= $(thi);
		    
		    /*  var a=$(thi).parent().siblings().children(); */
		    var a=$(thi).parent().next().children();
		    
		       //二级下拉框
		      $(a).empty();
		    
		          
					$.ajax({
						type : "POST",
						url : '${ctx}/department/deptAjas',
						data : {"DEPARTMENT_ID":peptid},
						async: false,
						dataType : 'json',
						success : function(data) {
							if(data.message=="1"){ 
							var users=data.deptuser;
							var str="";
								for (var i = 0; i < users.length; i++) {
									var sd='';
									if(userid==users[i].USER_ID){
										sd='selected="selected"';
										/* alert("ok"); */
									}
									/* str+="<option value=\""+users[i].NAME+"\">"+users[i].NAME+"</option>" */
									
									str+="<option "+sd+" value=\""+users[i].USER_ID+"\" uid=\""+users[i].USER_ID+"\" >"+users[i].NAME+"</option>"
								}
								$(a).append(str);
								$(a).change();
							}
								
							
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert2("操作无效");
						}
				})
			
			
			
		} 
		//用户联动
		function myuser(thi){

		     var uid=$(thi).children('option:selected').attr("uid")
		    /*  alert(uid) */
		     var thi= $(thi);
		       //二级下拉框
		      
					$.ajax({
						type : "POST",
						url : '${ctx}/teamd1/ajaxuserinfo',
						data : {"USER_ID":uid},
						async: false,
						dataType : 'json',
						success : function(data) {
							if(data.message=="1"){ 
							var users=data.userfind;
							    
							/* $("#DEPT").val(users.DEPARTMENT_NAME); */
							$(thi).parent().next().children().text(users.position);
							$(thi).parent().next().next().children().text(users.PHONE); 
							}
								
							
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert2("操作无效");
						}
				})
			
			
		}
		
		
		 var cNode;
			$(function(){
               //新增成员
               $(document).on("click",".xinze_r",function(){
               	 /*   var a=$(".tenxi_tab1 tbody tr").length+1;
               	   var str='<tr><td>'+a+'</td><td>团队成员</td><td><select class="fenxi_sea"><option>质量管理部</option><option>团队领导</option><option>主管</option></select></td><td><select class="fenxi_sea"><option>蓝千刃</option><option>团队领导</option><option>主管</option></select></td><td><div class="fenxi_zhi">质量管理部部长</div></td><td><div class="fenxi_zhi">18423527240</div></td><td><div class="fenxi_btnboxs"><button class="fenxi_btn fenxi_btnxg"type="button">修改</button><button class="fenxi_btn fenxi_btnsc"type="button">删除</button><button class="fenxi_btn xinze_r"type="button">新增</button></div></td></tr>'; */
               	  var a=$(".tenxi_tab1 tbody tr").length+1;
               		$(".trid").find("td:eq(0)").html(a-1);
               	   cNode= $(".trid").html();
               //  $("#addUserTable").append("<tr>"+cNode+"</tr>");
               	   $(".tenxi_tab1 tbody").append("<tr>"+cNode+"</tr>");
               })
               //删除成员
               $(".tenxi_tab1").on("click",".fenxi_btnsc",function(){
               	   var s=$(this).parents("tr").children("td").eq(0).text();//3
               	   var ina=$(".tenxi_tab1 tbody tr").length-1;//4
               	   if(ina<=3){
               	    //cNode= $(".trid").html();
               	 // $(".tenxi_tab1 tbody").append("<tr>"+cNode+"</tr>");
               	   	  // $(".tenxi_tab1 tbody tr:last-child td:first-child").text(s);
               	   	  var tis = $(this);
			 			var PROCESS_ONE_ID = tis.parents("tr").find("input[name='PROCESS_ONE_ID']").val();
               	   	   $.ajax({
						type : "POST",
						url : "${ctx}/process_one/delete",
						data :  {PROCESS_ONE_ID:PROCESS_ONE_ID},
						success : function(data) {
							  tis.parents("tr").remove();
		               	   	   $(".xinze_r").click();
						},
					 	error:function(){
				        	alert2("上传失败");
				        }
					});  
	               	   	  
               	   	  
               	   	 
               	   }else{
	               	  
	               	var tis = $(this);
		 			var PROCESS_ONE_ID = tis.parents("tr").find("input[name='PROCESS_ONE_ID']").val();
           	   	   $.ajax({
					type : "POST",
					url : "${ctx}/process_one/delete",
					data :  {PROCESS_ONE_ID:PROCESS_ONE_ID},
					success : function(data) {
						 tis.parents("tr").remove();
						 for(s;s<ina;s++){
			               	  $(".tenxi_tab1 tbody tr").eq(s).children("td").eq(0).html(s);
			               }
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});  
	               	 
               	   }
               })
               //点击保存显示步骤
               $(".fenxi_baocun").click(function(){
               	  $(".buzhou_fen").removeClass("dis");
               })
                //时间赋予
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
			})
		</script>
	</body>
</html>
