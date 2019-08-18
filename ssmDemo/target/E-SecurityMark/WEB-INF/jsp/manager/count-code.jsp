<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>
		 邀请码统计 - 系统统计
	</title>
	<style>
		.aui-flex {
			display: -webkit-box;
			display: -webkit-flex;
			display: flex;
			-webkit-box-align: center;
			-webkit-align-items: center;
			align-items: center;
			padding: 15px;
			position: relative;
		}

		.b-line {
			position: relative;
		}
		.aui-flex-car-img {
			width: 70px;
			margin-right: 0.8rem;
		}
		.aui-flex-car-img img {
			width: 70px;
			display: block;
			border: none;
		}
		.aui-flex-box {
			-webkit-box-flex: 1;
			-webkit-flex: 1;
			flex: 1;
			min-width: 0;
			font-size: 14px;
			color: #333;
		}
		.aui-flex-box p {
			color: #999999;
			font-size: 0.8rem;
			margin-bottom: 3px;
		}
		.aui-flex-top {
			background: #fc403d;
			border-radius: 3px;
			width: 22px;
			height: 22px;
			text-align: center;
			line-height: 22px;
			-webkit-transform: skew(-15deg);
		}
		.aui-flex-top-two {
			background: #ff5301;
		}
		.aui-flex-top-three {
			background: #ffcb02;
		}
		.aui-flex-top-four {
			background: #c8c8c8;
		}

		.aui-flex-top span {
			font-size: 0.9rem;
			color: #fff;
			font-weight: bold;
		}
		h2 {
			display: block;
			font-size: 1.5em;
			-webkit-margin-before: 0.83em;
			-webkit-margin-after: 0.83em;
			-webkit-margin-start: 0px;
			-webkit-margin-end: 0px;
			font-weight: bold;
		}
		.tab-panel-item.tab-active {
			position: relative;
			-webkit-transition: -webkit-transform .15s;
			transition: -webkit-transform .15s;
			transition: transform .15s;
			transition: transform .15s, -webkit-transform .15s;
			-webkit-transform: translateX(0);
			transform: translateX(0);
		}
		.noData{
			text-align: center;
		}

		.tab-panel-item {
			width: 100%;
			position: absolute;
			top: 0;
			-webkit-transform: translateX(-100%);
			transform: translateX(-100%);
		}
	</style>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			系统统计
			<span class="c-gray en">/</span>
			邀请码统计
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="row-24 clearfix" style="margin-left: -12px; margin-right: -12px;">
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
					<div class="panel">
						<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">(个人邀请码)邀请总数：</div>
						<div class="panel-body" style="padding:0 24px;">
							<div class="c-primary" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
								<c:choose>
									<c:when test="${iuseridCount < 10}">
										${iuseridCount}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${iuseridCount}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日邀请总数</span>
								<span>
								<c:choose>
									<c:when test="${iuseridCurCount < 10}">
										${iuseridCurCount}
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${iuseridCurCount}" pattern="#,#00"/>
									</c:otherwise>
								</c:choose>
							</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">(会员邀请码)邀请总数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-success" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${parentidCount < 10}">
											${parentidCount}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${parentidCount}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日邀请总数</span>
									<span>
									<c:choose>
										<c:when test="${parentidCurCount < 10}">
											${parentidCurCount}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${parentidCurCount}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
						</div>
					</div>
				<div class="col-24-xs-24 col-24-sm-12 col-24-md-12 col-24-lg-12 col-24-xl-8" style="padding-left: 12px; padding-right: 12px; margin-bottom: 24px;">
						<div class="panel">
							<div class="panel-header" style="padding:15px 24px;font-weight: 400;color:#999;">(渠道邀请码)邀请总数：</div>
							<div class="panel-body" style="padding:0 24px;">
								<div class="c-danger" style="font-size: 30px;line-height: 38px;padding-bottom: 24px;">
									<c:choose>
										<c:when test="${channelCount < 10}">
											${channelCount}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${channelCount}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="f-14" style="padding: 10px 0;border-top:solid 1px #eee"><span class="c-999">今日邀请总数</span>
									<span>
									<c:choose>
										<c:when test="${channelCurCount < 10}">
											${channelCurCount}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${channelCurCount}" pattern="#,#00"/>
										</c:otherwise>
									</c:choose>
								</span>
								</div>
							</div>
						</div>
					</div>
			</div>
			<!-- 排行榜 -->
			<div class="panel">
				<div class="panel-body">
					<div class="row clearfix">
						<div class="col-xs-4">
							<div class="panel">
								<div class="panel-header">
									邀请排行榜
									<div class="filter" style="display: initial;margin-left: 100px;">
										排行：
										<span class="select-box" style="width:150px;padding: 2px 5px;">
											<select class="select" name="邀请排行" size="1" id="bandOption" onchange="countRank($('#bandOption').val())">
												<option value="1">个人邀请码排行</option>
												<option value="2">会员邀请码排行</option>
												<option value="3">渠道邀请码排行</option>
											</select>
										</span>
									</div>
								</div>
								<div class="panel-body">
									<div class="tab-panel-item tab-active" id="rankD">
										<div style="display: none" class="noData">
											<span >暂无数据排行！</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-8">
							<div class="panel">
								<div class="panel-header">
									用户列表
								</div>
								<div class="panel-body">
									<div class="text-c">
										邀请类别：
										<span class="select-box" style="width:150px;padding: 2px 5px;">
											<select class="select" name="" size="1" id="typeOption" onchange="countInvite($('#typeOption').val())">
												<option value="0">所有邀请码</option>
												<option value="1">个人邀请码</option>
												<option value="2">会员邀请码</option>
												<option value="3">渠道邀请码</option>
											</select>
										</span>
										<input type="text" class="input-text" style="width:250px" placeholder=" 输入用户昵称、姓名" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">
										<button type="submit" class="btn btn-success radius"  id="userSearch_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
									</div>
								</div>
								<div class="panel-body">
									<div class="clearfix mt-20">
										<table id="userTable" class="table table-border table-bordered table-hover table-bg table-sort">
											<thead>
											<tr class="text-c">
												<th width="15">ID</th>
												<th width="80">用户昵称</th>
												<th width="20">用户头像</th>
												<th width="80">实名</th>
												<th width="80">实名类型</th>
												<th width="80">会员类型</th>
												<th width="100">用户身份</th>
												<th width="30">操作</th>
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
		</article>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="common/foot.jsp"></jsp:include>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="../../../statics/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="../../../statics/lib/datatables/1.10.15/jquery.dataTables.min.js"></script>
	<script type="text/javascript">

        $(function () {
            countRank(1);
        });

        $("#search_btn").click(function () {
			var time = $(".searchTime").find('.active').attr("data-time");
            totalWorks(time);
        });


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
                        param.type=$("#typeOption").val();
                        param.time=Date.parse(new Date());
                        return param;//自定义需要传递的参数。
                    }
                },
                columns: [
                    // 对应上面thead里面的序列
                    {"data": 'id'},
                    {"data": 'userName'},
                    {"data": 'userImg'},
                    {"data": 'realName'},
                    {"data": 'certifiedFlag'},
                    {"data": 'memberid'},
                    {"data": 'agentFlag'},
                    {"data": null}
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
					{ targets:3,render:function (data, type, row, meta) {
							if(data==null || data===""){
								return row.company;
							}else{
								return data;
							}
						}},
					{ targets:-4,render:function (val) {
							if (val == 0 || val == -1) {
								return "<span class='label label-danger radius'>尚未认证</span>";
							} else if (val == 1) {
								return "<span class='label label-primary radius'>个人认证</span>";
							}else{
								return "<span class='label label-success radius'>企业认证</span>";
							}
						}},
					{ targets:-3,render:function (val) {
							if (val === 0) {
								return "<span class='label radius'>普通用户</span>";
							} else if (val === 1) {
								return "<span class='label label-primary radius'>原创新星会员</span>";
							}else{
								return "<span class='label label-success radius'>原创大咖会员</span>";
							}
						}},
					{
						targets: -2, render: function (data, type, row, meta) {
							if (row.channelFlag == 0) {
								return "<span class='label radius'>普通用户</span>";
							}else{
								var html = '';
								if(row.channelFlag == 1){
									html += "<br><span class='label label-success radius'>渠道用户-个人</span>";
								}
								if(row.channelFlag == 2){
									html += "<br><span class='label label-success radius'>渠道用户-机构</span>";
								}
								return html;
							}
						}},
                    { targets:-1,render:function (val) {
                        return ' <span style="cursor: pointer"	 title="查看邀请列表" class="label label-primary radius btn_check">查看邀请列表</span>';
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
            //表格选中行效果
            $('#userTable tbody').on( 'click', 'tr', function (e) {
                $(this).toggleClass('selected');
                var idx = $(this).attr('data-time');
                if(idx==1 || idx == undefined){
                    $(this).find("input").prop('checked',true); //标签固有属性需要用prop
                    $(this).attr('data-time',2);
                }else{
                    $(this).find("input").prop('checked',false); //标签固有属性需要用prop
                    $(this).attr('data-time',1);
                }
            });
        });


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

		$('#userTable tbody').on('click', '.btn_check', function () {
			var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
			var id = row.id;
			var url = "/admin/user/userInviteForm?" + "id=" + id;
			var index = layer.open({
				type: 2,
				title: '用户邀请列表',
				content: url
			});
			layer.full(index);
		});

		function countInvite(type) {
			userTable.draw();
		}

		function countRank(type) {
			postData("codeRank",{type:type},function (result) {
                $(".tab-active a").remove();
                if(result.arrayresult.length > 0){
                    $(".noData").hide();
                    $.each(result.arrayresult,function(i,val){
                        var html = '<a href="javascript:;" class="aui-flex b-line" style="text-decoration: none;"> ' +
                            '<div class="aui-flex-car-img"> <img src="' + val.userImg + '" alt=""> </div> <div class="aui-flex-box"> ' +
                            '<p>' + val.userName + '</p> <p>' + val.realName + '</p> <p>邀请数 ' + val.countNum + '</p> </div> ' +
                            '<div class="aui-flex-top';
                        if(i > 0){
                            if(i == 1){
                                html += ' aui-flex-top-two';
                            }else if(i == 2){
                                html += ' aui-flex-top-three';
                            }else{
                                html += ' aui-flex-top-four';
                            }
                        }
                        html += ' "><span>'+ (i + 1) +'</span> </div> </a>';

                        $(".tab-active").append(html)
                    })
				}else{
                    $(".noData").show();
				}

            })
        }
		/*订单-搜索*/
		$("#userSearch_btn").click(function () {
			userTable.draw();
		});

		function JumpByEnter() {
			var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
			if (lKeyCode == 13) {
				userTable.draw();
			}
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
