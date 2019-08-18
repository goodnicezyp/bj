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
    <title>修改类别</title>
    <style>
        .highlight_box .info {
            float: left;
            font-size: 34px;
            color: #00AEEF;
            margin-right: 10px;
        }
        .highlight_box {
            background-color: #f4f5f9;
            line-height: 1.6;
            margin-bottom: 20px;
            padding: 9px 30px;
            position: relative;
        }
        .title{
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body style="min-height: 0px;">
<div class="codeView docs-example">
    <div class="highlight_box">
        <i class="Hui-iconfont info"></i>
        <p class="title">类别代码对照表</p><br>
        <p class="desc">
            101 文字、102 音乐、103 剧本、104 戏曲、105纪实报道、
            106 方案、107 说明书、108 翻译作品、109 歌词、110 作曲、
            111 音像、112 美术、113 平面作品、114 工业设计、115 室内设计、
            116 广告设计、117 工艺美术品设计、118 雕塑、119 集成电路图、
            120 建筑设计、121 软件、123商业秘密、124 摄影、125 其他
        </p>
    </div>

    <form onsubmit="return false;" class="form form-horizontal" id="cateAdd">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">类别代码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${oneCategory.projectFileType}" class="input-text" placeholder="类别代码请严格参照上述代码，如：文字类，此处填写101" id="projectFileType" name="projectFileType">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">类别名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${oneCategory.name}" class="input-text" placeholder="类别名称" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">作品编码前缀：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" value="${oneCategory.prefix}" class="input-text" placeholder="用于作品编码的前缀" id="prefix" name="prefix">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">文件类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select name="typeOption" class="select" id="typeOption">
                        <option value="0" <c:if test="${oneCategory.type == 0}">selected</c:if>>图片</option>
                        <option value="1" <c:if test="${oneCategory.type == 1}">selected</c:if>>视频</option>
                        <option value="2" <c:if test="${oneCategory.type == 2}">selected</c:if>>音频</option>
                        <option value="3" <c:if test="${oneCategory.type == 3}">selected</c:if>>文本</option>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">所属父类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="select" size="1" name="demo1" id="cateOptions">
                        <option data-depth="0" value="0">添加一级类别</option>
                        <c:forEach items="${cateList}" var="item">
                            <option <c:if test="${oneCategory.parentid == item.id}">selected</c:if> data-depth="${item.depth}" value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </span>
            </div>
        </div>
        <div class="row cl" style="margin-top: 93px;">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont"></i> 提交</button>
            </div>
        </div>
    </form>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>
<script src="../../../statics/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript">
    $("#cateAdd").validate({
        rules:{
            name:{
                required:true
            },
            prefix:{
                required:true
            },
            projectFileType:{
                required:true
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            var name = $("#name").val();
            var parentID = $("#cateOptions").val();
            var projectFileType = $("#projectFileType").val();
            var depth = $("#cateOptions").find("option:selected").attr("data-depth");
            var prefix = $("#prefix").val();
            var type = $("#typeOption").val();
            var data={
                name:name,
                parentID:parentID,
                depth:depth,
                projectFileType:projectFileType,
                prefix:prefix,
                type:type,
                id:"${oneCategory.id}"
            }
            postData("updateCategory",data,function (res) {
                if(res.status == "1"){
                    parent.location.replace(parent.location.href)
                }else{
                    layer.msg("添加失败 T.T," + res.errmsg,{icon:5,time:3000})
                }
            })

        }
    });
</script>

</body>
</html>
