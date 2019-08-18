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
    <title>添加权限节点</title>
</head>
<body style="min-height: 0px;">
<div class="codeView docs-example">
    <form onsubmit="return false;" class="form form-horizontal" id="permissionAdd">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">权限名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="权限名称" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">权限代码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input id="action" name="action" type="text" class="input-text" placeholder="格式(全英文)：'权限所属功能模块_权限操作'，如：admin_add">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">节点父类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="select" size="1" name="demo1" id="permissionOptions">
                        <option data-depth="0" value="0">添加一级节点</option>
                        <c:forEach items="${permissionList}" var="permission">
                            <option data-depth="${permission.depth}" value="${permission.pid}">${permission.name}</option>
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
    $("#permissionAdd").validate({
        rules:{
            name:{
                required:true
            },
            action:{
                required:true
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            var name = $("#name").val();
            var action = $("#action").val();

            if("menu,list,add,update,del".indexOf(action.split("_")[1]) == -1){
                layer.msg("权限代码不符合规范，格式(全英文)：'如：admin_add",{icon:5,time:3000})
                return;
            }

            var parentID = $("#permissionOptions").val();
            var depth=$("#permissionOptions").find("option:selected").attr("data-depth");
            var data={
                name:name,
                action:action,
                parentID:parentID,
                depth:depth
            }
            postData("addPermission",data,function (res) {
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
