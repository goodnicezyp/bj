<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
	<title>修改资讯 - 资讯管理</title>
</head>
<body>
	<div class="wap-container">
		<nav class="breadcrumb" style="background-color:#fff;padding: 0 24px">
			首页
			<span class="c-gray en">/</span>
			资讯管理
			<span class="c-gray en">/</span>
			修改资讯
			<a class="btn btn-success radius f-r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<article class="Hui-admin-content clearfix">
			<div class="panel">
				<div class="panel-body">
					<form class="form form-horizontal" id="form-article-add">
						<div class="row clearfix">
							<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
							<div class="form-controls col-xs-8 col-sm-9">
								<input type="text" class="input-text" value="${articles.title}" placeholder="" id="title" name="title">
							</div>
						</div>
						<div class="row clearfix">
							<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发布时间：</label>
							<div class="form-controls col-xs-8 col-sm-9">
								<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss' })" value="<fmt:formatDate value='${articles.pushTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="createTime" id="createTime" class="input-text Wdate createTime" style="width:200px;">
							</div>
						</div>
						<div class="row clearfix">
							<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
							<div class="form-controls col-xs-8 col-sm-9">
								<span class="select-box">
									<select name="typeOption" class="select" id="typeOptions">
										<option value="0" <c:if test="${articles.type == 0}">aria-checked="true" </c:if>>最新版权法规</option>
										<option value="1" <c:if test="${articles.type == 1}">aria-checked="true" </c:if>>最新活动</option>
										<option value="2" <c:if test="${articles.type == 2}">aria-checked="true" </c:if>>最新行业动态</option>
										<option value="3" <c:if test="${articles.type == 3}">aria-checked="true" </c:if>>最新维权案例</option>
									</select>
								</span>
							</div>
						</div>

						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章封面图：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<div class="z_photo upimg-div clear proDetail" style="border: 2px dashed #E7E6E6; width: 160px;padding: 3px;">
									<div id="preview" style="width: 160px;height: 150px;">
										<img id="imgProDetail0" name="imgProDetail0" border="0" src="<c:choose><c:when test="${empty articles.picUrl}">../../../statics/img/a11.png</c:when><c:otherwise>${articles.picUrl}</c:otherwise></c:choose>" width="160" height="150" onclick="$('#previewImg').click();">
									</div>
									<input type="file" onchange="onePicUpLoad(this,0,160,150)" style="display: none;" id="previewImg">
								</div>
								<span style="color: #7E7E7E;">温馨提示：为了美观，首页banner图片像素尺寸规定为：640*570，最新活动banner尺寸为：620*900</span>
							</div>
						</div>
						<div class="row clearfix">
							<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章内容：</label>
							<div class="form-controls col-xs-8 col-sm-9">
								<script id="articleEditor" type="text/plain" style="width:100%;height:400px;"></script>
							</div>
						</div>
						<div class="row clearfix">
							<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
								<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 发布</button>
								<button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button>
							</div>
						</div>
					</form>
		    </div>
	    </div>
		</article>
	</div>
	<jsp:include page="common/foot.jsp"></jsp:include>
	<script src="../../../statics/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript" src="../../../statics/lib/jquery.validation/1.14.0/additional-methods.js"></script>
	<script type="text/javascript" src="../../../statics/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script src="../../../statics/common/imgUp/imgUp.js"></script>
	<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/ueditor.all.js"> </script>
	<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="../../../statics/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript">
		$(function(){

			// 文章摘要
			$(".textarea-article").Huitextarealength({
				minlength: 10,
				maxlength: 500
			});

			// 文章内容 实例化百度富文本编辑器
			ue = UE.getEditor('articleEditor');
            UE.Editor.prototype._bkGetActionUrl=UE.Editor.prototype.getActionUrl;
            UE.Editor.prototype.getActionUrl=function(action){
                if (action == 'uploadimage'){
                    console.log("正在进行ueditor图片上传....")
                    return '/admin/upload/action';    /* 这里填上你自己的上传图片的接口地址 */
                }else{
                    return this._bkGetActionUrl.call(this, action);
                }
            };

			var content = '${articles.content}';
			ue.ready(function () {
				ue.setContent(content);
			});

			// 表单提交验证
			$("#form-article-add").validate({
				rules: {
                    title: {
						required: true
					},
                    typeOption: {
						required: true
					},
                    imgProDetail0: {
						required: true,
                        notEqualTo:'../../../statics/img/a11.png'
					},
					createTime:{
						required: true
					}
				},
				onkeyup: false,
				focusCleanup: true,
				success: "valid",
				submitHandler: function(form){
                    var title = $("#title").val();
                    var link = $("#link").val();
                    var pagePath = $("#pagePath").val();
                    var imgPath=$("#imgProDetail0").attr("src");
                    var type = $("#typeOptions").val();
					var pushTime = $(".createTime").val();
                    var content = "";
                    ue.ready(function () {
                        content = ue.getContent();
                    });
                    var data={
                        title:title,
                        link:link,
                        pagePath:pagePath,
                        picUrl:imgPath,
                        type:type,
                        content:content,
						pushTime:pushTime,
                        state:1,
						id:"${articles.id}"
                    }
                    postData("updateArticle",data,function (res) {
                        if(res.status == "1"){
                            parent.location.replace(parent.location.href)
                        }else{
                            layer.msg("修改失败 T.T," + res.errmsg,{icon:5,time:3000})
                        }
                    })

                }
			});
		});

        function article_save() {
            var title = $("#title").val();
            var link = $("#link").val();
            var pagePath = $("#pagePath").val();
            var imgPath=$("#imgProDetail0").attr("src");
            var type = $("#typeOptions").val();
            var content = "";
			var pushTime = $(".createTime").val();
            ue.ready(function () {
                content = ue.getContent();
            });
            var data={
                title:title,
                link:link,
                pagePath:pagePath,
                picUrl:imgPath,
                type:type,
                content:content,
                state:0,
				pushTime:pushTime,
				id:"${articles.id}"
            }
            postData("updateArticle",data,function (res) {
                if(res.status == "1"){
                    parent.location.replace(parent.location.href)
                }else{
                    layer.msg("修改失败 T.T," + res.errmsg,{icon:5,time:3000})
                }
            })

        }
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
