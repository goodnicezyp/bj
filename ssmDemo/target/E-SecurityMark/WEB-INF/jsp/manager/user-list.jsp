<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp" />
	<title>用户管理 - 微信用户</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			用户管理
			<span class="c-gray en">/</span>
			微信用户
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<div class="panel-body">
					<div class="text-c">
						<input type="text" class="input-text" style="width:250px" placeholder=" 输入用户昵称、邀请码" id="searchVal" name="" onfocus="this.select()" onKeyPress="JumpByEnter()">
						<button type="submit" class="btn btn-success radius"  id="userSearch_btn" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
					</div>
				</div>
			</div>
			<div class="panel mt-20">
				<div class="panel-body">
					<div class="clearfix">
						<span class="f-l">
							<a href="javascript:;" onclick="userAgentChange()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe61d;</i> 代理人设置</a>
							<a href="javascript:;" onclick="userChannelChange()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe61d;</i> 渠道用户设置</a>
							<a href="javascript:;" onclick="userMemberChange()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe61d;</i> 会员设置</a>
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
						<table id="userTable" class="table table-border table-bordered table-hover table-bg table-sort">
							<thead>
								<tr class="text-c">
									<th width="10"><input type="checkbox" name="all" value=""></th>
									<th width="15">ID</th>
									<th width="80">用户昵称</th>
									<th width="20">用户头像</th>
									<th width="30">会员等级</th>
									<th width="30">注册类型</th>
									<th width="50">实名认证</th>
									<th width="50">实名认证审核</th>
									<th width="50">资质认证</th>
									<th width="50">资质认证审核</th>
									<th width="50">用户身份</th>
									<th width="50">交易权限</th>
									<th width="30">推荐状态</th>
									<th width="30">状态</th>
									<th width="80">操作</th>
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
	<script src="../../../statics/common/imgUp/imgUp.js"></script>
	<script type="text/javascript" src="../../../statics/lib/My97DatePicker/4.8/WdatePicker.js"></script>

	<script type="text/javascript">
		var CURSTATE = "";
		$("#tab_demo").Huitab();
		$("#tab_demo").find("span").each(function (i) {
			$(this).click(function () {
				if (i === 0) {
					location.replace(location.href);
				} else if (i === 1) { //查询已审核-通过
					CURSTATE = 2;
				}else if (i === 2) { //查询已审核-驳回
					CURSTATE = -1;
				}else if (i === 3) { //查询未审核
					CURSTATE = 1;
				} else {
					location.replace(location.href);
				}
				userTable.draw();
			})
		})

        $(document).ready(function() {
            //添加、修改异步提交地址
            var url = "userList";

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
                        var userid="${id}";
                        param.searchVal=searchVal;
                        if(userid != "" && userid != null){
                            param.userid=userid;
                        }
						param.examine = CURSTATE;
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
                    {"data": 'memberid'},
                    {"data": 'signType'},
                    {"data": 'certifiedFlag'},
                    {"data": 'certifiedState'},
                    {"data": 'aptitudeFlag'},
                    {"data": 'aptitudeState'},
                    {"data": 'agentFlag'},
                    {"data": 'tradeFlag'},
                    {"data": 'recommendFlag'},
                    {"data": 'state'},
                    {"data":  'state'}
                ], //操作按钮
                columnDefs: [
                    { targets: 0, defaultContent: "<input type='checkbox' name='checkList'>" },
                    { targets:3,render:function (val) {
                        if(val==null || val===""){
                            return ''
                        }else{
                            return '<img class="img-thumbnail" height="80px" width="80px"src="'+val+'">'
                        }
                    }},
                    { targets:4,render:function (val) {
                        if (val === 0) {
                            return "<span class='label radius'>普通用户</span>";
                        } else if (val === 1) {
                            return "<span class='label label-primary radius'>原创新星会员</span>";
                        }else{
                            return "<span class='label label-success radius'>原创大咖会员</span>";
                        }
                    }},
                    { targets:5,render:function (val) {
                        if (val == 0 || val == -1) {
                            return "<span class='label label-danger radius'>尚未注册</span>";
                        }else if (val == 1) {
                            return "<span class='label label-primary radius'>个人</span>";
                        }else{
                            return "<span class='label label-success radius'>企业</span>";
                        }
                    }},
                    { targets:6,render:function (val) {
                        if (val == 0 || val == -1) {
                            return "<span class='label label-danger radius'>尚未认证</span>";
                        } else if (val == 1) {
                            return "<span class='label label-primary radius'>个人认证</span>";
                        }else{
                            return "<span class='label label-success radius'>企业认证</span>";
                        }
                    }},
                    { targets:7,render:function (val) {
						if(val == -1){
							return "<span class='label label-danger radius'>已驳回</span>";
						}else if (val == 0) {
                            return "<span class='label radius'>尚未进入审核流程</span>";
                        } else if (val == 1) {
                            return "<span class='label label-primary radius'>审核中</span>";
                        }else{
                            return "<span class='label label-success radius'>审核通过</span>";
                        }
                    }},
					{ targets:8,render:function (val) {
                        if (val == 0 || val == -1) {
							return "<span class='label label-danger radius'>尚未认证</span>";
						}else{
							return "<span class='label label-success radius'>已认证</span>";
						}
					}},
					{ targets:9,render:function (val) {
						if(val == -1){
							return "<span class='label label-danger radius'>已驳回</span>";
						}else if (val == 0) {
							return "<span class='label radius'>尚未进入审核流程</span>";
						} else if (val == 1) {
							return "<span class='label label-primary radius'>审核中</span>";
						}else{
							return "<span class='label label-success radius'>审核通过</span>";
						}
						}},
                    {
                        targets: -5, render: function (data, type, row, meta) {
                        if (row.agentFlag == 0 && row.channelFlag == 0) {
                            return "<span class='label radius'>普通用户</span>";
                        }else{
                            var html = '';
                            if(row.agentFlag == 1){
                                html = "<span class='label label-success radius'>代理人用户</span>";
							}
                            if(row.channelFlag == 1){
                                html += "<br><span class='label label-success radius'>渠道用户-个人</span>";
                            }
                            if(row.channelFlag == 2){
                                html += "<br><span class='label label-success radius'>渠道用户-机构</span>";
                            }
                            return html;
                        }
                    }},
                    {
                        targets: -4, render: function (data, type, row, meta) {
                        if (data == 0) {
                            return "<span class='label radius'>无</span>";
                        }else{
                            return "<span class='label label-success radius'>已开启</span>";
                        }
                    }},
                    { targets:-3,render:function (val) {
                        if(val == 1){
                            return '<span class="label label-success radius">已推荐</span>';
                        }else{
                            return '<span class="label radius">未推荐</span>';
                        }
                    }},
                    { targets:-2,render:function (val) {
                        if(val == 1){
                            return '<span class="label label-success radius">启用</span>';
                        }else{
                            return '<span class="label label-danger radius">禁用</span>';
                        }
                    }},
					{ targets: -1,render:function (data, type, row, meta) {
                        var html='';
                        if(data == 1){
                            html += '<span style="cursor: pointer" title="停用" class="label label-primary radius btn_state">停用</span>';
                        }else{
                            html += '<span style="cursor: pointer" title="启用" class="label label-primary radius btn_state">启用</span>';
                        }
                        if(row.signType > 0){
                            html += ' <span style="cursor: pointer" title="重新注册" class="label label-primary radius btn_signType">重新注册</span>';
                        }
                        if(row.recommendFlag == 0){
                            html += ' <span style="cursor: pointer" title="推荐" class="label label-primary radius btn_recommend">推荐</span>';
                        }else{
                            html += ' <span style="cursor: pointer" title="推荐编辑" class="label label-primary radius btn_recommend">推荐编辑</span>';
                        }
                        if(row.certifiedState != 0){
                            html += ' <br><span style="cursor: pointer" title="实名认证审核" class="label label-primary radius btn_certifiedState">实名认证审核</span>';
                        }
                        if(row.aptitudeState != 0){
                            html += ' <br><span style="cursor: pointer" title="资质认证审核" class="label label-primary radius btn_aptitudeState">资质认证审核</span>';
                        }
                        html += ' <br><span style="cursor: pointer" title="交易权限" class="label label-primary radius btn_tradeFlag">交易权限</span>';

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

		/*用户-推荐*/
        $("#userTable").find('tbody').on( 'click', '.btn_recommend', function () {
            var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var recommendFlag = row.recommendFlag;

            var descrip = row.descrip;
            var recommandPic = row.recommandPic;
            if(recommandPic == null || recommandPic == ''){
                recommandPic = "../../../statics/img/a11.png";
            }

            var btnTitle = ['推荐','不推荐','取消'];
            if(recommendFlag == 1){
                title = '确定更改该作者推荐信息？';
                btnTitle = ['修改','取消推荐','取消'];
            }else{
                title = '是否推荐为优秀艺术家？';
                recommendFlag = 1;
            }

            layer.confirm(title, {
                    btn: btnTitle,
                    shade: false,
                    closeBtn: 0
                },
                function(){ // 推荐或修改
                    var html = '<br><div class="z_photo upimg-div clear proDetail" style=" margin: 13px 0px;border: 2px dashed #E7E6E6; width: 160px;padding: 3px;"> <div id="preview" style="width: 160px;height: 150px;"> ' +
                        '<img id="imgProDetail0" name="imgProDetail0" border="0" ' +
                        'src="' + recommandPic +'" width="160" height="150" onclick="$(\'#previewImg\').click();"> </div> <input type="file" onchange="onePicUpLoad(this,0,160,150)" style="display: none;" id="previewImg"> </div>' +
                        '<textarea class="desc textarea" style="min-height: 150px" placeholder="请填写个人简介">'+ descrip +'</textarea> ';

                    layer.confirm('确定设置优秀艺术家推荐信息？' + html,{area:['400px','520px']},function(index){
                        var desc = $(".desc").val();
                        var imgPath=$("#imgProDetail0").attr("src");
                        if(imgPath == '../../../statics/img/a11.png'){
                            layer.msg("请选择图片！",{icon:5,time:3000});
                            return;
                        }
                        if(desc == ''){
                            layer.msg('请填写个人简介',{icon:5,time:3000});
                            return;
                        }

                        var data={
                            id:id,
                            recommendFlag:recommendFlag,
                            desc:desc,
                            imgPath:imgPath
                        }
                        postData("updateRecommend", data, function (result) {
                            if(result.status == "1"){
                                location.replace(location.href);
                            }else{
                                layer.msg('推荐失败:' + result.errmsg,{icon:5,time:3000});
                            }
                        });
                    });
                },
                function(){ //取消推荐
                    var area = [];
                    layer.confirm('确定取消推荐该用户为优秀艺术家？',{area:area},function(index){
                        var data={
                            id:id,
                            recommendFlag:0
                        }
                        postData("updateRecommend", data, function (result) {
                            if(result.status == "1"){
                                location.replace(location.href);
                            }else{
                                layer.msg('取消推荐失败:' + result.errmsg,{icon:5,time:3000});
                            }
                        });
                    });
                }
			);
        });

		/*用户-重新注册*/
        $("#userTable").find('tbody').on( 'click', '.btn_signType', function () {
            var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var title = '确定让该用户重新注册？';
            var signType = row.signType;
            if(signType > 0){
                layer.confirm(title,function(index){
                    var data={
                        id:id
                    }
                    postData("updateSignType", data, function (result) {
                        if(result.status == "1"){
                            location.replace(location.href);
                        }else{
                            layer.msg('重置失败:' + result.errmsg,{icon:5,time:3000});
                        }
                    });
                });
            }else{
                layer.msg('用户尚未注册',{icon:5,time:3000});
			}
        });

		/*作者-状态*/
        $("#userTable").find('tbody').on( 'click', '.btn_state', function () {
            var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            var title = '确定禁用该作者？';
            var state = row.state;
            if(state == 0){
                title = '确定启用该作者？';
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

        //更改用户为代理人用户
        function userAgentChange() {
            var length = userTable.rows('.selected').data().length;
            if(length > 0 ){
                var title = '是否设置为代理人：<span class="select-box">' +
                    '<select name="typeOption" class="select" id="typeOption">' +
                    '<option value="0">普通用户</option>' +
                    '<option value="1">代理人</option>' +
                    '</select></span>';
                layer.confirm(title,function(index){
                    var ids = [];
                    var rows = userTable.rows('.selected').data();
                    for(var i=0;i<length;i++){
                        ids.push(rows[i].id);
                    }

                    var state = $("#typeOption").val();
                    var data = {
                        ids:ids,
                        state:state
                    }
                    postData("updateAgent", data, function (result) {
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
        }

        //更改用户为渠道用户
        function userChannelChange() {
            var length = userTable.rows('.selected').data().length;
            if(length > 0 ){
                var title = '是否设置为渠道用户：<span class="select-box">' +
                    '<select name="channelOption" class="select" id="channelOption">' +
                    '<option value="0">普通用户</option>' +
                    '<option value="1">渠道用户(个人)</option>' +
                    '<option value="2">渠道用户(机构)</option>' +
                    '</select></span>';

                title += '<br><input type="text" class="input-text" style="margin-top: 10px;" placeholder=" 输入提成比例(0-100)" id="channelProfit"/>'
                layer.confirm(title,function(index){
                    var ids = [];
                    var rows = userTable.rows('.selected').data();
                    for(var i=0;i<length;i++){
                        ids.push(rows[i].id);
                    }

                    var state = $("#channelOption").val();
                    var channelProfit = $("#channelProfit").val();
                    if(state > 0 && channelProfit == ''){
                        layer.msg('请设置渠道收益提成比例',{icon:5,time:3000});
                        return;
					}
					if(state > 0 && (channelProfit <= 0 || channelProfit > 100)){
                        layer.msg('收益提成比例范围为：0-100',{icon:5,time:3000});
                        return;
					}

                    var data = {
                        ids:ids,
                        state:state,
                        profit:channelProfit
                    }
                    postData("updateChannel", data, function (result) {
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
        }

        $(document).on('change','#channelOption',function () {
            var state = $("#channelOption").val();
            if(state == 0){
                $("#channelProfit").hide();
            }else{
                $("#channelProfit").show();
            }
        })

        //更改用户为会员用户
        function userMemberChange() {
            var length = userTable.rows('.selected').data().length;
            if(length > 0 ){
                var title = '是否设置为会员：<span class="select-box">' +
                    '<select name="memberOption" class="select" id="memberOption">' +
                    '<option value="0">普通用户</option>' +
                    '<option value="1">原创新星(*赠送2G空间)</option>' +
                    '<option value="2">原创大咖(*赠送5G空间)</option>' +
                    '</select></span>';

                title += '<br><input type="text" ' +
					'onfocus="WdatePicker({minDate:\'%y-%M-\#{%d+1} %H:%m:%s\',dateFmt:\'yyyy-MM-dd HH:mm:ss\'})" ' +
				'id="logmax" class="input-text Wdate datetimeEnd" style="margin-top:10px;display:none;">';

                layer.confirm(title,function(index){
                    var ids = [];
                    var rows = userTable.rows('.selected').data();
                    for(var i=0;i<length;i++){
                        ids.push(rows[i].id);
                    }

                    var state = $("#memberOption").val();
                    var datetimeEnd = $('.datetimeEnd').val();
                    var data = {
                        ids:ids,
                        state:state,
                        datetimeEnd:datetimeEnd
                    }
                    postData("updateMember", data, function (result) {
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
        }

        $(document).on('change','#memberOption',function () {
            var state = $("#memberOption").val();
            if(state == 0){
                $("#logmax").hide();
			}else{
                $("#logmax").show();
			}
        })

		/*用户-实名审核*/
		$("#userTable").find('tbody').on( 'click', '.btn_certifiedState', function () {
			var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
			var id = row.id;
			layer.confirm('实名认证审核？', {
						btn: ['通过','不通过','取消'],
						shade: false,
						closeBtn: 0
					},
					function(){
						var data={
							id:id,
							examine:2,
							type:0
						};
						postData("userExamine", data, function (result) {
							if(result.status == "1"){
								location.replace(location.href);
							}else{
								layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
							}
						});
					},
					function(){
						var data={
							id:id,
							examine:-1,
							type:0
						};
						postData("userExamine", data, function (result) {
							if(result.status == "1"){
								location.replace(location.href);
							}else{
								layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
							}
						});
					});
		});

		/*用户-资质审核*/
        $("#userTable").find('tbody').on( 'click', '.btn_aptitudeState', function () {
            var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            layer.confirm('资质认证审核？', {
                    btn: ['通过','不通过','取消'],
                    shade: false,
                    closeBtn: 0
                },
                function(){
                    var data={
                        id:id,
                        examine:2,
                        type:1
                    };
                    postData("userExamine", data, function (result) {
                        if(result.status == "1"){
                            location.replace(location.href);
                        }else{
                            layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
                        }
                    });
                },
                function(){
                    var data={
                        id:id,
                        examine:-1,
                        type:1
                    };
                    postData("userExamine", data, function (result) {
                        if(result.status == "1"){
                            location.replace(location.href);
                        }else{
                            layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
                        }
                    });
                });
        });

        /*用户-交易权限*/
        $("#userTable").find('tbody').on( 'click', '.btn_tradeFlag', function () {
            var row = userTable.row($(this).closest('tr')).data(); //这个插件要取到值还真是只有这样的绑定事件才可以 原因不明
            var id = row.id;
            layer.confirm('交易权限？', {
                    btn: ['开启','关闭','取消'],
                    shade: false,
                    closeBtn: 0
                },
                function(){
                    var data={
                        id:id,
                        tradeFlag:1
                    };
                    postData("updateTradeFlag", data, function (result) {
                        if(result.status == "1"){
                            location.replace(location.href);
                        }else{
                            layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
                        }
                    });
                },
                function(){
                    var data={
                        id:id,
                        tradeFlag:0
                    };
                    postData("updateTradeFlag", data, function (result) {
                        if(result.status == "1"){
                            location.replace(location.href);
                        }else{
                            layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
                        }
                    });
                });
        });
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
