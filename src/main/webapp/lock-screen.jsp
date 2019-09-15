<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/8/30
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="assets/js/jquery.min.js"></script>

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/signin.css">
    <link rel="stylesheet" href="assets/css/extra-pages.css">
    <style>
        body {
            overflow: hidden !important;
            padding-top: 120px;
        }
    </style>
</head>
<body id="lock">
<!-- Preloader -->
<%--<div id="preloader">
    <div id="status">&nbsp;</div>
</div>--%>


<!-- Main content -->
<section class="page-error">

    <div class="headline-lock text-center" id="time">
        <span></span>
        <!-- Time auto generated by js -->
    </div>
    <!-- /.headline -->
    <div class="auto">

    </div>
    <!-- User name -->
    <!-- START LOCK SCREEN ITEM -->
    <div class="lockscreen-item">
        <!-- lockscreen credentials (contains the form) -->
        <div class="lockscreen-credentials">

            <div class="input-group">
                <input type="password" class="form-control" placeholder="password">
                <div class="input-group-btn">
                    <button class="btn btn-flat"><i class="fa fa-arrow-right text-muted" id="lock_btn"></i>
                    </button>
                </div>
            </div>
        </div>
        <!-- /.lockscreen credentials -->

    </div>

    <!-- /.lockscreen-item -->

    <div class="lockscreen-link">
        <a class="lock-link" href="logout">Or sign in as a different user</a>
    </div>

</section>

<!--  END OF PAPER WRAP -->
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>
</body>
</html>
<script>
    var userid = ${user.userid};
    var user;
    $(function () {
        startTime();
        /*        $(".center").center();
                $(window).resize(function() {
                    $(".center").center();
                });*/
        $.ajax({
            url: "${pageContext.request.contextPath}/getuser",
            data: "userid=" + userid,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                user = result.map.user;
                build_page(user);
            }
        })
    });

    /*  */

    function startTime() {
        var today = new Date();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();

        // add a zero in front of numbers<10
        m = checkTime(m);
        s = checkTime(s);

        //Check for PM and AM
        var day_or_night = (h > 11) ? "PM" : "AM";

        //Convert to 12 hours system
        if (h > 12)
            h -= 12;

        //Add time to the headline and update every 500 milliseconds
        $('#time').html(h + ":" + m + ":" + s + " " + day_or_night);
        setTimeout(function () {
            startTime()
        }, 500);
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }

    /* CENTER ELEMENTS IN THE SCREEN */
    jQuery.fn.center = function () {
        this.css("position", "absolute");
        this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) +
            $(window).scrollTop()) - 30 + "px");
        this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) +
            $(window).scrollLeft()) + "px");
        return this;
    };

    function build_page(result) {
        console.log(result);
        $(".auto").empty();
        var username = $("<div></div>").addClass("lockscreen-name").append(result.username);
        var img = $("<img>");
        img.attr("src", "assets/img/" + result.pic);
        var user_img = $("<div></div>").addClass("lockscreen-image").append(img);
        $("<div></div>").append(user_img).append(username).appendTo(".auto");
    }

    $("#lock_btn").click(function () {
        var password = $(".form-control").val();
        console.log(password);
        console.log(user);
        if (password == "") {
            alert("请输入内容");
        } else {
            if (password != user.password) {
                alert("密码错误")
            } else {
                location.href = "${pageContext.request.contextPath}/backStage.jsp";
            }
        }
    })
</script>