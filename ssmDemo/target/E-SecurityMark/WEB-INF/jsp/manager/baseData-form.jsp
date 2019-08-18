<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: 24537
Date: 2019/1/31
Time: 16:29
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>协议与文案 - 系统管理</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			系统管理
			<span class="c-gray en">/</span>
			协议与文案
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<div class="panel-body">
					<form class="form form-horizontal" id="form-article-add" onsubmit="returnFalse()">
						<div class="row clearfix">
							<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
							<div class="form-controls col-xs-8 col-sm-5">
								<span class="select-box">
									<select name="typeOption" class="select" id="typeOption" onchange="typeChange()">
										<option value="1" selected>帮助文档</option>
										<option value="2">关于</option>
										<option value="3">上传作品承诺及著作权授权书</option>
										<option value="4">作品下载授权协议</option>
										<option value="5">备案帮助</option>
										<option value="8">备案须知</option>
										<option value="9">提现协议</option>
										<option value="10">认证协议</option>
										<option value="12">文件上传操作指引（安卓）</option>
										<option value="13">文件上传操作指引（IOS）</option>
									</select>
								</span>
							</div>
						</div>

						<div class="row clearfix">
							<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文案内容：</label>
							<div class="form-controls col-xs-8 col-sm-9">
								<div><script id="baseDataEditor" type="text/plain" style="width:100%;height:400px;"></script></div>
							</div>
						</div>
						<div class="row clearfix">
							<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
								<button class="btn btn-primary radius" onclick="baseDataUpdate()" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存并提交</button>
							</div>
						</div>
					</form>
		    </div>
	    </div>
		</article>
	</div>
	<jsp:include page="common/foot.jsp"></jsp:include>
	<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/ueditor.all.js"></script>
	<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
        var ue;
		$(function() {
			// 文章内容 实例化百度富文本编辑器
			ue = UE.getEditor('baseDataEditor',{
				initialFrameWidth : 645
			});
			UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
			UE.Editor.prototype.getActionUrl = function (action) {
				if (action === 'uploadimage') {
					console.log("正在进行ueditor图片上传....");
					return '/admin/upload/action';    /* 这里填上你自己的上传图片的接口地址 */
				} else {
					return this._bkGetActionUrl.call(this, action);
				}
			};
		});

		baseData();
		function baseData(){
			var type = $("#typeOption").val();
			var data = {
				type: type
			}
			postData("baseData", data, function (res) {
				if (res.status == "1") {
					var content = "";
					if(res.result != null){
						content = res.result.content;
					}
					ue.ready(function () {
						ue.setContent(content);
					});
				} else {
					layer.msg("查看配置失败 T.T," + res.errmsg, {icon: 5, time: 3000})
				}
			})
		}

		function baseDataUpdate() {
            var type = $("#typeOption").val();
            var content = "";
            ue.ready(function () {
                content = ue.getContent();
            });
            var data = {
                type: type,
                content: content
            }
            postData("baseDataUpdate", data, function (res) {
                if (res.status != "1") {
					layer.msg("配置失败 T.T," + res.errmsg, {icon: 5, time: 3000})
                }else{
					location.replace(location.href)
				}
            })
        }

		function typeChange() {
			baseData();
		}
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
