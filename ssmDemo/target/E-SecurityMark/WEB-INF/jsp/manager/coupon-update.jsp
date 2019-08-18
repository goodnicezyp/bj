<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>修改代金券 - 代金券管理</title>
</head>
<body style="background-color:#fff">
	<div class="wap-container">
		<div class="panel">
			<div class="panel-body">
				<form onsubmit="return false;" class="form form-horizontal" id="form-member-add">
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>代金券名称：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${coupon.title}" placeholder="代金券名称" id="title" name="title">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>优惠金额：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<input type="text" class="input-text" autocomplete="off" value="${coupon.price}" placeholder="优惠金额" id="price" name="price">
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<span class="select-box" style="width:150px;">
								<select class="select" name="type" size="1" id="type">
									<option value="0" <c:if test="${coupon.type == 0}">selected</c:if> > 平台代金券</option>
									<option value="1" <c:if test="${coupon.type == 1}">selected</c:if> >线下维权代金券</option>
								</select>
							</span>
						</div>
					</div>
					<div class="row clearfix">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否限时：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<span class="select-box" style="width:150px;">
								<select class="select" name="type" size="1" id="date_flag">
									<option value="0" <c:if test="${coupon.date_flag == 0}">selected</c:if>>不限时</option>
									<option value="1" <c:if test="${coupon.date_flag == 1}">selected</c:if>>统一限时</option>
									<option value="2" <c:if test="${coupon.date_flag == 2}">selected</c:if>>获得限时</option>
								</select>
							</span>
						</div>
					</div>

					<div class="time" style="display: none;">
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>开始时间：</label>
							<div class="formControls col-xs-8 col-sm-2">
								<input type="text" value="<fmt:formatDate value='${coupon.start_time}' pattern='yyyy-MM-dd HH:mm'/>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm' })" id="logmin" class="input-text Wdate datetimeStart" style="width:150px;">
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>截止时间：</label>
							<div class="formControls col-xs-8 col-sm-2">
								<input type="text" value="<fmt:formatDate value='${coupon.end_time}' pattern='yyyy-MM-dd HH:mm'/>" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'logmin\')}',dateFmt:'yyyy-MM-dd HH:mm' })" id="logmax" class="input-text Wdate datetimeEnd" style="width:150px;">
							</div>
						</div>
					</div>

					<div class="day" style="display: none;">
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>有效天数：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input id="day_num" value="${coupon.day_num}" class="proNum input-text" placeholder="领到券后N天内有效" type="text">
							</div>
						</div>
					</div>

					<div class="row clearfix" style="display: none;">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>系统优惠券：</label>
						<div class="form-controls col-xs-8 col-sm-9">
							<div class="switch" id="authority" data-on="success" data-off="warning" data-on-label="是" data-off-label="否">
								<input type="checkbox" />
							</div>
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
	<script type="text/javascript" src="../../../statics/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript">
        $(document).ready(function(){
            if("${coupon.date_flag}"== 1){
                $(".time").show();
            }else if("${coupon.date_flag}"== 2){
                $(".day").show();
            }
        });

		$(function(){
			/* 表单验证，提交 */
			$("#form-member-add").validate({
				rules:{
                    title:{
						required:true,
						maxlength:10
					},
                    price:{
						required:true,
                        number:true,
						min:1
					}
				},
				onkeyup:false,
				focusCleanup:true,
				success:"valid",
				submitHandler:function(form){
                    var title = $("#title").val();
                    var price = $("#price").val();
                    var type = $('#type').val();
                    var date_flag = $('#date_flag').val();
                    var datetimeStart = $('.datetimeStart').val();
                    var datetimeEnd = $('.datetimeEnd').val();
                    var day_num = $('#day_num').val();
//                    var authority = $('#authority').find("input").is(":checked");
//                    if(authority){
//                        authority = 1;
//					}else{
//                        authority = 0;
//					}

					if(date_flag == 1){
					    if(datetimeStart == '' || datetimeEnd == ''){
                            layer.msg('请选择时间段',{icon:7,time:2000});
					        return;
						}
					}
					if(date_flag == 2){
					    if(day_num <= 0){
                            layer.msg('请填写大于0的有效天数',{icon:7,time:2000});
                            return;
						}
					}
                    var data={
					    id:"${coupon.id}",
                        title : title,
                        price : price,
                        type : type,
                        date_flag:date_flag,
                        start_time:datetimeStart,
                        end_time:datetimeEnd,
                        day_num:day_num
                    }
                    postData("updateCoupon",data,function (res) {
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


        $('#authority').on('switch-change', function (e, data) {
            var authority = $('#authority').find("input").is(":checked");
            if(authority){
                alert("系统券！")
			}
        });

        $("#date_flag").change(function () {
            var type = $("#date_flag").val();
            if(type == 0){
                $(".time").hide();
                $(".day").hide();
            }else if(type == 1){
                $(".time").show();
                $(".day").hide();
            }else{
                $(".time").hide();
                $(".day").show();
            }
        })
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
