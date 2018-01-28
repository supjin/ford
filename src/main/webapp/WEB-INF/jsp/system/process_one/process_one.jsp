<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/setting/taglib.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
		<link rel="stylesheet" href="${ctx}/static/fords/css/d1.css" />
		<link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
		<script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
		<script type="text/javascript" src="${ctx}/static/fords/js/public_d08.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 20px;">
		<div class="oiswen_box">
			<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">零公里问题一</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;">HOME</a><span>></span><a href="javascript:;">零公里问题</a><span>></span><a href="javascript:;">零公里流程</a>
					</div>
				</div>
				<div class="oiswen_ss">
		            <span class="glyphicon glyphicon-search"></span>
		            <input type="text" class="form-control" placeholder="搜索">
		        </div>
			</div>
			<!---头部信息--->
			<%@ include file="/setting/head.jsp"%>
			<!---d1分析小组---->
			<div class="fenxi_d1box">
				<div class="fenxi_d1tit">D1分析小组</div>
				<form  id="FORM1">
				<table   class="tenxi_tab tenxi_tab1">
					<thead>
						<tr>
							<!-- <td>序号</td> -->
							<td>角色</td>
							<td>部门</td>
							<td>姓名</td>
							<td>职务</td>
							<td>电话</td>
							<td>操作<span class="xinze_r">+新增成员</span></td>
						</tr>
					</thead>
					
					
					
                    <tbody id="addUserTable">
                  
                  <!------------ 回显不为空的修改---------------- -->
                  <input type="hidden" name="PROCESS_ONE_ID" id="PROCESS_ONE_ID" value="${sj.PROCESS_ONE_ID}"/>
		            <input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
                     <c:if test="${!empty sj}">
                       <c:forEach items="${teamList}" var="va">
                       
                          <c:if test="${va.STEPS eq '3'}">
                         
                    	<tr>
                    		<!-- <td>001</td> -->
                    		<td style="text-align: center">
                    		  <input type="hidden" name="TEAMD1_ID" value="${va.TEAMD1_ID}">
                    			<select class="fenxi_sea" name="STEPS">
                    				<option value="3">责任人</option>
                    			</select>
                    		</td>
                    		<td>
                    			<select class="fenxi_sea DEPT" onchange="empchang(this,'${va.PERSONNEL_NAME}')" name="DEPT"  >
									<c:forEach items="${deptList}" var="var">
									   <option value="${var.DEPARTMENT_ID}" at="${var.DEPARTMENT_ID}" <c:if test="${var.DEPARTMENT_ID eq va.DEPT}">selected="selected"</c:if>>${var.DEPARTMENT_NAME}</option>
									</c:forEach>
				                </select>  
                    		</td>
                    		<td>
                    			<select class="fenxi_sea PERSONNEL_NAME" onchange="myuser(this)" name="PERSONNEL_NAME"  data-placeholder="请选择人员">
									<c:forEach items="${userall}" var="var">
									  <option  value="${var.USER_ID}" uid="${var.USER_ID}" <c:if test="${var.USER_ID eq userfind.USER_ID}">selected="selected"</c:if>>${var.NAME}</option>
									 </c:forEach>
				                </select>
                    		</td>
                    		<td>
	                    			<div class="fenxi_zhi POSITION">${va.POSITION}</div>
	                    		</td>
	                    		<td>
	                    			<div class="fenxi_zhi PHONE">${va.PHONE}</div>
	                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs dis">
                    			<button class="fenxi_btn fenxi_btnxg" type="button">修改</button>
                    			<button class="fenxi_btn fenxi_btnsc"  type="button">删除</button>
                    			</div>
                    		</td>
                    	</tr>
                    	
                    	</c:if>
                    	</c:forEach>
                    	<!------------ 成员循环 ------------------->
                    	<c:forEach items="${teamList}" var="va">
                    	   <c:if test="${va.STEPS eq '1' or va.STEPS eq '2'}">
                    	   
	                    	<tr  class="">
	                    	<input type="hidden" name="TEAMD1_ID" value="${va.TEAMD1_ID}">
	                    		<!-- <td>002</td> -->
	                    		<td style="text-align: center">
	                    			
	                    			<select class="fenxi_sea STEPS" name="STEPS">
	                    				<option value="1">团队领导</option>
								         <option value="2">团队成员</option>
	                    			</select>
	                    		</td>
	                    		<td>
	                    			
	                    			<!-- 部门 -->
	                    			<select class="fenxi_sea DEPT" onchange="empchang(this,'${va.PERSONNEL_NAME}')" name="DEPT"  data-placeholder="请选择人员" >
										<c:forEach items="${deptList}" var="var">
										   <option value="${var.DEPARTMENT_ID}" at="${var.DEPARTMENT_ID}" <c:if test="${var.DEPARTMENT_ID eq va.DEPT}">selected="selected"</c:if>>${var.DEPARTMENT_NAME}</option>
										</c:forEach>
					                </select>             
	                    		</td>
	                    		<td>
	                    			
	                    			<!-- 人员 -->
	                    			<select class="fenxi_sea PERSONNEL_NAME" onchange="myuser(this)" name="PERSONNEL_NAME"  data-placeholder="请选择人员">
										<c:forEach items="${userall}" var="var">
										  <option  value="${var.USER_ID}" uid="${var.USER_ID}" <c:if test="${var.USER_ID eq userfind.USER_ID}">selected="selected"</c:if>>${var.NAME}</option>
										 </c:forEach>
					                </select>
	                    		</td>
	                    		<td>
	                    			<div class="fenxi_zhi POSITION">${va.POSITION}</div>
	                    		</td>
	                    		<td>
	                    			<div class="fenxi_zhi PHONE">${va.PHONE}</div>
	                    		</td>
	                    		<td>
	                    			<div class="fenxi_btnboxs">
	                    			<button class="fenxi_btn fenxi_btnxg"  onclick="updatetem(this,'${va.TEAMD1_ID}');" type="button">修改</button>
	                    			<button class="fenxi_btn fenxi_btnsc"  onclick="deletetem(this,'${va.TEAMD1_ID}','${va.PERSONNEL_NAME}');" type="button">删除</button>
	                    			</div>
	                    		</td>
	                    	</tr>
                    	 </c:if>
                    	</c:forEach>
                    	</c:if>
                    	
                    	<!-- --------------为空的添加 --------------->
                     <c:if test="${empty sj}">
                    	<tr>
                    		<!-- <td>001</td> -->
                    		<td style="text-align: center">
                    		  <input type="hidden" name="TEAMD1_ID" value="${va.TEAMD1_ID}">
                    			<select class="fenxi_sea" name="STEPS">
                    				<option value="3">责任人</option>
                    				
                    			</select>
                    		</td>
                    		<td>
                    			<select class="fenxi_sea DEPT" onchange="empchang(this,'')" name="DEPT"  >
									<c:forEach items="${deptList}" var="var">
									   <option value="${var.DEPARTMENT_ID}" at="${var.DEPARTMENT_ID}" <c:if test="${var.DEPARTMENT_ID eq va.DEPARTMENT_ID}">selected="selected"</c:if>>${var.DEPARTMENT_NAME}</option>
									</c:forEach>
				                </select>  
                    		</td>
                    		<td>
                    			<select class="fenxi_sea PERSONNEL_NAME" onchange="myuser(this)" name="PERSONNEL_NAME"  data-placeholder="请选择人员">
									<c:forEach items="${userall}" var="var">
									  <option  value="${var.USER_ID}" uid="${var.USER_ID}" <c:if test="${var.USER_ID eq userfind.USER_ID}">selected="selected"</c:if>>${var.NAME}</option>
									 </c:forEach>
				                </select>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">质量管理部部长</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi">18423527240</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs dis">
                    			<button class="fenxi_btn fenxi_btnxg" onclick="updatetem(this,'${va.TEAMD1_ID}');" type="button">修改</button>
                    			<button class="fenxi_btn fenxi_btnsc"  type="button">删除</button>
                    			</div>
                    		</td>
                    	</tr>
                    	<tr class="trid">
                    		<!-- <td>002</td> -->
                    		<td style="text-align: center">
                    			
                    			<select class="fenxi_sea STEPS" name="STEPS">
                    				<option value="1">团队领导</option>
							         <option value="2">团队成员</option>
                    			</select>
                    		</td>
                    		<td>
                    			
                    			<!-- 部门 -->
                    			<select class="fenxi_sea DEPT" onchange="empchang(this,'')" name="DEPT"  data-placeholder="请选择人员" >
									<c:forEach items="${deptList}" var="var">
									   <option value="${var.DEPARTMENT_ID}" at="${var.DEPARTMENT_ID}" <c:if test="${var.DEPARTMENT_ID eq userfind.DEPARTMENT_ID}">selected="selected"</c:if>>${var.DEPARTMENT_NAME}</option>
									</c:forEach>
				                </select>             
                    		</td>
                    		<td>
                    			
                    			<!-- 人员 -->
                    			<select class="fenxi_sea PERSONNEL_NAME" onchange="myuser(this)" name="PERSONNEL_NAME"  data-placeholder="请选择人员">
									<c:forEach items="${userall}" var="var">
									  <option  value="${var.USER_ID}" uid="${var.USER_ID}" <c:if test="${var.USER_ID eq userfind.USER_ID}">selected="selected"</c:if>>${var.NAME}</option>
									 
									</c:forEach>
				                </select>
                    			
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi POSITION">质量管理部部长</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_zhi PHONE">18423527240</div>
                    		</td>
                    		<td>
                    			<div class="fenxi_btnboxs">
                    			 <button class="fenxi_btn fenxi_btnxg" onclick="updatetem(this,'');"  type="button">修改</button>
                    			<button class="fenxi_btn fenxi_btnsc" onclick="$(this).parents('tr').remove();" type="button">删除</button>
                    			</div>
                    		</td>
                    	</tr>
                    	</c:if>
                    	
                    	
                       
                    </tbody>
                  	
                   
				</table>
				 </form>  
				 
				 
				 <c:if test="${empty sj}">
				  <button class="fenxi_baocun" onclick="teamServ();">保存</button>
				 </c:if>
				<c:if test="${!empty sj}">
				   <button class="fenxi_baocun" onclick="teamedit();">保存</button>
				</c:if>
				<!---步骤分配-->
				
				<div class="buzhou_fen <c:if test="${empty sj }">dis</c:if>">
					<div class="buzhoufen_tit">步骤分配</div>
					<table class="tenxi_tab tenxi_tab2">
						<thead>
							<tr>
								<td>步骤</td>
								<td>姓名</td>
								<td>部门</td>
								<td>计划时间</td>
								<td></td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${planlist}" var="vars" varStatus="vs">
								<tr>
									<td>D${vs.index}</td>
									<td>
									  
										<select name="USERID"  onchange="isuser(this)" class="fenxi_sea USERID">
											<c:forEach items="${teamList}" var="var">
											   <option  uid="${vars.USERID}" value="${var.PERSONNEL_NAME}" <c:if test="${vars.USERID eq var.PERSONNEL_NAME}">selected="selected"</c:if>>${var.NAME}</option>
											</c:forEach>
										</select>
									</td>
									<td>
									   <div class="fenxi_zhi">质量管理部门</div>
                    		        </td>
									<td>
										<input class="fenxiino" name="PLANTIME" type="date" value="<fmt:formatDate value="${vars.PLANTIME}" pattern="yyyy-MM-dd"/>" />
										
									</td>
									<td>
										<button class="fenixobtnx" onclick="planUp(this,'${vars.PLAN_ID}')"   type="button">修改</button>
									</td>
								</tr>
							</c:forEach>
							
							
						</tbody>
					</table>
					<!-- 添加内容 -->
					<table style="display: none;">
                    	<tr style="display: none;" class="trid">
	                    	<input type="hidden" name="TEAMD1_ID" value="">
	                    		<!-- <td>002</td> -->
	                    		<td style="text-align: center">
	                    			
	                    			<select class="fenxi_sea STEPS" name="STEPS">
	                    				<option value="1">团队领导</option>
								         <option value="2">团队成员</option>
	                    			</select>
	                    		</td>
	                    		<td>
	                    			<!-- 部门 -->
	                    			<select class="fenxi_sea DEPT" onchange="empchang(this,'${va.PERSONNEL_NAME}')" name="DEPT"  data-placeholder="请选择人员" >
										<c:forEach items="${deptList}" var="var">
										   <option value="${var.DEPARTMENT_ID}" at="${var.DEPARTMENT_ID}" <c:if test="${var.DEPARTMENT_ID eq va.DEPT}">selected="selected"</c:if>>${var.DEPARTMENT_NAME}</option>
										</c:forEach>
					                </select>             
	                    		</td>
	                    		<td>
	                    			
	                    			<!-- 人员 -->
	                    			<select class="fenxi_sea PERSONNEL_NAME" onchange="myuser(this)" name="PERSONNEL_NAME"  data-placeholder="请选择人员">
										<c:forEach items="${userall}" var="var">
										  <option  value="${var.USER_ID}" uid="${var.USER_ID}" <c:if test="${var.USER_ID eq userfind.USER_ID}">selected="selected"</c:if>>${var.NAME}</option>
										 </c:forEach>
					                </select>
	                    		</td>
	                    		<td>
	                    			<div class="fenxi_zhi POSITION">${va.POSITION}</div>
	                    		</td>
	                    		<td>
	                    			<div class="fenxi_zhi PHONE">${va.PHONE}</div>
	                    		</td>
	                    		<td>
	                    			<div class="fenxi_btnboxs">
	                    			<button class="fenxi_btn fenxi_btnxg"  onclick="updatetem(this,'');" type="button">修改</button>
	                    			<button class="fenxi_btn fenxi_btnsc"  onclick="$(this).parents('tr').remove();" type="button">删除</button>
	                    			</div>
	                    		</td>
	                    	</tr></table>
				</div>
				<div class="shangxia_box">
					<a href="${ctx}/dProcess/goProcess.do?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a>
					<a href="${ctx}/process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a>
				</div>
			</div>
			
		</div>
		<!----右边部分---->
		<%@ include file="/setting/right.jsp"%>
		<script>
		// 新增的tr元素
		 var  cNode;
		
			$(function(){
				
               //新增成员
               $(".xinze_r").click(function(){
                 cNode= $(".trid").html();
                 $("#addUserTable").append("<tr>"+cNode+"</tr>");
               })
               
             // 初始化部门 人员 信息
  			 var  deptclass=$('.DEPT');
  	         //循环调用人员默认选中
  			 for (var i = 0; i <= deptclass.length; i++) {
  				$(deptclass[i]).change();
  			  }  
  			$(".USERID").change();
               
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
								alert("操作无效");
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
								$(thi).parent().next().children().text(users.ROLE_NAME);
								$(thi).parent().next().next().children().text(users.PHONE); 
								}
									
								
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								alert("操作无效");
							}
					})
				
				
			}
			//成员 新增（保存按钮）====================================
			function teamServ(){
				
				$.ajax({
					type : "POST",
					url : '${ctx}/process_one/save',
					data : $("#FORM1").serialize(),
					async: false,
					dataType : 'json',
					success : function(data) {
						if(data.message=='1'){
							alert("保存成功");
							window.location.href='${ctx}/process_one/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}'; 
						}else{
							alert("保存失败")
						}
							
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("操作无效");
					}
			})
			}
			//成员修改（保存 按钮）
			function teamedit(){
				
				$.ajax({
					type : "POST",
					url : '${ctx}/process_one/edit',
					data : $("#FORM1").serialize(),
					async: false,
					dataType : 'json',
					success : function(data) {
						if(data.message=='1'){
							alert("保存成功");
							
						}else{
							alert("保存失败")
						}
							
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("操作无效");
					}
			})
			}
			
			
	  //成员修改
	  function updatetem(thi,TEAMD1_ID){
		  if(!TEAMD1_ID){
			  
			  alert("请先保存");
			  return;
		  }
			//获取角色
			 var STEPS=	$(thi).parent().parent().siblings().children('.STEPS').val();
			//部门
			 var DEPT=	$(thi).parent().parent().siblings().children('.DEPT').val();
			//人员
			 var PERSONNEL_NAME=$(thi).parent().parent().siblings().children('.PERSONNEL_NAME').val();
			/* //职位
			 var POSITION=	$(thi).parent().parent().siblings().children('.POSITION');
			//电话
			 var PHONE=	$(thi).parent().parent().siblings().children('.PHONE'); */
			
			
			 console.log(TEAMD1_ID+":"+STEPS+":"+DEPT+":"+PERSONNEL_NAME);
			 
			 $.ajax({
					type : "POST",
					url : '${ctx}/teamd1/edit',
					data : {"TEAMD1_ID":TEAMD1_ID,
					        "STEPS":STEPS,
					        "DEPT":DEPT,
					        "PERSONNEL_NAME":PERSONNEL_NAME
					    },
					async: false,
					dataType :'json',
					success : function(data) {
						if(data.message=='1'){
							alert("修改成功");
							window.location.href='${ctx}/process_one/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}'; 
						}else{
							alert("修改失败")
						}
							
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("操作无效");
					}
			})
			 
			 
					
				
			}
	  //成员删除
	  function deletetem(thi,TEAMD1_ID,USERID){
			
			 
			 $.ajax({
					type : "POST",
					url : '${ctx}/teamd1/delete',
					data : {"TEAMD1_ID":TEAMD1_ID,"USERID":USERID,"CLIENT_PROBLEM_COLLECTION_ID":'${pd.CLIENT_PROBLEM_COLLECTION_ID}'},
					async: false,
					dataType :'json',
					success : function(data) {
						if(data.message=='1'){
							alert("删除成功");
							$(thi).parents("tr").remove();
							window.location.href='${ctx}/process_one/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}'; 
						}else if(data.message=='3'){
							alert("已添加步骤负责人不能删除")
						}else{
							
							alert("删除失败");
						}
							
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("操作无效");
					}
			})
			 
			 
					
				
			}
			
	  //成员 end=====================
		  
		  
		  //步骤=-----------
		  
		  function planUp(thi,PLAN_ID){
		  
			 
			  //用户id
			  var USERID=$(thi).parent().siblings().children("[name='USERID']").val();
			  //完成时间
			  var PLANTIME=$(thi).parent().siblings().children("[name='PLANTIME']").val();
			  
			  if(!PLANTIME){
				  alert("时间不能为空");
				  return;
				  
			  }
			 
				 $.ajax({
						type : "POST",
						url : '${ctx}/process_one/paenEdit',
						data : {"PLAN_ID":PLAN_ID,
							    "USERID":USERID,
							    "PLANTIME":PLANTIME
						         },
						async: false,
						dataType :'json',
						success : function(data) {
							if(data.message=='1'){
								alert("修改成功");
								
							}else{
								alert("修改失败")
							}
								
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert("操作无效");
						}
				}) 
		  
		  
	    }
	  
	  // 步骤用户联动============================
	  
			function isuser(thi){

			     var uid=$(thi).children('option:selected').attr("uid")
			  
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
								$(thi).parent().next().children().text(users.DEPARTMENT_NAME);
								/* $(thi).parent().next().next().children().text(users.PHONE); */ 
								}
									
								
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								alert("操作无效");
							}
					})
				
				
			}
	  
		</script>
	</body>
</html>