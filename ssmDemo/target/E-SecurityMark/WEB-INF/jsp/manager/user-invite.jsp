<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>用户邀请列表</title>
    <jsp:include page="common/head.jsp"></jsp:include>
</head>
<body>
<div class="wap-container">
    <article class="Hui-admin-content clearfix">
        <div class="panel">
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
                    <input type="text" name="" onfocus="this.select()" onKeyPress="JumpByEnter()" id="couponSearch_val" placeholder=" 用户昵称" style="width:250px" class="input-text">
                    <button name="" id="couponSearch_btn" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
                </div>
            </div>
        </div>
        <div class="panel mt-20">
            <div class="panel-body">
                <div class="clearfix mt-20">
                    <table id="couponUserTable" class="table table-border table-bordered table-bg table-striped table-hover" align="center" width="100%">
                        <thead>
                            <tr class="text-c">
                                <th width="25"><input type="checkbox" name="all" value=""></th>
                                <th>用户ID</th>
                                <th>用户昵称</th>
                                <th>用户头像</th>
                                <th>真实姓名</th>
                                <th>实名认证</th>
                                <th>会员类型</th>
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
<jsp:include page="common/foot.jsp"></jsp:include>
<script type="text/javascript" src="../../../statics/lib/datatables/1.10.15/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../../statics/lib/laypage/1.2/laypage.js"></script>
<script>
    $(document).ready(function(){
        //添加、修改异步提交地址
        var url = "/admin/user/userList";

        couponUserTable=$("#couponUserTable").DataTable({
            serverSide: true,//分页，取数据等等的都放到服务端去
            processing: true,//载入数据的时候是否显示“载入中”
            paging:true,
            lengthchange:true,
            pageLength: 4,  //首次加载的数据条数
            lengthMenu:[4,10,20,50],
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
                    var searchVal=$.trim( $("#couponSearch_val").val() );
                    searchVal=encodeURI(encodeURI(searchVal));
                    param.searchVal = searchVal;
                    param.type=$("#typeOption").val();
                    param.iuserid="${id}";
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
                {"data": 'realName'},
                {"data": 'certifiedFlag'},
                {"data": 'memberid'}
            ], //操作按钮
            columnDefs: [
                { targets: 0, defaultContent: "<input type='checkbox' name='checkList'>" },
                {targets:2,render:function (val) {
                    if (val != null) {
                        if (val.length > 14) {
                            val = val.substring(0, 13) + "...";
                        }
                    } else {
                        val = ""
                    }
                    return '<a href="javascript:void(0)" class="btn btn-link icon-search btn_check_user">' + val + '</a>'
                }},
                { targets:3,render:function (val) {
                    if(val==null || val==""){
                        return ''
                    }else{
                        return '<img class="img-thumbnail" height="80px" width="80px"src="'+val+'">'
                    }
                }},
                { targets:-2,render:function (val) {
                        if (val == 0 || val == -1) {
                            return "<span class='label label-danger radius'>尚未认证</span>";
                        } else if (val == 1) {
                            return "<span class='label label-primary radius'>个人认证</span>";
                        }else{
                            return "<span class='label label-success radius'>企业认证</span>";
                        }
                    }},
                { targets:-1,render:function (val) {
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

        //表格选中行效果
        //表格选中行效果
        $('#couponUserTable tbody').on( 'click', 'tr', function (e) {
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

    /*订单-搜索*/
    $("#couponSearch_btn").click(function () {
        couponUserTable.draw();
    });

    function JumpByEnter() {
        var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
        if (lKeyCode == 13) {
            couponUserTable.draw();
        }
    }
    $('#couponUserTable tbody').on('click', '.btn_check_user', function () {
        var row = couponUserTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
        var id = row.id;
        var url = "/admin/user/userListForm?" + "id=" + id;
        var index = layer.open({
            type: 2,
            title: '用户信息',
            content: url
        });
        layer.full(index);
    });

    function countInvite(type) {
        couponUserTable.draw();
    }
</script>
</body>
</html>
