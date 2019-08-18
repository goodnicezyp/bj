<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>作品列表 - 作品管理</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			收益管理
			<span class="c-gray en">/</span>
			提现管理
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<div class="panel-body">
					<div class="text-c">
						<input type="text" class="input-text" style="width:250px" placeholder=" 输入用户昵称、姓名、提取单号" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">
						<button type="submit" class="btn btn-success radius"  id="search_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
					</div>
				</div>
			</div>
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="cl pd-5 bg-1 bk-gray mt-20">
						<div id="tab_demo" class="HuiTab">
							<div class="tabBar clearfix" style="border-bottom: none">
								<span>全部</span>
								<span>申请中</span>
								<span>提取成功</span>
							</div>
						</div>
					</div>
					<div class="clearfix mt-20">
						<table id="withDrawTable" class="table table-border table-bordered table-hover table-bg table-sort">
							<thead>
								<tr class="text-c">
									<th width="25"><input type="checkbox" name="all" value=""></th>
									<th width="15">ID</th>
									<th width="80">提取单号</th>
									<th width="80">用户昵称</th>
									<th width="80">用户姓名</th>
									<th width="50">用户头像</th>
									<th width="60">提取金额</th>
									<th width="60">用户余额</th>
									<th width="130">申请时间</th>
									<th width="130">处理时间</th>
									<th width="50">处理人</th>
									<th width="50">申请状态</th>
									<th style="width: 90px;">操作</th>
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

	<script type="text/javascript">
        var CURSTATE = "";
        $("#tab_demo").Huitab();
        $("#tab_demo").find("span").each(function (i) {
            $(this).click(function () {
                if (i === 0) {
                    location.replace(location.href);
                } else if (i === 1) { //查询申请中
                    CURSTATE = 0;
                }else {
                    CURSTATE = 1;
                }
                withDrawTable.draw();
            })
        })

        $(document).ready(function() {

            //添加、修改异步提交地址
            var url = "withDrawList";

            withDrawTable=$("#withDrawTable").DataTable({
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
                        var state = CURSTATE;
                        param.state = state;
                        param.time=Date.parse(new Date());
                        return param;//自定义需要传递的参数。
                    }
                },
                columns: [
                    // 对应上面thead里面的序列
                    {"data": null},
                    {"data": 'id'},
                    {"data": 'recordNo'},
                    {"data": 'userName'},
                    {"data": 'realName'},
                    {"data": 'userImg'},
                    {"data": 'price'},
                    {"data": 'profit'},
                    {"data": 'createTime'},
                    {"data": 'updateTime'},
                    {"data": 'update_by'},
                    {"data": 'state'},
                    {"data":  'state'}
                ], //操作按钮
                columnDefs: [
                    { targets: 0, defaultContent: "<input type='checkbox' name='all'>" },
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
                    { targets:5,render:function (val) {
                        if (val != null) {
                            return '<img class="img-thumbnail" height="80px" width="80px" src="'+val+'">';
                        } else {
                           return "";
                        }
                    }},
                    { targets:6,render:function (val) {
						return '￥' + val;
                    }},
                    { targets:7,render:function (val) {
                        return '￥' + val;
                    }},
                    { targets:8,render:function (data, type, row, meta) {
                        return new Date(data).toLocaleString();
                    }},
                    { targets:9,render:function (data, type, row, meta) {
                    	if(data != null){
                            return new Date(data).toLocaleString();
						}else{
                    	    return '';
						}
                    }},
                    { targets:-2,render:function (val) {
                        if(val == 1){
                            return '<span class="label label-success radius">提现成功</span>';
                        }else if(val == -1){
                            return '<span class="label label-danger radius">审核驳回</span>';
                        }else {
                            return '<span class="label label-warning radius">处理中</span>';
						}
                    }},
                    { targets: -1,render:function (data, type, row, meta) {
                        if(data == 0){
                            return '<span style="cursor: pointer"	 title="点击提现" class="label label-primary radius btn_withDraw">点击提现</span>';
                        }else{
                            return '已操作';
                        }
                    }}
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
            $('#withDrawTable tbody').on( 'click', 'tr', function (e) {
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
            withDrawTable.draw();
        });

        function JumpByEnter() {
            var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
            if (lKeyCode == 13) {
                withDrawTable.draw();
            }
        }

		/* 提现*/
        $('#withDrawTable tbody').on( 'click', '.btn_withDraw', function () {
            var row = withDrawTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var recordNo = row.recordNo;
            var balance = row.profit;
            var price = row.price;
            var state = row.state;
            var html = ' <label class="form-label col-xs-4 col-sm-10">当前余额：<span style="color:red">'+balance+' 元</span></label>' +
                '<div class="formControls col-xs-8 col-sm-9"> ' +
                '提取金额：<input id="refund_fee" onfocus="this.select()" class="proNum input-text" autocomplete="off" value="'+price+'" placeholder="请填写退款金额" type="text"> </div>'

            if(state == 0){ //说明用户正在申请提现
                layer.confirm(html,{title:"提现"},function(index){
                    var refundRee=$("#refund_fee").val();
                    if(refundRee != "" && refundRee <= price){
                        var postdata={
                            recordNo:recordNo,
                            price:refundRee
                        }
                        postData("withDraw",postdata,function (result) {
                            if(result.status == 1){
                                layer.msg("提现成功！",{icon:1,time:1000},function () {
                                    location.replace(location.href);
                                })
                            } else {
                                layer.msg( "提现失败:"+result.errmsg ,{icon:7,time:3000})
                            }
                        })
                    }else{
                        layer.msg("您填写的提现金额为空或超出用户余额！",{icon:7,time:3000})
                    }
                });
            }else{
                layer.msg("该提现申请状态无法提现！",{icon:7,time:2000})
            }

        });

        $('#withDrawTable tbody').on('click', '.btn_check_user', function () {
            var row = withDrawTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.userid;
            var url = "/admin/user/userListForm?" + "id=" + id;
            var index = layer.open({
                type: 2,
                title: '用户信息',
                content: url
            });
            layer.full(index);
        });

        function workStateChange() {
            layer.msg('此功能待开发！需要确定需要批量操作的内容',{icon:7,time:3000});
        }
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
