<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<title>${pd.TITLE }</title>
		<link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/list.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/iqc.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
		<link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
		<script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js"></script>
		<script type="text/javascript" src="${ctx }/static/fords/laydate/laydate.js" ></script>
		<script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
	</head>
<body style="background-color:#edeff5;margin: 15px;">
		<div class="oiswen_box oiswen_boxavite">
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
			<!---表---->
			<form action="" id="codeForm" name="codeForm">
			<div class="iqc_listbot">
			<input type="hidden" name="TYPE" value="5">
			<input type="hidden" name="IQC_PROBLEM_ID" value="${pd.IQC_PROBLEM_ID }">
			<input type="hidden" name="FINISHSTATE" id="FINISHSTATE" value="${pd.FINISHSTATE }">
				<div class="container" style="width: 100%;">
				    <div class="row">
				     <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>是否需要8D：</em>
				        		<div class="idsosnt sb_lanqiao"><label><input type="radio" name="ISEIGHTD"  value="1" <c:if test="${pd.ISEIGHTD eq 1 }"> checked="checked"</c:if>/><span>是</span></label><label><input type="radio" name="ISEIGHTD" value="2"  <c:if test="${pd.ISEIGHTD eq 2 }"> checked="checked"</c:if>/><span>否</span></label></div>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>供应商联系人：</em>
				        		<select id="LINKSELEC">
				        			<option attid="${pdd.LINKEMAIL }" 	<c:if test="${pd.SENDEMAIL eq pdd.LINKEMAIL }">selected="selected"</c:if> value="${pdd.LINKEMAIL }">${pdd.LINKMAN }</option>
				        			<option attid="${pdd.LINKEMAILT }" 	<c:if test="${pd.SENDEMAIL eq pdd.LINKEMAILT }">selected="selected"</c:if> value="${pdd.LINKEMAILT }">${pdd.LINKMANT }</option>
				        		</select>
				        	
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>邮箱：</em><input type="text" id="SENDEMAIL"  name="SENDEMAIL" value="${pd.SENDEMAIL }" class="emailspan"></input>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>要求回复日期：</em><input class="laydate-icon" type="text" id="demo1" name="REQUIREDATE" value="<fmt:formatDate value='${pd.REQUIREDATE }' pattern='yyyy-MM-dd HH:mm' />" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm'})"/>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>是否重复发生：</em>
				        		<div class="idsosnt"><label><input type="radio" name="adds" disabled="disabled" <c:if test="${pd.ISREAPED eq 1 }"> checked="checked"</c:if>/><span>是</span></label><label><input type="radio" name="adds" disabled="disabled" <c:if test="${pd.ISREAPED eq 2 }"> checked="checked"</c:if>//><span>否</span></label></div>
				        	</div>
				        </div>
				       
				    </div>
				</div>
			<!-- 	<button type="button" class="iqcbtna iqcsubmito">提交</button> -->
			</div>
		<c:if test="${pd.ISEIGHTD eq 1}">
		<!---表---->
			<div class="iqc_listbot">
			<input type="hidden" name="IQC_PROBLEM_ID" value="${pd.IQC_PROBLEM_ID }">
				<div class="container" style="width: 100%;">
				    <div class="row">
				    	<div class="col-sm-4">
				        	<div class="iqc2div clearfix">
				        		<em>完成日期：</em><input class="laydate-icon" type="text" name="WANCDATE" value="${pd.WANCDATE }" id="demo1"/>
				        	</div>
				        </div>
				        <div class="col-sm-4">
				        	<div class="jinjiule jinjiulb">
				        		<input type="hidden" name="FILEURL">
				        		<div class="jinjiultit2" style="float: left;">上传附件<input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
								<div class="jinjiuze" style="margin-left: 100px;">
									<div class="jinjiddi" style="border: 1px solid #e3e3e3;" id="myfilea">
										<c:forEach items="${pd.ATTMAP }" var="map">
										 <div class="jinjiuddd">
												<em class="jinjiudddeml"><img src="${ctx }/static/fords/img/wenjian.png"/></em>
												<div class="jinjiudtits">
												<a class="pull-left" href="${ctx }/process_two/downWen.do?filepath=${map.key}&filename=${map.value}" title="${map.value}">${map.value}</a>
												<input type='hidden' value='${map.key}'/>
												</div>
												<em class="jinjiudddemr"><img src="${ctx }/static/fords/img/guanbi.png"/></em>
											</div>
					                    </c:forEach>
									</div>
								</div>
				        	</div>
				        </div>
				    </div>
				</div>
				<!-- <button type="button" class="iqcbtna iqcsubmitt">提交</button> -->
			</div>
		</c:if>
		<c:if test="${pd.ISEIGHTD eq 2 }">
		<!---表---->
			<div class="iqc_listbot">
			<input type="hidden" name="IQC_PROBLEM_ID" value="${pd.IQC_PROBLEM_ID }">
				<div class="container" style="width: 100%;">
				    <div class="row">
				    	<div class="col-sm-4">
				        	<div class="iqc2div clearfix">
				        		<em>实际回复日期：</em><input class="laydate-icon" type="text" id="demo1" name="SHIJIDATE"  value="<fmt:formatDate value='${pd.SHIJIDATE }' pattern='yyyy-MM-dd HH:mm' />" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm'})"/>
				        	</div>
				        </div>
				        <div class="col-sm-4">
				        	<div class="iqc2div clearfix">
				        		<em>完成日期：</em><input class="laydate-icon" type="text" id="demo2" name="WANCDATE" value="<fmt:formatDate value='${pd.WANCDATE }'   pattern='yyyy-MM-dd HH:mm' />" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm'})"/>
				        	</div>
				        </div>
				    </div>
				    <div class="row">
				    	<div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>临时对策：</em><textarea name="DUICELIN">${pd.DUICELIN }</textarea>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>发生原因：</em><textarea name="FASRESON">${pd.FASRESON }</textarea>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>流出原因：</em><textarea name="LIURESON">${pd.LIURESON }</textarea>
				        	</div>
				        </div>
				        <div class="col-sm-3">
				        	<div class="iqc2div clearfix">
				        		<em>根本对策：</em><textarea name="DUICEYON">${pd.DUICEYON }</textarea>
				        	</div>
				        </div>
				    </div>
				</div>
				<!-- <button type="button" class="iqcbtna iqcsubmitf">提交</button> -->
			</div>
		
		</c:if>
		
		<%-- <c:if test="${pds.TYPE eq 3 }">
		<!---表---->
			<div class="iqc_listbot">
				<div class="iqc_listbox clearfix">
				<div class="iqc_list" style="margin-left: 71%;">
					<p class="iqc_listtit">领导确认</p>
					<ul class="iqc_listul">
						<li>
							<div class="clearfix word_teme"><p>2017-12-30</p><p>已发送</p></div>
							<div class="clearfix word_box">
								<em class="word_img"></em>
								<div class="word_tit"><p>客户反馈8D报告</p><p>16MB</p></div>
								<a class="word_xiaimg" href="javascript:;"></a>
							</div>
							<div class="clearfix word_teme2"><p>2017-12-30</p><p>由于资料不齐，未通过审核</p></div>
						</li>
						<li>
							<div class="clearfix word_teme"><p>2017-12-30</p><p>已发送</p></div>
							<div class="clearfix word_box">
								<em class="word_img"></em>
								<div class="word_tit"><p>客户反馈8D报告</p><p>16MB</p></div>
								<a class="word_xiaimg" href="javascript:;"></a>
							</div>
							<!-- <div class="word_info2 clearfix"><a href="javascript:;" class="word_bobtn">驳回</a><a href="javascript:;" class="word_tongbtn">通过</a></div> -->
						</li>
					</ul>
				</div>
				</div>
			</div>
		</c:if> --%>
		<div class="word_info2 clearfix"><a href="javascript:;" class="word_bobtn">驳回</a><a href="javascript:;" class="word_tongbtn">通过</a></div>
		</form>
		</div>
		<script>
			!function(){
			    laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
			    laydate({elem: '#demo1'});//绑定元素
			    laydate({elem: '#demo2'});//绑定元素
			}();
			$(function() {
				//驳回按钮事件
				$(document).on("click",".word_bobtn",function(){
					//prompt层
					parent.layer.prompt({
			        	formType:2,//输入框类型，支持0（文本）默认1（密码）2（多行文本）
						title:"请填写驳回原因",//标题
						area:['320px','295px'],//宽高
						shadeClose:false,//是否点击遮罩关闭
						scrollbar: true,//是否允许浏览器出现滚动条
						//btnAlign: 'c'//按钮居中
					},function(value,index){//value是输入值
						parent.layer.close(index);//关闭弹
					})
				})
				 //点击删除文件
				$(".jinjiule").on("click", ".jinjiudddemr", function() {
				    var s = $(this).parent().index();
					$(this).parent().remove();
				})
				if($("#FINISHTIMEA").val().length>0){
				$("#SENDEMAIL").val($("#LINKSELEC>option:selected").attr("attid"));
				$("#SENDMAN").val($("#LINKSELEC>option:selected").text());
				}else{
					$("#SENDEMAIL").val($("#LINKSELEC>option:eq(0)").attr("attid"));	
					$("#SENDMAN").val($("#LINKSELEC>option:selected").text());
				}
				
			})
			
			$(".sb_lanqiao input").click(function(){
				     if($('input:radio[name="ISEIGHTD"]:checked')){
				     	var a=$(this).val();
				     	if(a=="1"){
				     		$(".iqc_ulbox li").eq(1).children("a").attr("href","${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${pd.IQC_PROBLEM_ID}&TYPE=2");
				     	}else{
				     		$(".iqc_ulbox li").eq(1).children("a").attr("href","${ctx }/iqc_problem/goDeal?IQC_PROBLEM_ID=${pd.IQC_PROBLEM_ID}&TYPE=4");
				     	}
				     }
				})
			
			$(".jinjiule").on("change", "$('input:radio[name='ISEIGHTD']')", function() {
				
				})
			$(document).on("change", "#LINKSELEC", function() {
				$("#SENDEMAIL").val($("#LINKSELEC>option:selected").attr("attid"));
				$("#SENDMAN").val($("#LINKSELEC>option:selected").text());
			})
				
			$(document).on("click", ".word_tongbtn", function() {
				//附件
				var accessory = "";
				var tis = $(this);
				tis.parents(".oiswen_boxavite").find(".jinjiddi").find("a").each(function(index,el){
					var name = $(this).text();
					var realname = $(this).next().val();
					var str = realname + "::" + name +";;";
					accessory += str;
				});
				$("input[name='FILEURL']").val(accessory); 
				 $.ajax({
						type : "POST",
						url : "${ctx}/iqc_problem/addAndEdit",
						data : $("#cofeForm").serialize(),
						success : function(data) {
						alert2("保存成功");
						window.location.href='${ctx}/iqc_problem/deallist';
						},
					 	error:function(){
				        	alert2("上传失败");
				        }
					});  
			})
			
			
			
			//上传附件
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
		//附件上传
		function upload(target){
			var name=target.value;
		    var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
		    if(fileName !="doc" && fileName !="docx"&& fileName !="xls"&& fileName !="xlsx"&& fileName !="pdf"&& fileName !="txt"&& fileName !="zip"&& fileName !="rar"&&fileName !="jpg" && fileName !="jpeg"&& fileName !="png" &&fileName !="gif"&& fileName !="avi"&& fileName !="mp3"){
		       alert2("请选择正确格式的文件(doc,docx,xls,xlsx,pdf,txt,zip,png,jpg,jpeg,gif,avi,mp3)！");
		       target.value="";
		       return
		    }
			var fileSize = 0;    
		    if(isIE && !target.files) {  
		    	try {
		    		var file = target; 
		        	file.select(); 
		        	file.blur(); 
		        	var path = document.selection.createRange().text; 
		        	var fso = new ActiveXObject("Scripting.FileSystemObject"); 
		        	fileSize = fso.GetFile(path).size; 
				} catch (e) {
					alert2(e+"\n"+"如果错误为：Error:Automation 服务器不能创建对象；"+"\n"+"请按以下方法配置浏览器："+"\n"+"请打开【Internet选项-安全-Internet-自定义级别-ActiveX控件和插件-对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本（不安全）-点击启用-确定】");
					return;
				}
		    }else{    
		     fileSize = target.files[0].size;     
		    }
		    var size = fileSize / 1024;    
		    if(size>20480){  
		      alert2("文件大小不能超过20M");
		      target.value="";
		      return
		    } 
		    
		    DocAjaxFileUpload(target); 
		     
		}
		
		function DocAjaxFileUpload(target){
			
			var name=target.value;
			var fileName = name.substring(name.lastIndexOf("\\")+1);
			var $target = $(target);
			var classname = $target.attr('class');
			/* alert2(classname); */
			var myDate = new Date();
			var now = myDate.getTime();
			$.ajaxFileUpload({
				url: '${ctx}/pc/uploadfile', 
		        secureuri: false, 
		        fileElementId: classname, 
		        data:{"fileitem":"processZero"},
		        /* dataType: 'JSON',   */ 
		        success:function(data){
		        	
		        	var str = $(data).find("body").text();  
		            var json = $.parseJSON(str);
		        	if("success"==json.info){
		        		var str = "<div class='jinjiuddd'>"+"<em class='jinjiudddeml'><img src='${ctx }/static/fords/img/wenjian.png'/></em>";
						str +="<div class='jinjiudtits'>"
		        		str += "<a  href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\">"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
		        		str += "</div>"
						str += "<em class='jinjiudddemr'><img src='${ctx }/static/fords/img/guanbi.png'/></em> </div>	";
						$("#"+classname+"a").append(str);
		        	}else if("oversize"==json.info){
		        		alert2("系统繁忙请稍后再试！");
		        	}
		        },
		        error:function(){
		        	alert2("上传失败");
		        }
			})
		}
		</script>
	</body>
