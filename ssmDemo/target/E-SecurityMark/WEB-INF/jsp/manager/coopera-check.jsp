<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="common/head.jsp"></jsp:include>
	<title>合作详情</title>

</head>
<body>
<div class="wap-container">
	<div class="panel">
		<div class="panel-body">
			<form onsubmit="return false;" class="form form-horizontal" id="form-admin-add">
				<div class="row clearfix">
					<label class="form-label col-xs-4 col-sm-3">标题：</label>
					<div class="form-controls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${cooperation.title}" placeholder="" readonly>
					</div>
				</div>
				<div class="row clearfix">
					<label class="form-label col-xs-4 col-sm-3">内容：</label>
					<div class="form-controls col-xs-8 col-sm-9">
						<textarea name="remarks" style="height: 300px;"  rows="" class="textarea" readonly>${cooperation.content}</textarea>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<jsp:include page="common/foot.jsp"></jsp:include>
</body>
</html>
