<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/9/9
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/layer-v3.1.1/layer/layer.js"></script>
    <style>
        body {
            background: #eee !important;
        }

        .wrapper {
            margin-top: 80px;
            margin-bottom: 80px;
        }


        .content {
            max-width: 600px;
            padding: 15px 35px 45px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }


        /*
                .form-signin input[type="text"] {
                    margin-bottom: -1px;
                    border-bottom-left-radius: 0;
                    border-bottom-right-radius: 0;
                }

                .form-signin input[type="password"] {
                    margin-bottom: 10px;
                    border-top-left-radius: 0;
                    border-top-right-radius: 0;
                }*/
    </style>
</head>
<body>
<div class="wrapper">
    <div class="content">
        <form class="form-horizontal" id="form">
            <h3 class="form-signin-heading">请注册</h3>
            <div class="form-group">
                <label class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" name="username" class="form-control">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" name="password" class="form-control">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                    <input type="radio" name="sex" value="男">男
                    <input type="radio" name="sex" value="女">女
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">电话</label>
                <div class="col-sm-10">
                    <input type="email" name="phone" class="form-control">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">地址</label>
                <div class="col-sm-10">
                    <input type="text" name="address" class="form-control">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">个人简介</label>
                <div class="col-sm-10">
                    <textarea name="introduce" style="width: 435px;height: 82px"></textarea>
                    <span class="help-block"></span>
                </div>
            </div>
        </form>
        <button class="btn btn-lg btn-primary btn-block" id="register">注册</button>
    </div>
</div>
</body>
</html>
<script>
    $("#register").click(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/register",
            data: $("#form").serialize(),
            type: "get",
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                debugger;
                if (result.msg == '成功') {
                    layer.msg("注册成功", {shift: -1}, function () {
                        location.href = "${pageContext.request.contextPath}/login.jsp";
                    })
                } else {
                    layer.alert("注册失败")
                }

            }
        })
    })
</script>