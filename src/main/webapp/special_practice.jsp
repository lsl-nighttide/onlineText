<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/9/3
  Time: 21:40
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

        .content-wrap {
            width: 95%;
            margin: 20px auto;
            background-color: #EEEEEE;
            height: 700px;
        }

        .options {
            width: 90%;
            margin: 0 auto;
            padding-top: 10px;
            background-color: #f8f8f8;
        }

        /*    #form > input {
                margin-left: 20%;
            }*/
        .table > tbody > tr > td {
            border: none;
        }

        .button > button {
            margin: 0 10px 10px 0;
        }

        h4 {
            padding: 10px 0 0 10px;
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
    </style>
</head>
<body>
<nav role="navigation" class="navbar navbar-static-top">
    <div class="container-fluid">
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
            <a href="index.jsp" class="pull-left"><img style="width: 200px;height: 40px;"></a>
            <ul style="margin-left: 0" class="nav navbar-nav navbar-left">
                <li>
                    <a href="index.jsp">首页</a>
                </li>
                <li class="active">
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
<div class="content-wrap">
    <div style="padding-top: 70px">友情提示,由于现今题库不全，所以只开放以下选项(如需测试，请选择java或javascript)</div>
    <div class="options">
        <form id="form">
            <div style="background-color: #EEEEEE;margin: 20px auto;width:90%;">
                <h4>编程语言</h4>

                <table class="table" border="0">
                    <tr>
                        <td><input type="checkbox" name="major" value="java">java</td>
                        <td><input type="checkbox" name="major" value="html5">html5</td>
                        <td><input type="checkbox" name="major" value="javascript">javascript</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="major" value="jquery"> jquery</td>
                        <td><input type="checkbox" name="major" value="bootstrap3">bootstrap3</td>
                        <td><input type="checkbox" name="major" value="vue">vue</td>
                    </tr>
                </table>

            </div>
            <div style="background-color: #EEEEEE;margin: 20px auto;width:90%;">
                <h4>编程语言</h4>

                <table class="table" border="0">
                    <tr>
                        <td><input type="checkbox" name="major" value="java">java</td>
                        <td><input type="checkbox" name="major" value="html5">html5</td>
                        <td><input type="checkbox" name="major" value="javascript">javascript</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="major" value="jquery"> jquery</td>
                        <td><input type="checkbox" name="major" value="bootstrap3">bootstrap3</td>
                        <td><input type="checkbox" name="major" value="vue">vue</td>
                    </tr>
                </table>

            </div>
            <div style="background-color: #EEEEEE;margin: 20px auto;width:90%;">
                <h4>编程语言</h4>

                <table class="table" border="0">
                    <tr>
                        <td><input type="checkbox" name="major" value="java">java</td>
                        <td><input type="checkbox" name="major" value="html5">html5</td>
                        <td><input type="checkbox" name="major" value="javascript">javascript</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="major" value="jquery"> jquery</td>
                        <td><input type="checkbox" name="major" value="bootstrap3">bootstrap3</td>
                        <td><input type="checkbox" name="major" value="vue">vue</td>
                    </tr>
                </table>

            </div>
        </form>
        <div class="button text-center">
            <button class="btn" id="confirm_btn">确定</button>
            <button class="btn" id="cancel_btn">重置</button>
        </div>
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
</body>
</html>
<script>
    var arr = new Array();
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
    // 鼠标移入事件
    $("#confirm_btn").mouseenter(function () {
        console.log($("input"));
        arr = new Array();
        $("input[name='major']").each(function (index, item) {
            if (item.checked)
                arr.push(item.value)
        });
        console.log(arr);
    });
    $("#confirm_btn").click(function () {
        console.log(arr);
        $.ajax({
            url:"${pageContext.request.contextPath}/special_practise",
            data:"arr="+arr,
            type:"post",
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            success:function (result) {

                if(result.msg == "成功"){
                    alert("我成功啦！");
                location.href = "${pageContext.request.contextPath}/exam.jsp";
                }
                else
                    alert("请选择所要练习的项目");
            }
        })
    })
</script>