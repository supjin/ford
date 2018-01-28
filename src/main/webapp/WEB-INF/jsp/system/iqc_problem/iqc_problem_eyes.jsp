<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>供应商问题浏览</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/iqc.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
	</head>
	<body style="background-color:#edeff5;margin: 15px;">
		<div class="oiswen_box oiswen_boxavite">
			<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">供应商问题浏览</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span>
						<a href="javascript:;">供应商问题浏览</a>
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
			</div>
			<!---表---->
			<div class="iqc_listbot" style="padding: 5px 10px;">
				<div class="iqc_boxtit"><span>1</span>发送供应商问题通知</div>
				<div class="container" style="width: 100%;">
				    <div class="row">
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>供应商联系人：</em>
				        		<span>张三</span>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>邮箱：</em><span>${pd.SENDEMAIL }</span>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>要求回复日期：</em><span><fmt:formatDate value='${pd.REQUIREDATE }' pattern='yyyy-MM-dd HH:mm' /></span>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>是否重复发生：</em><span>是</span>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>是否需要8D：</em>
				        		<span>是</span>
				        	</div>
				        </div>
				    </div>
				</div>
			</div>
			<div class="iqc_listbot" style="padding: 5px 10px;">
				<div class="iqc_boxtit"><span>2</span>供应商反馈8D报告</div>
				<c:if test="${pd.ISEIGHTD eq 1}">
				<div class="container" style="width: 100%;">
				    <div class="row">
				    	<div class="col-sm-4">
				        	<div class="iqc2div clearfix">
				        		<em>完成日期：</em><span>2017-02-22</span>
				        	</div>
				        </div>
				        <div class="col-sm-4">
				        	<div class="jinjiule jinjiulb">
				        		<div class="jinjiultit2" style="float: left;">上传附件</div>
								<div class="jinjiuze" style="margin-left: 100px;">
									<div class="jinjiddi" style="border: none;">
										<c:forEach items="${pd.ATTMAP }" var="map">
										 <div class="jinjiuddd">
												<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
												<div class="jinjiudtits">
												<a class="pull-left" href="${ctx }/process_two/downWen.do?filepath=${map.key}&filename=${map.value}" title="${map.value}">${map.value}</a>
												<input type='hidden' value='${map.key}'/>
												</div>
											</div>
					                    </c:forEach>
									</div>
								</div>
				        	</div>
				        </div>
				    </div>
				</div>
				</c:if>
				<c:if test="${pd.ISEIGHTD eq 2}">
				<div class="container" style="width: 100%;">
				    <div class="row">
				    	<div class="col-sm-4">
				        	<div class="iqc2div clearfix">
				        		<em>实际回复日期：</em><span><fmt:formatDate value='${pd.SHIJIDATE }' pattern='yyyy-MM-dd HH:mm' /></span>
				        	</div>
				        </div>
				        <div class="col-sm-4">
				        	<div class="iqc2div clearfix">
				        		<em>完成日期：</em><span><fmt:formatDate value='${pd.WANCDATE }'   pattern='yyyy-MM-dd HH:mm' /></span>
				        	</div>
				        </div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>临时对策：</em><div class="iqc2divbo">${pd.DUICELIN }</div>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>发生原因：</em><div class="iqc2divbo">${pd.FASRESON }</div>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>流出原因：</em><div class="iqc2divbo">${pd.LIURESON }</div>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>根本对策：</em><div class="iqc2divbo">${pd.DUICEYON }</div>
				        	</div>
				        </div>
				    </div>
				</div>
				</c:if>
				<!-- <button type="button" class="iqcbtna">提交</button> -->
			</div>
			<!-- <div class="iqc_listbot" style="padding: 5px 10px;">
				<div class="iqc_boxtit"><span>3</span>领导审核结果</div>
				<div>通过/驳回</div>
			</div>	 -->
	</div>
	</body>

</html>