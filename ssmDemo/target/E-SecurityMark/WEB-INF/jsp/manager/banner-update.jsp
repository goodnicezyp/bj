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
    <title>修改banner图</title>
</head>
<body style="min-height: 0px;">
<div class="codeView docs-example">
    <form onsubmit="return false;" class="form form-horizontal" id="permissionAdd">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">图片名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${banner.title}" class="input-text" placeholder="图片名称" id="title" name="title">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">外部链接：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input id="link" name="link" value="${banner.link}" type="text" class="input-text" placeholder="跳转H5链接，非本域名必须要在小程序后台配置安全域名">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">小程序链接：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input id="pagePath" name="pagePath" value="${banner.pagePath}" type="text" class="input-text" placeholder="跳转小程序的页面链接，是以pages/xxx开头，此地址需要询问小程序开发人员">
                <span style="color: #7E7E7E;margin-top: 11px;display: block;">*使用规则，链接+ID</span>
                <span class="select-box">
                    <select class="select" size="1" name="demo1" id="pageOpt">
                        <option value="">-------- 选择页面 -------</option>
                        <option value="../details/details?id=">某作品详情页（请在作品页查看作品ID）</option>
                        <option value="../authorData/authorData?userid=">个人主页（请在用户管理页查看用户ID）</option>
                        <option value="../index/information?id=">资讯详情页（请在资讯管理页查看资讯ID）</option>
                        <option value="../index/cooperation?id=">授权合作详情页（请在授权合作管理页查看合作ID）</option>
                        <option value="../index/index?reUserid=">优秀艺术家页（请在用户管理页查看用户ID）</option>
                        <option value="../index/index?reWorkid=">优秀作品页（请在作品页查看用户ID）</option>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">所属类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="select" size="1" name="demo1" id="typeOptions">
                        <option value="1" <c:if test="${banner.type == 1}">aria-checked="true" </c:if> >首页banner</option>
                        <option value="2" <c:if test="${banner.type == 2}">aria-checked="true"</c:if>>最新活动banner</option>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">banner图：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="z_photo upimg-div clear proDetail" style="border: 2px dashed #E7E6E6; width: 160px;padding: 3px;">
                    <div id="preview" style="width: 160px;height: 150px;">
                        <img id="imgProDetail0" name="imgProDetail0" border="0" src="<c:choose><c:when test="${empty banner.picUrl}">../../../statics/img/a11.png</c:when><c:otherwise>${banner.picUrl}</c:otherwise></c:choose>" width="160" height="150" onclick="$('#previewImg').click();">
                    </div>
                    <input type="file" onchange="onePicUpLoad(this,0,160,150)" style="display: none;" id="previewImg">
                </div>
                <span style="color: #7E7E7E;">温馨提示：为了美观，首页banner图片像素尺寸规定为：640*570，最新活动banner尺寸为：620*900</span>
            </div>
        </div>
        <div class="row cl" style="margin-top: 93px;">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont"></i> 提交</button>
            </div>
        </div>
    </form>
</div>
<jsp:include page="common/foot.jsp" />
<script src="../../../statics/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="../../../statics/lib/jquery.validation/1.14.0/additional-methods.js"></script>
<script type="text/javascript" src="../../../statics/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script src="../../../statics/common/imgUp/imgUp.js"></script>
<script type="text/javascript">
    $("#pageOpt").change(function () {
        $("#pagePath").val($(this).val())
    })
    $("#permissionAdd").validate({
        rules:{
            title:{
                required:true
            },
            imgProDetail0:{
                required:true,
                notEqualTo:'../../../statics/img/a11.png'
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            var title = $("#title").val();
            var link = $("#link").val();
            var pagePath = $("#pagePath").val();
            var imgPath=$("#imgProDetail0").attr("src");
            var type = $("#typeOptions").val();
            if(imgPath == '../../../statics/img/a11.png'){
                layer.msg("请选择图片！",{icon:5,time:3000});
                return;
            }
            if(pagePath != '' && pagePath.split("=")[1] == ''){
                layer.msg("小程序链接缺少参数！",{icon:5,time:3000});
                return;
            }

            var data={
                title:title,
                link:link,
                pagePath:pagePath,
                picUrl:imgPath,
                type:type,
                id:"${banner.id}"
            }
            postData("updateBanner",data,function (res) {
                if(res.status == "1"){
                    parent.location.replace(parent.location.href)
                }else{
                    layer.msg("修改失败 T.T," + res.errmsg,{icon:5,time:3000})
                }
            })

        }
    });
</script>

</body>
</html>
