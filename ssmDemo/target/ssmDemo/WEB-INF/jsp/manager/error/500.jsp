<%@page import="java.io.PrintStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="../../../../statics/lib/html5shiv.js"></script>
<script type="text/javascript" src="../../../../statics/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../../../../statics/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../../../../statics/h-ui.admin.pro.iframe/css/h-ui.admin.pro.iframe.min.css" />
<link rel="stylesheet" type="text/css" href="../../../../statics/lib/Hui-iconfont/1.0.9/iconfont.css" />
<title>500页面</title>
</head>
<body  style="background-color:#fff">
	<div class="page-error text-c">
		<p class="error-title"><i class="Hui-iconfont va-m">&#xe65b;</i>
			<span class="va-m"> 500</span>
		</p>
		<p class="error-description">抱歉，服务器出错了~</p>
		<p class="error-description">
			<div style="max-width: 1000px;text-align: left;white-space: pre-wrap;margin: 0 auto;">
				<%  //此处输出异常信息
					exception.printStackTrace();
					out.print(exception.getMessage());
				%>
			</div>
		</p>

	</div>
</body>
</html>