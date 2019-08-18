<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>流水列表 - 订单管理</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			订单管理
			<span class="c-gray en">/</span>
			流水列表
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<div class="panel-body">
					<div class="text-c">
						<input type="text" class="input-text" style="width:250px" placeholder=" 输入用户昵称、订单号" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">
						<button type="submit" class="btn btn-success radius"  id="search_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
					</div>
				</div>
			</div>
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="clearfix mt-20">
						<table id="orderSalesTable" class="table table-border table-bordered table-hover table-bg table-sort">
							<thead>
								<tr class="text-c">
									<th width="25"><input type="checkbox" name="all" value="" /></th>
									<th width="15">ID</th>
									<th width="80">用户昵称</th>
									<th width="40">用户头像</th>
									<th width="80">订单号</th>
									<th width="40">订单金额</th>
									<th width="60">下单时间</th>
									<th width="40">流水类型</th>
									<th width="100">支付方式</th>
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

        $(document).ready(function() {

            //添加、修改异步提交地址
            var url = "orderSaleList";

            orderSalesTable=$("#orderSalesTable").DataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                processing: true,//载入数据的时候是否显示“载入中”
                paging:true,
                lengthchange:true,
                pageLength: 7,  //首次加载的数据条数
                lengthMenu:[7,20,30,50,100],
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
                        param.time=Date.parse(new Date());
                        return param;//自定义需要传递的参数。
                    }
                },
                columns: [
                    // 对应上面thead里面的序列
                    {"data": null},
                    {"data": 'id'},
					{"data": 'userName'},
					{"data": 'userImg'},
					{"data": 'orderNo'},
                    {"data": 'price'},
                    {"data": 'createTime'},
					{"data": 'state'},
					{"data": 'payType'},
                ], //操作按钮
                columnDefs: [
                    { targets: 0, defaultContent: "<input type='checkbox' name='checkList'>" },
                    { targets:2,render:function (val) {
                        return '<a href="javascript:void(0)" class="btn btn-link icon-search btn_check_user">'+val+'</a>'
                    }},
					{ targets:3,render:function (val) {
							if(val==null || val===""){
								return ''
							}else{
								return '<img class="img-thumbnail" height="80px" width="80px"src="'+val+'">'
							}
						}},
					{ targets:5,render:function (val) {
							return '￥' + val;
					}},
                    { targets:-3,render:function (data, type, row, meta) {
                        return new Date(data).toLocaleString();
                    }},
					{ targets:-2,render:function (data, type, row, meta) {
							if(data=== 0){
							    if(row.sourceType == 0){
                                    return "<span class='label label-primary radius'>作品购买</span>"
								}else if(row.sourceType == 1){
                                    return "<span class='label label-primary radius'>会员购买</span>"
								}else if(row.sourceType == 2){
                                    return "<span class='label label-primary radius'>作品备案</span>"
                                }else{
                                    return "<span class='label label-primary radius'>购买磁盘空间</span>"
								}
							}else{
								return "<span class='label label-warning radius'>提现</span>"
							}
						}},
					{ targets:-1,render:function (data, type, row, meta) {
							if(data === 0){
								return '微信支付';
							}else if(data === 1){
								return '邀请码优惠抵扣';
							}else if(data === 2){
								return '代金券优惠抵扣';
							}else{
								return '邀请码+代金券优惠抵扣';
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
            $('#orderSalesTable tbody').on( 'click', 'tr', function (e) {
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
            orderSalesTable.draw();
        });

		/*订单-时间改变*/
		var o_startdate = $.trim($(".datetimeStart").val());
		var o_dateEnd = $(".datetimeEnd").val();
		function dateChange() {
			var date = $.trim($(".datetimeStart").val());
			var dateEnd = $.trim($(".datetimeEnd").val());
			if (o_startdate != date) {
				o_startdate = date;
				orderSalesTable.draw();
			}
			if (o_dateEnd != dateEnd) {
				o_dateEnd = dateEnd;
				orderSalesTable.draw();
			}
		}

		function JumpByEnter() {
            var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
            if (lKeyCode == 13) {
                orderSalesTable.draw();
            }
        }

        $('#orderSalesTable tbody').on('click', '.btn_check_user', function () {
            var row = orderSalesTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
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
