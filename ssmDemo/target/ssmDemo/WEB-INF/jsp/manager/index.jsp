<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>我的桌面</title>
	</head>
<body>
	<div class="wap-container">
		<article class="Hui-admin-content clearfix">
			<div class="row-24 clearfix" style="margin-left: -12px; margin-right: -12px;">
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-6" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
					<div class="panel">
						<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总销售额：</div>
						<div class="panel-body" style="padding:0 24px;">
							<div class="c-primary" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
								&yen;
								<c:choose>
									<c:when test="${totalSales < 10}">
										${totalSales}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${totalSales}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日销售额</span> <span>&yen;
								<c:choose>
									<c:when test="${curSales < 10}">
										${curSales}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${curSales}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
							</span></div>
						</div>
					</div>
				</div>
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-6" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
					<div class="panel">
						<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总访问量：</div>
						<div class="panel-body" style="padding:0 24px;">
							<div class="c-success" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
								<c:choose>
									<c:when test="${totalPageView < 10}">
										${totalPageView}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${totalPageView}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>

							</div>
							<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日访问量</span>
								<span>
									<c:choose>
										<c:when test="${curPageView < 10}">
											${curPageView}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${curPageView}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-6" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
					<div class="panel">
						<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总会员数：</div>
						<div class="panel-body" style="padding:0 24px;">
							<div class="c-danger" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
								<c:choose>
									<c:when test="${totalMember < 10}">
										${totalMember}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${totalMember}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
								人
							</div>
							<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日新增会员</span> <span>
								<c:choose>
									<c:when test="${curMember < 10}">
										${curMember}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${curMember}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
								人</span></div>
						</div>
					</div>
				</div>
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-6" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
					<div class="panel">
						<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总文章数：</div>
						<div class="panel-body" style="padding:0 24px;">
							<div class="c-warning" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
								<c:choose>
									<c:when test="${totalWork < 10}">
										${totalWork}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${totalWork}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日新增文章</span> <span>
								<c:choose>
									<c:when test="${curWork < 10}">
										${curWork}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${curWork}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
							</span></div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel">
				<div class="panel-body">
					<p class="f-20 text-success">欢迎使用E防标原创保护平台
						<span class="f-14">v1.0</span>
						后台管理系统
					</p>
					<table class="table table-border table-bordered table-bg mt-20">
						<thead>
							<tr>
								<th colspan="2" scope="col">服务器信息</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th width="30%">项目域名</th>
								<td><span id="lbServerName">https://xcx.efangbiao.com</span></td>
							</tr>
							<tr>
								<td>服务器IP地址</td>
								<td>39.108.83.198</td>
							</tr>
							<tr>
								<td>服务器域名</td>
								<td>xcx.efangbiao.com</td>
							</tr>
							<tr>
								<td>服务器端口 </td>
								<td>443</td>
							</tr>
							<tr>
								<td>服务器操作系统 </td>
								<td>Linux</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</article>
		<%--<footer class="footer Hui-admin-footer">--%>
			<%--<p>感谢jQuery、layer、laypage、Validform、UEditor、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br> Copyright &copy;2015 h-ui.admin.pro v1.0 All Rights Reserved.<br> 本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>--%>
		<%--</footer>--%>
	</div>
	<jsp:include page="common/foot.jsp"></jsp:include>
</body>
</html>
