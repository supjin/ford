<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!----右边部分---->

<div class="right_zhineng">
			<div class="right_kongbai"></div>
			<ul class="right_zhiul">
				<li>智能协助</li>
			</ul>
			<c:if test="${pd.STEP == '00'}">
			<p class="right_zhip"><span class="right_zhipb">问题症状</span>--主要是客户的抱怨描述</p>
			<p class="right_zhip"><span class="right_zhipb">ERA</span>--第一时间的保护顾客的措施</p>
			<p class="right_zhip"><span class="right_zhipb">常见ERA</span>：
				<ul class="right_ul">
					<li>隔离批次</li><li>跟线围堵</li><li>库存排查</li><li>停止发运</li>
				</ul>
			</p>
			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			    <div class="right_borbo">
			    	<p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    	<p>应急反应：</p>
			    	<ol class="right_ol">
			    	    <li>再次派人到平伟库存品排查福特从19日到22日送的1500PCS，确认结果无不良。</li>
			    	    <li>对REBO成品库房进行排查，排查数1000件无不良。</li>
			    	</ol>
			    </div>
			    <div class="right_borbo">
			    	<p class="right_pp">P66085：6-尾车灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    	<p>应急反应：</p>
			    	<ol class="right_ol">
			    	    <li>福特整体排查100辆，无不良。</li>
			    	    <li>安通林库排查，无不良。</li>
			    	</ol>
			    </div>
			</div>
			</c:if>
			<c:if test="${pd.STEP == '01'}">
			<p class="right_zhip"><span class="right_zhipb">Champion负责人</span>--在整个过程中提供资源，清除障碍，支持团队解决问题，特别是涉及体系整改、跨部门协调、资源支持时。</p>
			<p class="right_zhip"><span class="right_zhipb">Team Leader团队领导</span>--一个在整个G8D过程中负责领导团队成员的人，项目执行的牵头人。</p>
			<p class="right_zhip"><span class="right_zhipb">Member成员</span>--包括但不限于：制造工艺、制造生产、产品设计、质量、过程/产品专家。</p><br /><br />
			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			    <p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    <table cellpadding="0" cellspacing="0" class="right_table">
			        <tr>
			            <td style="width: 45px;">Name</td>
			            <td>Dept</td>
			            <td>Role</td>
			            <td>Phone</td>
			        </tr>
			        <tr>
			            <td>李娜娜</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>何　科</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>杨志勇</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>张　兵</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>蒋光红</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>钟　鹏</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			    </table>
			</div>
			</c:if>
			<c:if test="${pd.STEP == '02'}">
			<p class="right_zhip">使用5W2H和Is/Is Not，将问题清楚并且客观的描述，定义问题范围，缩小调查范围，避免直接对问题下结论或者作没有根据的设想。</p>
			<!-- <p class="right_zhip"><span class="right_zhipb">Team Leader团队领导</span>--一个在整个G8D过程中负责领导团队成员的人，项目执行的牵头人。</p>
			<p class="right_zhip"><span class="right_zhipb">Member成员</span>--包括但不限于：制造工艺、制造生产、产品设计、质量、过程/产品专家。</p><br /><br /> -->
			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			    <p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    <table cellpadding="0" cellspacing="0" class="right_table">
			        <tr>
			            <td style="width: 45px;">Name</td>
			            <td>Dept</td>
			            <td>Role</td>
			            <td>Phone</td>
			        </tr>
			        <tr>
			            <td>李娜娜</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>何　科</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>杨志勇</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>张　兵</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>蒋光红</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			        <tr>
			            <td>钟　鹏</td>
			            <td>QA</td>
			            <td>工程师</td>
			            <td>18580185736</td>
			        </tr>
			    </table>
			</div>
			</c:if>
			<c:if test="${pd.STEP == '03'}">
			<p class="right_zhip">制定在永久措施实施前的措施，保护顾客远离该问题症状影响的措施。一般是优化测量系统，比如增加检查频次、优化检查方法和工具等。</p>
			<p class="right_zhip"><span class="right_zhipb">ERA/ICA/PCA的说明：</span></p>
			<p class="right_zhip"><span class="right_zhipb">1、</span>三个措施是随着问题调查的深入，信息更多，而采取的更有效/更根本的措施。</p>
			<p class="right_zhip"><span class="right_zhipb">2、</span>其中ERA（应急处理措施）以最小的支撑数据执行；PCA是在根本原因分析后执行。</p>
			<p class="right_zhip"><span class="right_zhipb">3、</span>通常验证有效地ICA执行后，ERA可以取消。</p>
			<p class="right_zhip"><span class="right_zhipb">4、</span>验证有效的PCA执行后，ICA可以取消。</p>
			<p class="right_zhip"><span class="right_zhipb">5、</span>在某些情况下，可能出现ERA=ICA；ICA=PCA</p>

			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			    <p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			   
			</div>
			</c:if>
			<c:if test="${pd.STEP == '04'}">
			<p class="right_zhip"><span class="right_zhipb">1. 发生原因：</span>从制造过程中人、机、料、法、环、测方面分析问题产生原因，同时必须被验证以及符合Is/Is Not的描述。</p>
			<p class="right_zhip"><span class="right_zhipb">原因验证说明：</span></p>
			<p class="right_zhip">验证是通过被动和主动方法完成的：被动验证是通过观察来完成的；主动验证是通过改变根本原因变量来完成的，比如问题再现。</p>
			<p class="right_zhip"><span class="right_zhipb">2. 逃出原因：</span>遗漏点是指与根本原因很靠近的点，在那里应该检查到问题，但实际却没有。一般是测量系统不够稳健，探测度不足以识别该问题。或者没有该项检查。</p>
			<p class="right_zhip"><span class="right_zhipb">3、系统原因：</span>根本原因的根本原因，一般是指体系、流程、管理等方面的原因。可用于D7的措施的指导。</p>

			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			    <p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    
			</div>
			</c:if>
			<c:if test="${pd.STEP == '05'}">
			<p class="right_zhip"><span class="right_zhipb">1、</span>综合考虑成本和有效性的前提下，同时消除根本原因和流出原因，实施措施达到顾客期望标准（从根本上解决问题；不会产生新的问题；被验证能够起作用）</p>
			<p class="right_zhip"><span class="right_zhipb">2、 </span>措施应和发生原因与逃出原因有对应关系。</p>
			<p class="right_zhip"><span class="right_zhipb">3、验证：</span>一般是少量的测试或者实验验证，以验证措施是否有效果，发生在措施执行之前，在公司内执行的。</p>
			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			    <p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    
			</div>
			</c:if>
			<c:if test="${pd.STEP == '06'}">
			<p class="right_zhip"><span class="right_zhipb">1、</span>执行永久性措施并证实达到效果，跟踪实施计划。</p>
			<p class="right_zhip"><span class="right_zhipb">2、证实：</span>主要是需要时间和客户考验的批量证实，以证实措施确实是有效果的，发生在措施执行之后。使用公司内数据和客户数据证实。</p>
			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			    <p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    
			</div>
			</c:if>
			<c:if test="${pd.STEP == '07'}">
			<p class="right_zhip">针对分析识别出的体系漏洞、流程漏洞和管理漏洞等采取的措施，防止相同或者类似问题再次发生。</p>
			<p class="right_zhip">包括更新相应的文件更新、横向展开等。同时，需辅以培训以助落实。</p>
			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			<p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    
			</div>
			</c:if>
			<c:if test="${pd.STEP == '08'}">
			<p class="right_zhip">总结问题并展开表扬，关闭问题。</p>
			<p class="right_zhip">对问题进行审批，并回执改进意见，帮助团队持续改进。</p>
			<div class="right_xiangt">相似问题</div>
			<div class="right_borbox">
			    <p class="right_pp">P360829-行李箱灯闪烁<em class="pull-right"><img src="${ctx }/static/fords/img/eyeas.jpg"/></em></p>
			    
			</div>
			</c:if>
			<div class="tight_guanbi"><span class="icon-angle-right"></span></div>
		</div>
