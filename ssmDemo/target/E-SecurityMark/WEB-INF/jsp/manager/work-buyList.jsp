﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<link rel="stylesheet" href="../../../statics/lib/layui/css/layui.css"  media="all">
	<title>作品购买列表 - 作品列表</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			作品管理
			<span class="c-gray en">/</span>
			作品列表
			<span class="c-gray en">/</span>
			作品购买列表
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<div class="panel-body">
					<div class="text-c">
						<input type="text" class="input-text" style="width:250px" placeholder=" 输入昵称、姓名" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">
						<button type="submit" class="btn btn-success radius"  id="search_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
					</div>
				</div>
			</div>
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="clearfix mt-20">
						<table id="workBuyTable" class="table table-border table-bordered table-hover table-bg table-sort">
							<thead>
								<tr class="text-c">
									<th width="25"><input type="checkbox" name="all" value=""></th>
									<th width="80">用户昵称</th>
									<th width="50">用户头像</th>
									<th width="60">真实姓名</th>
									<th width="60">订单号</th>
									<th width="60">购买金额</th>
									<th width="140">时间记录</th>
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

        $(document).ready(function() {

            //添加、修改异步提交地址
            var url = "workBuyList";

            workBuyTable=$("#workBuyTable").DataTable({
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
                        param.workid="${workid}";
                        param.time=Date.parse(new Date());
                        return param;//自定义需要传递的参数。
                    }
                },
                columns: [
                    // 对应上面thead里面的序列
                    {"data": null},
                    {"data": 'userName'},
                    {"data": 'userImg'},
                    {"data": 'realName'},
                    {"data": 'orderNo'},
                    {"data": 'price'},
                    {"data": 'createTime'}
                ], //操作按钮
                columnDefs: [
                    { targets: 0, defaultContent: "<input type='checkbox' name='checkList'>" },
                    { targets:1	,render:function (val) {
                        if (val != null) {
                            if (val.length > 14) {
                                val = val.substring(0, 13) + "...";
                            }
                        } else {
                            val = ""
                        }
                        return '<a href="javascript:void(0)" title="查看购买列表" class="btn btn-link icon-search btn_check_buyList">'+val+'</a>'
                    }},
                    { targets:2,render:function (val) {
                        if (val != null) {
                            return '<img class="img-thumbnail" height="80px" width="80px" src="'+val+'">';
                        } else {
                            return "";
                        }
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
                    { targets:5,render:function (val) {
						return "￥" + val;
                    }},

                    { targets:6,render:function (data, type, row, meta) {
                        var html = '';
                        if(data != null && data != ''){
                            html += "下单时间：" + new Date(row.createTime).toLocaleString() + '<br>';
                        }
                        if(row.finishTime != null && row.finishTime != ''){
                            html += "付款时间：" + new Date(row.finishTime).toLocaleString() + '<br>';
                        }
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
            $('#workBuyTable tbody').on( 'click', 'tr', function (e) {
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
            workBuyTable.draw();
        });

        function JumpByEnter() {
            var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
            if (lKeyCode == 13) {
                workBuyTable.draw();
            }
        }

		/*作品-查看*/
        $("#workBuyTable").find('tbody').on( 'click', '.btn_check', function () {
            var row = workBuyTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var index = layer.open({
                type: 2,
                title: '作品详情',
                content: 'checkWorkForm?id=' + id,
            });
            layer.full(index);
        });



		$("#cateOptions").change(function () {
			workBuyTable.draw();
		})
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
