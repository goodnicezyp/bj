<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>作品展示 - 作品管理</title>
	<style>
		html, body {
			width: 100%;
			height: 100%;
			background-color: #fafafa;
			background-image: url(../../../statics/img/bgImg.png);
			background-repeat: repeat-x;
		}
		.workState{
			padding: 1px 0;
			font-size: 12px;
			font-weight: bold;
			line-height: 14px;
			vertical-align: middle;
		}
		.workNum{
			padding: 1px 0;
			font-size: 12px;
			font-weight: bold;
			line-height: 14px;
			vertical-align: middle;
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
		.title-cpt {
			clear: both;
			padding-bottom: 40px;
			background-repeat: no-repeat;
			padding-left: 28px;
			background-position: 0 4px;
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
			width: 173px;
			height: 173px;
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
			width: 867px;
			height: 406px;
			margin-top: -184px;
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
		.btn-play {
			background-image: url(../../../statics/img/radio-play.png);
		}
		.btn-pause {
			background-image: url(../../../statics/img/radio-pause.png);
		}
		.btn-pause, .btn-play {
			background-repeat: no-repeat;
			background-size: 30px;
			background-position: 12px center;
		}
		.play-status-btn {
			color: #57ad68;
			cursor: pointer;
			-ms-border-radius: 25px;
			-webkit-border-radius: 25px;
			-moz-border-radius: 25px;
			border-radius: 25px;
			font-weight: 200;
			border: 1px solid #57ad68;
			padding-left: 53px;
		}
		.btn-pause, .btn-play {
			background-repeat: no-repeat;
			background-size: 30px;
			background-position: 12px center;
		}
		.play-status-btn {
			color: #57ad68;
			cursor: pointer;
			-ms-border-radius: 25px;
			-webkit-border-radius: 25px;
			-moz-border-radius: 25px;
			border-radius: 25px;
			font-weight: 200;
			border: 1px solid #57ad68;
			padding-left: 53px;
		}
		.spanShow{
			 margin-bottom: 9px;
			 display: -webkit-inline-box;
		 }
	</style>
</head>
<body>
<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	<div class="container">
		<div class="index-content">
			<c:if test="${work.type == 2}"><audio id="audiosrc"  autoplay="autoplay" src="${work.url}">您的浏览器不支持 audio 标签。</audio> </c:if>
			<div class="audio-info-box">
				<div class="radio-info-content">
					<div class="e-img">
						<img src="${work.userImg}">
					</div>
					<div class="radio-info e-info">
						<div class="radio-title">
							${work.name}
							<br><span style="font-size: 15px;font-weight: bold;color: #999;">
								作者：
								<c:if test="${not empty work.realName}">${work.realName}</c:if>

								<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
								微信昵称：<a href="javascript:(0)" class="btn_check_user btn btn-link icon-search" style="padding: 3px 0;">${work.userName}</a>
							</span>
						</div>
						<div class="e-others">
							<span class="workNum spanShow">喜欢:&nbsp;${work.likedNum}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">收藏:&nbsp;${work.collectNum}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">分享:&nbsp;${work.shareNum}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">下载:&nbsp;${work.downloadNum}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">评论:&nbsp;${work.replyNum}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workNum spanShow">购买:&nbsp;${work.buyNum}</span>
							<br>
							<span class="workState spanShow">公开:</span>&nbsp;
							<c:choose>
								<c:when test="${work.disclosure == 0}">
									<span class="label label-warning radius spanShow">否</span>
								</c:when>
								<c:otherwise>
									<span class="label label-success radius spanShow">是</span>&nbsp;
									<span class="workState spanShow">公开时间:</span>
									<span class="label radius spanShow">
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${work.disclosureTime}"/>
									</span>
								</c:otherwise>
							</c:choose>

							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workState spanShow">授权:</span>&nbsp;
							<c:choose>
								<c:when test="${work.authorization == 0}">
									<span class="label label-warning radius spanShow">否</span>
								</c:when>
								<c:otherwise>
									<span class="label label-success radius spanShow">是</span>&nbsp;
									<span class="workState spanShow">授权时间:</span>
									<span class="label radius spanShow">
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${work.authorizationTime}"/>
									</span>
								</c:otherwise>
							</c:choose>

							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workState spanShow">类型:</span>&nbsp;
							<c:choose>
								<c:when test="${work.genre == 0}">
									<span class="label label-primary radius spanShow">个人作品</span>
								</c:when>
								<c:otherwise>
									<span class="label label-primary radius spanShow">合作作品</span>
								</c:otherwise>
							</c:choose>

							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workState spanShow">作品分类:</span>&nbsp;
							<span class="label label-primary radius spanShow">${work.cateName}</span>

							<br>
							<span class="workState spanShow">售价:</span>&nbsp;
							<span class="label label-primary radius spanShow">￥${work.price}</span>
							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workState spanShow">课程包:</span>&nbsp;
							<c:choose>
								<c:when test="${work.eduPackage == 0}">
									<span class="label label-primary radius spanShow">否</span>
								</c:when>
								<c:otherwise>
									<span class="label label-warning radius spanShow">是</span>
								</c:otherwise>
							</c:choose>

							<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span class="workState spanShow">支付状态:</span>&nbsp;
							<c:choose>
								<c:when test="${work.payState != 1}">
									<span class="label label-warning radius spanShow">未支付</span>
								</c:when>
								<c:otherwise>
									<span class="label label-warning radius spanShow">已支付</span>
									<span class="workState spanShow">支付时间:</span>
									<span class="label radius spanShow">
										<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${work.payTime}"/>
									</span>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workState spanShow">支付订单号:</span>
									<span class="label radius spanShow">
										${work.orderNo}
									</span>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${not empty work.serialNumber}">
									<br>
									<span class="workState spanShow">TSA申请序列号:</span>&nbsp;
									<span class="label label-primary radius spanShow">${work.serialNumber}</span>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="workState spanShow">TSA标准时间:</span>&nbsp;
									<span class="label label-primary radius spanShow">${work.tsaTime}</span>
									<%--<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>--%>
									<%--<span class="workState spanShow">TSA标准时间:</span>&nbsp;--%>
									<%--<span class="label label-primary radius spanShow">${work.tsaTime}</span>--%>
								</c:when>
							</c:choose>

							<br>
							<span class="workState">著作权:</span>
							<c:forEach items="${copyrightArr}" var="item">
								<br><span class="workState" style="margin-left:30px;">
									类型：
									<c:choose>
										<c:when test="${item.type == 0}">
											个人
											<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
											姓名：${item.name}
										</c:when>
										<c:otherwise>
											企业
											<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
											企业名称：${item.name}
										</c:otherwise>
									</c:choose>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									证件类型：
										<c:if test="${item.cardType == 0}">身份证</c:if>
										<c:if test="${item.cardType == 1}">军官证</c:if>
										<c:if test="${item.cardType == 2}">护照</c:if>
										<c:if test="${item.cardType == 3}">港澳同胞同乡证</c:if>
										<c:if test="${item.cardType == 4}">台胞证</c:if>
										<c:if test="${item.cardType == 5}">企业统一社会信用代码</c:if>
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									证件号：${item.idCard}
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									国籍：${item.country}
									<span class="spanShow workState">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									地区：${item.province}
								</span>
							</c:forEach>
						</div>
						<div class="authors">
							<div class="e-author">
								作品说明:&nbsp;
								<span class="remark" title="${work.remark}" >
									<c:choose>
										<c:when test="${work.remark.length() > 210}">
											${work.remark.substring(0,208)}...
										</c:when>
										<c:otherwise>
											${work.remark}
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
						<div class="play-all" <c:if test="${work.type != 2}">style="display: none;" </c:if> >
							<div class="btn-play play-status-btn" style="display: none;">播放Play</div>
							<div class="btn-pause play-status-btn" style="">暂停Pause</div>
						</div>
					</div>
				</div>

				<div class="e-article-content">
					<div class="title-cpt" <c:if test="${work.type == 2}">style="display: none;"</c:if>>
						<c:if test="${work.type == 0}">
							图片
						</c:if>
						<c:if test="${work.type == 1}">
							视频
						</c:if>
						<c:if test="${work.type == 3}">
							原文
						</c:if>
					</div>
					<div class="article-content" <c:if test="${work.type == 2}">style="display: none;"</c:if>>
						<span style="display: block;padding-bottom: 10px;"></span>
						<c:if test="${work.type == 0}">
							<div class="preview" style="text-align: center;">
								<img style="width: 100%;" src="${work.url}" />
							</div>
						</c:if>
						<c:if test="${work.type == 1}">
							<div class="preview" style="text-align: center;">
								<video controls="" autoplay="" name="media" style="max-width: 705px;">
									<source src="${work.url}" type="video/mp4">
								</video>
							</div>
						</c:if>
						<c:if test="${work.type == 3}">
							<c:choose>
								<c:when test="${fn:contains(work.url,'pdf' )}">
									<iframe src='${work.url}' width='100%' height='1260px' frameborder='1'>
									</iframe>
								</c:when>
								<c:otherwise>
									<iframe src='https://view.officeapps.live.com/op/view.aspx?src=${work.url}' width='100%' height='1260px' frameborder='1'>
									</iframe>
								</c:otherwise>
							</c:choose>
						</c:if>
					</div>
					<div class="title-cpt">
						作品证书
					</div>
					<div class="article-content" style="margin-bottom: 50px;">
						<c:choose>
							<c:when test="${empty work.workCert}">
								暂未获取！
							</c:when>
							<c:otherwise>
								<iframe src='${work.workCert}' width='100%' height='1260px' frameborder='1'>
								</iframe>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="title-cpt">
						TSA证书
					</div>
					<div class="article-content">
						<c:choose>
							<c:when test="${empty work.tsaCert}">
								暂未获取！
							</c:when>
							<c:otherwise>
								<iframe src='${work.tsaCert}' width='100%' height='1260px' frameborder='1'>
								</iframe>
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
		$(".play-all").click(function (e) {
            var audio = $("#audiosrc")[0];
			if($('.btn-play').is(':visible')){ // 暂停
                $(".btn-play").hide();
                $(".btn-pause").show();
                audio.play();
            }else{ // 播放
                $(".btn-pause").hide();
                $(".btn-play").show();
                audio.pause();
            }
        })

		$('.btn_check_user').click(function () {
			var id = "${work.userid}";
			var url = "/admin/user/userListForm?" + "id=" + id;
			parent.creatIframe(url, '用户信息');
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
