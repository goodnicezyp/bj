<%--
  Created by IntelliJ IDEA.
  User: will
  Date: 2015/10/19
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>E防标后台管理系统 - 登录</title>

    <%--<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- bootstrap -->
    <link href="../../statics/common/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="../../statics/common/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" />
    <link href="../../statics/common/bootstrap/css/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="../../statics/common/bootstrap/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="../../statics/common/bootstrap/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="../../statics/common/bootstrap/css/icons.css" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="../../statics/css/signin.css" type="text/css" media="screen" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        h7{
            color: red;
        }
    </style>
</head>
<body style="background-image: url(../../statics/img/10.jpg); padding-top: 90px;">




<div class="row-fluid login-wrapper">
    <a href="adminLoginForm.do">
        <img class="logo" src="../../statics/img/logo-white.png" />
    </a>

    <div class="span4 box">
        <div class="content-wrap">
            <h6>登录</h6>
            <div>
                <h7>未登录无法进行此操作，请您登陆后操作！</h7>
            </div>
            <form id="userform" name="userform" onsubmit="return false;">
                <input id="name" name="name" class="span12" type="text" placeholder="管理员名称" onKeyPress="JumpByEnter(UserPwd)" />
                <input id="pwd" name="pwd" class="span12" type="password" placeholder="密码" />
                <input type="submit" name="button" id="button" class="btn-glow primary login" value="登录" onKeyPress="IsEnterKeyPress()"/>
            </form>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="../../statics/lib/jquery/1.9.1/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../../statics/common/bootstrap/js/bootstrap.min.js"></script>
<script src="../../statics/common/js/theme.js"></script>
<!--[if lt IE 9] -->
<script src="../../statics/common/js/html5.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        $("#button").focus();
    });
    function JumpByEnter(NextElement) {
        var lKeyCode = (navigator.appname == "Netscape") ? event.which : window.event.keyCode; //event.keyCode按的建的代码，13表示回车
        if (lKeyCode == 13) {

            NextElement.focus();
        }
    }

    function IsEnterKeyPress(){
        var lKeyCode = (navigator.appname=="Netscape")?event.which:event.keyCode;
        if ( lKeyCode == 13 ){
            Login();
        }
        else
            return false;
    }


    $(".login").click(function () {
        Login();
    })

    function Login() {
        var name = $("#name").val();
        var pwd = $("#pwd").val();

        if(name == "" || pwd == ""){
            $(".loginMsg").find('h7').text("请填写账号或者密码！");
            $(".loginMsg").attr('style','display:block;');
        }else{
            var data = {
                name:name,
                pwd:pwd
            }
            $.ajax({
                url: "/adminLogin.do",
                data: data,
                traditional: true,
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if(res.status != "1"){
                        $(".loginMsg").find('h7').text(res.errmsg);
                        $(".loginMsg").attr('style','display:block;');
                    }else{
                        window.location.href = "admin/main";
                    }
                },
                //设置ajax请求结束后的执行动作
                complete : function(XMLHttpRequest, textStatus) {
                    if(XMLHttpRequest.status != 200){
                        $(".loginMsg").find('h7').text("系统繁忙!请稍后再试！");
                        $(".loginMsg").attr('style','display:block;');
                    }
                }
            })
        }
    }
</script>

</body>
</html>
