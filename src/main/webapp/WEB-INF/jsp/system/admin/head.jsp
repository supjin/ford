<div class="navbar navbar-inverse">
		  <div class="navbar-inner">
		   <div class="container-fluid" style="background-color: #24cbb2;">
			  <a class="brand"><small>${pd.SYSNAME}</small> </a>
			  
			  <ul class="nav ace-nav pull-right">
			  
			  <li class="green" style="background-color:#24cbb2;">
						<a href="javascript:alert('预留功能,待开发');" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-envelope-alt icon-animated-vertical icon-only"></i>
							<span class="badge pw-bg-a">1</span>
						</a>
					</li>
								
					
					<li class="purple" style="background-color:#24cbb2;" onclick="creatw();">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-warning-sign icon-animated-bell icon-only "></i>
							<span class="badge pw-bg-b">1</span>
						</a>
					</li>
					
					<li class="grey" style="background-color:#24cbb2;">
						<a href="javascript:alert('预留功能,待开发');" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-tasks"></i>
							<span class="badge pw-bg-c">1</span>
						</a>
					</li>
					<li class="light-blue user-profile" style="background-color:#24cbb2; ">
						<a class="user-menu dropdown-toggle" href="javascript:;" data-toggle="dropdown">
							<img alt="FH" src="static/avatars/user.jpg" class="pw-user-photo nav-user-photo" />
							<span id="user_info">
							</span>
							<i class="icon-caret-down"></i>
						</a>
						<ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a onclick="editUserH();" style="cursor:pointer;"><i class="icon-user"></i> 修改资料</a></li>
							<li id="systemset"><a onclick="editSys();" style="cursor:pointer;"><i class="icon-cog"></i> 系统设置</a></li>
							<li id="productCode"><a onclick="productCode();" style="cursor:pointer;"><i class="icon-cogs"></i> 代码生成</a></li>
							<li class="divider"></li>
							<li><a href="logout"><i class="icon-off"></i> 退出</a></li>
						</ul>
					</li>
			  </ul><!--/.ace-nav-->
		   </div><!--/.container-fluid-->
		  </div><!--/.navbar-inner-->
		</div><!--/.navbar-->
	
	
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
