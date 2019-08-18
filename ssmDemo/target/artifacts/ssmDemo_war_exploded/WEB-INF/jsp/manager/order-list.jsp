<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>订单列表 - 订单管理</title>
	<style>
		td.details-control {
			background: url('../../../statics/img/details_open.png') no-repeat center center;
			cursor: pointer;
		}

		tr.shown td.details-control {
			background: url('../../../statics/img/details_close.png') no-repeat center center;
		}
	</style>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			订单管理
			<span class="c-gray en">/</span>
			订单列表
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<div class="panel-body">
					<div class="text-c">
						<span class="select-box" style="width: 150px;">
							<select class="select" size="1" name="demo1" id="cateOptions" >
								<option value="-1">------- 全部订单 ------</option>
								<option value="0">作品购买</option>
								<option value="1">会员购买</option>
								<option value="2">作品备案</option>
								<option value="3">购买磁盘空间</option>
							</select>
						</span>
						<input type="text" class="input-text" style="width:250px" placeholder=" 输入用户名、订单号" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">
						<button type="submit" class="btn btn-success radius"  id="search_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
					</div>
				</div>
			</div>
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="clearfix">
						<span class="f-l">
							<a href="javascript:;" onclick="workStateChange()" class="btn btn-warning radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量操作</a>
						</span>
					</div>
					<div class="cl pd-5 bg-1 bk-gray mt-20">
						<div id="tab_demo" class="HuiTab">
							<div class="tabBar clearfix" style="border-bottom: none;width: 32%;float: left;">
								<span>全部</span>
								<span>已支付</span>
								<span>未支付</span>
							</div>
							<div style="float: right;">
								支付时间：
								<input type="text"
									   onfocus="WdatePicker({onpicked:dateChange(), maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
									   id="logmin" class="input-text Wdate datetimeStart" style="width:120px;">
								-
								<input type="text"
									   onfocus="WdatePicker({  onpicked:dateChange(), minDate:'#F{$dp.$D(\'logmin\')}'  })"
									   id="logmax" class="input-text Wdate datetimeEnd" style="width:120px;">
							</div>
						</div>
					</div>
					<div class="clearfix mt-20">
						<table id="orderTable" class="table table-border table-bordered table-hover table-bg table-sort">
							<thead>
								<tr class="text-c">
									<th width="25"><input type="checkbox" name="all" value="" /></th>
									<th width="30">订单详情</th>
									<th width="15">ID</th>
									<th width="80">订单号</th>
									<th width="80">真实姓名</th>
									<th width="40">订单来源</th>
									<th width="40">订单金额</th>
									<th width="40">优惠方式</th>
									<th width="40">优惠金额</th>
									<th width="40">订单状态</th>
									<th width="60">下单时间</th>
									<th width="60">支付时间</th>
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
	<script type="text/javascript" src="../../../statics/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript">

		var CURSTATE = "";
		$("#tab_demo").Huitab();
		$("#tab_demo").find("span").each(function (i) {
			$(this).click(function () {
				if (i === 0) {
					location.replace(location.href);
				} else if (i === 1) { //查询已支付订单
					CURSTATE = 1;
				}else if (i === 2) { //查询未支付订单
					CURSTATE = -1;
				} else {
					location.replace(location.href);
				}
				orderTable.draw();
			})
		})

        $(document).ready(function() {

            //添加、修改异步提交地址
            var url = "orderList";

            orderTable=$("#orderTable").DataTable({
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
						var date = $(".datetimeStart").val();
						var dateEnd = $(".datetimeEnd").val();
						param.searchVal = searchVal;
						param.date = date;
						param.dateEnd = dateEnd;
                        var state = CURSTATE;
						param.state = state;
                        param.sourceType = $("#cateOptions").val();
                        param.time=Date.parse(new Date());
                        return param;//自定义需要传递的参数。
                    }
                },
                columns: [
                    // 对应上面thead里面的序列
                    {"data": null},
                    {"class": 'details-control', "orderable": false, "data": null, "defaultContent": ''},
                    {"data": 'id'},
                    {"data": 'orderNo'},
                    {"data": 'userName'},
                    {"data": 'sourceType'},
                    {"data": 'price'},
                    {"data": 'discountType'},
                    {"data": 'discountFee'},
                    {"data": 'state'},
                    {"data": 'createTime'},
                    {"data": 'finishTime'},
                    {"data": 'payType'},
                ], //操作按钮
                columnDefs: [
                    { targets: 0, defaultContent: "<input type='checkbox' name='checkList'>" },
                    { targets:4,render:function (val) {
                        return '<a href="javascript:void(0)" class="btn btn-link icon-search btn_check_user">'+val+'</a>'
                    }},
                    { targets:5,render:function (val) {
                    	if(val === 0){
                    		return '作品购买'
						}else if(val === 1){
                    		return '会员购买'
						}else if(val === 2){
                            return '作品备案'
                        }else{
                    		return '购买磁盘空间'
						}
                    }},
					{ targets:6,render:function (val) {
							return '￥' + val;
					}},
					{ targets:7,render:function (val) {
							if(val === 0){
								return '没有优惠'
							}else if(val === 1){
								return '邀请码'
							}else if(val === 2){
								return '代金券'
							}else if(val === 3){
                                return '邀请码+代金券'
                            }else{
								return '备案次数抵扣'
							}
						}},
					{ targets:8,render:function (val) {
							return '￥' + val;
						}},
					{ targets:-4,render:function (val) {
							if(val === -1){
								return '<span class="label radius">未支付</span>';
							}else if(val === 0){
								return '<span class="label label-danger radius">已退款</span>';
							}else if(val === 1){
								return '<span class="label label-success radius">已支付</span>';
							}else {
								return '<span class="label label-success radius">后台已确认</span>';
							}
						}},

                    { targets:-3,render:function (data, type, row, meta) {
                        return new Date(data).toLocaleString();
                    }},
					{ targets:-2,render:function (val, type, row, meta) {
						if(val != null){
							return new Date(val).toLocaleString();
						}else{
							return '';
						}
					}},
					{ targets:-1,render:function (data, type, row, meta) {
							if(data === 0){
								return '微信支付';
							}else if(data === 1){
								return '邀请码优惠抵扣';
							}else if(data === 2){
								return '代金券优惠抵扣';
							}else if(data === 3){
                                return '邀请码+代金券抵扣'
                            }else{
                                return '备案次数抵扣'
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
            $('#orderTable tbody').on( 'click', 'tr', function (e) {
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

			//行折叠与展开
            $('#orderTable tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = orderTable.row(tr);
                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                } else {
                    // Open this row
//                row.child( format(row.data()) ).show();
                    var rowData = orderTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
                    var orderNo = rowData.orderNo;
                    var data = {
                        orderNo: orderNo
                    }
                    postData("findOrderItemByOrderNo", data, function (result) {
                        row.child(format(result.arrayresult)).show();
                        tr.addClass('shown');
                    })
                }
            });
        });

        function format(dataArr) {
            var html = '<table id="tempTable" class="table table-border table-bordered table-bg table-striped ' +
                'table-hover" cellpadding="6" cellspacing="0" border="0"><tr class="text-c">' +
                '<th>商品图片</th><th>商品名称</th><th>商品售价</th></tr>' +
                '<tbody class="tempbody">';
            for (var i = 0; i < dataArr.length; i++) {
                html += '<tr>' +
					'<span class="text"></span></label></td>' +
                    '<td><img src="' + dataArr[i].coverPic + '" width="80px" height="80px"></td>' +
                    '<td>' + dataArr[i].proName + '</td>' +
                    '<td>￥' + dataArr[i].price + '</td></tr>'
            }
            html += '</tbody></table>';
            return html;
        }


        /*用户-搜索*/
        $("#search_btn").click(function () {
            orderTable.draw();
        });

		/*订单-时间改变*/
		var o_startdate = $.trim($(".datetimeStart").val());
		var o_dateEnd = $(".datetimeEnd").val();
		function dateChange() {
			var date = $.trim($(".datetimeStart").val());
			var dateEnd = $.trim($(".datetimeEnd").val());
			if (o_startdate != date) {
				o_startdate = date;
				orderTable.draw();
			}
			if (o_dateEnd != dateEnd) {
				o_dateEnd = dateEnd;
				orderTable.draw();
			}
		}

		function JumpByEnter() {
            var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
            if (lKeyCode == 13) {
                orderTable.draw();
            }
        }

        $('#orderTable tbody').on('click', '.btn_check_user', function () {
            var row = orderTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
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

        $("#cateOptions").change(function () {
            orderTable.draw();
        })
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
