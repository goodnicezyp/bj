<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="../../../../statics/img/favicon.ico" >
    <link rel="icon" type="image/x-icon" href="../../../../statics/img/favicon.ico"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../../../statics/lib/html5shiv.js"></script>
    <script type="text/javascript" src="../../../../statics/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../../../../statics/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../../../statics/h-ui.admin.pro.iframe/css/h-ui.admin.pro.iframe.min.css" />
    <link rel="stylesheet" type="text/css" href="../../../../statics/lib/Hui-iconfont/1.0.9/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="../../../../statics/h-ui.admin.pro.iframe/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../../../../statics/business/css/style.css" />
    <style>
        .table>tbody>tr>td{
            text-align:center;
        }
    </style>
<shiro:notAuthenticated>
    <script>
        window.parent.parent.location.href="/adminLoginForm"
    </script>
</shiro:notAuthenticated>


