<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>xxx管理系统</title>
</head>
<body>

	<!--_menu 作为公共模版分离出去-->
	<aside class="Hui-admin-aside-wrapper">
		<div class="Hui-admin-logo-wrapper">
			<a class="logo navbar-logo" href="#">
				<i class="va-m iconpic global-logo"></i>
				<span class="va-m">xxx管理系统</span>
			</a>
		</div>
		<div class="Hui-admin-menu-dropdown bk_2">


			<dl id="menu-article" class="Hui-menu">
				<dt class="Hui-menu-title"><i class="Hui-iconfont">&#xe616;</i> 资讯管理<i class="Hui-iconfont Hui-admin-menu-dropdown-arrow">&#xe6d5;</i></dt>
				<dd class="Hui-menu-item">
					<ul>
						<li><a data-href="/admin/article/articleForm" data-title="资讯列表" href="javascript:void(0)">资讯列表</a></li>
					</ul>
				</dd>
			</dl>

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
