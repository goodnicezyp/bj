<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>
		<c:if test="${type == 0}">登录人数统计</c:if>
		<c:if test="${type == 1}">注册用户统计</c:if>
		<c:if test="${type == 2}">会员人数统计</c:if>
		<c:if test="${type == 3}">代理人人数统计</c:if>
		- 系统统计
	</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			系统统计
			<span class="c-gray en">/</span>
			<c:if test="${type == 0}">登录人数统计</c:if>
			<c:if test="${type == 1}">注册用户统计</c:if>
			<c:if test="${type == 2}">会员人数统计</c:if>
			<c:if test="${type == 3}">代理人人数统计</c:if>
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="row-24 clearfix" style="margin-left: -12px; margin-right: -12px;">
				<c:if test="${type != 2}">
					<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总登录人数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-primary" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${totalPageView < 10}">
											${totalPageView}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${totalPageView}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日登录人数</span>
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
					<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总注册人数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-success" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${totalSigned < 10}">
											${totalSigned}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${totalSigned}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日注册人数</span>
									<span>
									<c:choose>
										<c:when test="${curSigned < 10}">
											${curSigned}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${curSigned}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总代理人数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-success" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${totalChanel < 10}">
											${totalChanel}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${totalChanel}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日代理人数</span>
									<span>

										<c:choose>
											<c:when test="${curChannel < 10}">
												${curChannel}
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${curChannel}" pattern="#,#00"/>
											</c:otherwise>
										</c:choose>
									</span>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${type == 2}">
					<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">原创新星总数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-primary" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${totalV1Num < 10}">
											${totalV1Num}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${totalV1Num}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日原创新星总数</span>
									<span>
									<c:choose>
										<c:when test="${curV1Num < 10}">
											${curV1Num}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${curV1Num}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">原创大咖总数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-success" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${totalV2Num < 10}">
											${totalV2Num}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${totalV2Num}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日原创大咖总数</span>
									<span>
									<c:choose>
										<c:when test="${curV2Num < 10}">
											${curV2Num}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${curV2Num}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">总会员数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-danger" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${totalMemberNum < 10}">
											${totalMemberNum}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${totalMemberNum}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日新增会员</span>
									<span>
									<c:choose>
										<c:when test="${curTotalMemberNum < 10}">
											${curTotalMemberNum}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${curTotalMemberNum}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<div class="panel">
				<div class="panel-body">
					<div class="row clearfix">
						<div class="col-xs-12">
							<div class="panel">
								<div class="panel-header">
									<c:if test="${type == 0}">登录人数统计</c:if>
									<c:if test="${type == 1}">注册用户统计</c:if>
									<c:if test="${type == 2}">会员人数统计</c:if>
									<c:if test="${type == 3}">代理人统计</c:if>
								</div>
								<div class="panel-body">
									<div class="Hui-admin-datetime-select">
										<span onclick="loginUser('day',this)" class="active">天</span>
										<span onclick="loginUser('month',this)">月</span>
										<span onclick="loginUser('year',this)">年</span>
									</div>
									<div id="echarts-1" style="height: 400px"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${type == 2}">
				<div class="panel">
					<div class="panel-body">
						<div class="row clearfix">
							<div class="col-xs-12">
								<div class="panel">
									<div class="panel-header">
										会员列表
									</div>
									<div class="panel-body">
										<div class="text-c">
											<span class="select-box" style="width: 150px;">
												<select class="select" size="1" name="demo1" id="cateOptions" >
													<option value="0">------- 全部会员 ------</option>
													<option value="1">------- 原创新星 ------</option>
													<option value="2">------- 原创大咖 ------</option>
												</select>
											</span>
											<input type="text" class="input-text" style="width:250px" placeholder=" 输入用户昵称、姓名" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">
											<button type="submit" class="btn btn-success radius"  id="userSearch_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
										</div>
									</div>
									<div class="panel mt-20">
										<div class="panel-body">
											<div class="clearfix mt-20">
												<table id="userTable" class="table table-border table-bordered table-hover table-bg table-sort">
													<thead>
													<tr class="text-c">
														<th width="15">ID</th>
														<th width="80">用户昵称</th>
														<th width="20">用户头像</th>
														<th width="30">会员等级</th>
													</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>

		</article>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="common/foot.jsp"></jsp:include>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="../../../statics/lib/echarts/4.1.0.rc2/echarts.min.js"></script>
	<script type="text/javascript" src="../../../statics/lib/datatables/1.10.15/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../../../statics/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
        function loginUser(type, obj) {
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
                        formatter: '{value} 人'
                    }
                },
                series: []
            }

            $.ajax({
                type: "post",
                async: false, //同步执行
                url: "countUsers",
				data:{time:type,type:"${type}"},
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

            echarts1.setOption(echarts1_option);
        }

        $(function () {
            loginUser('day'); // 默认天
        });

        if("${type}" == 2){
            $(document).ready(function() {
                //添加、修改异步提交地址
                var url = "/admin/user/userList";

                userTable=$("#userTable").DataTable({
                    serverSide: true,//分页，取数据等等的都放到服务端去
                    processing: true,//载入数据的时候是否显示“载入中”
                    paging:true,
                    lengthchange:true,
                    pageLength: 5,  //首次加载的数据条数
                    lengthMenu:[5,10,20,50],
                    ordering: false, //排序操作在服务端进行，所以可以关了。
                    pagingType: "full_numbers",
                    autoWidth: true, //需要在table标签设置一个父级div
                    stateSave: false,//保持翻页状态，和comTable.fnDraw(false);结合使用
                    searching: false,//禁用datatables搜索
                    deferRender:false, //控制Datatables的延迟渲染，可以提高初始化的速度
                    destroy:true, //允许表格重新配置参数
                    info:true, //页脚信息
                    ajax: {
                        type: "GET",
                        url: url,
                        data: function (d) {
                            var param = {};
                            param.draw = d.draw;
                            param.start = d.start;
                            param.length = d.length;
                            var searchVal=$.trim( $("#searchVal").val() );
                            searchVal=encodeURI(encodeURI(searchVal));
                            param.searchVal=searchVal;
                            param.memberid=$("#cateOptions").val();
                            param.time=Date.parse(new Date());
                            return param;//自定义需要传递的参数。
                        }
                    },
                    columns: [
                        // 对应上面thead里面的序列
                        {"data": 'id'},
                        {"data": 'userName'},
                        {"data": 'userImg'},
                        {"data": 'memberid'}
                    ], //操作按钮
                    columnDefs: [
                        { targets:1,render:function (val) {
                            if (val != null) {
                                if (val.length > 14) {
                                    val = val.substring(0, 13) + "...";
                                }
                            } else {
                                val = ""
                            }
                            return '<a href="javascript:void(0)" title="查看用户详情" class="btn btn-link icon-search btn_check_user">'+val+'</a>'
                        }},
                        { targets:2,render:function (val) {
                            if(val==null || val===""){
                                return ''
                            }else{
                                return '<img class="img-thumbnail" height="80px" width="80px" src="'+val+'">'
                            }
                        }},
                        { targets:3,render:function (val) {
                            if (val === 0) {
                                return "<span class='label radius'>普通用户</span>";
                            } else if (val === 1) {
                                return "<span class='label label-primary radius'>原创新星会员</span>";
                            }else{
                                return "<span class='label label-success radius'>原创大咖会员</span>";
                            }
                        }},

                    ],
                    language: {
                        lengthMenu: "每页条数： _MENU_",
                        processing: "",
                        paginate: {
                            previous: "<",
                            next: ">",
                            first: "<<",
                            last: ">>"
                        },
                        zeroRecords: "没有检索到数据",
                        info: "从 _START_ 到 _END_ 条/共 _TOTAL_ 条数据",
                        infoEmpty: "没有数据",
                        infoFiltered: "(从 _MAX_ 条数据中检索)"
                    },
                });
            });

			/*用户-搜索*/
            $("#userSearch_btn").click(function () {
                userTable.draw();
            });

            function JumpByEnter() {
                var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
                if (lKeyCode == 13) {
                    userTable.draw();
                }
            }

			/*用户-查看*/
            $("#userTable").find('tbody').on( 'click', '.btn_check', function () {
                var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
                var id = row.id;
                var index = layer.open({
                    type: 2,
                    title: '用户信息',
                    content: 'checkUserForm?id=' + id,
                });
                layer.full(index);
            });
		}
		
		$("#cateOptions").change(function () {
			var memberid = $("#cateOptions").val();
            userTable.draw();
        })

        $('#userTable tbody').on('click', '.btn_check_user', function () {
            var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var url = "/admin/user/userListForm?" + "id=" + id;
            var index = layer.open({
                type: 2,
                title: '用户信息',
                content: url
            });
            layer.full(index);
        });
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
