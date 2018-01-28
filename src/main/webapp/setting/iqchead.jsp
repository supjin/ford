<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>	
<%@ include file="/setting/taglib.jsp"%>
	<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">${pd.TITLE }</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span>
						<a href="javascript:;">${pd.TITLE }</a>
					</div>
				</div>
			</div>
			<!-- 头 -->
			<div class="insonc_box">
				<div class="insonctit">基本信息</div>
				<div class="container">
				    <div class="row">
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>申请人：</em><span>${pd.SENNAME }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>录入日期：</em><span><fmt:formatDate value='${pd.BILLDATE }' pattern='yyyy-MM-dd hh:mm' /></span></div>
				        </div> 
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>跟踪号：</em><span>${pd.TRACKINGNUMBER}</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>零件编码：</em><span>${pd.MACODE }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>零件名称：</em><span>${pd.MANAME }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>供应商名称：</em><span>${pd.NAME }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>到货日期：</em><span><fmt:formatDate value='${pd.DAOHUODATE }' pattern='yyyy-MM-dd' /></span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>批次号：</em><span>${pd.BATCHNUMBER }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>抽样数量：</em><span>${pd.SANPLI }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>失效模式：</em><span>${pd.FAILURENAME }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>缺陷数量：</em><span>${pd.DEFECTSNUMBER }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>发生日期：</em><span><fmt:formatDate value='${pd.OCCURENTDATE }' pattern='yyyy-MM-dd' /></span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>责任人：</em><span>${pd.USERNAME }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>缺陷症状描述：</em><span>${pd.DEFECTDESCRIP }</span></div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc1div"><em>备注：</em><span>${pd.REMARK }</span></div>
				        </div>
				    </div>
				</div>
			</div>
			<!---颈---->
			<div class="iqc_list1con">
				<!-----li的5种状态（d_active23\d_active22\d_active3\d_active4\没有class的时候）；使用列子：<li class="d_active22">。----->
				<ul class="iqc_ulbox clearfix">
			
					<li <c:if test="${pds.TYPE eq 1 }">class="d_active22"</c:if>>
						<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${pd.IQC_PROBLEM_ID}&TYPE=1">
							<em>1</em>
							<span>发送供应商问题通知</span>
						</a>
						<div class="d_yydd"></div>
					</li>
					<li <c:if test="${pds.TYPE eq 2 || pds.TYPE eq 4}">class="d_active22"</c:if>>
					
						<a <c:if test="${pd.ISEIGHTD eq 1}">href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${pd.IQC_PROBLEM_ID}&TYPE=2"</c:if><c:if test="${pd.ISEIGHTD eq 2}">href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${pd.IQC_PROBLEM_ID}&TYPE=4"</c:if>>
							<em>2</em>
							<span>供应商反馈8D报告</span>
						</a>
						
						
					</li>
					<%-- <li <c:if test="${pds.TYPE eq 3 }">class="d_active22"</c:if>>
						<a href="${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${pd.IQC_PROBLEM_ID}&TYPE=3">
							<em>3</em>
							<span>领导确认</span>
						</a>
					</li> --%>
				</ul>
			</div>