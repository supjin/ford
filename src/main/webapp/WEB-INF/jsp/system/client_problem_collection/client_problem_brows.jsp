<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>${pd.DINGTILE }浏览</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/browse.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<script src="${ctx }/static/fords/js/my.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
	</head>
	<body style="background-color:#edeff5;margin: 15px;">
		<div class="oiswen_box" style="margin-right: 0px;">
			<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">${pd.DINGTILE }</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span><a href="javascript:;">${pd.DINGTILE }</a><span>/</span><a href="javascript:;">${pd.TITLE }</a>
					</div>
				</div>
			</div>
			<!---头部信息--->
			<div class="shijian_box">
				<div class="shijian_tit">${pd.TITLE }</div>
				<ul class="shijian_ul">
					<li>事件编号：${pd.TRACKINGNUMBER}</li>
					<li>产品名称：${pd.PRODUCTNAME }</li>
					<li>问题类型：功能问题</li>
					<li>客户名称：${pd.CLIENTSNAME }</li>
					<li>创建时间：<fmt:formatDate value='${pd.CREATETIME }' pattern='yyyy-MM-dd' /></li>
					<li>负责人：${pd.NAME }</li>
				</ul>
				<div class="shijian_div">
					<div class="shijian_d">
						<p>${pd.timepast }</p>
						<em>进行天数</em>
					</div>
				</div>
			</div>
			<!---8d流程--->
			<div class="d_box">
				<h3 class="d_tit" style="border: none;">标准8D流程</h3>
				<div class="browse_box">
					<!---d0---->
					<div class="browse_div">
						<div class="browse_conts">
							<div class="browse_titsbbt">
								<p>症状描述：</p>
								<p>${pds.SYSPTOMDESCRIPTION }</p>
							</div>
							<c:forEach items="${dzList }" var="var" varStatus="status">
							<div class="browse_titsbbt">
								<p>应急反应：</p>
								<p>${status.index + 1 }</p>
							</div>
							<div class="browse_titwi clearfix">
								<div class="browse_titwile">
									<ul class="browse_titwileul clearfix">
										<li><em>责任人：</em><span> <c:if test="${not empty var.NAME}"> ${var.NAME }</c:if><c:if test="${empty var.NAME}"> ${var.RESPONSIBLE }</c:if></span></li>
										<li><em>计划时间：</em><span>${var.PLANTIME }</span></li>
										<li><em>执行时间：</em><span>${var.EXECUTIONDATE }</span></li>
										<li><em>有效率：</em><span>${var.EFFCIENT }</span></li>
									</ul>
									<p class="browse_titwilep"><em>应急反应：</em><span>${var.EMERGENCYRESPONSE }</span></p>
								</div>
								<div class="browse_titwiri">
									<div class="jinjiule jinjiulb">
										<div class="jinjiultit2">上传附件</div>
										<div class="jinjiuze">
											<div class="jinjiddi">
												<c:forEach items="${var.ATTMAP }" var="att">
												 <c:forEach var="map" items="${att}">
												 <div class="jinjiuddd">
														<em class="jinjiudddeml pull-left"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
														<div class="jinjiudtits">
														<a class="pull-left" href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
														<input type='hidden' value='${map.value}'/>
														</div>
														<em class="jinjiudddemr pull-left"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
													</div>
							                    </c:forEach>
							                    </c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<div class="clearfix"><a href="${ctx }/dProcess/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="xiangbtn">详情</a></div>
						</div>
						<div class="browse_left">
							<div>D0</div>
							<div>紧急遏制</div>
						</div>
					</div>
					<!---d1---->
					<div class="browse_div">
						<div class="browse_conts" style="padding: 0px;">
							<table class="browse_tab" cellpadding="0" cellspacing="0">
								<thead>
									<tr>
										<td style="width: 8%;">序号</td>
										<td style="width: 10%;">步骤负责</td>
										<td style="width: 14%;">计划时间</td>
										<td style="width: 10%;">角色</td>
										<td style="width: 10%;">姓名</td>
										<td style="width: 14%;">部门</td>
										<td style="width: 19%;">职务</td>
										<td style="width: 15%;">电话</td>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${paList }" var="var" varStatus="status">
									<tr>
										<td>${status.index +1 }</td>
										<td>D${status.index }</td>
										<td><fmt:formatDate value='${var.PLANTIME}' type='date' pattern="yyyy-MM-dd"/></td>
										<td>责任人</td>
										<td>${var.NAME}</td>
										<td>${var.DEPARTMENT_NAME }</td>
										<td>${var.position }</td>
										<td>${var.PHONE }</td>
									</tr>
								</c:forEach>	
								</tbody>
							</table>
							
							<div class="clearfix" style="padding-right: 2%;padding-bottom: 15px;"><a href="${ctx }/process_one/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="xiangbtn" >详情</a></div>
						</div>
						<div class="browse_left">
							<div>D1</div>
							<div>分析小组</div>
						</div>
					</div>
					<!----d2---->
					<div class="browse_div">
						<div class="browse_conts">
							<p class="br_d2p">问题陈述：</p>
							<div class="br_d2div">${pdt.PROBLEMSTATEMENT }</div>
							<div class="br_d2div2"><em>问题分类：</em><span>${pdt.PROBLEMMOLD }</span></div>
							<div class="br_d2box clearfix">
								<div class="br_d2le">
									<ul class="br_d2leul clearfix">
										<li><p>发生了什么问题?</p><p>${pdt.WHATS }</p></li>
										<li><p>为什么是问题?</p><p>${pdt.WHYS }</p></li>
										<li><p>何时发生的?何时问题被提出的？</p><p>${pdt.WHENS }</p></li>
										<li><p>谁发现的?谁提出的？</p><p>${pdt.WHOS }</p></li>
										<li><p>在哪发现的?在哪被提出的？</p><p>${pdt.WHERES }</p></li>
										<li><p>数量是多少？</p><p>${pdt.HOWFOUNDS }</p></li>
										<li><p>如何被发现的？</p><p>${pdt.HOWMANY }</p></li>
									</ul>
								</div>
								<div class="br_d2ri">
									<div class="jinjiule jinjiulb">
										<div class="jinjiultit2">上传附件</div>
										<div class="jinjiuze">
											<div class="jinjiddi">
												<c:forEach items="${dtlist }" var="maps">
											 	 <c:forEach var="map" items="${maps}">
												 <div class="jinjiuddd">
														<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
														<div class="jinjiudtits">
														<a href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
														</div>
														<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
													</div>
												</c:forEach>	
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="d2_btdib clearfix"><a href="${ctx }process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${CLIENT_PROBLEM_COLLECTION_ID}" class="xiangbtn">详情</a><a href="is_not2.html" class="xiangbtnis">Is & Is not</a></div>
						</div>
						<div class="browse_left">
							<div>D2</div>
							<div>问题描述</div>
						</div>
					</div>
					<!----d3---->
					<div class="browse_div">
						<div class="browse_conts">
							<div class="d3_uls">
								<c:forEach items="${thList }" var="var" varStatus="status">
								<div class="d3_lis">
									<div class="d3_xuhao">${status.index + 1 }</div>
									<div class="browse_titwi clearfix">
										<div class="browse_titwile">
											<ul class="browse_titwileul clearfix">
												<li><em>责任人：</em><span> <c:if test="${not empty var.NAME}"> ${var.NAME }</c:if><c:if test="${empty var.NAME}"> ${var.RESPONSIBLE }</c:if></span></li>
												<li><em>计划时间：</em><span> ${var.DOTIME }</span></li>
												<li><em>执行时间：</em><span>${var.EXECUTIONDATE }</span></li>
												<li><em>有效率：</em><span>${var.LABEL }</span></li>
											</ul>
											<p class="browse_titwilep"><em>临时措施：</em><span>${var.MEASURESNAME }</span></p>
										</div>
										<div class="browse_titwiri">
											<div class="jinjiule jinjiulb">
												<div class="jinjiultit2">上传附件</div>
												<div class="jinjiuze">
													<div class="jinjiddi">
															 <c:forEach items="${var.ATTMAP }" var="att">
														 <c:forEach var="map" items="${att}">
															 <div class="jinjiuddd">
																<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
																</div>
																<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
															</div>
									                    </c:forEach>
									                    </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>	
								
								
								
							</div>
							<div class="clearfix"><a href="${ctx }process_three/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="xiangbtn">详情</a><a href="screening_table.html" class="xiangbtnis" style="width: 80px;">排查表</a></div>
						</div>
						<div class="browse_left">
							<div>D3</div>
							<div>临时措施</div>
						</div>
					</div>
					<!---d4----->
					<div class="browse_div">
						<div class="browse_conts">
							<div class="clearfix browse_dds"><p>是供应商问题</p><p><em>责任人：</em><span>吴萌萌</span></p><a href="javascript:;" class="gongbtn">供应商</a></div>
							<div class="d4_liss">
								<div class="d4_lisstit">发生原因：</div>
								<div class="browse_titwi">
								<c:forEach items="${fo1List}" var="var" varStatus="vs">
									<div class="clearfix">
										<div class="browse_titwile">
											<ul class="browse_titwileul clearfix">
												<li><em>是否重复发生：</em><span> <c:if test="${var.ISREPEAT ==1}">是</c:if><c:if test="${var.ISREPEAT ==0}">否</c:if></span></li>
												<li><em>发生次数：</em><span>${var.occurrences }</span></li>
												<li><em>发生原因分类：</em><span><c:if test="${var.causes ==1}">外观原因</c:if><c:if test="${var.causes ==2}">功能原因</c:if></span></li>
												<li><em>贡献：</em><span>${var.contribution }</span></li>
											</ul>
											<p class="browse_titwilep"><em>发生原因：</em><span>${var.OCCUR }</span></p>
										</div>
										<div class="browse_titwiri">
											<div class="jinjiule jinjiulb">
												<div class="jinjiultit2">上传附件</div>
												<div class="jinjiuze">
													<div class="jinjiddi">
														 <c:forEach items="${var.ATTACHMENT}" var="vars">
														       <div class="jinjiuddd">
																	<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
																	<div class="jinjiudtits">
																		<a href="${ctx }/process_two/downWen.do?filepath=${vars.k_url}&filename=${vars.k_name}">${vars.k_name}</a>
																	</div>
																	<em class="jinjiudddemr"><img src="${ctx}/static/fords/img/guanbi.png"/></em>
																</div>
													     
													 	 </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									<div class="clearfix"><a href="javascript:;" class="yu_btns">鱼骨图</a><a href="${ctx}/pc/fivewhyCLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="ww_btns">5why</a><a href="${ctx}/isnot/goIsNotCLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="isnot_btn">Is & Is not</a></div>
								</div>
								<p class="browse_titwilep"><em>验证证实：</em><span>${pdf.VERIFICATION }</span></p>
							</div>
							
							<div class="d4_liss">
								<div class="d4_lisstit">逃逸点：</div>
								<div class="browse_titwi">
								 <c:forEach items="${varLists}" var="var" varStatus="vs">
									<div class="clearfix">
										<div class="browse_titwile">
											<ul class="browse_titwileul clearfix">
												<li style="width: 70%;"><em>逃逸点：</em><span>${var.ESCAPE }</span></li>
												<li><em>贡献：</em><span>${var.contribution }</span></li>
											</ul>
										</div>
										<div class="browse_titwiri">
											<div class="jinjiule jinjiulb">
												<div class="jinjiultit2">上传附件</div>
												<div class="jinjiuze">
													<div class="jinjiddi">
														 <c:forEach items="${var.ATTACHMENT}" var="vars">
														       <div class="jinjiuddd">
																	<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
																	<div class="jinjiudtits">
																		<a href="${ctx }/process_two/downWen.do?filepath=${vars.k_url}&filename=${vars.k_name}">${vars.k_name}</a>
																	</div>
																	<em class="jinjiudddemr"><img src="${ctx}/static/fords/img/guanbi.png"/></em>
																</div>
													     
													 	 </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									<div class="clearfix"><a href="${ctx}/pc/fivewhyCLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="ww_btns">5why</a></div>
								</div>
								<p class="browse_titwilep"><em>验证证实：</em><span>${pdf.VALIDATIONURE }</span></p>
							</div>
							<div class="d4_liss">
								<div class="d4_lisstit">体系原因：</div>
								<div class="browse_titwi">
								 <c:forEach items="${varListss}" var="var" varStatus="vs">
									<div class="clearfix">
										<div class="browse_titwile">
											<ul class="browse_titwileul clearfix">
												<li style="width: 70%;"><em>体系原因：</em><span>${var.SYSTEMS }</span></li>
												<li><em>贡献：</em><span>${var.contribution }</span></li>
											</ul>
										</div>
										<div class="browse_titwiri">
											<div class="jinjiule jinjiulb">
												<div class="jinjiultit2">上传附件</div>
												<div class="jinjiuze">
													<div class="jinjiddi">
														 <c:forEach items="${var.ATTACHMENT}" var="vars">
														       <div class="jinjiuddd">
																	<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
																	<div class="jinjiudtits">
																		<a href="${ctx }/process_two/downWen.do?filepath=${vars.k_url}&filename=${vars.k_name}">${vars.k_name}</a>
																	</div>
																	<em class="jinjiudddemr"><img src="${ctx}/static/fords/img/guanbi.png"/></em>
																</div>
													     
													 	 </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									<div class="clearfix"><a href="${ctx}/pc/fivewhyCLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="ww_btns">5why</a></div>
								</div>
								<p class="browse_titwilep"><em>验证证实：</em><span>${pdf.VALIDATIONERU }</span></p>
							</div>
							<div class="clearfix"><a href="${ctx }process_four/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="xiangbtn" >详情</a></div>
						</div>
						<div class="browse_left">
							<div>D4</div>
							<div>根本原因</div>
						</div>
					</div>
					<!----d5--->
					<div class="browse_div">
						<div class="browse_conts">
							<div class="d3_uls">
							<c:forEach items="${fiList }" var="var" varStatus="vs">
								<div class="d3_lis">
									<div class="d3_xuhao">${vs.index + 1 }</div>
									<div class="browse_titwi clearfix">
										<div class="browse_titwile">
											<ul class="browse_titwileul clearfix">
												<li><em>责任人：</em><span><c:if test="${not empty var.NAME}"> ${var.NAME }</c:if><c:if test="${empty var.NAME}"> ${var.PRINCIPALNAME }</c:if></span></li>
												<li style="width: 45%;"><em>计划时间：</em><span>${var.schedule_time }</span></li>
												<li><em>有效率：</em><span>${var.LABEL }</span></li>
											</ul>
											<p class="browse_titwilep"><em>永久措施：</em><span>${var.MEASURES }</span></p>
										</div>
										<div class="browse_titwiri">
											<div class="jinjiule jinjiulb">
												<div class="jinjiultit2">上传附件</div>
												<div class="jinjiuze">
													<div class="jinjiddi">
														<c:forEach items="${var.ATTACHMENT}" var="vars">
														     <div class="jinjiuddd">
																	<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
																	<div class="jinjiudtits">
																		<a href="${ctx }/process_two/downWen.do?filepath=${vars.k_url}&filename=${vars.k_name}" title="${vars.k_name}">${vars.k_name}</a>
																	</div>
																	<em class="jinjiudddemr"><img src="${ctx}/static/fords/img/guanbi.png"/></em>
																</div>
													     </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
							<p class="browse_titwilep"><em>验证证实：</em><span>${pdfi.VALIDATION }</span></p>
							<div class="clearfix"><a href="${ctx }process_five/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID }" class="xiangbtn" >详情</a></div>
						</div>
						<div class="browse_left">
							<div>D5</div>
							<div>措施选择</div>
						</div>
					</div>
					<!----d6------>
					<div class="browse_div">
						<div class="browse_conts">
							<div class="d3_uls">
							<c:forEach items="${siList }" var="var" varStatus="vs">
								<div class="d3_lis">
									<div class="d3_xuhao">${vs.index + 1 }</div>
									<div class="browse_titwi clearfix">
										<div class="browse_titwile">
											<ul class="browse_titwileul clearfix">
												<li><em>责任人：</em><span><c:if test="${not empty var.NAME}"> ${var.NAME }</c:if><c:if test="${empty var.NAME}"> ${var.RESPONSIBLE }</c:if></span></li>
												<li><em>计划时间：</em><span>${var.DOTIME }</span></li>
												<li><em>执行时间：</em><span>${var.EXECUTIONDATE }</span></li>
												<li></li>
											</ul>
											<p class="browse_titwilep"><em>永久措施：</em><span>${var.MEASURESNAME }</span></p>
										</div>
										<div class="browse_titwiri">
											<div class="jinjiule jinjiulb">
												<div class="jinjiultit2">上传附件</div>
												<div class="jinjiuze">
													<div class="jinjiddi">
														<c:forEach items="${var.ATTMAP }" var="att">
														<c:forEach var="map" items="${att}">
															<div class="jinjiuddd">
																<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																	<a href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
																</div>
																<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
															</div>
														 </c:forEach>
							                   			 </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
							<p class="browse_titwilep"><em>验证证实：</em><span>${pdsi.COMGIRMED }</span></p>
							<div class="clearfix"><a href="${ctx }/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="xiangbtn" >详情</a></div>
						</div>
						<div class="browse_left">
							<div>D6</div>
							<div>措施执行</div>
						</div>
					</div>
					<!-----d7------>
					<div class="browse_div">
						<div class="browse_conts">
							<div class="d4_lisstit">预防措施：</div>
							<div class="d3_uls">
							<c:forEach items="${mesList }" var="var" varStatus="vs">
								<div class="d3_lis">
									<div class="d3_xuhao">${vs.index + 1 }</div>
									<div class="browse_titwi clearfix">
										<div class="browse_titwile">
											<ul class="browse_titwileul clearfix">
												<li><em>责任人：</em><span><c:if test="${not empty var.NAME}"> ${var.NAME }</c:if><c:if test="${empty var.NAME}"> ${var.RESPONSIBLE }</c:if></span></li>
												<li><em>计划时间：</em><span>${var.DOTIME }</span></li>
												<li><em>执行时间：</em><span>${var.EXECUTIONDATE }</span></li>
											</ul>
											<p class="browse_titwilep"><em>预防措施：</em><span>${var.MEASURESNAME }</span></p>
										</div>
										<div class="browse_titwiri">
											<div class="jinjiule jinjiulb">
												<div class="jinjiultit2">上传附件</div>
												<div class="jinjiuze">
													<div class="jinjiddi">
														<c:forEach items="${var.ATTMAP }" var="att">
														 <c:forEach var="map" items="${att}">
															 <div class="jinjiuddd">
																<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
																</div>
																<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
															</div>
									                    </c:forEach>
									                    </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
							<p class="browse_titwilep"><em>验证证实：</em><span>${pdse.VERIFICATION }</span></p>
							<div class="d4_liss">
								<div class="d4_lisstit">体制整改预防措施：</div>
								<div class="browse_titwi">
								<c:forEach items="${tixList }" var="var" varStatus="vs">
									<div class="clearfix">
										<div class="browse_titwile">
											<ul class="browse_titwileul clearfix">
												<li><em>责任人：</em><span><c:if test="${not empty var.NAME}"> ${var.NAME }</c:if><c:if test="${empty var.NAME}"> ${var.RESPONSIBLE }</c:if></span></li>
												<li><em>计划时间：</em><span>${var.DOTIME }</span></li>
												<li><em>执行时间：</em><span>${var.EXECUTIONDATE }</span></li>
											</ul>
											<p class="browse_titwilep"><em>体制整改预防措施：</em><span>${var.MEASURESNAME }</span></p>
										</div>
										<div class="browse_titwiri">
											<div class="jinjiule jinjiulb">
												<div class="jinjiultit2">上传附件</div>
												<div class="jinjiuze">
													<div class="jinjiddi">
														<c:forEach items="${var.ATTMAP }" var="att">
														 <c:forEach var="map" items="${att}">
															 <div class="jinjiuddd">
																<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																<a href="${ctx }/process_two/downWen.do?filepath=${map.value}&filename=${map.key}" title="${map.key}">${map.key}</a>
																</div>
																<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
															</div>
									                    </c:forEach>
									                    </c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							<p class="browse_titwilep"><em>验证证实：</em><span>${pdse.VERIFICATIONURE }</span></p>
							<div class="clearfix"><a href="${ctx }/process_seven/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="xiangbtn" >详情</a></div>
						</div>
						<div class="browse_left">
							<div>D7</div>
							<div>预防措施</div>
						</div>
					</div>
					<!----d8----->
					<div class="browse_div">
						<div class="browse_conts">
							<ul class="browse_titwileul clearfix">
								<li><em>报告人：</em><span>${pde.REPORTMAN }</span></li>
								<li><em>完成时间：</em><span>${pde.FINISHTIME }</span></li>
							</ul>
							<div class="biaoqinatit">经验库标签：</div>
							<ul class="biaoqian_box clearfix">
								<li>标签1</li>
								<li>标签2</li>
								<li>标签3</li>
							</ul>
							<div class="clearfix"><a href="${ctx }process_eight/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}" class="xiangbtn" >详情</a></div>
						</div>
						<div class="browse_left">
							<div>D8</div>
							<div>团队认可</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<script>
			$(function(){
				
			})
		</script>
	</body>
</html>
