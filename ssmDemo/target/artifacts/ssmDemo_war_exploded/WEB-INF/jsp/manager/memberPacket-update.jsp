<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>修改会员套餐 - 会员套餐管理</title>
</head>
<body style="background-color:#fff">
	<div class="wap-container">
		<div class="panel">
			<div class="panel-body">
				<form onsubmit="return false;" class="form form-horizontal" id="form-member-update">
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>套餐名称：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${memberPacket.title}" placeholder="套餐名称" id="title" name="title">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>套餐价格：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="text" class="input-text" autocomplete="off" value="${memberPacket.price}" placeholder="套餐价格" id="price" name="price">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>期限(月份)：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<span class="select-box" style="width:150px;">
								<select class="select" name="monthNum" size="1" id="monthNum">
									<c:set var="num" value="48"></c:set>
									<c:forEach begin="1" end="${num}" varStatus="idx">
										<option <c:if test="${idx.index == memberPacket.monthNum}"> selected</c:if> value="${idx.index}">${idx.index}</option>
									</c:forEach>
								</select>
							</span>
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>会员类型：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<span class="select-box" style="width:150px;">
								<select class="select" name="memberid" size="1" id="memberid">
									<option value="1" <c:if test="${memberPacket.memberid==1}">selected</c:if>>会员1</option>
									<option value="2"  <c:if test="${memberPacket.memberid==2}">selected</c:if>>会员2</option>
								</select>
							</span>
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
			$("#form-member-update").validate({
				rules:{
                    title:{
						required:true,
						maxlength:10
					},
                    price:{
						required:true,
                        number:true,
						min:1
					},
                    monthNum:{
                        required:true
					},
                    memberid:{
						required:true
					}
				},
				onkeyup:false,
				focusCleanup:true,
				success:"valid",
				submitHandler:function(form){
                    var title = $("#title").val();
                    var price = $("#price").val();
                    var monthNum = $('#monthNum').val();
                    var memberid = $('#memberid').val();

                    var data={
                        title : title,
                        price : price,
                        monthNum : monthNum,
                        memberid:memberid,
						id:"${memberPacket.id}"
                    }
                    postData("updateMemberPacket",data,function (res) {
                        if(res.status == "1"){
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.location.replace(parent.location.href)
                            parent.layer.close(index);
                        }else{
                            layer.msg('添加失败:' + res.errmsg,{icon:5,time:3000});
                        }
                    })


				}
			});
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
