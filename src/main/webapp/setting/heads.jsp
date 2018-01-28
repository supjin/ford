<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
			<!---头部信息--->
			<div class="shijian_box">
				<div class="shijian_tit">事件名称名称名称</div>
				<ul class="shijian_ul">
					<li>事件编号：D120171130001</li>
					<li>工厂代号：RBCQ001</li>
					<li>产品阶段：试用期阶段</li>
					<li>客户名称：长安福特</li>
					<li>当前步骤：D5</li>
					<li>当前处理人：客户经理1</li>
				</ul>
				<div class="shijian_div">
					<div class="shijian_d">
						<p>16</p>
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
					<li class="d_active1">
						<a href="${ctx}/dProces/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D0</p>
								<p>紧急遏制</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
					<li class="d_active2">
						<a href="${ctx}/process_one/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D1</p>
								<p>团队</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
					<li class="d_active3">
						<a href="${ctx}/process_two/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D2</p>
								<p>问题陈述</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
					<li class="d_active4">
						<a href="${ctx}/process_three/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D3</p>
								<p>临时措施</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
					<li>
						<a href="${ctx}/process_four/go?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D4</p>
								<p>根本原因</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
					<li>
						<a href="${ctx}/process_five/goProcess_five?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D5</p>
								<p>永久措施选择</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
					<li>
						<a href="${ctx}/process_six/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D6</p>
								<p>永久措施执行</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
					<li>
						<a href="${ctx}/process_seven/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D7</p>
								<p>预防措施</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
					<li>
						<a href="${ctx}/process_eight/goProcess?CLIENT_PROBLEM_COLLECTION_ID=${pd.CLIENT_PROBLEM_COLLECTION_ID}">
							<div class="d_yys">
								<p>D8</p>
								<p>团队认定</p>
							</div>
							<div class="d_yydd"></div>
						</a>
					</li>
				</ul>
			</div>
			<input type="hidden" name="CLIENT_PROBLEM_COLLECTION_ID" id="CLIENT_PROBLEM_COLLECTION_ID" value="${pd.CLIENT_PROBLEM_COLLECTION_ID }">
			<input type="hidden" name="FIRSTDEPARTMENT" id="FIRSTDEPARTMENT" value="${pd.FIRSTDEPARTMENT }">