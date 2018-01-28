<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
		<div class="fen_navlis">
		    <%-- <span></span><a class="fen_active" href="${ctx }/process_zero/goDprocess.do?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">标准8D</a> --%>
		    <c:forEach items="${biaoList }" var="var">
				 <span>---></span><a <c:if test="${empty var.PID }">href="javascript:"</c:if><c:if test="${not empty var.PID }">href="${ctx }/${var.PID}${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if> <c:if test="${var.VALUE<=pd.PROCESSTATE }">class="fen_active"</c:if>>${var.LABEL }</a>
			</c:forEach>
		</div>