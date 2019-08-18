<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>个人资料 - 微信用户</title>
	<style>
		html, body {
			width: 100%;
			height: 100%;
			background-color: #fafafa;
			background-image: url(../../../statics/img/bgImg.png);
			background-repeat: repeat-x;
		}
		.container {
			width: 1200px;
		}
		.index-content {
			width: 1083px;
			margin: 0 auto;
			clear: both;
		}
		audio:not([controls]) {
			display: none !important;
		}
		audio {
			width: 300px;
			height: 32px;
		}
		.radio-info-content {
			margin-top: 50px;
		}
		.member_icon{
			width: 20px;
			position: absolute;
			left: -58px;
			top: 122px;
		}
		.title-cpt {
			clear: both;
			padding-bottom: 40px;
			background-repeat: no-repeat;
			padding-top: 70px;
			padding-left: 28px;
			background-position: 0 74px;
			background-image: url(../../../statics/img/square.png);
			color: #555;
			font-weight: 700;
			font-size: 16px;
		}
		.e-article-content .article-content {
			border: 1px solid #e8e8e8;
			line-height: 24px;
			margin-bottom: 50px;
			-ms-box-sizing: border-box;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
			padding: 30px 127px;
			padding-bottom: 50px;
			font-weight: 200;
			background-color: #fff;
			font-size: 14px;
			color: #333;
			position: relative;
		}
		.radio-info-content .e-img {
			width: 132px;
			height: 132px;
			overflow: hidden;
		}
		.radio-info-content .e-img img {
			width: 100%;
		}
		.radio-info-content .radio-info {
			height: 340px;
			float: right;
			width: 582px;
			margin-top: -340px;
			font-size: 14px;
			font-weight: lighter;
			position: relative;
			color: #999;
		}
		.radio-info-content .e-info {
			width: 904px;
			height: 226px;
			margin-top: -142px;
		}

		.radio-info-content .radio-info .radio-title {
			font-size: 40px;
			color: #333;
			font-weight: 400;
		}
		.radio-info-content .e-info .e-others {
			color: #999;
			padding-top: 5px;
			padding-bottom: 14px;
			font-weight: 100;
			font-size: 12px;
		}
		.e-author{
			font-weight: bold;
		}
		.radio-info-content .radio-info .play-all {
			bottom: 35px;
			position: absolute;
			width: 129px;
			height: 50px;
			line-height: 50px;
		}
		.radio-info-content .e-info .play-all {
			bottom: 0;
		}
		.workState{
			padding: 1px 0;
			font-size: 12px;
			font-weight: bold;
			line-height: 14px;
			vertical-align: middle;
		}
		.spanShow{
			margin-bottom: 9px;
			display: -webkit-inline-box;
		}
		.workNum{
			padding: 1px 0;
			font-size: 12px;
			font-weight: bold;
			line-height: 14px;
			vertical-align: middle;
		}
		.setting_opus{
			font-size: 19px;
			cursor: pointer;
		}
		.setting_opus:hover{
			color:cornflowerblue;
		}
	</style>
</head>
<body>
<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	<div class="container">
		<div class="index-content">
			<div class="audio-info-box">
				<div class="radio-info-content">
					<div class="e-img">
						<img src="${user.userImg}">
					</div>
					<div class="radio-info e-info">
						<div class="radio-title">
							${user.userName}
						</div>
						<div class="e-others">
							<span class="workNum spanShow">关注:&nbsp;${user.totalCare}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">粉丝:&nbsp;${user.totalFans}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">作品:&nbsp;${user.works}</span>
							<br>
							<span class="workNum spanShow">会员:&nbsp;</span>
							<c:choose>
								<c:when test="${user.memberid == 0}">
									<span class="label label-primary radius workNum spanShow">普通用户</span>
								</c:when>
								<c:when test="${user.memberid == -1}">
									<span class="label radius workNum spanShow">已过期</span>
								</c:when>
								<c:otherwise>
									<span class="label label-success radius workNum spanShow">
										<c:if test="${user.memberid == 1}">原创新星</c:if>
										<c:if test="${user.memberid == 2}">原创大咖</c:if>
									</span>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow">会员邀请码:&nbsp;</span>
									<span class="workNum spanShow">${user.inviteCode}</span>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="radius workNum spanShow">成为会员时间:&nbsp;</span>
									<span class=" workNum spanShow">
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.memberTime}"/>
									</span>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="radius workNum spanShow">会员截止时间:&nbsp;</span>
									<span class="workNum spanShow">
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.expireTime}"/>
									</span>
									<img class="member_icon" src="../../../statics/img/member_icon.png">
								</c:otherwise>
							</c:choose>
							<br>
							<span class="workNum spanShow">收益余额:&nbsp;￥${user.profit}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">累计收益:&nbsp;￥${user.totalProfit}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">剩余免费备案次数:&nbsp;${user.freeTime}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">总共磁盘空间:&nbsp;
								<c:choose>
									<c:when test="${user.totalDiskSpace > (1024*1024) }">
										${user.totalDiskSpace / (1024*1024) }G
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${user.totalDiskSpace > 1024 }">
												${user.totalDiskSpace / 1024 }Mb
											</c:when>
											<c:otherwise>
												${user.totalDiskSpace}Kb
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">剩余磁盘空间:&nbsp;
								<c:choose>
									<c:when test="${user.diskSpace > (1024*1024) }">
										${user.diskSpace / (1024*1024) }G
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${user.diskSpace > 1024 }">
												${user.diskSpace / 1024 }Mb
											</c:when>
											<c:otherwise>
												${user.diskSpace}Kb
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">交易权限:&nbsp;</span>
							<c:choose>
								<c:when test="${user.tradeFlag == 0}">
									<span class="label radius workNum spanShow">未开启</span>
								</c:when>
								<c:otherwise>
									<span class="label label-success radius workNum spanShow">已开启</span>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow">交易码:&nbsp;${user.tradeCode}</span>
								</c:otherwise>
							</c:choose>
							<br>
							<span class="radius workNum spanShow">用户状态:&nbsp;</span>
							<c:choose>
								<c:when test="${user.state == 0}">
									<span class="label label-danger radius workNum spanShow">已禁用</span>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow">禁用时间:</span>
									<span class="label label-success radius workNum spanShow">
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.stateTime}"/>
									</span>
								</c:when>
								<c:otherwise>
									<span class="label label-success radius workNum spanShow">已启用</span>
								</c:otherwise>
							</c:choose>

							<br>
							<span class="radius workNum spanShow">用户身份:&nbsp;</span>
							<c:choose>
								<c:when test="${user.agentFlag == 0 && user.channelFlag == 0}">
									<span class="label radius workNum spanShow">普通用户</span>
								</c:when>
								<c:otherwise>
									<c:if test="${user.agentFlag == 1}">
										<span class="label label-success radius workNum spanShow">代理人</span>
										<span class="workNum spanShow">代理时间:</span>
										<span class="label radius workNum spanShow">
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.agentTime}"/>
										</span>
									</c:if>

									<c:if test="${user.channelFlag == 1}">
										<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
										<span class="label label-success radius workNum spanShow">渠道用户-个人</span>
										<span class="workNum spanShow">渠道邀请码:&nbsp;</span>
										<span class="workNum spanShow">${user.channelCode}</span>
										<span class="workNum spanShow">渠道变更时间:</span>
										<span class="label radius workNum spanShow">
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.channelTime}"/>
										</span>
									</c:if>
									<c:if test="${user.channelFlag == 2}">
										<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
										<span class="label label-success radius workNum spanShow">渠道用户-机构</span>
										<span class="workNum spanShow">渠道变更时间:</span>
										<span class="label radius workNum spanShow">
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.channelTime}"/>
										</span>
									</c:if>
									<c:if test="${user.channelFlag > 0}">
										<span class="workNum spanShow">提成比例:</span>
										<span class="label radius workNum spanShow">
											${user.channelProfit}%
										</span>
									</c:if>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="authors">
							<div class="e-author">
								个性签名:&nbsp;
								<span class="remark" title="${user.remark}" >
									<c:choose>
										<c:when test="${empty user.remark}">
											未填写
										</c:when>
										<c:otherwise>
											${user.remark}
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
						
						<i class="Hui-iconfont setting_opus" aria-placeholder="点我可以配置代表作哦">&#xe61d;</i>
						<span class="radius workNum spanShow">代表作:&nbsp;</span>
						<span style="cursor: pointer;margin-bottom: 9px;display: none;" title="配置" class="label label-primary radius userOpsBtn">提交配置</span><br>
						<span class="radius workNum spanShow magnumOpus">
							<c:choose>
								<c:when test="${empty user.magnumOpus}">
									未配置
								</c:when>
								<c:otherwise>
									<table class="table table-border table-bordered opsTable">
										<c:forEach items="${magnuList}" var="item">
											<tr>
												<td><img class="img-thumbnail"  width="60px" src="${item.coverPic}"></td>
												<td>${item.name}</td>
												<td class="magnuDel" data-id="${item.id}">
													<span style="cursor: pointer" title="删除" class="label label-danger radius btn_state">删除</span>
												</td>
											</tr>
										</c:forEach>
									</table>
								</c:otherwise>
							</c:choose>
						</span>
						<div id="Huitags-demo1" style="display: none;"></div>
					</div>
				</div>

				<div class="e-article-content" style="margin-top: 226px;">
					<div class="title-cpt">
							用户资料
					</div>
					<div class="article-content">
						<span style="display: block;padding-bottom: 10px;"></span>
						<span class="radius workNum spanShow" style="color: #999;">注册类型:&nbsp;</span>
						<c:choose>
							<c:when test="${user.signType == 0}">
								<span class="label label-warning radius workNum spanShow">尚未注册</span>
							</c:when>
							<c:otherwise>
								<span class="label label-success radius workNum spanShow">
									<c:if test="${user.signType == 1}">个人</c:if>
									<c:if test="${user.signType == 2}">企业</c:if>
								</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">注册邀请码：${user.signCode}</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">职业：
									<c:choose>
										<c:when test="${empty user.professional}">
											未填写
										</c:when>
										<c:otherwise>
											${user.professional}
										</c:otherwise>
									</c:choose>
								</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">兴趣：
									<c:choose>
										<c:when test="${empty user.interest}">
											未填写
										</c:when>
										<c:otherwise>
											${user.interest}
										</c:otherwise>
									</c:choose>
								</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">性别：
									<c:if test="${user.sex == 1}">男</c:if>
									<c:if test="${user.sex == 2}">女</c:if>
								</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">手机号：${user.userPhone}</span>
								<br>
								<span class="workNum spanShow" style="color: #999;">邮箱：${user.email}</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">出生年月：
									<c:choose>
										<c:when test="${empty user.birthDay}">
											未填写
										</c:when>
										<c:otherwise>
											<fmt:formatDate pattern="yyyy-MM-dd" value="${user.birthDay}"/>
										</c:otherwise>
									</c:choose>
								</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">企业名称：
									<c:choose>
										<c:when test="${empty user.company}">
											未填写
										</c:when>
										<c:otherwise>
											${user.company}
										</c:otherwise>
									</c:choose>
								</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">注册时间：
									<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.signTime}"/>
								</span>
							</c:otherwise>
						</c:choose>
					</div>

					<!-- 实名认证资料 -->
					<div class="title-cpt">
						实名认证资料
					</div>
					<div class="article-content">
						<span style="display: block;padding-bottom: 10px;"></span>
						<span class="radius workNum spanShow" style="color: #999;">认证类型:&nbsp;</span>
						<c:choose>
							<c:when test="${user.certifiedFlag == 0}">
								<span class="label label-warning radius workNum spanShow">尚未认证</span>
							</c:when>
							<c:otherwise>
								<!-- 个人认证 -->
								<c:if test="${user.certifiedFlag == 1}">
									<span class="label label-success radius workNum spanShow">个人</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">证件类型：
										<c:if test="${user.cardType == 0}">身份证</c:if>
										<c:if test="${user.cardType == 1}">军官证</c:if>
										<c:if test="${user.cardType == 2}">护照</c:if>
										<c:if test="${user.cardType == 3}">港澳同胞同乡证</c:if>
										<c:if test="${user.cardType == 4}">台胞证</c:if>
									</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">证件号码：${user.cardNo}</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">真实姓名：${user.realName}</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">性别：
										<c:if test="${user.sex == 1}">男</c:if>
										<c:if test="${user.sex == 2}">女</c:if>
									</span>
									<br>
									<span class="workNum spanShow" style="color: #999;">邮箱：${user.email}</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">出生年月：
										<c:choose>
											<c:when test="${empty user.birthDay}">
												未填写
											</c:when>
											<c:otherwise>
												<fmt:formatDate pattern="yyyy-MM-dd" value="${user.birthDay}"/>
											</c:otherwise>
										</c:choose>
									</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">国籍：${user.country}</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">省份：${user.province}</span>
									<br>
									<span class="workNum spanShow" style="color: #999;">认证时间：
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.certifiedTime}"/>
									</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">认证审核状态：</span>
									<c:if test="${user.certifiedState == -1}">
										<span class="label label-danger radius workNum spanShow">驳回</span>
									</c:if>
									<c:if test="${user.certifiedState == 1}">
										<span class="label label-warning radius workNum spanShow">审核中</span>
									</c:if>
									<c:if test="${user.certifiedState == 2}">
										<span class="label label-success radius workNum spanShow">审核通过</span>
										<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
										<span class="workNum spanShow" style="color: #999;">审核时间：
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.certifiedUpdateTime}"/>
										</span>
										<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
										<span class="workNum spanShow" style="color: #999;">审核人员：${user.certifiedUpdate_by}</span>
									</c:if>

									<br>
									<span class="workNum spanShow" style="color: #999;">身份证正面：</span>
									<div class="preview" style="text-align: center;">
										<img style="width: 100%;" src="${user.cardFrontPic}" />
									</div>
									<br>
									<span class="workNum spanShow" style="color: #999;">身份证背面：</span>
									<div class="preview" style="text-align: center;">
										<img style="width: 100%;" src="${user.cardBackPic}" />
									</div>
									<c:if test="${not empty user.cardHandPic}">
										<br>
										<span class="workNum spanShow" style="color: #999;">手持身份证照片：</span>
										<div class="preview" style="text-align: center;">
											<img style="width: 100%;" src="${user.cardHandPic}" />
										</div>
									</c:if>
								</c:if>

								<!-- 企业认证 -->
								<c:if test="${user.certifiedFlag == 2}">
									<span class="label label-success radius workNum spanShow">企业</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">企业名称：${user.company}</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">企业统一社会信用代码：${user.socialCreditCode}</span>
									<br>
									<span class="workNum spanShow" style="color: #999;">企业法人姓名：
										<c:choose>
											<c:when test="${empty user.legalName}">
												未填写
											</c:when>
											<c:otherwise>
												${user.legalName}
											</c:otherwise>
										</c:choose>
									</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">企业邮箱：${user.email}</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">企业地址：
										<c:choose>
											<c:when test="${empty user.companyAddr}">
												未填写
											</c:when>
											<c:otherwise>
												${user.companyAddr}
											</c:otherwise>
										</c:choose>
									</span>
									<br>
									<span class="workNum spanShow" style="color: #999;">认证时间：
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.certifiedTime}"/>
									</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">认证审核状态：</span>
									<c:if test="${user.certifiedState == -1}">
										<span class="label label-danger radius workNum spanShow">驳回</span>
									</c:if>
									<c:if test="${user.certifiedState == 1}">
										<span class="label label-warning radius workNum spanShow">审核中</span>
									</c:if>
									<c:if test="${user.certifiedState == 2}">
										<span class="label label-success radius workNum spanShow">审核通过</span>
										<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
										<span class="workNum spanShow" style="color: #999;">审核时间：
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.certifiedUpdateTime}"/>
										</span>
										<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
										<span class="workNum spanShow" style="color: #999;">审核人员：${user.certifiedUpdate_by}</span>
									</c:if>
									<br>
									<span class="workNum spanShow" style="color: #999;">营业执照：</span>
									<div class="preview" style="text-align: center;">
										<img style="width: 100%;" src="${user.businessLicense}" />
									</div>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 资质认证资料 -->
					<div class="title-cpt">
						资质认证资料
					</div>
					<div class="article-content">
						<span style="display: block;padding-bottom: 10px;"></span>
						<span class="radius workNum spanShow" style="color: #999;">认证类型:&nbsp;</span>
						<c:choose>
							<c:when test="${user.aptitudeFlag == 0}">
								<span class="label label-warning radius workNum spanShow">尚未认证</span>
							</c:when>
							<c:otherwise>
								<span class="label label-success radius workNum spanShow">已认证</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">学历：${user.educational}</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">行业：${user.industry}</span>
								<br>
								<span class="workNum spanShow" style="color: #999;">业界工作经历：${user.workDes}</span>
								<br>
								<span class="workNum spanShow" style="color: #999;">获奖经历：${user.winDes}</span>
								<br>
								<span class="workNum spanShow" style="color: #999;">认证时间：
									<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.aptitudeTime}"/>
								</span>
								<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								<span class="workNum spanShow" style="color: #999;">认证审核状态：</span>
								<c:if test="${user.aptitudeState == -1}">
									<span class="label label-danger radius workNum spanShow">驳回</span>
								</c:if>
								<c:if test="${user.aptitudeState == 1}">
									<span class="label label-warning radius workNum spanShow">审核中</span>
								</c:if>
								<c:if test="${user.aptitudeState == 2}">
									<span class="label label-success radius workNum spanShow">审核通过</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">审核时间：
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${user.aptitudeUpdateTime}"/>
									</span>
									<span class="spanShow workState" style="color: #999;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workNum spanShow" style="color: #999;">审核人员：${user.aptitudeUpdate_by}</span>
								</c:if>
								<br>
								<span class="workNum spanShow" style="color: #999;">资质证明材料：</span>
								<div class="preview" style="text-align: center;">
									<c:set value="${ fn:split(user.aptitudePic, ',') }" var="arr" />
									<c:forEach items="${arr}" var="item" varStatus="status">
										<span class="workNum spanShow" style="color: #999;">材料${status.index + 1}：</span>
										<img style="width: 100%;" src="${item}" /><br>
									</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="common/foot.jsp"></jsp:include>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript">
		$(".setting_opus").click(function (e) {
            var index = layer.open({
                type: 2,
                title: '代表作设置',
                content: '/admin/work/updateOpusForm?id=' + "${user.id}",
                area: ['1300px', '750px']
            });
		})

		<%--postData("myWorks",{id:"${user.id}"},function (res) {--%>
			<%--if(res.status == "1"){--%>
				<%--var workList = res.arrayresult;--%>

				<%--if(workList.length > 0){--%>
                    <%--var html = '<table class="table table-border table-bordered">';--%>
                    <%--$.each(workList,function (index,item) {--%>
						<%--html += '<tr>' +--%>
							<%--'<td><img class="img-thumbnail"  width="60px" src="'+item.coverPic+'"></td><td>'+item.name+'</td> ' +--%>
							<%--'<td class="magnuDel" data-id="'+item.id+'">' +--%>
							<%--'<span style="cursor: pointer" title="删除" class="label label-danger radius btn_state">删除</span>' +--%>
							<%--'</td></tr>'--%>
                    <%--});--%>

                    <%--$(".Huitags-input").hide();--%>
                    <%--$(".Huitags-token").eq(0).remove();--%>
                    <%--$("#Huitags-demo1").append(html);--%>
				<%--}else{--%>
                    <%--layer.msg('该用户没有可供展示的作品',{icon:5,time:3000});--%>
				<%--}--%>


			<%--}--%>
		<%--})--%>

		$(document).on('DOMNodeInserted DOMNodeRemoved','.Huitags-editor',function (e) {
            if($("#Huitags-demo1").is(':visible')){
                var spanObj = $(".Huitags-token");
                var o_Text = '${user.magnumOpus}';
                var itemText = "";

                $.each(spanObj,function () {
                    if(o_Text == ''){ // 元数据为空 目前所有操作都是新的 直接加即可
                        if(itemText != ''){
                            if(itemText.indexOf($(this).text()) == -1){
                                itemText += "," + "《" + $(this).text() + "》";
                            }else{
                                $(this).hide();
                            }
						}else{
                            itemText = "《" + $(this).text() + "》";
						}
					}else{ // 元数据不为空 需要判断点击的项是否存在  不存在则添加
                        if(o_Text.indexOf($(this).text()) == -1){
                            itemText += "," + "《" + $(this).text() + "》";
                        }else{
                            $(this).hide();
						}
					}
                });

                $(".magnumOpus").text(o_Text + itemText)
            }
		})

		$(".userOpsBtn").click(function () {
			var text = $(".magnumOpus").text().replace("未配置","").trim();
			if(text != ''){
			    var data = {
                    magnumOpus:text,
					id:"${user.id}"
				};
				postData("updateUserOpus",data,function (res) {
					if(res.status == "1"){
                        layer.msg('配置成功',{icon:1,time:1000});
					}else{
                        layer.msg('配置失败:' + res.errmsg,{icon:5,time:3000});
					}
                })
			}else{
                layer.msg('请选择作品',{icon:7,time:2000});
            }
        })
		$(document).on('click','.magnuDel',function () {
            var id = $(this).attr('data-id');
            postData("/admin/work/updateWorkOpus",{id:id,flag:0},function (res) {
                if(res.status == "1"){

                    layer.msg('配置成功',{icon:1,time:1000},function () {
                        location.replace(location.href);
                    });
                }else{
                    layer.msg('配置失败:' + res.errmsg,{icon:5,time:3000});
                }
            });
        })
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
