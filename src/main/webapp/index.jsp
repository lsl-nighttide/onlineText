<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/9/2
  Time: 9:24
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
            line-height: 20px;
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

        .dropdown-toggle {
            color: white;
        }

        .carousel-inner .item img {
            margin: 0 auto;
        }

        .tab1 {
            width: 95%;
            margin: 30px auto;
            text-align: center;
            background-color: #EEEEEE;
            font-weight: bold;
            /*color: black;*/
        }

        .item-box > li {
            width: 230px;
            height: 200px;
            background-color: #f8f8f8;
            float: left;
            list-style: none;
            margin: 10px 20px;
        }

        .item-box-li > h3 {
            font-size: 15px;
            text-align: center;
            color: #666;
            vertical-align: middle;
        }

        .li-pic {
            height: 100px;
            width: 100px;
            float: none;
            margin-top: 10px;
            background-color: #EEEEEE;
        }

        .item-content > li {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            list-style: none;
            float: left;
            margin: 10px 30px;
        }

        #footer {
            width: 95%;
            margin: 20px auto 0 auto;
            padding: 20px;
            text-align: center;
            background-color: #666666;
            color: white;
            border-top: 1px solid #ccc;
            position: unset;
        }

        .navbar-center > li {
            margin-top: 10px;
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
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
    <!-- 轮播图的中的小点 -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>
    <!-- 轮播图的轮播图片 -->
    <div class="carousel-inner" role="listbox">
        <div class="item active" style="height: 400px">
            <img src="assets/img/picture3.png" style="width: 95%">
            <%--							<div class="carousel-caption">--%>
            <%--								<!-- 轮播图上的文字 -->--%>
            <%--                                <img src="${pageContext.request.contextPath}/image/泪奔w.png">--%>
            <%--							</div>--%>
        </div>
        <div class="item" style="height: 400px">
            <img src="assets/img/picture4.jpg" style="width:95%">
            <%--							<div class="carousel-caption">--%>
            <%--								<!-- 轮播图上的文字 -->--%>
            <%--                                <img src="${pageContext.request.contextPath}/image/泪奔w.png">--%>
            <%--							</div>--%>
        </div>
        <div class="item" style="height: 400px">
            <img src="assets/img/picture5.jpg" style="width:95%">
            <%--<div class="carousel-caption">
                <!-- 轮播图上的文字 -->
                <img src="${pageContext.request.contextPath}/image/泪奔w.png">
            </div>--%>
        </div>
    </div>

    <!-- 上一张 下一张按钮 -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="tab1">
    <div class="container">
        <h2 class="tab-h2">专项练习</h2>
        <p class="tab-p">针对薄弱知识点进行专项练习
        </p>
        <ul class="item-box clearfix">
            <li>
                <a class="item-box-li" href="#">
                    <h3>java专项练习</h3>
                    <img src="assets/img/java.png" class="li-pic img-circle">
                </a>
            </li>
            <li>
                <a class="item-box-li" href="#">
                    <h3>javascript专项练习</h3>
                    <img src="assets/img/javascript.jpg" class="li-pic img-circle">
                </a>
            </li>
            <li>
                <a class="item-box-li" href="#">
                    <h3>java专项练习</h3>
                    <img src="assets/img/java.png" class="li-pic img-circle">
                </a>
            </li>
            <li>
                <a class="item-box-li" href="#">
                    <h3>javascript专项练习</h3>
                    <img src="assets/img/javascript.jpg" class="li-pic img-circle">
                </a>
            </li>
            <li>
                <a class="item-box-li" href="#">
                    <h3>java专项练习</h3>
                    <img src="assets/img/java.png" class="li-pic img-circle">
                </a>
            </li>
            <li>
                <a class="item-box-li" href="#">
                    <h3>javascript专项练习</h3>
                    <img src="assets/img/javascript.jpg" class="li-pic img-circle">
                </a>
            </li>
            <li>
                <a class="item-box-li" href="#">
                    <h3>java专项练习</h3>
                    <img src="assets/img/java.png" class="li-pic img-circle">
                </a>
            </li>
            <li>
                <a class="item-box-li" href="#">
                    <h3>javascript专项练习</h3>
                    <img src="assets/img/javascript.jpg" class="li-pic img-circle">
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="tab1">
    <div class="container">
        <h2 class="tab-h2">课程培训</h2>
        <p class="tab-p">系统性对学生进行培训
        </p>
        <ul class="item-content clearfix">
            <li>
                <a href="#" class="item-box-li">
                    <img src="assets/img/java.png" class="li-pic img-circle">
                    <h3>java课程学习</h3>
                </a>
            </li>
            <li>
                <a href="#" class="item-box-li">
                    <img src="assets/img/vue.png" class="li-pic img-circle">
                    <h3>vue课程学习</h3>
                </a>
            </li>
            <li>
                <a href="#" class="item-box-li">
                    <img src="assets/img/bootstrap.jpg" class="li-pic img-circle">
                    <h3>bootstrap课程学习</h3>
                </a>
            </li>
            <li>
                <a href="#" class="item-box-li">
                    <img src="assets/img/python.jpg" class="li-pic img-circle">
                    <h3>python课程学习</h3>
                </a>
            </li>
        </ul>
    </div>
</div>
<footer id="footer">
    <div class="container">
        <p>专项练习 | 课程学习
        </p>
        <p>赣 ICP 备 12345678. © 2019-2039 易考网.
        </p>
    </div>
</footer>
<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>
<script type="text/javascript" src="assets/js/layer-v3.1.1/layer/layer.js"></script>
</body>
</html>
<script>
    var text = "";
    var img_src = "assets/img/public.png";
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/isLogin",
            type: "get",
            success: function (result) {
                console.log(result);
                if (result.msg == "成功") {
                    console.log("1111");
                    img_src = "assets/img/" + result.map.user.pic;
                    $("#b").addClass("caret");
                    $(".admin-pic").attr("src", img_src);
                    $("#login").hide();
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
    console.log($(".item-content").find("li"));
    $(".item-content").find("img").hover(function () {
        $(this).animate({
            "padding": "10px 10px"
        }, 1000, function () {
        })
    }, function () {
        $(this).animate({
            "padding": "0 0 "
        }, 1000, function () {
        })
    })

</script>