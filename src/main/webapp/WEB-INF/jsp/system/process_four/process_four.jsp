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
    <link rel="stylesheet" href="${ctx}/static/fords/css/d4.css" />
    <link rel="stylesheet" href="${ctx}/static/fords/css/font-awesome.min.css" />
    <script type="text/javascript" src="${ctx}/static/fords/js/jquery-1.9.1.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/bootstrap3.37.min.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/public_d08.js" ></script>
    <script type="text/javascript" src="${ctx}/static/fords/js/d4.js" ></script>
    <script type="text/javascript" src="${ctx }/static/js/ajaxfileupload.js"></script>
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
    <!---8d流程--->
    
    <!-- d4根本原因 -->
    <div class="yanyun">
        <div class="yangtle">D4根本原因</div>
        <div class="kuangbox">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="gongys">是否供应商问题</div>
                    <div class="shitou">
                        <label><input type="checkbox"/><span>是</span></label>
                        <label><input type="checkbox"/><span>否</span></label>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="zherns">
                        <div class="zernsy">责任人</div>
                        <input class="iptsosd" type="text"/>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12 text-right texrlef">
                    <a class="gonytnx" href="javascript:">供应商分析</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 发生原因 -->
    <div class="yanyun">
        <div class="tens_lts">
            <div class="faxinbox">
            <input type="hidden" class="type" name="type" value="1">
            <input type="hidden" class="CAUSED4_ID" name="type" value="">
                <span>发生原因</span><a class="xinz_btn" href="javascript:">新增+</a>
            </div>
            <div class="buen_zus">
                <a href="javascript:">5why</a>
                <a href="javascript:">鱼骨图</a>
                <a href="javascript:">Is&Is Not</a>
            </div>
        </div>
      <!--   判断手是否有数据 -->
        <div class="zhegfsd_box">
          <c:if test="${fn:length(varList ) == 0}">
            <div class="jinji_div">
                <form action="">
                    <input type="hidden" class="type" name="type" value="1">
                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID}" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		            <input type="hidden" name="PROCESS_FOUR_ID" id="PROCESS_FOUR_ID" value="${sj.PROCESS_FOUR_ID}"/>
                    <div class="jinji_divtit">
                        <div class="jinjixuh">序号</div>
                        <div class="jinjixuh2"><span>1</span></div>
                    </div>
                    <div class="jinjiul">
                        <div class="container" style="width: 100%;">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="fenxbler">
                                        <div class="fashl_l tleyiyd myname0">发生原因</div>
                                        <textarea name="OCCUR" class="tex_zxuyd myname1"></textarea>
                                    </div>
                                    <div class="fenxbler">
                                        <div class="fashl_l">验证/证实</div>
                                        <textarea class="tex_zxuyd myclass2" name="VALIDATION"></textarea>
                                    </div>
                                </div>
                                <div class=" col-lg-3">
                                    <div class=" fenxbler">
                                        <div class="fashl_l">贡献</div>
                                        <input class="goanxipt myclass3" name="contribution" type="text"/>
                                    </div>
                                    <div class=" fenxbler">
                                        <div class="jinjiule">
                                            <div class="jinjiultit2">上传附件
                                               <input id="myfile1" name="myfile1" class="myfile1" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
                                            </div>
                                            <div class="jinjiuze">
                                                <div class="jinjiddi">
                                                    <div class="jinjiuddd">
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="jinji_divtitbot">
                        <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
                        <button class="pull-right jinjiscbtn" type="button">删除</button>
                        <button class="pull-right jiushibtnxiu" type="button">保存</button>
                        <button class="pull-right zjbtn xinz_btn" type="button">新增+</button>
                    </div>
                </form>
            </div>
          </c:if>
          <!-- 有数据 -->
          <c:if test="${!empty varList }">
             <c:forEach items="${varList}" var="var" varStatus="vs">
                <!-- 发生原因 -->
                <c:if test="${var.type eq '1' }">
		            <div class="jinji_div">
		                <form action="">
		                    <input type="hidden" class="type" name="type" value="1">
		                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID}" class="CAUSED4_ID"> 
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
				            <input type="hidden" name="PROCESS_FOUR_ID" id="PROCESS_FOUR_ID" value="${sj.PROCESS_FOUR_ID}"/>
		                    <div class="jinji_divtit">
		                        <div class="jinjixuh">序号</div>
		                        <div class="jinjixuh2"><span>${vs.index+1}</span></div>
		                    </div>
		                    <div class="jinjiul">
		                        <div class="container" style="width: 100%;">
		                            <div class="row">
		                                <div class="col-lg-9">
		                                    <div class="fenxbler">
		                                        <div class="fashl_l tleyiyd myname0">发生原因</div>
		                                        <textarea name="OCCUR" class="tex_zxuyd myname1" >${var.OCCUR}</textarea>
		                                    </div>
		                                    <div class="fenxbler">
		                                        <div class="fashl_l">验证/证实</div>
		                                        <textarea class="tex_zxuyd myclass2" name="VALIDATION">${var.VALIDATION }</textarea>
		                                    </div>
		                                </div>
		                                <div class=" col-lg-3">
		                                    <div class=" fenxbler">
		                                        <div class="fashl_l">贡献</div>
		                                        <input class="goanxipt myclass3" name="contribution" value="${var.contribution}" type="text"/>
		                                    </div>
		                                    <div class=" fenxbler">
		                                        <div class="jinjiule">
		                                            <div class="jinjiultit2">上传附件
		                                               <input id="myfile1" name="myfile1" class="myfile1" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
		                                            </div>
		                                            <div class="jinjiuze">
		                                                <div class="jinjiddi">
		                                                
		                                                <c:forEach items="${var.ATTACHMENT}" var="vars">
													       <div class="jinjiuddd">
													       <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
																<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																	<a href="${fns:getConfig('IMGURL')}/${vars.k_url}" title="${vars.k_name}">${vars.k_name}</a>
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
		                        </div>
		                    </div>
		                    
		                    <div class="jinji_divtitbot">
		                        <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
		                        <button class="pull-right jinjiscbtn" type="button">删除</button>
		                        <button class="pull-right jiushibtnxiu" type="button">保存</button>
		                        <button class="pull-right zjbtn xinz_btn" type="button">新增+</button>
		                    </div>
		                </form>
		            </div>
                </c:if>
              </c:forEach>
          </c:if>
         </div>
        
          
        
    </div>
    <!-- 逃逸点 -->
    <div class="yanyun">
    
        <div class="tens_lts">
            <div class="faxinbox">
            <input type="hidden" class="type" name="type" value="3">
            <input type="hidden" class="CAUSED4_ID" name="CAUSED4_ID" value="">
                <span>逃逸点</span><a class="xinz_btn" href="javascript:">新增+</a>
            </div>
            <div class="buen_zus">
                <a href="javascript:">5why</a>
            </div>
        </div>
        
        <div class="zhegfsd_box">
         <c:if test="${fn:length(varListss ) == 0}">
            <div class="jinji_div">
                <form action="">
                    <input type="hidden" class="type" name="type" value="3">
                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID}" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		            <input type="hidden" name="PROCESS_FOUR_ID" id="PROCESS_FOUR_ID" value="${sj.PROCESS_FOUR_ID}"/>
                    <div class="jinji_divtit">
                        <div class="jinjixuh">序号</div>
                        <div class="jinjixuh2"><span>1</span></div>
                    </div>
                    <div class="jinjiul">
                        <div class="container" style="width: 100%;">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="fenxbler">
                                        <div class="fashl_l tleyiyd">逃逸点</div>
                                        <textarea class="tex_zxuyd myname1" name="ESCAPE"></textarea>
                                    </div>
                                    <div class="fenxbler">
                                        <div class="fashl_l">验证/证实</div>
                                        <textarea class="tex_zxuyd" name="VALIDATION"></textarea>
                                    </div>
                                </div>
                                <div class=" col-lg-3">
                                    <div class=" fenxbler">
                                        <div class="fashl_l">贡献</div>
                                        <input class="goanxipt" name="contribution" type="text"/>
                                    </div>
                                    <div class=" fenxbler">
                                        <div class="jinjiule">
                                            <div class="jinjiultit2">上传附件
                                              <input id="myfile2" name="myfile2" class="myfile2" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
                                            </div>
                                            <div class="jinjiuze">
                                                <div class="jinjiddi">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="jinji_divtitbot">
                        <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
                        <button class="pull-right jinjiscbtn" type="button">删除</button>
                        <button class="pull-right jiushibtnxiu" type="button">保存</button>
                        <button class="pull-right zjbtn xinz_btn" type="button">新增+</button>
                    </div>
                </form>
             </div>
           </c:if>
           
           <!-- 有数据 -->
           <!-- 逃逸点 -->
           <c:if test="${!empty varListss }">
           <c:forEach items="${varListss}" var="var" varStatus="vs">
              <c:if test="${var.type eq '3' }">
		            <div class="jinji_div">
		                <form action="">
		                    <input type="hidden" class="type" name="type" value="3">
		                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID}" class="CAUSED4_ID"> 
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
				            <input type="hidden" name="PROCESS_FOUR_ID" id="PROCESS_FOUR_ID" value="${sj.PROCESS_FOUR_ID}"/>
		                    <div class="jinji_divtit">
		                        <div class="jinjixuh">序号</div>
		                        <div class="jinjixuh2"><span>${vs.index+1}</span></div>
		                    </div>
		                    <div class="jinjiul">
		                        <div class="container" style="width: 100%;">
		                            <div class="row">
		                                <div class="col-lg-9">
		                                    <div class="fenxbler">
		                                        <div class="fashl_l tleyiyd">逃逸点</div>
		                                        <textarea class="tex_zxuyd myname1" name="ESCAPE">${var.ESCAPE }</textarea>
		                                    </div>
		                                    <div class="fenxbler">
		                                        <div class="fashl_l">验证/证实</div>
		                                        <textarea class="tex_zxuyd" name="VALIDATION">${var.VALIDATION }</textarea>
		                                    </div>
		                                </div>
		                                <div class=" col-lg-3">
		                                    <div class=" fenxbler">
		                                        <div class="fashl_l">贡献</div>
		                                        <input class="goanxipt" name="contribution" type="text" value="${var.contribution }"/>
		                                    </div>
		                                    <div class=" fenxbler">
		                                        <div class="jinjiule">
		                                            <div class="jinjiultit2">上传附件
		                                              <input id="myfile2" name="myfile2" class="myfile2" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
		                                            </div>
		                                            <div class="jinjiuze">
		                                                <div class="jinjiddi">
		                                                 <c:forEach items="${var.ATTACHMENT}" var="vars">
													       <div class="jinjiuddd">
													       <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
																<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
																<div class="jinjiudtits">
																	<a href="${fns:getConfig('IMGURL')}/${vars.k_url}" title="${vars.k_name}">${vars.k_name}</a>
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
		                        </div>
		                    </div>
		                    <div class="jinji_divtitbot">
		                        <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
		                        <button class="pull-right jinjiscbtn" type="button">删除</button>
		                        <button class="pull-right jiushibtnxiu" type="button">保存</button>
		                        <button class="pull-right zjbtn xinz_btn" type="button">新增+</button>
		                    </div>
		                </form>
		             </div>
	             </c:if>
             </c:forEach>
           </c:if>

        </div>

    </div>
    <!-- 体系原因 -->
    <div class="yanyun">
     
        <div class="tens_lts">
            <div class="faxinbox">
            <input type="hidden" class="type" name="type" value="2">
            <input type="hidden" class="CAUSED4_ID" name="type" value="">
                <span>体系原因</span><a class="xinz_btn" href="javascript:">新增+</a>
            </div>
            <div class="buen_zus">
                <a href="javascript:">5why</a>
            </div>
        </div>
        <div class="zhegfsd_box">
        <!-- 体系原因 -->
        <c:if test="${fn:length(varLists ) == 0}">
            <div class="jinji_div">
            <form action="">
                    <input type="hidden" class="type" name="type" value="2">
                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID}" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		            <input type="hidden" name="PROCESS_FOUR_ID" id="PROCESS_FOUR_ID" value="${sj.PROCESS_FOUR_ID}"/>
                    <div class="jinji_divtit">
                        <div class="jinjixuh">序号</div>
                        <div class="jinjixuh2"><span>1</span></div>
                    </div>
                    <div class="jinjiul">
                        <div class="container" style="width: 100%;">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="fenxbler">
                                        <div class="fashl_l tleyiyd">体系原因</div>
                                        <textarea class="tex_zxuyd myname1" name="SYSTEMS"></textarea>
                                    </div>
                                    <div class="fenxbler">
                                        <div class="fashl_l">验证/证实</div>
                                        <textarea class="tex_zxuyd" name="VALIDATION"></textarea>
                                    </div>
                                </div>
                                <div class=" col-lg-3">
                                    <div class=" fenxbler">
                                        <div class="fashl_l">贡献</div>
                                        <input class="goanxipt" name="contribution" type="text"/>
                                    </div>
                                    <div class=" fenxbler">
                                        <div class="jinjiule">
                                            <div class="jinjiultit2">上传附件
                                              <input id="myfile3" name="myfile3" class="myfile3" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
                                            </div>
                                            <div class="jinjiuze">
                                                <div class="jinjiddi">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="jinji_divtitbot">
                        <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
                        <button class="pull-right jinjiscbtn" type="button">删除</button>
                        <button class="pull-right jiushibtnxiu" type="button">保存</button>
                        <button class="pull-right zjbtn xinz_btn" type="button">新增+</button>
                    </div>
                </form>
            </div>
            </c:if>
          <!--   体系原因有数据 -->
            <c:if test="${!empty varLists }">
            
              <c:forEach items="${varLists }" var="var" varStatus="vst">
                <c:if test="${var.type eq '2' }">
		            <div class="jinji_div">
		            <form action="">
		                    <input type="hidden" class="type" name="type" value="2">
		                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID}" class="CAUSED4_ID"> 
							<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
				            <input type="hidden" name="PROCESS_FOUR_ID" id="PROCESS_FOUR_ID" value="${sj.PROCESS_FOUR_ID}"/>
		                    <div class="jinji_divtit">
		                        <div class="jinjixuh">序号</div>
		                        <div class="jinjixuh2"><span>${vst.index+1 }</span></div>
		                    </div>
		                    <div class="jinjiul">
		                        <div class="container" style="width: 100%;">
		                            <div class="row">
		                                <div class="col-lg-9">
		                                    <div class="fenxbler">
		                                        <div class="fashl_l tleyiyd">体系原因</div>
		                                        <textarea class="tex_zxuyd myname1" name="SYSTEMS">${var.SYSTEMS}</textarea>
		                                    </div>
		                                    <div class="fenxbler">
		                                        <div class="fashl_l">验证/证实</div>
		                                        <textarea class="tex_zxuyd" name="VALIDATION">${var.VALIDATION }</textarea>
		                                    </div>
		                                </div>
		                                <div class=" col-lg-3">
		                                    <div class=" fenxbler">
		                                        <div class="fashl_l">贡献</div>
		                                        <input class="goanxipt" name="contribution" type="text" value="${var.contribution}"/>
		                                    </div>
		                                    <div class=" fenxbler">
		                                        <div class="jinjiule">
		                                            <div class="jinjiultit2">上传附件
		                                              <input id="myfile3" name="myfile3" class="myfile3" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
		                                            </div>
		                                            <div class="jinjiuze">
		                                                <div class="jinjiddi">
		                                                   <c:forEach items="${var.ATTACHMENT}" var="vars">
														       <div class="jinjiuddd">
														       <input type='hidden' name='fileurl' value="${vars.k_name}::${vars.k_url}">
																	<em class="jinjiudddeml"><img src="${ctx}/static/fords/img/wenjian.png"/></em>
																	<div class="jinjiudtits">
																		<a href="${fns:getConfig('IMGURL')}/${vars.k_url}" title="${vars.k_name}">${vars.k_name}</a>
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
		                        </div>
		                    </div>
		                    <div class="jinji_divtitbot">
		                        <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
		                        <button class="pull-right jinjiscbtn" type="button">删除</button>
		                        <button class="pull-right jiushibtnxiu" type="button">保存</button>
		                        <button class="pull-right zjbtn xinz_btn" type="button">新增+</button>
		                    </div>
		                </form>
		            </div>
            </c:if>
            </c:forEach>
            </c:if>

        </div>
        <div class="xiayibus">
            <a href="${ctx}/process_three/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">上一步</a>
            <a href="${ctx}/process_five/goProcess_five?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">下一步</a>
        </div>
    </div>


</div>
<!----右边部分---->
<%@ include file="/setting/right.jsp"%>

<!-- 新增的模板 -->
<div class="muban_zjd">
    <div class="jinji_div">
    
        <form action="">
                    <input type="hidden" name="CAUSED4_ID" value="${var.CAUSED4_ID}" class="CAUSED4_ID"> 
					<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID}"/>
		            <input type="hidden" name="PROCESS_FOUR_ID" id="PROCESS_FOUR_ID" value="${sj.PROCESS_FOUR_ID}"/>
            <div class="jinji_divtit">
                <div class="jinjixuh">序号</div>
                <div class="jinjixuh2">
                <input type="hidden" class="type" name="type" value="">
                <input type="hidden" class="CAUSED4_ID" name="type" value="">
                <span>1</span></div>
            </div>
            <div class="jinjiul">
                <div class="container" style="width: 100%;">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="fenxbler">
                                <div class="fashl_l tleyiyd"></div>
                                <textarea class="tex_zxuyd myclass1"></textarea>
                            </div>
                            <div class="fenxbler">
                                <div class="fashl_l">验证/证实</div>
                                <textarea class="tex_zxuyd myclass2" name="VALIDATION"></textarea>
                            </div>
                        </div>
                        <div class=" col-lg-3">
                            <div class=" fenxbler">
                                <div class="fashl_l">贡献</div>
                                <input class="goanxipt myclass3" name="contribution"  type="text"/>
                            </div>
                            <div class=" fenxbler">
                                <div class="jinjiule">
                                    <div class="jinjiultit2">上传附件
                                        <input id="myfile" name="myfile" class="myfile" type="file" style="opacity: 0; filter:Alpha(opacity=0);" onchange="upload(this);"/>
                                    </div>
                                    <div class="jinjiuze">
                                        <div class="jinjiddi">

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="jinji_divtitbot">
                <input type="hidden" class="ATTACHMENT" name="ATTACHMENT" value="">
                <button class="pull-right jinjiscbtn" type="button">删除</button>
                <button class="pull-right jiushibtnxiu" type="button">保存</button>
                <button class="pull-right zjbtn xinz_btn" type="button">新增+</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">

//上传附件
var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
	//附件上传
	function upload(target){
		var name=target.value;
	    var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
	    if(fileName !="doc" && fileName !="docx"&& fileName !="xlsx"&& fileName !="zip"&& fileName !="xls"&& fileName !="pdf"&&fileName !="jpg" && fileName !="jpeg"&& fileName !="png" &&fileName !="gif"){
	       alert("请选择正确格式的文件(doc,docx,xlsx,zip,pdf,xls,png,jpg,jpeg,gif)！");
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
				alert(e+"\n"+"如果错误为：Error:Automation 服务器不能创建对象；"+"\n"+"请按以下方法配置浏览器："+"\n"+"请打开【Internet选项-安全-Internet-自定义级别-ActiveX控件和插件-对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本（不安全）-点击启用-确定】");
				return;
			}
	    }else{    
	     fileSize = target.files[0].size;     
	    }
	    var size = fileSize / 1024;    
	    if(size>5120){  
	      alert("文件大小不能超过5M");
	      target.value="";
	      return
	    } 
	    
	    DocAjaxFileUpload(target); 
	     
	}
	
	function DocAjaxFileUpload(target){
		var myfilediv=$(target).parent().siblings().children(".jinjiddi");
		/* alert(myfilediv.html()); */
		var name=target.value;
		var fileName = name.substring(name.lastIndexOf("\\")+1);
		var $target = $(target);
		var classname = $target.attr('class');
	/* 	alert(classname); */
		var myDate = new Date();
		var now = myDate.getTime();
		$.ajaxFileUpload({
			url: '${ctx}/pc/uploadfile', 
	        secureuri: false, 
	        fileElementId: classname, 
	        data:{"fileitem":"processFour"},
	        /* dataType: 'JSON',   */ 
	        success:function(data){
	        	
	        	var str = $(data).find("body").text();  
	            var json = $.parseJSON(str);
	        	if("success"==json.info){
	        		var str =
	        		"<div class=\"jinjiuddd\">\n" +
	        		"<input type='hidden' name='fileurl' value='"+fileName+"::"+json.url+"'>"+
	        		"		    <em class=\"jinjiudddeml\"><img src=\"${ctx}/static/fords/img/wenjian.png\"/></em>\n" +
	        		"				<div class=\"jinjiudtits\">\n" +
	        		"					<a href=\""+json.imgurl+"\" title=\""+fileName+"\">"+fileName+"</a>\n" +
	        		"				</div>\n" +
	        		"           <em class=\"jinjiudddemr\"><img src=\"${ctx}/static/fords/img/guanbi.png\"/></em>\n" +
	        		"		</div>";
	        		
	        		myfilediv.append(str);
	        	}else if("oversize"==json.info){
	        		alert("系统繁忙请稍后再试！");
	        	}
	        },
	        error:function(){
	        	alert("上传失败");
	        }
		})
	}

	
	// 保存
		//保存
	$(document).on("click",".jiushibtnxiu",function(){
		//附件
		var tis = $(this);
		var str ="";
		//附件遍历
		tis.parent().prev().find("input[name='fileurl']").each(function(index,el){
			var realname = $(this).val();
			str += realname+";;";
		});
		
		$("input[name='ATTACHMENT']").val(str);
		
	  //提交数据
		 $.ajax({
			type : "POST",
			url : "${ctx}/caused4/updated",
			data : tis.closest("form").serialize(),
			success : function(data) {
				
				if(data.message=='1'){
					
					alert("保存成功");
					tis.text("修改");
					tis.parents(".jinji_div").find("input[name='CAUSED4_ID']").val(data.CAUSED4_ID);
					
				}else{
					alert("保存失败");
					
				}
				
				 
			},
		 	error:function(){
	        	alert("上传失败");
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
					
				  alert("删除成功");
				
					
				}else{
					
					 alert("删除失败");
				}
			},
		 	error:function(){
	        	alert("上传失败");
	        }
		});
	})


		
		
</script>
</body>
</html>
