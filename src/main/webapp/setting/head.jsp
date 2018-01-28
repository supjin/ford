<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ include file="/setting/taglib.jsp"%>
<style>
.shijian_ul>li {
    float: left;
    line-height: 30px;
    color: #3a3b47;
    margin-right: 50px;
    min-width: 221px;
    font-size: 14px;
}
</style>
<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">${DINGTILE }</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;">HOME</a><span>></span><a href="${ctx }/client_problem_collection/list.do?TYPE=${pd.TYPE}">${DINGTILE }</a><span>></span><a href="javascript:;">${DINGTILE }流程</a>
					</div>
				</div>
			</div>
			<!---头部信息--->
			<div class="shijian_box">
				<div class="shijian_tit">${pd.TITLE }</div>
				<ul class="shijian_ul">
					<li>事件编号：${pd.TRACKINGNUMBER}</li>
					<li>发生日期：<fmt:formatDate value='${pd.OCCURRENCEDATE }' pattern='yyyy-MM-dd' /></li>
					<li>当前步骤：${STEPS }</li>
					<li>当前处理人：${handle.RSNAME }</li>
					<li>客户名称：${pd.CLIENTSNAME }</li>
					<li>产品名称：${pd.PRODUCTNAME }</li>
				</ul>
				<div class="shijian_div">
					<div class="shijian_d">
						<p>${pd.timepast }</p>
						<em>进行天数</em>
					</div>
					<!-- <div class="shijian_d">
						<p>86</p>
						<em>健康度</em>
					</div> -->
				</div>
			</div>
			
			<!---8d流程--->
			<div class="d_box">
				<h3 class="d_tit">标准8D流程</h3>
				<!---状态分析--li状态class---d_active1-5-->
				<ul class="d_divul">
					<c:forEach items="${dicList }" var="var" varStatus="status">
					<c:forEach items="${planList }" var="plan">
						<c:if test="${var.VALUE == plan.USTEP }">
					  <c:choose>
						     <c:when test="${pd.STEP == plan.STEP}">
						      <li class="d_active1" uid="${handle.uid }">
								<a href="${ctx}/${var.PID}${pd.CLIENT_PROBLEM_COLLECTION_ID}">
									<div class="d_yys">
										<p>${var.LABEL }</p>
										<p>${var.REMARKS }</p>
									</div>
									<div class="d_yydd"></div>
								</a>
							  </li>
							</c:when>
							<c:when test="${pd.STEP != plan.STEP  && plan.ISFINISH == 1 && plan.ISOUTIME != 2 && plan.ISOUTIME != 1}">
						      <li class="d_active2" uid="">
								<a href="${ctx}/${var.PID}${pd.CLIENT_PROBLEM_COLLECTION_ID}">
									<div class="d_yys">
										<p>${var.LABEL }</p>
										<p>${var.REMARKS }</p>
									</div>
									<div class="d_yydd"></div>
								</a>
							  </li>
							</c:when>
							 <c:when test="${pd.STEP != plan.STEP && plan.ISOUTIME == 1}">
						      <li class="d_active3" uid="">
								<a <c:if test="${DANGQJY<=plan.USTEP  }">href="javaScript:;"</c:if> <c:if test="${DANGQJY>plan.USTEP  }">href="${ctx}/${var.PID}${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if>>
									<div class="d_yys">
										<p>${var.LABEL }</p>
										<p>${var.REMARKS }</p>
									</div>
									<div class="d_yydd"></div>
								</a>
							  </li>
							</c:when>
							<c:when test="${pd.STEP != plan.STEP && plan.ISOUTIME == 2}">
						      <li class="d_active4" uid="">
								<a href="${ctx}/${var.PID}${pd.CLIENT_PROBLEM_COLLECTION_ID}">
									<div class="d_yys">
										<p>${var.LABEL }</p>
										<p>${var.REMARKS }</p>
									</div>
									<div class="d_yydd"></div>
								</a>
							  </li>
							</c:when>
						     <c:otherwise>
						       <li uid="">
								<a <c:if test="${DANGQJY<=plan.USTEP  }">href="javaScript:;"</c:if> <c:if test="${DANGQJY>plan.USTEP  }">href="${ctx}/${var.PID}${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if>>
									<div class="d_yys">
										<p>${var.LABEL }</p>
										<p>${var.REMARKS }</p>
									</div>
									<div class="d_yydd"></div>
								</a>
							  </li>
						      
						     </c:otherwise>
					  </c:choose>
					</c:if>
					</c:forEach>
						<c:if test="${fn:length(planList ) == 0}">
						<c:if test="${var.VALUE == USTEP}">
							 <li class="d_active1">
								<a href="${ctx}/${var.PID}${pd.CLIENT_PROBLEM_COLLECTION_ID}">
									<div class="d_yys">
										<p>${var.LABEL }</p>
										<p>${var.REMARKS }</p>
									</div>
									<div class="d_yydd"></div>
								</a>
							  </li>
						</c:if>
						
						<c:if test="${var.VALUE != USTEP}">
								 <li>
									<a href="${ctx}/${var.PID}${pd.CLIENT_PROBLEM_COLLECTION_ID}">
										<div class="d_yys">
											<p>${var.LABEL }</p>
											<p>${var.REMARKS }</p>
										</div>
										<div class="d_yydd"></div>
									</a>
								  </li>
							</c:if>
							</c:if>
					</c:forEach>
				</ul>
			</div>
			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
			<input type="hidden" name="FIRSTDEPARTMENT" id="FIRSTDEPARTMENT" value="${pd.FIRSTDEPARTMENT }">
			<input type="hidden" name="RESPONSIBLE" id="RESPONSIBLE" value="${handle.USERID }">
			<input type="hidden" name="FIRNAME" id="FIRNAME" value="${handle.RSNAME }">