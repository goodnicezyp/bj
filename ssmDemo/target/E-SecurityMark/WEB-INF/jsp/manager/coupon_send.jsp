<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>赠送代金券 - 代金券管理</title>
    <jsp:include page="common/head.jsp"></jsp:include>
</head>
<body>
<div class="wap-container">
    <article class="Hui-admin-content clearfix">
        <div class="panel">
            <div class="panel-body">
                <div class="text-c">
                    <input type="text" name="" onfocus="this.select()" onKeyPress="JumpByEnter()" id="couponSearch_val" placeholder=" 用户昵称" style="width:250px" class="input-text">
                    <button name="" id="couponSearch_btn" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
                </div>
            </div>
        </div>
        <div class="panel mt-20">
            <div class="panel-body">
                <div class="clearfix">
                    <span class="l">
                        <a href="javascript:;" id="btn_send" class="btn btn-primary radius">
                            <i class="Hui-iconfont">&#xe600;</i> 赠送
                        </a>
                    </span>
                </div>
                <div class="clearfix mt-20">
                    <table id="couponUserTable" class="table table-border table-bordered table-bg table-striped table-hover" align="center" width="100%">
                        <thead>
                            <tr class="text-c">
                                <th width="25"><input type="checkbox" name="all" value=""></th>
                                <th>用户昵称</th>
                                <th>用户头像</th>
                                <th>真实姓名</th>
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
                    param.time=Date.parse(new Date());
                    return param;//自定义需要传递的参数。
                }
            },
            columns: [
                // 对应上面thead里面的序列
                {"data": null},
                {"data": 'userName'},
                {"data": 'userImg'},
                {"data": 'realName'}
            ], //操作按钮
            columnDefs: [
                { targets: 0, defaultContent: "<input type='checkbox' name='checkList'>" },
                {targets:1,render:function (val) {
                    if (val != null) {
                        if (val.length > 14) {
                            val = val.substring(0, 13) + "...";
                        }
                    } else {
                        val = ""
                    }
                    return '<a href="javascript:void(0)" class="btn btn-link icon-search btn_check_user">' + val + '</a>'
                }},
                { targets:2,render:function (val) {
                    if(val==null || val==""){
                        return ''
                    }else{
                        return '<img class="img-thumbnail" height="80px" width="80px"src="'+val+'">'
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

    $("#btn_send").click(function () {
        var length=couponUserTable.rows('.selected').data().length;
        if(length <= 0){
            layer.msg("请选择您要赠送的用户",{icon:7,time:2000})
        }else{
            var ids=[];
            var rows=couponUserTable.rows('.selected').data();
            for(var i=0;i<length;i++){
                ids.push(rows[i].id);
            }

            var title = '请输入赠送张数：<br><input type="number" class="input-text" value="1" style="margin-top: 10px;" placeholder=" 输入赠送张数" id="couponNum"/>'
            layer.confirm('是否赠送该用户优惠券？'+ title,function(index){
                var num = $("#couponNum").val();
                if(num <= 0 || num === ''){
                    layer.msg("至少赠送一张",{icon:7,time:1000});
                    return;
                }
                var data = {
                    couponid:"${id}",
                    userids: ids,
                    num:num
                }
                postData("sendCoupon", data, function (result) {
                    if(result.status == "1"){
                        layer.msg("赠送成功",{icon:1,time:1000},function () {
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.location.replace(parent.location.href)
                            parent.layer.close(index);
                        });

                    }else{
                        layer.msg("赠送失败了",{icon:7,time:1000});
                    }
                });
            });
        }
    })

    $("#btn_send_all").click(function () {
        var enddate = $(".datetimeStart").val();
        var getdate=$("#datetimeStart").val();
        var data = {
            couponid:"${id}",
            getdate:getdate,
            enddate: enddate,
        }
        layer.confirm('是否批量赠送优惠券？',function(index){
            var layerLoadID=layer.msg('正在批量赠送，请稍后...', {
                icon: 16,
                shade: 0.01,
                time:false //取消自动关闭
            });
            $.ajax({
                url : "sendAllUserCoupon",
                type : "POST",
                dataType : "json",
                traditional: true,
                data : data,
                success:function (res) {
                    if(res.status == "1"){
                        layer.msg("提交成功！",{icon:1,time:2000})
                    }else{
                        layer.msg("赠送出错：" + res.errmsg,{icon:7,time:2000})
                    }
                },
                error:function (data,status,e) {
                    layer.msg("请求失败，"+e,{icon:5,time:1500}) //icon:  1:成功  2：失败 3:疑问 4：锁 5：红色哭脸 6：绿色笑脸 7以上：橙色感叹号
                },
                complete:function (res) {
                    layer.close(layerLoadID);//手动关闭 加载
                }
            })
        });
    })

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
</script>
</body>
</html>
