<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>供应商问题${pd.saveoredit }</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/a_table.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		 <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/d0.js"></script>
		 <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js"></script>
		<!--下拉框  -->
		<link rel="stylesheet" href="${ctx }/static/css/chosen.css" />
		<script type="text/javascript" src="${ctx }/static/js/chosen.jquery.min.js" ></script>
	</head>

	<body style="background-color:#edeff5;margin: 15px;">
		<div class="oiswen_box oiswen_boxavite">
			<!---顶部--->
			<div class="oiswen_titop">
				<div class="oiswen_titople">
					<div class="oiswen_titoplea">供应商问题${pd.saveoredit }表</div>
					<div class="oiswen_titopleb">
						<a href="javascript:;"><span class="daohangbefor glyphicon glyphicon-home"></span>HOME</a><span>/</span>
						<a href="${ctx }/iqc_problem/list">供应商问题</a><span>/</span>
						<a href="javascript:;">供应商问题${pd.saveoredit }</a>
					</div>
				</div>
			</div>
			<form action="" id="sForm" name="sForm">
			<!----问题采集---->
			<div class="wenti_box">
			<input type="hidden" id="IQC_PROBLEM_ID" name="IQC_PROBLEM_ID" value="${pd.IQC_PROBLEM_ID }">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>申请人</p>
								<div class="tadiv">${pd.USERNAME}</div>
								<input type="hidden"  name="APPLICANT" value="${pd.USERID}">
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>录入日期</p>
						<%-- 		<c:if test="${empty pd.IQC_PROBLEM_ID }"><input  name="BILLDATE" class="layui-input test-item pw_layimg shifenm addss" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm'})"/></c:if> --%>
								<input name="BILLDATE" id="BILLDATE" class="layui-input test-item pw_layimg shifenm" onClick="laydate({istime: true, format: 'yyyy-MM-dd HH:mm'})" value="<fmt:formatDate value='${pd.BILLDATE }' pattern='yyyy-MM-dd hh:mm' />"/>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>跟踪号</p>
								<div class="tadiv">${pd.TRACKINGNUMBER}</div>
								<input type="hidden"  name="TRACKINGNUMBER" value="${pd.TRACKINGNUMBER}">
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>零件编码</p>
								<select class="chzn-select partding" name="PARTCODING" id="PARTCODING" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
							     	<option></option>
							     	<c:forEach items="${suList }" var="var">
			                    	<option attid="${var.NAME }" atid = "${var.PARTNAME }" value="${var.PARTCODING }" <c:if test="${pd.PARTCODING eq var.PARTCODING }"> selected="selected"</c:if>>${var.PARTCODING }</option>
			            			</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>零件名称</p>
								<div class="tadiv ljbina">${pd.PARTNAME }</div>
								<input type="hidden"  name="PARTNAME" id="PARTNAME" value="${pd.PARTNAME}">
							</div>
						</div>

						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>供应商名称</p>
								<div class="tadiv gyname">${pd.GYNAME }</div>
								<input type="hidden"  name="GYNAME" id="GYNAME" value="${pd.GYNAME}">
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>到货日期</p>
								<c:if test="${empty pd.IQC_PROBLEM_ID }"><input  name="DAOHUODATE"  class="jihuatame layui-input test-item pw_layimg adds" id="BILLDATES"/></c:if>
								<c:if test="${not empty pd.IQC_PROBLEM_ID }"><input name="DAOHUODATE" class="layui-input test-item pw_layimg adds" id="BILLDATESE"  value="<fmt:formatDate value='${pd.DAOHUODATE }' pattern='yyyy-MM-dd HH:mm' />"/></c:if>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>批次号</p>
								<input type="text" name="BATCHNUMBER" id="BATCHNUMBER" value="${pd.BATCHNUMBER }"/>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>抽样数量</p>
								<input type="number" name="SANPLI" id="SANPLI" value="${pd.SANPLI }"/>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>失效模式</p>
								<select class="chzn-select" name="FALUREMODEL" id="FALUREMODEL" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
										<option></option>
							      	  	 <c:forEach items="${failureList }" var="var">
							      	     	<option value="${var.FAILURENAME }" <c:if test="${pd.FALUREMODEL == var.FAILURENAME}">selected</c:if>>${var.FAILURENAME }</option>
							      	     </c:forEach>
								 </select>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>缺陷数量</p>
								<input type="number" name="DEFECTSNUMBER" id="DEFECTSNUMBER" value="${pd.DEFECTSNUMBER }"/>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>发生日期</p>
								<c:if test="${empty pd.IQC_PROBLEM_ID }"><input  name="OCCURENTDATE"  class="jihuatame layui-input test-item pw_layimg adds" id="OCCURENTDATE"/></c:if>
								<c:if test="${not empty pd.IQC_PROBLEM_ID }"><input name="OCCURENTDATE" class="layui-input test-item pw_layimg adds" id="OCCURENTDATEE"  value="<fmt:formatDate value='${pd.OCCURENTDATE }' pattern='yyyy-MM-dd' />"/></c:if>
							</div>
						</div>
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="inputboxa">
								<p>责任人</p>
								<select class="chzn-select" name="RESPONSEBLEMAN" id="RESPONSEBLEMAN" data-placeholder="请选择" style="vertical-align:top; width: 100%; border: 1px solid #dedede;height: 29px;">
								<option ></option>
				     				<c:forEach items="${userList }" var="var">
                    				<option value="${var.USER_ID }" <c:if test="${var.USER_ID eq pd.RESPONSEBLEMAN }"> selected="selected"</c:if>>${var.NAME }</option>
            						</c:forEach>
								</select>
							</div>
						</div>

						<div class="col-sm-12 col-md-12 col-lg-12">
							<div class="inputboxb">
								<p>缺陷症状描述</p>
								<textarea name="DEFECTDESCRIP" id="DEFECTDESCRIP" >${pd.DEFECTDESCRIP }</textarea>
							</div>
						</div>
						<div class="col-sm-12 col-md-12 col-lg-12">
							<div class="inputboxb">
								<p>备注</p>
								<textarea name="REMARK" id="REMARK">${pd.REMARK }</textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="acq_boxtx">
					<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/iqc_problem/list'">关闭</button>
					<button type="button" class="tibutton">提交</button>
					<c:if test="${pd.IQC_PROBLEM_ID == null }">
					<button type="button" class="jxbutton" onclick="window.location.href='${ctx}/iqc_problem/goandAddEdit'">继续添加</button>
					</c:if>
				</div>

			</div>
		</form>
		</div>
		<script>
		//获取时分秒
		shifens();
		function shifens(){
			var oDate = new Date(); //实例一个时间对象；
			var nian=oDate.getFullYear();   //获取系统的年；
			var yue=oDate.getMonth()+1;   //获取系统月份，由于月份是从0开始计算，所以要加1
			var ri=oDate.getDate(); // 获取系统日，
			function Appendzero(obj) {
	           if (obj < 10) return "0" + obj; else return obj;
	        }
			var shi=oDate.getHours(); //获取系统时，
			var fen=oDate.getMinutes(); //分;格式如：2018-01-25 10:49
			var strtade=Appendzero(nian)+"-"+Appendzero(yue)+"-"+Appendzero(ri)+" "+Appendzero(shi)+":"+Appendzero(fen);
			
			if($("#IQC_PROBLEM_ID").val() == ""){
			$(".shifenm").val(strtade);
			}
		}
		//同时绑定多个
		lay('.test-item').each(function(){
			laydate.render({
			    elem: this
			    ,trigger: 'click'//点击出发日期
			    ,type: 'datetime'//年月日
			    ,format: 'yyyy-MM-dd HH:mm'//自定义格式
			    ,theme: 'molv'//墨绿色
			});
		});
			$(function() {
				//失效输入框赋值
				$(document).on("click", ".dropdown-menu>li", function() {
					var a = $(this).children("a").html();
					$(this).parents(".input-group").find("input").val(a);
				})
				$(".chzn-select").chosen({
					search_contains: true,
					enable_split_word_search: true
				});
				$(".partding").change(function(){
					 var secode = $(this).val();
					
					 var atis =  $(this).find('option:selected').attr("attid");
					 var atie =  $(this).find('option:selected').attr("atid");
					 $(".ljbina").html(atie);
					$(".gyname").html(atis);
					$("#GYNAME").val(atis);
					$("#PARTNAME").val(atie);
					/* $(".gycode").html(atie); */
					
				});
				$(document).on("click", ".tibutton", function() {
					$.ajax({
						type : "POST",
						url : "${ctx}/iqc_problem/addAndEdit",
						data : $("#sForm").serialize(),
						success : function(data) {
							alert2("保存成功");
							$("#IQC_PROBLEM_ID").val(data.IQC_PROBLEM_ID);
						},
						error : function() {
							alert("上传失败");
						}
					});
				})
				
				
				//下拉框----初判责任部门(引用zcity.js)
				//zcityrun('.zcityGroup');
				//选择按钮js
				/*$(document).on("change",".chebox input",function(){
					var b=$(this).val();
					if(b==1){
						if($(this).is(":checked")){
							$(this).prop("checked","checked");
					        $(this).parent().siblings("label").children("input").removeAttr("checked");
						}else{
							
						}
					}else{
						if($(this).is(":checked")){
							$(this).prop("checked","checked");
					        $(this).parent().siblings("label").children("input").removeAttr("checked");
						}else{
							
						}
					}
					
				})*/
			})
		</script>
	</body>

</html>