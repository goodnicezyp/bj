<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>E防标后台管理系统</title>
</head>
<body>

	<!--_menu 作为公共模版分离出去-->
	<aside class="Hui-admin-aside-wrapper">
		<div class="Hui-admin-logo-wrapper">
			<a class="logo navbar-logo" href="#">
				<i class="va-m iconpic global-logo"></i>
				<span class="va-m">E防标后台管理系统</span>
			</a>
		</div>
		<div class="Hui-admin-menu-dropdown bk_2">

			<shiro:hasPermission name="user_menu">
				<dl id="menu-users" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe62b;</i> 用户管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/user/userListForm" data-title="微信用户" href="javascript:void(0)">微信用户</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

		<shiro:hasPermission name="article_menu">
			<dl id="menu-article" class="Hui-menu">
				<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe616;</i> 资讯管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
				<dd class="Hui-menu-item">
					<ul>
						<li><a data-href="/admin/article/articleForm" data-title="资讯列表" href="javascript:void(0)">资讯列表</a></li>
					</ul>
				</dd>
			</dl>
		</shiro:hasPermission>

		<shiro:hasPermission name="banner_menu">
			<dl id="menu-picture" class="Hui-menu">
				<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe613;</i> 图片管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
				<dd class="Hui-menu-item">
					<ul>
						<li><a data-href="/admin/banner/bannerForm" data-title="banner图管理" href="javascript:void(0)">banner图管理</a></li>
					</ul>
				</dd>
			</dl>
		</shiro:hasPermission>

			<shiro:hasPermission name="work_menu">
				<dl id="menu-work" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe620;</i> 作品管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/work/workListForm" data-title="作品列表" href="javascript:void(0)">作品列表</a></li>
							<li><a data-href="/admin/cate/cateListForm" data-title="作品分类" href="javascript:void(0)">作品分类</a></li>
							<li><a data-href="/admin/download/downloadListForm" data-title="下载记录" href="javascript:void(0)">下载记录</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

		<shiro:hasPermission name="order_menu">
			<dl id="menu-order" class="Hui-menu">
				<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe627;</i> 订单管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
				<dd class="Hui-menu-item">
					<ul>
						<li><a data-href="/admin/order/orderListForm" data-title="订单列表" href="javascript:void(0)">订单列表</a></li>
					</ul>
				</dd>
			</dl>
		</shiro:hasPermission>

		<shiro:hasPermission name="withDraw_menu">
			<dl id="menu-order" class="Hui-menu">
				<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe63a;</i> 提现管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
				<dd class="Hui-menu-item">
					<ul>
						<li><a data-href="/admin/withDraw/withDrawListForm" data-title="提现列表" href="javascript:void(0)">提现列表</a></li>
					</ul>
				</dd>
			</dl>
		</shiro:hasPermission>

		<%--<shiro:hasPermission name="appointment_menu">--%>
			<dl id="menu-order" class="Hui-menu">
				<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe63a;</i> 预约服务管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
				<dd class="Hui-menu-item">
					<ul>
						<li><a data-href="/admin/appointment/appointmentListForm" data-title="预约列表" href="javascript:void(0)">预约列表</a></li>
					</ul>
				</dd>
			</dl>
		<%--</shiro:hasPermission>--%>

			<shiro:hasPermission name="coupon_menu">
				<dl id="menu-coupon" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe6b6;</i> 代金券管理<i
							class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/coupon/couponListForm" data-title="代金券列表"
								   href="javascript:void(0)">代金券列表</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

			<shiro:hasPermission name="custom_menu">
				<dl id="menu-custom" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe6d0;</i> 客服管理<i
							class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li>
								<a data-href="/admin/custom/customListForm" data-title="客服列表" href="javascript:void(0)">客服列表</a>
							</li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

			<shiro:hasPermission name="orderSale_menu">
				<dl id="menu-orderSale" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe636;</i> 流水管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/orderSale/saleListForm" data-title="流水列表" href="javascript:void(0)">流水列表</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

			<shiro:hasPermission name="member_menu">
				<dl id="menu-member" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe60d;</i> 会员管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/member/memberPacketForm" data-title="会员套餐管理" href="javascript:void(0)">会员套餐管理</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

			<shiro:hasPermission name="coopera_menu">
				<dl id="menu-coopera" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe73a;</i> 授权合作管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/coopera/cooperaForm" data-title="合作申请列表" href="javascript:void(0)">合作申请列表</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

			<shiro:hasPermission name="interest_menu">
				<dl id="menu-coopera" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe64b;</i> 兴趣与职业管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/interest/interestForm" data-title="兴趣管理" href="javascript:void(0)">兴趣管理</a></li>
							<li><a data-href="/admin/profess/professForm" data-title="职业管理" href="javascript:void(0)">职业管理</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

			<shiro:hasPermission name="diskSpace_menu">
				<dl id="menu-coopera" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe6c6;</i> 磁盘管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/diskSpace/diskSpaceForm" data-title="套餐管理" href="javascript:void(0)">套餐管理</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>


			<shiro:hasPermission name="admin_menu">
				<dl id="menu-admin" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/role/roleListForm" data-title="角色管理" href="javascript:void(0)">角色管理</a></li>
							<li><a data-href="/admin/permission/listForm" data-title="权限管理" href="javascript:void(0)">权限管理</a></li>
							<li><a data-href="/admin/admin/adminListForm" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

			<shiro:hasPermission name="countUser_menu">
				<dl id="menu-tongji" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe61a;</i> 系统统计<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li>
								<dl class="Hui-menu">
									<dt class="Hui-menu-title">用户统计<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
									<dd class="Hui-menu-item">
										<ul>
											<li><a data-href="/admin/count/countUserForm?type=0" data-title="登录人数统计" href="javascript:void(0)">登录人数统计</a></li>
											<li><a data-href="/admin/count/countUserForm?type=1" data-title="注册人数统计" href="javascript:void(0)">注册人数统计</a></li>
											<li><a data-href="/admin/count/countUserForm?type=2" data-title="会员统计" href="javascript:void(0)">会员统计</a></li>
											<li><a data-href="/admin/count/countUserForm?type=3" data-title="代理人统计" href="javascript:void(0)">代理人统计</a></li>
											<li><a data-href="/admin/count/countCodeForm" data-title="分享码统计" href="javascript:void(0)">分享码统计</a></li>
										</ul>
									</dd>
								</dl>
							</li>
							<li><a data-href="/admin/count/countWorkForm" data-title="作品统计" href="javascript:void(0)">作品统计</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>

			<shiro:hasPermission name="system_menu">
				<dl id="menu-system" class="Hui-menu">
					<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
					<dd class="Hui-menu-item">
						<ul>
							<li><a data-href="/admin/base/baseForm" data-title="协议与文案管理" href="javascript:void(0)">协议与文案管理</a></li>
							<li><a data-href="/admin/agree/agreeRecordForm" data-title="协议签订记录" href="javascript:void(0)">协议签订记录</a></li>
							<%--<li><a data-href="system-category.html" data-title="栏目管理" href="javascript:void(0)">栏目管理</a></li>--%>
							<%--<li><a data-href="system-data.html" data-title="数据字典" href="javascript:void(0)">数据字典</a></li>--%>
							<%--<li><a data-href="system-shielding.html" data-title="屏蔽词" href="javascript:void(0)">屏蔽词</a></li>--%>
							<li><a data-href="/admin/sys/sysLogForm" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
						</ul>
					</dd>
				</dl>
			</shiro:hasPermission>
		</div>
	</aside>
	<div class="Hui-admin-aside-mask"></div>
	<!--/_menu 作为公共模版分离出去-->

	<div class="Hui-admin-dislpayArrow">
		<a href="javascript:void(0);" onClick="displaynavbar(this)">
			<i class="Hui-iconfont Hui-iconfont-left">&#xe6d4;</i>
			<i class="Hui-iconfont Hui-iconfont-right">&#xe6d7;</i>
		</a>
	</div>

	<section class="Hui-admin-article-wrapper">
		<!--_header 作为公共模版分离出去-->
		<header class="Hui-navbar">
			<div class="navbar">
				<div class="container-fluid clearfix">
					  <nav id="Hui-topNav" class="nav navbar-nav">
						<%--<ul class="clearfix">--%>
						  <%--<li><a data-href="article-add.html" data-title="新增资讯" onclick="Hui_admin_tab(this)" href="javascript:;">新增资讯</a></li>--%>
						  <%--<li class="dropDown dropDown_hover">--%>
							<%--<a class="dropDown_A" href="javascript:;">顶部菜单</a>--%>
							<%--<ul class="dropDown-menu menu radius box-shadow">--%>
							  <%--<li class="">--%>
								<%--<a href="#">二级导航</a>--%>
							  <%--</li>--%>
							  <%--<li class="">--%>
								<%--<a href="#">二级导航</a>--%>
							  <%--</li>--%>
							<%--</ul>--%>
						  <%--</li>--%>
						<%--</ul>--%>
					  </nav>
					<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar">
						<ul class="clearfix">
							<li>[管理员]</li>
							<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">[<shiro:principal/>] <i class="Hui-iconfont">&#xe6d5;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">
									<%--<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>--%>
									<li><a href="/adminLoginForm">切换账户</a></li>
									<li><a href="/adminLoginForm">退出</a></li>
								</ul>
							</li>
							<li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
							<li id="Hui-skin" class="dropDown dropDown_hover right">
								<a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">
									<li><a href="javascript:;" data-val="default" title="默认（蓝色）">默认（深蓝）</a></li>
									<li><a href="javascript:;" data-val="black" title="黑色">黑色</a></li>
									<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
									<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
									<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
									<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!--/_header 作为公共模版分离出去-->

		<div id="Hui-admin-tabNav" class="Hui-admin-tabNav">
			<div class="Hui-admin-tabNav-wp">
				<ul id="min_title_list" class="acrossTab clearfix" style="width: 241px; left: 0px;">
					<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li>
				</ul>
			</div>
			<div class="Hui-admin-tabNav-more btn-group" style="display: none;">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a>
				<a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
			</div>
		</div>

		<div id="iframe_box" class="Hui-admin-article">
			<div class="show_iframe">
				<iframe id="iframe-welcome" data-scrolltop="0" scrolling="yes" frameborder="0" src="index"></iframe>
			</div>
		</div>
	</section>
	<div class="contextMenu" id="Huiadminmenu">
		<ul>
			<li id="closethis">关闭当前 </li>
			<li id="closeall">关闭全部 </li>
		</ul>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="common/foot.jsp"></jsp:include>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<%--<script type="text/javascript" src="static/business/js/main.js"></script>--%>
</body>
</html>
