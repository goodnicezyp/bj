<%--
  Created by IntelliJ IDEA.
  User: Clarence
  Date: 2019/5/23
  Time: 14:33
--%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录页面</title>
</head>
<script type="text/javascript" src="/static/jquery-1.7.2.min.js"></script>
<body>
<h1>Login Page</h1>
<form action="${pageContext.request.contextPath }/login">
    username: <input type="text" name="username"><br /> <br />
    password: <input type="password" name="password"><br /> <br />
    <input type="submit" value="登录">
</form>
<br />
<fb:login-button scope="public_profile,email"
                 onlogin="checkLoginState();"
                 auto_logout_link="true"
                 size="large"
                 show_faces="true">
</fb:login-button>

<div id="status"></div>

<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        if (response.status === 'connected') {
            //到此代表用户登录成功
            //跳转到http://gntina.iok.la/code(参见我后台代码的路径)
            location.href = "发送重定向的地址";
        } else {
            document.getElementById('status').innerHTML = 'Please log '
                + 'into this app.';
        }
    }

    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId : '应用编号',
            cookie : true, // enable cookies to allow the server to access
            xfbml : true, // parse social plugins on this page
            version : 'v2.8' // use graph api version 2.8
        });

        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
</body>
</html>
