<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<link rel="stylesheet" href="../../../statics/lib/layui/css/layui.css"  media="all">
	<title>批量审核 - 作品管理</title>
</head>
<body>
	<div class="wap-container">
		<article class="Hui-admin-content clearfix">
			<div class="panel mt-20" style="height: 614px;position: relative;">
				<div class="panel-body" style="height: 400px;overflow-y: auto;">
					<div class="clearfix mt-20">
						<table id="tempTable" class="table table-border table-bordered table-hover table-bg table-sort">
							<thead>
								<tr class="text-c">
									<th width="15">ID</th>
									<th width="80">作品名称</th>
									<th width="40">审核状态</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${works}" var="item">
									<tr>
										<td>${item.id}</td>
										<td>${item.name}</td>
										<td>
											<c:choose>
												<c:when test="${item.examine == 0}">
													<span class="label label-warning radius">待审核</span>
												</c:when>
												<c:otherwise>
													<span class="label label-success radius">审核成功</span>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div style="position: absolute;bottom: 0px;width: 710px;">
						<div class="mt-20">
							<span>
								审核中的任务如果出现审核失败的将跳过直接进入下一个任务，
								<br>审核过程中请勿关闭此页面
								<br>是否立即开始？<br>
							</span>
							处理进度：
							<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
								<div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
							</div>
						</div>
						<button name="" id="batch" class="btn btn-success mt-20" title="开始审核" type="button">开始审核 </button>
					</div>
				</div>
			</div>
		</article>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="common/foot.jsp"></jsp:include>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="../../../statics/lib/layui/layui.js"></script>
	<script type="text/javascript">
        var element;
        layui.use('element', function(){
            element = layui.element;
        });

		$("#batch").click(function () {
            var curNum = 0;
            var successNum = 0;

            var length = "${length}";
            var rows = jQuery.parseJSON('${works}');

			getTsa(successNum,rows,length,curNum)

            layer.msg('共选择：' + length + '条，审核成功:' + successNum +"条",{icon:1,time:3000});
        })

		function getTsa1(successNum,rows,length,curNum) {
            if(curNum >= length){
                return;
            }
            var wid = rows[curNum].id;
            var defer = $.Deferred();

            var data={
                id:wid,
                examine:1
            };

            curNum++;
            element.progress('demo', (curNum / length) * 100 + '%');
            var index = layer.msg('正在下发证书' + curNum + '，请稍后...',{icon:16,shade: 0.01,time:false});
            console.log('正在下发证书' + curNum + '，请稍后...')

            postData("getTSA",{id:wid},function (res) {
                layer.close(index);
                if(res.status == "1"){
                    console.log('下发成功，审核中。。。' + curNum + '，请稍后...')
                    layer.msg(res.errmsg,{icon:1,time:500},function () {
                        defer.resolve(res);
                    });
                }else{

				}
            })
            return defer.promise();
        }
        
        function getExamine() {
            //当getTsa1() 执行完成后，执行done()以下操作。就跟同步效果一样。
            $.when(getTsa1()).done(function(dataStr){
                console.log(dataStr);
            });
        }
		
		
		function getTsa(successNum,rows,length,curNum) {
		    if(curNum >= length){
		        return;
			}
            var wid = rows[curNum].id;

            var data={
                id:wid,
                examine:1
            };

            curNum++;
            element.progress('demo', (curNum / length) * 100 + '%');
            var index = layer.msg('正在下发证书' + curNum + '，请稍后...',{icon:16,shade: 0.01,time:false});
            console.log('正在下发证书' + curNum + '，请稍后...')
            $.ajax({
                type: 'POST',
                url: "getTSA",
                dataType: "json",
                data:{id:wid},
                async: false,
                cache: true,
                success: function(res){
                    layer.close(index);
                    if(res.status == "1"){
//                        layer.msg(res.errmsg,{icon:1,time:500},function () {
////                            var index2 = layer.msg(" 审核处理中...",{icon:16,shade: 0.01,time:false})
//
//                        });
                        console.log('下发成功，审核中。。。' + curNum + '，请稍后...')
                        $.ajax({
                            url: "workExamine",
                            data: data,
                            traditional: true,
                            dataType: 'json',
                            async: false,
                            type: 'POST',
                            success: function (result) {
//                                layer.close(index2);
                                if(result.status == "1"){
                                    console.log('审核成功' + curNum)
                                    successNum++;
//                                        layer.msg('审核成功！',{icon:1,time:1000},function () {
//                                            successNum++;
//                                        });
                                }else{
                                    console.log('审核失败' + curNum)
//                                        layer.msg('审核失败:' + result.errmsg,{icon:5,time:3000});
                                }
                            }
                        })

                    }else{
                        console.log('审核中证书下发失败：' + curNum)
//                        layer.msg('证书下发失败:' + res.errmsg,{icon:5,time:3000});
                    }
                },complete:function(){
                    getTsa(successNum,rows,length,curNum)
                }
            });
        }
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
