<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>兴趣与职业管理 - 兴趣管理</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			兴趣与职业管理
			<span class="c-gray en">/</span>
			兴趣管理
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>

		<article class="Hui-admin-content clearfix">
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="clearfix">
						<span class="f-l">
							<a href="javascript:;" id="dataDels" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
							<a href="javascript:;" onclick="interest_add('添加兴趣','addInterestForm')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加兴趣</a>
						</span>
					</div>
					<div class="mt-20 clearfix">
						<table id="interestTable" class="table table-border table-bordered table-bg table-hover table-sort">
							<thead>
								<tr>
									<th scope="col" colspan="8">兴趣列表</th>
								</tr>
								<tr class="text-c">
									<th width="25"><input type="checkbox" value="" name="all"></th>
									<th width="40">ID</th>
									<th>兴趣名称</th>
									<th>状态</th>
									<th width="70">操作</th>
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
            var url = "interestList";

            interestTable=$("#interestTable").DataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                processing: true,//载入数据的时候是否显示“载入中”
                paging:true,
                lengthchange:true,
                pageLength: 10,  //首次加载的数据条数
                lengthMenu:[10,20,30,50],
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
                        param.time=Date.parse(new Date());
                        return param;//自定义需要传递的参数。
                    }
                },
                columns: [
                    // 对应上面thead里面的序列
                    {"data": null},
                    {"data": 'id'},
                    {"data": 'title'},
                    {"data": 'state'},
                    {"data":  'state'}
                ], //操作按钮
                columnDefs: [
                    { targets: 0, defaultContent: "<input type='checkbox' name='checkList'>" },
                    { targets: -2,render:function (val) {
                        if (val == 1) {
                            return "<span class='label label-success radius'>已启用</span>";
                        }else{
                            return "<span class='label label-warning radius'>已停用</span>";
                        }
                    }},
                    { targets: -1,render:function (val) {
                        var html='';
                        if(val == 1){
                            html += '<span style="cursor: pointer" title="停用" class="label label-primary radius btn_state">停用</span>';
                        }else{
                            html += '<span style="cursor: pointer" title="启用" class="label label-primary radius btn_state">启用</span>';
                        }
                        html += ' <span style="cursor: pointer"	 title="编辑" class="label label-primary radius btn_update">编辑</span>';

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
            $('#interestTable tbody').on( 'click', 'tr', function (e) {
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


		/*-添加*/
        function interest_add(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url,
                area: ['500px', '200px']
            });
        }

		/*兴趣状态更改*/
        $("#interestTable").find('tbody').on( 'click', '.btn_state', function () {
            var row = interestTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var title = '确定禁用该兴趣？';
            var state = row.state;
            if(state == 0){
                title = '确定启用该兴趣？';
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

		/*-批量删除*/
        $('#dataDels').click( function () {
            var length = interestTable.rows('.selected').data().length;
            if(length != 0 ){
                layer.confirm('确认要删除吗？',function(index){
                    var ids = [];
                    var rows = interestTable.rows('.selected').data();
                    for(var i=0;i<length;i++){
                        ids.push(rows[i].id);
                    }
                    var data={
                        ids:ids
                    }
                    postData("delInterest", data, function (result) {
                        if(result.status == "1"){
                            location.replace(location.href);
                        }else{
                            layer.msg('删除失败:' + result.errmsg,{icon:1,time:3000});
                        }
                    });
                });
            }else{
                layer.msg("请选择您要删除的数据",{icon:7,time:2000}) //icon:  1:成功  2：失败 3:疑问 4：锁 5：红色哭脸 6：绿色笑脸 7以上：橙色感叹号
            }
        } );


		/*-修改*/
        $("#interestTable").find('tbody').on( 'click', '.btn_update', function () {
            var row = interestTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var index = layer.open({
                type: 2,
                title: '兴趣修改',
                content: 'updateInterestForm?id=' + id,
                area: ['500px', '200px']
            });
        });
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
