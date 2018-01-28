<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/setting/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
    <title>零公里问题一</title>
    <link rel="stylesheet" href="${ctx }/static/fords/css/bootstrap3.37.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/public_d08.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/d0.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/d4.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/seek.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${ctx }/static/fords/css/pw_alert.css" />
    <script type="text/javascript" src="${ctx }/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/public_d08.js" ></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/d4.js" ></script>
    <script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/seek.js" ></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="${ctx }/static/fords/js/pw_alert.js" ></script>
</head>
<body style="background-color:#edeff5;margin: 20px;">
<div class="oiswen_box">
    <!---头部信息--->
    <%@ include file="/setting/head.jsp"%>
    <!-- d4根本原因 -->
    <div class="yanyun">
        <div class="yangtle">D4根本原因</div>
        <div class="kuangbox">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="gongys">是否供应商问题</div>
                    <div class="shitou">
                        <label><input type="checkbox" value="1"/><span>是</span></label>
                        <label><input type="checkbox" value="0"/><span>否</span></label>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="zherns clearfix">
                        <div class="zernsy">责任人</div>
                        <div class="iptsosd">
                        	<div class="jinjiuze">
								<div class="baidssb">
									<input type="hidden" class="responsese" name="RESPONSIBLE" value="${var.RESPONSIBLE }">
					                <input class="sowe_lse form-control"  type="text" value="${var.NAME }"/>
					                <div class="taocen_cn">
					                    <ul class="houxuciu"></ul>
					                </div>
					       		 </div>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12 text-right texrlef">
                    <a class="gonytnx" href="javascript:">供应商分析</a>
                </div>
            </div>
        </div>
    </div>
    <!----发生原因---->
	<div class="jinji_box jinji_boxa">
	<input type="hidden" name="PROCESS_FOUR_ID" id="PROCESS_FOUR_ID" value="${pds.PROCESS_FOUR_ID }">
		<div class="jinji_titbtn">
			<div class="fay_tled">发生原因</div>
			<div class="npaicbxz d4_npaicbxz">
				<button class="jinjipai" type="button" onclick="goIsnot()">Is&Is Not</button><button class="jinjipai" type="button" onclick="gofivetable()">5why</button><button class="jinjipai" type="button">鱼骨图</button><button type="button" class="zjbtna">新增+</button>
			</div>
		</div>
		 <c:if test="${!empty varList }">
             <c:forEach items="${varList}" var="var" varStatus="vs">
             <div class="jinji_div">
			<div class="xuhao_bocn">序号-<span>${vs.index+1}</span></div>
			<div class="neibka_bor">
				<form action="">
					<input type="hidden" class="type" name="type" value="1">
                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID }" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
					<div class="jinjiul">
						<div class="container" style="width: 100%;">
							<div class="row">
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="jinjiula">
										<p class="jinjiultit">是否重复发生</p>
										<div class="jinjiuze">
											<div class="shitou">
						                        <label><input type="checkbox" value="1"  <c:if test="${var.ISREPEAT ==1}">checked="checked"</c:if> name="ISREPEAT"/><span>是</span></label>
						                        <label><input type="checkbox" value="0" <c:if test="${var.ISREPEAT ==0}">checked="checked"</c:if> name="ISREPEAT"/><span>否</span></label>
						                    </div>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="jinjiulb">
										<p class="jinjiultit">发生次数</p>
										<div class="jinjiuze">
											<input type="number" class="jihuatame form-control" name="occurrences" value="${var.occurrences }">
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="jinjiulc jinjiulb">
										<p class="jinjiultit">发生原因分类</p>
										<div class="jinjiuze">
											<select name="causes">
											
												<option value="1" <c:if test="${var.causes ==1}">selected="selected"</c:if>>外观原因</option>
												<option value="2"<c:if test="${var.causes ==2}">selected="selected"</c:if>>功能原因</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="jinjiulc jinjiulb">
										<p class="jinjiultit">贡献</p>
										<div class="jinjiuze">
											<input type="text" name="contribution" value="${var.contribution }" maxlength="5"/>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-8 col-md-12 col-lg-4">
									<div class="jinjiule jinjiulb">
									<input type="hidden" name="ATTACHMENT">
									<input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
										<div class="jinjiultit2">上传附件<input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
										<div class="jinjiuze">
											<div class="jinjiddi" id="myfilea">
											  <c:forEach items="${var.ATTACHMENT}" var="vars">
											       <div class="jinjiuddd">
											       <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
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

							<div class="row">
								<div class="col-md-12 col-lg-12">
									<div class="jinjiuld jinjiulb">
										<p class="jinjiultit">发生原因</p>
										<div class="jinjiuze">
											<textarea name="OCCUR">${var.OCCUR }</textarea>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="jinji_divtitbot">
						<button class="pull-right zjbtna" type="button">新增+</button>
						<button class="pull-right jinjiscbtn" type="button">删除</button>
						<button class="pull-right jiushibtnxiu" type="button">修改</button>
					</div>
				</form>
			</div>
		</div>
             
             </c:forEach>
         </c:if>
		 <c:if test="${fn:length(varList ) == 0}">
		<div class="jinji_div">
			<div class="xuhao_bocn">序号-<span>1</span></div>
			<div class="neibka_bor">
				<form action="">
					<input type="hidden" class="type" name="type" value="1">
                    <input type="hidden" name="CAUSED4_ID" value="" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
					<div class="jinjiul">
						<div class="container" style="width: 100%;">
							<div class="row">
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="jinjiula">
										<p class="jinjiultit">是否重复发生</p>
										<div class="jinjiuze">
											<div class="shitou">
											
						                        <label><input type="checkbox" value="1" name="ISREPEAT" <c:if test="${pds.ISREPEAT == 1}">checked="checked"</c:if>/><span>是</span></label>
						                        <label><input type="checkbox" value="0" name="ISREPEAT" <c:if test="${pds.ISREPEAT == 0}">checked="checked"</c:if>/><span>否</span></label>
						                    </div>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="jinjiulb">
										<p class="jinjiultit">发生次数</p>
										<div class="jinjiuze">
											<input type="number" class="jihuatame form-control" name="occurrences" maxlength="5">
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="jinjiulc jinjiulb">
										<p class="jinjiultit">发生原因分类</p>
										<div class="jinjiuze">
											<select name="causes">
												<option value="1" >外观原因</option>
												<option value="2">功能原因</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="jinjiulc jinjiulb">
										<p class="jinjiultit">贡献</p>
										<div class="jinjiuze">
											<input type="text" name="contribution" maxlength="5"/>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-8 col-md-12 col-lg-4">
									<div class="jinjiule jinjiulb">
									<input type="hidden" name="ATTACHMENT">
									<input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
										<div class="jinjiultit2">上传附件<input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
										<div class="jinjiuze">
											<div class="jinjiddi" id="myfilea">
												
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12 col-lg-12">
									<div class="jinjiuld jinjiulb">
										<p class="jinjiultit">发生原因</p>
										<div class="jinjiuze">
											<textarea name="OCCUR" ></textarea>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="jinji_divtitbot">
						<button class="pull-right zjbtna" type="button">新增+</button>
						<button class="pull-right jinjiscbtn" type="button">删除</button>
						<button class="pull-right jiushibtnxiu" type="button">保存</button>
					</div>
				</form>
			</div>
		</div>
		</c:if>
        <!---验证证实--->
		<div class="d0_jinbox" style="padding: 0px;margin-top: 30px;">
			<div class="d0_shuru">
				<p class="d0_shurutit"><span>*</span>验证/证实</p>
				<div class="d0_shurut"><textarea name="VERIFICATION" id="VERIFICATION">${pds.VERIFICATION }</textarea></div>
				<button class="d0_8btnbc vios" type="button"><c:if test="${empty pds.VERIFICATION  }">保存</c:if><c:if test="${not empty pds.VERIFICATION  }">修改</c:if></button>
			</div>
		</div>
	</div>
    <!-- 逃逸点 2-->
    <div class="jinji_box jinji_boxb">
		<div class="jinji_titbtn">
			<div class="fay_tled">逃逸点</div>
			<div class="npaicbxz">
				<button class="jinjipai" type="button" onclick="gofivetable2()">5why</button><button type="button" class="zjbtnb">新增+</button>
			</div>
		</div>
		  <c:if test="${!empty varLists}">
           <c:forEach items="${varLists}" var="var" varStatus="vs">
           <div class="jinji_div">
			<div class="xuhao_bocn">序号-<span>${vst.index+1 }</span></div>
			<div class="neibka_bor">
				<form action="">
				<input type="hidden" class="type" name="type" value="2">
                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID }" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
					<div class="jinjiul">
						<div class="container" style="width: 100%;">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
									<div class="jinjiuld jinjiulb">
										<p class="jinjiultit">逃逸点</p>
										<div class="jinjiuze">
											<textarea name="ESCAPE">${var.ESCAPE }</textarea>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
									<div class="jinjiule jinjiulb">
									 <input type="hidden" name="ATTACHMENT">
									 <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
										<div class="jinjiultit2">上传附件<input id="myfiles" name="myfiles" class="myfiles" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
										<div class="jinjiuze">
											<div class="jinjiddi" id="myfilesa" style="height: 110px;">
												 <c:forEach items="${var.ATTACHMENT}" var="vars">
											       <div class="jinjiuddd">
											       <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
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
								<div class="col-xs-6 col-sm-6 col-md-2 col-lg-2">
									<div class="jinjiulc jinjiulb">
										<p class="jinjiultit">贡献</p>
										<div class="jinjiuze">
											<input type="text" name="contribution" value="${var.contribution }"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="jinji_divtitbot">
						<button class="pull-right zjbtnb" type="button">新增+</button>
						<button class="pull-right jinjiscbtn" type="button">删除</button>
						<button class="pull-right jiushibtnxiu" type="button">修改</button>
					</div>
				</form>
			</div>
		</div>
           
           </c:forEach>
          </c:if>
		
		<c:if test="${fn:length(varLists ) == 0}">
		<div class="jinji_div">
			<div class="xuhao_bocn">序号-<span>1</span></div>
			<div class="neibka_bor">
				<form action="">
				<input type="hidden" class="type" name="type" value="2">
                    <input type="hidden" name="CAUSED4_ID" value="" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
					<div class="jinjiul">
						<div class="container" style="width: 100%;">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
									<div class="jinjiuld jinjiulb">
										<p class="jinjiultit">逃逸点</p>
										<div class="jinjiuze">
											<textarea name="ESCAPE"></textarea>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
									<div class="jinjiule jinjiulb">
									 <input type="hidden" name="ATTACHMENT">
									 <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
										<div class="jinjiultit2">上传附件<input id="myfiles" name="myfiles" class="myfiles" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
										<div class="jinjiuze">
											<div class="jinjiddi" id="myfilesa" style="height: 110px;">
												
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-2 col-lg-2">
									<div class="jinjiulc jinjiulb">
										<p class="jinjiultit">贡献</p>
										<div class="jinjiuze">
											<input type="text" name="contribution"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="jinji_divtitbot">
						<button class="pull-right zjbtnb" type="button">新增+</button>
						<button class="pull-right jinjiscbtn" type="button">删除</button>
						<button class="pull-right jiushibtnxiu" type="button">保存</button>
					</div>
				</form>
			</div>
		</div>
		</c:if>
        <!---验证证实--->
		<div class="d0_jinbox" style="padding: 0px;margin-top: 30px;">
			<div class="d0_shuru">
				<p class="d0_shurutit"><span>*</span>验证/证实</p>
				<div class="d0_shurut"><textarea name="VALIDATIONURE" id="VALIDATIONURE">${pds.VALIDATIONURE }</textarea></div>
				<button class="d0_8btnbc ures" type="button"><c:if test="${empty pds.VALIDATIONURE  }">保存</c:if><c:if test="${not empty pds.VALIDATIONURE  }">修改</c:if></button>
			</div>
		</div>
	</div>
    <!-- 体系原因 3-->
    <div class="jinji_box jinji_boxc">
		<div class="jinji_titbtn">
			<div class="fay_tled">体系原因</div>
			<div class="npaicbxz">
				<button class="jinjipai" type="button" onclick="gofivetable2()"> 5why</button><button type="button" class="zjbtnc">新增+</button>
			</div>
		</div>
		<c:if test="${!empty varListss }">
           <c:forEach items="${varListss}" var="var" varStatus="vs">
           <div class="jinji_div">
			<div class="xuhao_bocn">序号-<span>${vst.index+1 }</span></div>
			<div class="neibka_bor">
				<form action="">
				<input type="hidden" class="type" name="type" value="2">
                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID }" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
					<div class="jinjiul">
						<div class="container" style="width: 100%;">
							<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
									<div class="jinjiuld jinjiulb">
										<p class="jinjiultit">体系原因</p>
										<div class="jinjiuze">
											<textarea name="SYSTEMS">${var.SYSTEMS }</textarea>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
									<div class="jinjiule jinjiulb">
									 <input type="hidden" name="ATTACHMENT">
									 <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
										<div class="jinjiultit2">上传附件<input id="myfiles" name="myfiles" class="myfiles" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
										<div class="jinjiuze">
											<div class="jinjiddi" id="myfilesa" style="height: 110px;">
												 <c:forEach items="${var.ATTACHMENT}" var="vars">
											       <div class="jinjiuddd">
											       <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
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
								<div class="col-xs-6 col-sm-6 col-md-2 col-lg-2">
									<div class="jinjiulc jinjiulb">
										<p class="jinjiultit">贡献</p>
										<div class="jinjiuze">
											<input type="text" name="contribution" value="${var.contribution }"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="jinji_divtitbot">
						<button class="pull-right zjbtnc" type="button">新增+</button>
						<button class="pull-right jinjiscbtn" type="button">删除</button>
						<button class="pull-right jiushibtnxiu" type="button">修改</button>
					</div>
				</form>
			</div>
		</div>
          </c:forEach>
         </c:if>
		
		<c:if test="${fn:length(varListss ) == 0}">
		<div class="jinji_div">
			<div class="xuhao_bocn">序号-<span>1</span></div>
			<div class="neibka_bor">
				<form action="">
				<input type="hidden" class="type" name="type" value="3">
                    <input type="hidden" name="CAUSED4_ID" value="" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
					<div class="jinjiul">
						<div class="container" style="width: 100%;">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
									<div class="jinjiuld jinjiulb">
										<p class="jinjiultit">体系原因</p>
										<div class="jinjiuze">
											<textarea name="SYSTEMS"></textarea>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-4 col-lg-4">
									<div class="jinjiule jinjiulb">
									 <input type="hidden" name="ATTACHMENT">
									 <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
										<div class="jinjiultit2">上传附件<input id="myfilec" name="myfilec" class="myfilec" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/></div>
										<div class="jinjiuze">
											<div class="jinjiddi" id="myfileca"  style="height: 110px;">
												
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-2 col-lg-2">
									<div class="jinjiulc jinjiulb">
										<p class="jinjiultit">贡献</p>
										<div class="jinjiuze">
											<input type="text" name="contribution" maxlength="5"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="jinji_divtitbot">
						<button class="pull-right zjbtnc" type="button">新增+</button>
						<button class="pull-right jinjiscbtn" type="button">删除</button>
						<button class="pull-right jiushibtnxiu" type="button">保存</button>
					</div>
				</form>
			</div>
		</div>
		</c:if>
        <!---验证证实--->
		<div class="d0_jinbox" style="padding: 0px;margin-top: 30px;">
			<div class="d0_shuru">
				<p class="d0_shurutit"><span>*</span>验证/证实</p>
				<div class="d0_shurut"><textarea name="VALIDATIONERU" id="VALIDATIONERU">${pds.VALIDATIONERU }</textarea></div>
				<button class="d0_8btnbc erus" type="button"><c:if test="${empty pds.VALIDATIONERU  }">保存</c:if><c:if test="${not empty pds.VALIDATIONERU  }">修改</c:if></button>
			</div>
		</div>
		<div class="xiayibus"><a class="pull-left" href="${ctx }/process_three/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a><a class="pull-right nextSub"  <c:if test="${handle.USTEP <DANGQJY-1}">href="${ctx}/process_five/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}"</c:if><c:if test="${handle.USTEP >=DANGQJY-1}">href="javaScript:;"</c:if> >下一步</a></div>
	</div>
    

</div>
<!----右边部分---->
<%@ include file="/setting/right.jsp"%>
<script type="text/javascript">

function goIsnot(){
	window.location.href="${ctx}/isnot/goIsNot";
}
function gofivetable(){
	var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
	window.location.href="${ctx}/why5_processfour/goaddAndEdit?5WHYTYPE=0&CLIENT_PROBLEM_COLLECTION_ID="+CLIENT_PROBLEM_COLLECTION_ID;
}
function gofivetable2(){
	window.location.href="${ctx}/why5_processfour/goaddAndEdit?5WHYTYPE=1&CLIENT_PROBLEM_COLLECTION_ID="+CLIENT_PROBLEM_COLLECTION_ID;
}
$(document).on("click",".nextSub",function(){
	if(this.href == "javascript:;"){
		alert2("当前未完成，请先完成");
	}
})
		//保存
		$(document).on("click",".jiushibtnxiu",function(){
			var tis = $(this);
			var occurrences = $(this).parents(".jinji_div").find("input[name='occurrences']");
			if(occurrences.val()==""){
				occurrences.tips({
					side:3,
		            msg:'请输入重复次数',
		            bg:'#AE81FF',
		            time:2
		        });
				occurrences.focus();
				return false;
				}
			var ESCAPE = $(this).parents(".jinji_div").find("textarea[name='ESCAPE']");
			if(ESCAPE.val()==""){
				ESCAPE.tips({
					side:3,
		            msg:'请输入逃逸点',
		            bg:'#AE81FF',
		            time:2
		        });
				ESCAPE.focus();
				return false;
				}
			var OCCUR = $(this).parents(".jinji_div").find("textarea[name='OCCUR']");
			if(OCCUR.val()==""){
				OCCUR.tips({
					side:3,
		            msg:'请输入发生原因',
		            bg:'#AE81FF',
		            time:2
		        });
				OCCUR.focus();
				return false;
				}
			var SYSTEMS = $(this).parents(".jinji_div").find("textarea[name='SYSTEMS']");
			if(SYSTEMS.val()==""){
				SYSTEMS.tips({
					side:3,
		            msg:'请输入体系原因',
		            bg:'#AE81FF',
		            time:2
		        });
				OCCUR.focus();
				return false;
				}
			
			//附件
			
			var str ="";
			//附件遍历
			tis.parent().prev().find("input[name='fileurl']").each(function(index,el){
				var realname = $(this).val();
				str += realname+";;";
			});
			
			tis.parent().prev().find("input[name='ATTACHMENT']").val(str);
			
		  //提交数据
			 $.ajax({
				type : "POST",
				url : "${ctx}/caused4/updated",
				data : tis.closest("form").serialize(),
				success : function(data) {
					
					if(data.message=='1'){
						
						alert2("保存成功");
						tis.text("修改");
						tis.parents(".jinji_div").find("input[name='CAUSED4_ID']").val(data.CAUSED4_ID);
						
					}else{
						alert2("保存失败");
						
					}
					
					 
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});  
		});  
		
		//删除
		$(document).on("click",".jinjiscbtn",function(){
			$.ajax({
				type : "POST",
				url : "${ctx}/caused4/delet",
				data : $(this).closest("form").serialize(),
				success : function(data) {
					/*  window.location.reload(); */
					if(data.message=="1"){
						
					//  alert2("删除成功");
					
						
					}else{
						
						 alert2("删除失败");
					}
				},
			 	error:function(){
		        	alert2("上传失败");
		        }
			});
		})

		//验证1
		$(document).on("click",".vios",function(){
			if($("#VERIFICATION").val()==""){
				$("#VERIFICATION").tips({
					side:3,
		            msg:'请输入验证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VERIFICATION").focus();
				return false;
				}
			
				var PROCESS_FOUR_ID = $("#PROCESS_FOUR_ID").val();
				var VERIFICATION = $("#VERIFICATION").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				var tis = $(this);
				if(ISHANDLE == 0){
					return false;
				}
				$.ajax({
					type : "POST",
					url : "${ctx}/process_four/symptom",
					data : {PROCESS_FOUR_ID:PROCESS_FOUR_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,VERIFICATION:VERIFICATION},
					success : function(data) {
						$("#PROCESS_FOUR_ID").val(data.PROCESS_FOUR_ID);
						alert2("保存成功");
						tis.text("修改");
						if($(".nextSub").attr("href")=="javaScript:;"){
							$(".nextSub").attr("href","${ctx}/process_five/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
							tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_five/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
						}
						//当前步棸完成状态
						//window.location.href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID="+CLIENT_PROBLEM_COLLECTION_ID;	
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
			});
		//验证2
		$(document).on("click",".ures",function(){
			if($("#VALIDATIONURE").val()==""){
				$("#VALIDATIONURE").tips({
					side:3,
		            msg:'请输入验证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VALIDATIONURE").focus();
				return false;
				}
				var PROCESS_FOUR_ID = $("#PROCESS_FOUR_ID").val();
				var VALIDATIONURE = $("#VALIDATIONURE").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				var tis = $(this);
				if(ISHANDLE == 0){
					return false;
				}
				$.ajax({
					type : "POST",
					url : "${ctx}/process_four/symptom",
					data : {PROCESS_FOUR_ID:PROCESS_FOUR_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,VALIDATIONURE:VALIDATIONURE},
					success : function(data) {
						$("#PROCESS_FOUR_ID").val(data.PROCESS_FOUR_ID);
						alert2("保存成功");
						tis.text("修改");
						if($(".nextSub").attr("href")=="javaScript:;"){
							$(".nextSub").attr("href","${ctx}/process_five/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
							tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_five/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");	
						}
						//当前步棸完成状态
						//window.location.href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID="+CLIENT_PROBLEM_COLLECTION_ID;	
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
			});
		//验证3
		$(document).on("click",".erus",function(){
			if($("#VALIDATIONERU").val()==""){
				$("#VALIDATIONERU").tips({
					side:3,
		            msg:'请输入验证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VALIDATIONERU").focus();
				return false;
				}
				var PROCESS_FOUR_ID = $("#PROCESS_FOUR_ID").val();
				var VALIDATIONERU = $("#VALIDATIONERU").val();
				var CLIENT_PROBLEM_COLLECTION_ID = $("#CLIENT_PROBLEM_COLLECTION_ID").val();
				var ISHANDLE = $("#ISHANDLE").val();//是否是责任人
				var tis = $(this);
				if(ISHANDLE == 0){
					return false;
				}
				$.ajax({
					type : "POST",
					url : "${ctx}/process_four/symptom",
					data : {PROCESS_FOUR_ID:PROCESS_FOUR_ID,CLIENT_PROBLEM_COLLECTION_ID:CLIENT_PROBLEM_COLLECTION_ID,VALIDATIONERU:VALIDATIONERU},
					success : function(data) {
						$("#PROCESS_FOUR_ID").val(data.PROCESS_FOUR_ID);
						alert2("保存成功");
						tis.text("修改");
						if($(".nextSub").attr("href")=="javaScript:;"){
							$(".nextSub").attr("href","${ctx}/process_five/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");
							tis.parents(".oiswen_box").find(".d_divul li[uid='clickId']").next().find("a").attr("href","${ctx}/process_five/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}");	
						}
					},
				 	error:function(){
			        	alert2("上传失败");
			        }
				});
			});
			//上传附件
			var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
			//附件上传
			function upload(target){
			var name=target.value;
			var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
			if(fileName !="doc" && fileName !="docx" && fileName !="mp3" && fileName !="xlsx"&& fileName !="zip"&& fileName !="xls"&& fileName !="pdf"&&fileName !="jpg" && fileName !="jpeg"&& fileName !="png" &&fileName !="gif"){
			   alert2("请选择正确格式的文件(doc,docx,mp3,xlsx,zip,pdf,xls,png,jpg,jpeg,gif)！");
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
			if(size>5120){  
			  alert2("文件大小不能超过5M");
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
			    data:{"fileitem":"processThree"},
			    /* dataType: 'JSON',   */ 
			    success:function(data){
			    	
			    	var str = $(data).find("body").text();  
			        var json = $.parseJSON(str);
			    	if("success"==json.info){
			    		var str = "<div class='jinjiuddd'>"+"<em class='jinjiudddeml'><img src='${ctx }/static/fords/img/wenjian.png'/></em>";
			    		str +="<input type='hidden' name='fileurl' value='"+fileName+"::"+json.url+"'>";
			    		str +="<div class='jinjiudtits'>"
			    		str += "<a href=\"${ctx }/process_two/downWen.do?filepath="+json.url+"&filename="+fileName+"\">"+fileName+"</a><input type='hidden' value='"+json.url+"'>";
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
</html>
