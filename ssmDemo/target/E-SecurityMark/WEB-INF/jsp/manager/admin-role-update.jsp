<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>修改角色 - 管理员管理</title>
</head>
<body style="background-color:#fff">
	<div class="wap-container">
		<div class="panel">
			<div class="panel-body">
				<form action="" method="post" class="form form-horizontal" id="form-admin-role-add">
				<div class="row clearfix">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
					<div class="form-controls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${role.name}" placeholder="" id="rolename" name="rolename" datatype="*4-16" nullmsg="角色名称不能为空">
					</div>
				</div>
				<div class="row clearfix">
					<label class="form-label col-xs-4 col-sm-3">功能描述：</label>
					<div class="form-controls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${role.rolecode}" placeholder="" id="rolecode" name="rolecode">
					</div>
				</div>
				<div class="row clearfix">
					<label class="form-label col-xs-4 col-sm-3">角色权限：</label>
					<div class="form-controls col-xs-8 col-sm-9">
						<c:forEach items="${permissionDtoList}" var="permission">
							<dl class="Hui-admin-permission-list">
								<dt>
									<label>
										<input type="checkbox" name="permissionInput" data-content="${permission.paction}" <c:if test="${fn:contains(permissions, permission.paction)}">checked="true" </c:if>>
										${permission.pname}</label>
								</dt>
								<dd>
									<c:forEach items="${permission.permissionList}" var="item">
										<dl class="clearfix Hui-admin-permission-list2">
											<dt style="margin-right: 30px;">
												<label class="">
													<input type="checkbox">
													${item.pname_2}</label>
											</dt>
											<dd>
												<c:forEach items="${item.permissionList2}" var="item1">
													<c:if test="${fn:contains(item1.paction_3,'add')}">
														<label class="">
															<input type="checkbox" name="permissionInput" data-content="${item1.paction_3}" <c:if test="${fn:contains(permissions, item1.paction_3) && fn:contains(item1.paction_3,'add')}">checked="true" </c:if>>添加
														</label>
													</c:if>
													<c:if test="${fn:contains(item1.paction_3,'update')}">
														<label class="">
															<input type="checkbox" name="permissionInput" data-content="${item1.paction_3}" <c:if test="${fn:contains(permissions, item1.paction_3) && fn:contains(item1.paction_3,'update')}">checked="true" </c:if>>
															修改
														</label>
													</c:if>
													<c:if test="${fn:contains(item1.paction_3,'del')}">
														<label class="">
															<input type="checkbox" name="permissionInput" data-content="${item1.paction_3}" <c:if test="${fn:contains(permissions, item1.paction_3) && fn:contains(item1.paction_3,'del')}">checked="true" </c:if>>
															删除
														</label>
													</c:if>
												</c:forEach>

												<label class="">
													<input type="checkbox" name="permissionInput" data-content="${item.paction_2}" <c:if test="${fn:contains(permissions, item.paction_2) && fn:contains(item.paction_2,'list')}">checked="true" </c:if>>
													查看</label>
											</dd>
										</dl>
									</c:forEach>
								</dd>
							</dl>
						</c:forEach>
					</div>
				</div>
				<div class="row clearfix">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
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
		$(".Hui-admin-permission-list dt input:checkbox").click(function(){
			$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
		});
		$(".Hui-admin-permission-list2 dd input:checkbox").click(function(){
			var l =$(this).parent().parent().find("input:checked").length;
			var l2=$(this).parents(".Hui-admin-permission-list").find(".Hui-admin-permission-list2 dd").find("input:checked").length;
			if($(this).prop("checked")){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
				$(this).parents(".Hui-admin-permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
			}
			else{
				if(l==0){
					$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
				}
				if(l2==0){
					$(this).parents(".Hui-admin-permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
				}
			}

		});

        $("input[name='permissionInput']:checkbox:checked").each(function(){
            $(this).parent().parent().parent().find("dt").first().find("input:checkbox").prop("checked",true);
        })

		$("#form-admin-role-add").validate({
			rules:{
                rolename:{
					required:true,
				},
			},
			onkeyup:false,
			focusCleanup:true,
			success:"valid",
			submitHandler:function(form){
                var arr=[];
                $("input[name='permissionInput']:checkbox:checked").each(function(){
                    arr.push($(this).data("content"))
                })

                var rolename = $("#rolename").val();
                var rolecode = $("#rolecode").val();
                var permissions = arr.toString();
                console.log(permissions)
                if(rolename == "" || permissions == "") {
                    layer.msg('存在必填项',{icon:7,time:2000});
                    return false;
                }

                var data={
                    permissions : JSON.stringify(arr),
                    rolename : rolename,
                    rolecode : rolecode,
                    roleid : "${role.id}"
                }
				postData("updateRole",data,function (res) {
					if(res.status == "1"){
                        parent.window.location.href="roleListForm";//刷新父窗口
					}else{
                        layer.msg('添加失败:' + res.errmsg,{icon:5,time:3000});
					}
                })
//
			}
		});
	});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
