<%--suppress ALL --%>
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
    <title>会员权益配置</title>
</head>
<body style="min-height: 0px;">
<div class="codeView docs-example">
    <div id="tab-memberPacket" class="HuiTab" style="padding: 10px;">
        <div class="tabBar cl">
            <span>原创新星会员</span>
            <span>原创大咖会员</span>
        </div>
        <form onsubmit="return false;" class="form form-horizontal" id="memberSettingForm">
            <div class="tabCon">
                <div class="row clearfix">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员简介：</label>
                    <div class="form-controls col-xs-8 col-sm-9">
                        <textarea style="height: 100px;" class="textarea valid" placeholder="用于商店首页会员简介" id="member1Des" name="member1Des">${member1Des}</textarea>
                    </div>
                </div>
                <div class="row clearfix">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员权益：</label>
                    <div class="form-controls col-xs-8 col-sm-9">
                        <%--<textarea style="height: 320px;" class="textarea valid" id="member1" name="member1">${rightsDes1}</textarea>--%>
                        <div><script id="member1" type="text/plain" style="width:100%;min-height:400px;"></script></div>
                    </div>
                </div>
            </div>
            <div class="tabCon">
                <div class="row clearfix">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员简介：</label>
                    <div class="form-controls col-xs-8 col-sm-9">
                        <textarea style="height: 100px;" class="textarea valid" placeholder="用于商店首页会员简介" id="member2Des" name="member2Des">${member2Des}</textarea>
                    </div>
                </div>
                <div class="row clearfix">
                    <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员权益：</label>
                    <div class="form-controls col-xs-8 col-sm-9">
                        <%--<textarea style="height: 320px;" class="textarea valid" id="member2" name="member2">${rightsDes2}</textarea>--%>
                        <div><script id="member2" type="text/plain" style="width:100%;min-height:400px;"></script></div>
                    </div>
                </div>
            </div>
            <div style="margin-left: 100px;margin-top: 10px;">
                <button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont"></i> 提交</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="common/foot.jsp"></jsp:include>
<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/ueditor.all.js"></script>
<script type="text/javascript" src="../../../statics/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script src="../../../statics/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript">
    var ue;
    var ue2;
    $(function() {
        // 文章内容 实例化百度富文本编辑器
        ue = UE.getEditor('member1',{
            initialFrameWidth : 645
        });
        ue2 = UE.getEditor('member2',{
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

        ue.addListener("ready", function () {
            ue.setContent('${rightsDes1}');
        });

        ue2.addListener("ready", function () {
            ue2.setContent('${rightsDes2}');
        });
    });



    $("#tab-memberPacket").Huitab();
    $("#memberSettingForm").validate({
        rules:{
            member1:{
                required:true
            },
            member1Des:{
                required:true
            },
            member2:{
                required:true
            },
            member2Des:{
                required:true
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            var member1Des = $("#member1Des").val();
            var rightsDes1 = "";
            ue.ready(function () {
                rightsDes1 = ue.getContent();
            });
            var member2Des = $("#member2Des").val();
            var rightsDes2 = "";
            ue2.ready(function () {
                rightsDes2 = ue2.getContent();
            });

            var data={
                member1Des:member1Des,
                member2Des:member2Des,
                rightsDes1:rightsDes1,
                rightsDes2:rightsDes2
            }
            postData("updateRightSetting",data,function (res) {
                if(res.status == "1"){
                    parent.location.replace(parent.location.href)
                }else{
                    layer.msg("配置更新失败 T.T," + res.errmsg,{icon:5,time:3000})
                }
            })

        }
    });
</script>

</body>
</html>
