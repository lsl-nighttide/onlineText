<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/8/21
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <style>
        body {
            background: #eee !important;
        }

        .wrapper {
            margin-top: 80px;
            margin-bottom: 80px;
        }

        .form-signin {
            max-width: 380px;
            padding: 15px 35px 45px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .form-signin .form-signin-heading {
            margin-bottom: 30px;
        }

        .form-signin .form-control {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <form class="form-signin" id="form"  action="login" >
        <h3 class="form-signin-heading">请登录</h3>
        <div><input type="text" class="form-control" name="username" id="username" placeholder="用户名"
                   />
            <span id="span" style="float: right"></span></div>
        <input type="password" class="form-control" name="password" id="password" placeholder="密码" />
        <a href="register.jsp" style="margin-bottom: 10px" ><span>没有用户，点这里</span></a>
        <button class="btn btn-lg btn-primary btn-block" id="mylogin" >登录</button>
    </form>
</div>
</body>
</html>


