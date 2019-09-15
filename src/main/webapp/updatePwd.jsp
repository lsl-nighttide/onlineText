<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/8/27
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/profile.css">
    <style>
        .form-signin {
            max-width: 380px;
            padding: 15px 35px 8px;
            margin: 0 auto;
            background-color: #fff;
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
            margin-bottom: 20px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body>
<div class="wrap-fluid">
    <div class="container-fluid paper-wrap bevel tlbr">
        <!-- CONTENT -->
        <!--TITLE -->
        <div class="row">
            <div id="paper-top">
                <div class="col-sm-3">
                    <h2 class="tittle-content-header">
                        <i class="icon-media-record"></i>
                        <span>Blank Page</span>
                    </h2>
                </div>
                <div class="col-sm-7">
                    <div class="devider-vertical visible-lg"></div>
                    <div class="tittle-middle-header">

                        <div class="alert">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <span class="tittle-alert entypo-info-circled"></span> Welcome back,&nbsp;
                            <strong>${user.username}!</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ TITLE -->

        <!-- BREADCRUMB -->
        <ul id="breadcrumb">
            <li>
                <span class="entypo-home"></span>
            </li>
            <li><i class="fa fa-lg fa-angle-right"></i>
            </li>
            <li>
                <a href="#" title="Sample page 1">Extra Pages</a>
            </li>
            <li><i class="fa fa-lg fa-angle-right"></i>
            </li>
            <li>
                <a href="#" title="Sample page 1">Blank Page</a>
            </li>
            <li class="pull-right">
                <div class="input-group input-widget">

                    <input style="border-radius:15px" type="text" placeholder="Search..." class="form-control">
                </div>
            </li>
        </ul>
        <div class="content-wrap">
            <div class="row">
                <div class="col-sm-12">
                    <div class="nest" style="margin: -20px 15px;">
                        <div class="title-alt">
                            <h6>修改密码</h6>
                        </div>
                        <div class="body-nest text-center">
                            <form class="form-signin" id="form" method="post">
                                <div><input type="password" class="form-control" name="password" id="password"
                                            placeholder="旧密码"/>
                                    <span id="span" style="float: right"></span></div>
                                <input type="password" class="form-control" name="newPassword" id="newPassword"
                                       placeholder="新密码"/>
                                <input type="password" class="form-control" name="confirmPwd" id="confirmPwd"
                                       placeholder="确认密码"/>
                            </form>
                            <button class="btn btn-primary btn-lg " id="check" style="width: 100px">确认</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-space"></div>
            <div id="footer">
                <div class="devider-footer-left"></div>
                <div class="time">
                    <p id="spanDate">
                    <p id="clock">
                </div>
                <div class="copyright">Make with Love
                    <span class="entypo-heart"></span>
                    <div class="devider-footer"></div>

                </div>
                <!-- / END OF FOOTER -->

            </div>
            <script type="text/javascript" src="assets/js/preloader.js"></script>
            <script type="text/javascript" src="assets/js/bootstrap.js"></script>
            <script type="text/javascript" src="assets/js/app.js"></script>
            <script type="text/javascript" src="assets/js/load.js"></script>
            <script type="text/javascript" src="assets/js/main.js"></script>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $("#password").hover(function () {
        console.log("鼠标移入");
    }, function () {
        var password = ${user.password};
        var pwd = $("#password").val();
        console.log($("#password"));
        console.log(pwd);
        if (pwd != password) {
            alert("密码错误!");
        }
    });

    $("#check").click(function () {
        var newPassword = $("#newPassword").val();
        var confirmPwd = $("#confirmPwd").val();
        var userid = ${user.userid};
       var formdata = new FormData($("#form")[0]);
        formdata.set("userid",userid);
        if (newPassword != confirmPwd) {
            alert("两次密码输入不一致!")
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/updatePwd",
            data: formdata,
            type: "post",
            processData: false,
            contentType: false,
            success: function (result) {
                console.log(result);
                if (result.msg == "成功") {
                    alert("修改密码成功!")
                }
            }
        })
    })
</script>