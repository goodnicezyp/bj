<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>修改兴趣 - 兴趣管理</title>
</head>
<body style="background-color:#fff">
	<div class="wap-container">
		<div class="panel">
			<div class="panel-body">
				<form onsubmit="return false;" class="form form-horizontal" id="form-member-add">
					<div class="row clearfix">
						<label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>兴趣名称：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${interest.title}" placeholder="兴趣名称" id="title" name="title">
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<jsp:include page="common/foot.jsp"></jsp:include>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script src="../../../statics/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript" src="../../../statics/lib/jquery.validation/1.14.0/additional-methods.js"></script>
	<script type="text/javascript" src="../../../statics/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
		$(function(){


			/* 表单验证，提交 */
			$("#form-member-add").validate({
				rules:{
                    title:{
						required:true,
						maxlength:10
					}
				},
				onkeyup:false,
				focusCleanup:true,
				success:"valid",
				submitHandler:function(form){
                    var title = $("#title").val();

                    var data={
                        title : title,
						id:"${interest.id}"
                    }
                    postData("updateInterest",data,function (res) {
                        if(res.status == "1"){
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.location.replace(parent.location.href)
                            parent.layer.close(index);
                        }else{
                            layer.msg('修改失败:' + res.errmsg,{icon:5,time:3000});
                        }
                    })


				}
			});
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
