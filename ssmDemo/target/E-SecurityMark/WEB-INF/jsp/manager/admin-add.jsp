<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>添加管理员 - 管理员管理</title>
</head>
<body style="background-color:#fff">
	<div class="wap-container">
		<div class="panel">
			<div class="panel-body">
				<form onsubmit="return false;" class="form form-horizontal" id="form-admin-add">
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="password" class="input-text" autocomplete="off" value="" placeholder="密码" id="password" name="password">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="password" class="input-text" autocomplete="off"  placeholder="确认新密码" id="password2" name="password2">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
						<div class="form-controls col-xs-8 col-sm-9 skin-minimal">
							<div class="radio-box">
								<input name="sex" type="radio" id="sex-1" checked value="0">
								<label for="sex-1">男</label>
							</div>
							<div class="radio-box">
								<input type="radio" id="sex-2" name="sex" value="1">
								<label for="sex-2">女</label>
							</div>
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="" placeholder="" id="phone" name="phone">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="text" class="input-text" placeholder="@" name="email" id="email">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3">角色：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<span class="select-box" style="width:150px;">
								<select class="select" name="adminRole" size="1" id="roleOptions">
									<c:forEach items="${roleList}" var="role">
										<option value="${role.id}">${role.name}</option>
									</c:forEach>
								</select>
							</span>
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3">备注：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<textarea name="remarks" cols="" id="desc" rows="" class="textarea"  placeholder="说点什么...100个字符以内" dragonfly="true" onKeyUp="textarealength(this,100)"></textarea>
							<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
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
			/* 通过iCheck插件，美化checkbox */
			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});

			/* 表单验证，提交 */
			$("#form-admin-add").validate({
				rules:{
					adminName:{
						required:true,
						maxlength:16
					},
					password:{
						required:true,
					},
					password2:{
						required:true,
						equalTo: "#password"
					},
					sex:{
						required:true
					},
					phone:{
						required:false,
						isPhone:true
					},
					email:{
						required:false,
						email:true
					},
					adminRole:{
						required:true
					},
					remarks: {
						maxlength: 100
					}
				},
				onkeyup:false,
				focusCleanup:true,
				success:"valid",
				submitHandler:function(form){
                    var roleid = $("#roleOptions").val();
                    var confirmpwd = $("#password").val();
                    var adminname = $("#adminName").val();
                    var phone = $("#phone").val();
                    var email = $("#email").val();
                    var desc = $("#desc").val();
                    var sex = $('input[name="sex"]:checked').val();

                    var data={
                        roleid : roleid,
                        pwd : confirmpwd,
                        adminname : adminname,
                        phone:phone,
                        email:email,
                        desc:desc,
                        sex:sex
                    }
                    postData("addAdmin",data,function (res) {
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
