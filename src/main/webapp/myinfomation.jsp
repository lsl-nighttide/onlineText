<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/9/3
  Time: 9:58
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
        body {
            /* background: none;
             background-color:lightskyblue;*/
            min-height: 100%;
            z-index: -2;
            background: url('assets/img/bg2.jpg') no-repeat top center fixed;
            -moz-background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        nav {
            margin: 0 100px;
        }

        .content-wrap {
            background-color: #EEEEEE;
            width: 95%;
            margin: 30px auto;
        }

        .list-left {
            list-style: none;
            background-color: #f8f8f8;
            margin-top: 15px;
            padding: 0;
        }

        .list-left-a {
            color: black;
            display: block;
        }

        .list-left > li {
            line-height: 50px;
            font-size: 14px;
        }

        .icon-style {
            margin: 0 25px;
        }

        .icon-chevron-right {
            margin-top: 18px;
        }

        .select {
            color: #666;
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<nav role="navigation" class="navbar navbar-static-top">
    <div class="container-fluid">
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
            <a href="index.jsp" class="pull-left"><img style="width: 200px;height: 40px;"></a>
            <ul style="margin-left: 0" class="nav navbar-nav navbar-left">
                <li class="active">
                    <a href="index.jsp">首页</a>
                </li>
                <li>
                    <a href="special_practice.jsp">专项练习</a>
                </li>
                <li>
                    <a href="">课程学习</a>
                </li>
            </ul>
            <ul style="margin-right:0;" class="nav navbar-nav navbar-right">
                <li>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <img alt="" class="admin-pic img-circle"
                             src="assets/img/public.png">${user.username}<b
                            class="caret" id="b"></b>
                    </a>

                    <ul style="margin-top:14px;" role="menu" class="dropdown-setting dropdown-menu">
                        <li>
                            <a href="myinfomation.jsp">
                                <span class="entypo-user"></span>&#160;&#160;个人信息</a>
                        </li>
                        <li style="display: none;" id="backstage">
                            <a href="backStage.jsp">
                                <span class="entypo-window"></span>&#160;&#160;后台</a>
                        </li>
                        <li>
                            <a href="lock-screen.jsp">
                                <span class="entypo-lock"></span>&#160;&#160;锁屏</a>
                        </li>
                        <li>
                            <a href="logout">
                                <span class="entypo-logout"></span>&#160;&#160;退出登录</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <button class="btn btn-warning" id="login" style="margin-top: 10px">登录/注册</button>
                </li>
            </ul>

        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<div class="content-wrap">
    <div class="row">
        <div class="col-sm-3">
            <ul class="list-left">
                <%--                <li><a href="#" class="list-left-a">--%>
                <%--                    <i class="icon-home icon-style"></i>首页<i class="icon-chevron-right pull-right"></i></a></li>--%>
                <li><a href="#" class="list-left-a" id="exercise"><i class="icon-document-edit icon-style"></i>刷题<i
                        class="icon-chevron-right pull-right"></i></a></li>
                <li><a href="#" class="list-left-a" id="collection_ques"><i class="icon-star icon-style"></i>收藏<i
                        class="icon-chevron-right pull-right"></i></a>
                </li>
                <li><a href="#" class="list-left-a" id="infomation"><i class="icon-user icon-style"></i>个人资料<i
                        class="icon-chevron-right pull-right"></i></a></li>
                <li><a href="#" class="list-left-a" id="wrongset"><i class="icon-document icon-style"></i>错题集<i
                        class="icon-chevron-right pull-right"></i></a></li>
                <li><a href="#" class="list-left-a" id="updatePwd"><i class="icon-camera icon-style"></i>修改密码<i
                        class="icon-chevron-right pull-right"></i></a></li>
            </ul>
        </div>
        <div class="col-sm-9">
            <iframe src="infomation.jsp" width="100%" frameborder="0" scrolling="no" id="myiframe"
                    style="margin:15px 0"></iframe>
        </div>
    </div>
</div>
<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>
</body>
</html>
<script>
    var text = "";
    var img_src = "assets/img/public.png";
    var user;
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/isLogin",
            type: "get",
            success: function (result) {
                console.log(result);
                if (result.msg == "成功") {
                    console.log("1111");
                    user = result.map.user;
                    img_src = "assets/img/" + user.pic;
                    $("#b").addClass("caret");
                    $(".admin-pic").attr("src", img_src);
                    $("#login").hide();
                    if (user.permissions > 0) {
                        $("#backstage").show();
                    }
                } else {
                    console.log("2222");
                    $("#b").removeClass("caret");
                    $("#login").show();
                }
            }
        });
    });
    $("#login").click(function () {
        location.href = "${pageContext.request.contextPath}/login.jsp"
    });
    $(".list-left-a").hover(function () {
            $(this).addClass("select");
            $(this).siblings().removeClass("select");
        }, function () {
            $(this).removeClass("select");
        }
    );


    function reinitIframe() {
        var iframe = document.getElementById("myiframe");
        try {
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            iframe.height = height;
        } catch (ex) {
        }
    }

    window.setInterval("reinitIframe()", 20);
    $("#exercise").click(function () {
        $("#myiframe").attr("src", "exercise.jsp")
    });
    $("#collection_ques").click(function () {
        $("#myiframe").attr("src", "collection.jsp")
    });
    $("#infomation").click(function () {
        $("#myiframe").attr("src", "infomation.jsp")
    })
    $("#wrongset").click(function () {
        $("#myiframe").attr("src", "wrongset.jsp")
    })
    $("#updatePwd").click(function () {
        $("#myiframe").attr("src", "updatePwd.jsp")
    })
</script>