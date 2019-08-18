<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<link rel="stylesheet" href="../../../statics/lib/layui/css/layui.css"  media="all">
	<title>作品列表 - 作品管理</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			作品管理
			<span class="c-gray en">/</span>
			作品列表
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<div class="panel-body">
					<div class="text-c">
						<span class="select-box" style="width: 150px;">
							<select class="select" size="1" name="demo1" id="cateOptions" >
								<option value="0">------- 全部类别 ------</option>
								<c:forEach items="${cateList}" var="item">
									<option value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</span>
						<input type="text" class="input-text" style="width:250px" placeholder=" 输入作者昵称、姓名、作品名称" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">
						<button type="submit" class="btn btn-success radius"  id="search_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
					</div>
				</div>
			</div>
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="clearfix">
						<span class="f-l">
							<a href="javascript:;" id="dataDels" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
							<%--<a href="javascript:;" id="batchExamine" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe61d;</i> 批量审核</a>--%>
						</span>
						<span class="f-r">
							<div class="proRate" style="float: left;">
								备案金额：<input type="number" id="workPrice" value="${workPrice}" min="0" style="width:81px;margin-right: 20px;" class="input-text">
							</div>
							<div class="workRate" style="float: left;">
								（用户)收益率(%)：<input type="number" id="productRate" value="${workRate}" min="1" max="100" style="width:81px;margin-right: 20px;" class="input-text">
							</div>
							<button name="" id="updateWorkRate" class="btn btn-success" title="确定配置" type="button">
								确定配置
							</button>
						</span>
					</div>
					<div class="cl pd-5 bg-1 bk-gray mt-20">
						<div id="tab_demo" class="HuiTab">
							<div class="tabBar clearfix" style="border-bottom: none;width: 32%;float: left;">
								<span>全部</span>
								<span>审核-已通过</span>
								<span>审核-已驳回</span>
								<span>未审核</span>
							</div>
						</div>
					</div>
					<div class="clearfix mt-20">
						<table id="workTable" class="table table-border table-bordered table-hover table-bg table-sort">
							<thead>
								<tr class="text-c">
									<th width="25"><input type="checkbox" name="all" value=""></th>
									<th width="30">ID</th>
									<th width="80">作品名称</th>
									<th width="80">用户昵称</th>
									<th width="50">用户头像</th>
									<th width="40">作品类型</th>
									<th width="60">喜欢人数</th>
									<th width="60">收藏人数</th>
									<th width="60">分享数</th>
									<th width="60">下载数</th>
									<th width="140">时间记录</th>
									<th width="40">推荐状态</th>
									<th width="40">审核状态</th>
									<th width="100">TSA证书</th>
									<th width="40">作品状态</th>
									<th width="50">操作</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="common/foot.jsp"></jsp:include>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="../../../statics/lib/datatables/1.10.15/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../../../statics/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="../../../statics/lib/layui/layui.js"></script>

	<script type="text/javascript">
        var CURSTATE = "";
        $("#tab_demo").Huitab();
        $("#tab_demo").find("span").each(function (i) {
            $(this).click(function () {
                if (i === 0) {
                    location.replace(location.href);
                } else if (i === 1) { //查询已审核-通过
                    CURSTATE = 1;
                }else if (i === 2) { //查询已审核-驳回
                    CURSTATE = -1;
                }else if (i === 3) { //查询未审核订单
					CURSTATE = 0;
				} else {
                    location.replace(location.href);
                }
                workTable.draw();
            })
        })

        $(document).ready(function() {

            //添加、修改异步提交地址
            var url = "workList";

            workTable=$("#workTable").DataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                processing: true,//载入数据的时候是否显示“载入中”
                paging:true,
                lengthchange:true,
                pageLength: 5,  //首次加载的数据条数
                lengthMenu:[5,10,20,50],
                ordering: false, //排序操作在服务端进行，所以可以关了。
                pagingType: "full_numbers",
                autoWidth: true, //需要在table标签设置一个父级div
                stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
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
                        param.examine = CURSTATE;
                        param.cateid = $("#cateOptions").val();
                        param.time=Date.parse(new Date());
                        return param;//自定义需要传递的参数。
                    }
                },
                columns: [
                    // 对应上面thead里面的序列
                    {"data": null},
                    {"data": 'id'},
                    {"data": 'name'},
                    {"data": 'userName'},
                    {"data": 'userImg'},
                    {"data": 'cateName'},
                    {"data": 'likedNum'},
                    {"data": 'collectNum'},
                    {"data": 'shareNum'},
                    {"data": 'downloadNum'},
                    {"data": 'createTime'},
                    {"data": 'recommendFlag'},
                    {"data": 'examine'},
                    {"data": 'tsaCert'},
                    {"data": 'state'},
                    {"data":  'state'}
                ], //操作按钮
                columnDefs: [
                    { targets: 0, defaultContent: "<input type='checkbox' name='checkList'>" },
                    { targets:2,render:function (val) {
                        if (val != null) {
                            if (val.length > 14) {
                                val = val.substring(0, 13) + "...";
                            }
                        } else {
                            val = ""
                        }
                        return '<a href="javascript:void(0)" title="查看购买列表" class="btn btn-link icon-search btn_check_buyList">'+val+'</a>'
                    }},
                    { targets:3,render:function (val) {
                        if (val != null) {
                            if (val.length > 14) {
                                val = val.substring(0, 13) + "...";
                            }
                        } else {
                            val = ""
                        }
                        return '<a href="javascript:void(0)" class="btn btn-link icon-search btn_check_user">'+val+'</a>'
                    }},
                    { targets:4,render:function (val) {
                        if (val != null) {
                            return '<img class="img-thumbnail" height="80px" width="80px" src="'+val+'">';
                        } else {
                           return "";
                        }
                    }},
                    { targets:5,render:function (val) {
						return val;
                    }},

                    { targets:10,render:function (data, type, row, meta) {
                        var html = '';
                        if(data != null && data != ''){
                            html += "创建时间：" + new Date(row.createTime).toLocaleString() + '<br>';
                        }
                        if(row.updateTime != null && row.updateTime != ''){
                            html += "审核时间：" + new Date(row.updateTime).toLocaleString() + '<br>';
                        }
                        if(row.stateTime != null && row.stateTime != ''){
                            html += "状态操作时间：" + new Date(row.stateTime).toLocaleString() + '<br>';
                        }
                        return html;
                    }},
                    { targets:-5,render:function (val) {
                        if(val == 1){
                            return '<span class="label label-success radius">已推荐</span>';
                        }else{
                            return '<span class="label radius">未推荐</span>';
                        }
                    }},
                    { targets:-4,render:function (val) {
                        if(val == 1){
                            return '<span class="label label-success radius">审核通过</span>';
                        }else if(val == -1){
                            return '<span class="label label-danger radius">审核驳回</span>';
                        }else {
                            return '<span class="label label-warning radius">待审核</span>';
                        }
                    }},
                    { targets:-3,render:function (data, type, row, meta) {
                        if(data == null){
                            return '申请失败原因：<br>' + (row.tsaReason == null ?  '参数传递异常' : row.tsaReason);
                        }else{
                            return '<span class="label label-success radius">申请成功</span>';
                        }
                    }},

                    { targets:-2,render:function (val) {
                        if(val == 1){
                            return '<span class="label label-success radius">正常</span>';
                        }else{
                            return '<span class="label label-danger radius">已删除</span>';
                        }
                    }},
                    { targets: -1,render:function (data, type, row, meta) {
                        var html='<span style="cursor: pointer" title="审核" class="label label-primary radius btn_examine">审核</span>';

                        if(row.recommendFlag == 0){
                            html += ' <span style="cursor: pointer" title="推荐" class="label label-primary radius btn_recommend">推荐</span><br>';
						}else{
                            html += ' <span style="cursor: pointer" title="取消推荐" class="label label-primary radius btn_recommend">取消推荐</span><br>';
						}
                        if(data == 1){
                            html += ' <span style="cursor: pointer" title="(删除)禁止显示" class="label label-primary radius btn_state">删除</span>';
                        }else{
                            html += ' <span style="cursor: pointer" title="(恢复)允许显示" class="label label-primary radius btn_state">显示</span>';
                        }

                        html += ' <span style="cursor: pointer"	 title="查看详情" class="label label-primary radius btn_check">查看</span>';

                        return html;
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
			//全选,设置chheckbox name='all' tbody id=tb
            $("input[name=all]").click(function () {
                var idx = $(this).attr('data-time');
                if(idx==1 || idx == undefined){
                    $(this).parent().parent().parent().parent().find('tbody tr').find("input").prop('checked',true); //标签固有属性需要用prop
                    $(this).parent().parent().parent().parent().find('tbody tr').toggleClass('selected');
                    $(this).parent().parent().parent().parent().find('tbody tr').attr('data-time',2);
                    $(this).attr('data-time',2);
                }else{
                    $(this).parent().parent().parent().parent().find('tbody tr').find("input").prop('checked',false); //标签固有属性需要用prop
                    $(this).parent().parent().parent().parent().find('tbody tr').removeClass('selected');
                    $(this).parent().parent().parent().parent().find('tbody tr').attr('data-time',1);
                    $(this).attr('data-time',1);
                }
            });
            //表格选中行效果
            $('#workTable tbody').on( 'click', 'tr', function (e) {
                $(this).toggleClass('selected');
                var idx = $(this).attr('data-time');
                if(idx==1 || idx == undefined){
                    $(this).find("input").prop('checked',true); //标签固有属性需要用prop
                    $(this).attr('data-time',2);
                }else{
                    $(this).find("input").prop('checked',false); //标签固有属性需要用prop
                    $(this).attr('data-time',1);
                }
            } );

        });

        /*用户-搜索*/
        $("#search_btn").click(function () {
            workTable.draw();
        });

        function JumpByEnter() {
            var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
            if (lKeyCode == 13) {
                workTable.draw();
            }
        }

		/*作品-查看*/
        $("#workTable").find('tbody').on( 'click', '.btn_check', function () {
            var row = workTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var index = layer.open({
                type: 2,
                title: '作品详情',
                content: 'checkWorkForm?id=' + id,
            });
            layer.full(index);
        });

        //批量删除
        $('#dataDels').click( function () {
            var length = workTable.rows('.selected').data().length;
            if(length > 0 ){
                var title = '删除后无法恢复，请慎重操作！是否确认删除？';
                layer.confirm(title,function(index){
                    var ids = [];
                    var rows = workTable.rows('.selected').data();
                    for(var i=0;i<length;i++){
                        ids.push(rows[i].id);
                    }

                    var data = {
                        ids:ids
                    }
                    postData("delWork", data, function (result) {
                        if(result.status == "1"){
                            location.replace(location.href);
                        }else{
                            layer.msg('设置失败:' + result.errmsg,{icon:5,time:3000});
                        }
                    });
                });
            }else{
                layer.msg("请选择您要修改的数据",{icon:7,time:2000})
            }
        })

        //批量审核
        $('#batchExamine').click( function () {
            layer.msg("正在申请TSA账号，审核功能暂停使用！",{icon:7,time:2000})
            return;
            var length = workTable.rows('.selected').data().length;
            if(length > 0){
                var rows = workTable.rows('.selected').data();

                var works = [];
                for(var i=0;i<length;i++){

                    var examine = rows[i].examine;
                    var id = rows[i].id;
                    var name = rows[i].name;

                    if(examine == 1){
                        layer.msg("请勿选择已审核通过的作品！",{icon:7,time:2000})
						return;
					}
                    var json = {};
                    json.examine = examine;
                    json.id = id;
                    json.name = name;
                    works.push(json);
                }


                var index = layer.open({
                    type: 2,
                    title: '批量审核',
                    content: 'batchWorkForm?works=' + encodeURI(encodeURI(JSON.stringify(works))),
                    area: ['800px','750px']
                });

            }else{
                layer.msg("请选择您要修改的数据",{icon:7,time:2000})
            }
        })

        /*作品-审核*/
        $("#workTable").find('tbody').on( 'click', '.btn_examine', function () {
//            layer.msg("正在申请TSA账号，审核功能暂停使用！",{icon:7,time:2000})
//			return;
            var row = workTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            layer.confirm('审核该作品？', {
                    btn: ['通过','不通过','取消'],
                    shade: false,
                    closeBtn: 0
                },
                function(){
                    var data={
                        id:id,
                        examine:1
                    }
                    var index1 = layer.msg('正在下发证书，请稍后...',{icon:16,shade: 0.01,time:false});
                    postData("getTSA",{id:id},function (res) {
                        layer.close(index1);
                        if(res.status == "1"){
                            layer.msg(res.errmsg,{icon:1,time:500},function () {
                                var index2 = layer.msg(" 审核处理中...",{icon:16,shade: 0.01,time:false})
                                postData("workExamine", data, function (result) {
                                    layer.close(index2);
                                    if(result.status == "1"){
                                        layer.msg('审核成功！',{icon:1,time:1000},function () {
                                            location.replace(location.href);
                                        });
                                    }else{
                                        layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
                                    }
                                });
                            });

                        }else{
                            layer.msg('证书下发失败:' + res.errmsg,{icon:5,time:3000});
                        }
                    })
                },
                function(){
                    var data={
                        id:id,
                        examine:-1
                    }
                    postData("workExamine", data, function (result) {
                        if(result.status == "1"){
                            location.replace(location.href);
                        }else{
                            layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
                        }
                    });
                });
        });

		/*作品-推荐*/
        $("#workTable").find('tbody').on( 'click', '.btn_recommend', function () {
            var row = workTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var title = '确定推荐该作品？';
            var recommendFlag = row.recommendFlag;
            if(recommendFlag == 1){
                title = '确定取消推荐该作品？';
                recommendFlag = 0;
			}else{
                recommendFlag = 1;
			}

            layer.confirm(title,function(index){
                var data={
                    id:id,
                    recommendFlag:recommendFlag
                }
                postData("updateRecommend", data, function (result) {
                    if(result.status == "1"){
                        location.replace(location.href);
                    }else{
                        layer.msg('推荐失败:' + result.errmsg,{icon:5,time:3000});
                    }
                });
            });
        });

		/*作品-状态*/
        $("#workTable").find('tbody').on( 'click', '.btn_state', function () {
            var row = workTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var title = '确定删除(隐藏)该作品？';
            var state = row.state;
            if(state == 0){
                title = '确定恢复(显示)该作品？';
                state = 1;
            }else{
                state = 0;
            }

            layer.confirm(title,function(index){
                var data={
                    id:id,
                    state:state
                }
                postData("updateState", data, function (result) {
                    if(result.status == "1"){
                        location.replace(location.href);
                    }else{
                        layer.msg('设置失败:' + result.errmsg,{icon:5,time:3000});
                    }
                });
            });
        });

        $('#workTable tbody').on('click', '.btn_check_user', function () {
            var row = workTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.userid;
            var url = "/admin/user/userListForm?" + "id=" + id;
            var index = layer.open({
                type: 2,
                title: '用户信息',
                content: url
            });
            layer.full(index);
        });

        $('#workTable tbody').on('click', '.btn_check_buyList', function () {
            var row = workTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var url = "/admin/order/buyListForm?" + "id=" + id;
            creatIframe(url, '购买列表');
        });

        $("#updateWorkRate").click(function () {
            var workPrice = $("#workPrice").val();
            var productRate = $("#productRate").val();
            layer.confirm("确定配置吗？", function (index) {
                var data = {
                    workPrice: workPrice,
                    productRate:productRate
                }

                postData("updateWorkRate", data, function (result) {
                    if (result.status == "1") {
                        location.replace(location.href);
                    } else {
                        layer.msg("更新失败:" + result.errmsg, {icon: 5, time: 1500}) //icon:  1:成功  2：失败 3:疑问 4：锁 5：红色哭脸 6：绿色笑脸 7以上：橙色感叹号
                    }
                });
            });
        })

		$("#cateOptions").change(function () {
			workTable.draw();
		})
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
