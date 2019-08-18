<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>
		作品统计 - 系统统计
	</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			系统统计
			<span class="c-gray en">/</span>
			作品统计
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="row-24 clearfix" style="margin-left: -12px; margin-right: -12px;">
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
					<div class="panel">
						<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">公开作品数：</div>
						<div class="panel-body" style="padding:0 24px;">
							<div class="c-primary" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
								<c:choose>
									<c:when test="${totalPublicNum < 10}">
										${totalPublicNum}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${totalPublicNum}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日公开作品数</span>
								<span>
								<c:choose>
									<c:when test="${curPublicNum < 10}">
										${curPublicNum}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${curPublicNum}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
							</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">授权作品数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-success" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${totalAuthNum < 10}">
											${totalAuthNum}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${totalAuthNum}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日授权作品数</span>
									<span>
									<c:choose>
										<c:when test="${curAuthNum < 10}">
											${curAuthNum}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${curAuthNum}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
						</div>
					</div>
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总作品数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-danger" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${totalWorkNum < 10}">
											${totalWorkNum}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${totalWorkNum}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日作品数</span>
									<span>
									<c:choose>
										<c:when test="${curWorkNum < 10}">
											${curWorkNum}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${curWorkNum}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div class="panel">
				<div class="panel-body">
					<div class="row clearfix">
						<div class="col-xs-12">
							<div class="panel">
								<div class="panel-header">
									作品统计
									<div class="filter" style="display: initial;margin-left: 418px;">
										作品类别：
										<span class="select-box" style="width:97px;padding: 2px 5px;">
											<select class="select" name="作品类别" size="1" id="cateOption">
												<option value="0">所有类别</option>
												<c:forEach var="item" items="${cateList}">
													<option value="${item.id}">${item.name}</option>
												</c:forEach>
											</select>
										</span>
										&nbsp;关键字：
										<input type="text" class="input-text" style="width:250px" placeholder=" 输入关键字" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">

										<button type="submit" class="btn btn-success radius"  id="search_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 筛选</button>
									</div>
								</div>
								<div class="panel-body">
									<div class="Hui-admin-datetime-select searchTime">
										<span onclick="totalWorks('day',this)" class="active" data-time="day">天</span>
										<span onclick="totalWorks('month',this)" data-time="month">月</span>
										<span onclick="totalWorks('year',this)" data-time="year">年</span>
									</div>
									<div id="echarts-1" style="height: 400px"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="common/foot.jsp"></jsp:include>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="../../../statics/lib/echarts/4.1.0.rc2/echarts.min.js"></script>
	<script type="text/javascript" src="../../../statics/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript">
        function totalWorks(type, obj) {
            var cateid = $("#cateOption").val();
            var searchVal=$.trim( $("#searchVal").val() );
            searchVal=encodeURI(encodeURI(searchVal));

//            var date = $(".datetimeStart").val();
//            var dateEnd = $(".datetimeEnd").val();


            $(obj).parent().find("span").removeClass("active");
            $(obj).addClass("active");
            var xData = [];
            var legendData = [];
            var subtext = "统计过去30天数据";

            // 月
            if (type == 'month') {
                subtext = "统计过去12个月数据";
            }

            // 年
            if (type == 'year') {
                subtext = "统计过去5年数据";
            }

            var echarts1_option = {
                title: {
                    subtext: subtext
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    x: 'center',
                    y: 'top',
                    data: legendData
                },
                xAxis: {
                    data: xData,
                },
                yAxis: {
                    type: 'value',
                    nameTextStyle: {
                        // 坐标轴名称的文字样式
                    },
                    axisLine: {
                        // 坐标轴轴线相关设置
                    },
                    axisLabel: {
                        formatter: '{value} 个'
                    }
                },
                series: []
            }

            $.ajax({
                type: "post",
                async: false, //同步执行
                url: "countWorks",
				data:{time:type,cateid:cateid,searchVal:searchVal},
                dataType: "json", //返回数据形式为json
                success: function (result) {
                    if (result) {
                        //将返回的xAxisData和series对象赋值给options对象内的xAxisData和series
                        //因为xAxis是一个数组 这里需要是xAxis[i]的形式
                        echarts1_option.xAxis.data = result.xAxisData; //x轴数据
                        echarts1_option.series = result.series; //y轴数据
                        echarts1_option.legend.data = result.legend; //图例
                    }
                },
                error: function (errorMsg) {
                    layer.msg('图表请求数据失败啦',{icon:5,time:3000});
                }
            });

            var echarts1 = echarts.init(document.getElementById('echarts-1'));

            echarts1.setOption(echarts1_option,true);
        }

        $(function () {
            totalWorks('day'); // 默认天
        });
        
        $("#search_btn").click(function () {
			var time = $(".searchTime").find('.active').attr("data-time");
            totalWorks(time);
        });

        function JumpByEnter() {
            var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
            if (lKeyCode == 13) {
                var time = $(".searchTime").find('.active').attr("data-time");
                totalWorks(time);
            }
        }

	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
