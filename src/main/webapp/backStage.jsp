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
    <meta charset="utf-8">
    <title>Apricot 1.3</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="assets/js/progress-bar/number-pb.css">



    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
<!   <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>-->
    <![endif]-->
    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body>
<!-- Preloader -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>
<!-- TOP NAVBAR -->
<nav role="navigation" class="navbar navbar-static-top">
    <div class="container-fluid">
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
            <ul style="margin-right:0;" class="nav navbar-nav navbar-right">
                <li>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <img alt="" class="admin-pic img-circle"
                             src="assets/img/${user.pic}">Hi, ${user.username} <b
                            class="caret"></b>
                    </a>
                    <ul style="margin-top:14px;" role="menu" class="dropdown-setting dropdown-menu">
                        <li>
                            <a href="#">
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
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="icon-gear"></span>&#160;&#160;Setting</a>
                    <ul role="menu" class="dropdown-setting dropdown-menu">

                        <li class="theme-bg">
                            <div id="button-bg"></div>
                            <div id="button-bg2"></div>
                            <div id="button-bg3"></div>
                            <div id="button-bg5"></div>
                            <div id="button-bg6"></div>
                            <div id="button-bg7"></div>
                            <div id="button-bg8"></div>
                            <div id="button-bg9"></div>
                            <div id="button-bg10"></div>
                            <div id="button-bg11"></div>
                            <div id="button-bg12"></div>
                            <div id="button-bg13"></div>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!-- /END OF TOP NAVBAR -->

<!-- SIDE MENU -->
<div id="skin-select">
    <div id="logo">
        <h1>YiKao<span>v1.2</span></h1>
    </div>

    <a id="toggle">
        <span class="entypo-menu"></span>
    </a>
    <div class="dark">
        <form action="#">
					<span>
                    <input type="text" name="search" value="" class="search rounded id_search"
                           placeholder="Search Menu..." autofocus="">
                </span>
        </form>
    </div>
    <div class="skin-part">
        <div id="tree-wrap">
            <div class="side-bar">
                <ul class="topnav menu-left-nest">
                    <li>
                        <a href="#" style="border-left:0px solid!important;" class="title-menu-left">
                            <span class="widget-menu"></span>
                        </a>
                    </li>
                    <li>
                        <a class="tooltip-tip ajax-load" href="#" title="账户管理">
                            <i class="icon-user-group"></i>
                            <span>账户管理</span>

                        </a>
                        <ul>
                            <li>
                                <a class="tooltip-tip2 ajax-load" href="#" title="用户管理" id="user_management"><i
                                        class="entypo-user"></i><span>用户管理</span></a>
                            </li>
                            <li>
                                <a class="tooltip-tip2 ajax-load" href="#" title="权限管理" id="permissions_management"><i
                                        class="entypo-users"></i><span>权限管理</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="tooltip-tip ajax-load" href="#" title="修改密码" id="update_pwd">
                            <i class="icon-feed"></i>
                            <span>修改密码</span>

                        </a>
                    </li>
                    <li>
                        <a class="tooltip-tip ajax-load" href="#" title="管理员管理" id="admin_management">
                            <i class="icon-camera"></i>
                            <span>管理员管理</span>
                        </a>
                    </li>
                </ul>

                <ul class="topnav menu-left-nest">
                    <li>
                        <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                            <span class="design-kit"></span>
                        </a>
                    </li>

                    <li>
                        <a class="tooltip-tip ajax-load" href="#" title="个人信息" id="profile">
                            <i class="icon-user"></i>
                            <span>个人信息</span>

                        </a>
                        <a class="tooltip-tip ajax-load" href="index.jsp" title="前台" id="front_desk">
                            <i class="icon-user"></i>
                            <span>前台</span>

                        </a>
                    </li>
                </ul>

                <ul id="menu-showhide" class="topnav menu-left-nest">
                    <li>
                        <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                            <span class="component"></span>
                        </a>
                    </li>
                    <li>
                        <a class="tooltip-tip" href="#" title="题库信息" id="show_questionBank">
                            <i class="icon-monitor"></i>
                            <span>题库信息</span>
                        </a>
                    </li>
                    <li>
                        <a class="tooltip-tip" href="#" title="帖子信息" id="show_post">
                            <i class="icon-document"></i>
                            <span>帖子信息</span>
                        </a>
                    </li>
                    <li>
                        <a class="tooltip-tip" href="#" title="评论信息" id="show_comment">
                            <i class="icon-view-thumb"></i>
                            <span>评论信息</span>
                        </a>
                    </li>
                </ul>
                  </div>
        </div>
    </div>
</div>
<!-- END OF SIDE MENU -->

<!--  PAPER WRAP -->
<div class="wrap-fluid" style="width: auto;margin-left: 250px;">
    <iframe src="adminInfo.jsp" width="100%" frameborder="1" scrolling="no" id="myiframe"></iframe>
</div>

<!-- END OF RIGHT SLIDER CONTENT-->
<script type="text/javascript" src="assets/js/jquery.js"></script>
<!--jquery的动画效果插件-->
<script src="assets/js/progress-bar/src/jquery.velocity.min.js"></script>
<!--		<script src="assets/js/progress-bar/number-pb.js"></script>
		<script src="assets/js/progress-bar/progress-app.js"></script>-->

<!-- MAIN EFFECT -->
<!--	<script type="text/javascript" src="assets/js/preloader.js"></script>-->
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<!--换背景的-->
<script type="text/javascript" src="assets/js/app.js"></script>
<!--加载js-->
<script type="text/javascript" src="assets/js/load.js"></script>
<!--vuejs-->
<script type="text/javascript" src="assets/js/main.js"></script>

<!-- GAGE -->

<!--		<script type="text/javascript" src="assets/js/chart/jquery.flot.js"></script>
		<script type="text/javascript" src="assets/js/chart/jquery.flot.resize.js"></script>-->
<!--<script type="text/javascript" src="assets/js/chart/realTime.js"></script>-->
<script type="text/javascript" src="assets/js/speed/canvasgauge-coustom.js"></script>
<script type="text/javascript" src="assets/js/countdown/jquery.countdown.js"></script>

<script src="assets/js/jhere-custom.js"></script>


</body>

</html>
<script>
    // 高度自适应
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
    $("#user_management").click(function () {
        $("#myiframe").attr("src","user.jsp");
    });
    $("#permissions_management").click(function () {
        $("#myiframe").attr("src","permissions.jsp");
    });
    $("#update_pwd").click(function () {
        $("#myiframe").attr("src","updatePwd.jsp");
    });
    $("#profile").click(function () {
        $("#myiframe").attr("src","adminInfo.jsp");
    });
    $("#admin_management").click(function () {
        $("#myiframe").attr("src","admin.jsp");
    });
    $("#show_questionBank").click(function () {
        $("#myiframe").attr("src","showQuestionBank.jsp");
    });
    $("#show_post").click(function () {
        $("#myiframe").attr("src","showPost.jsp");
    });
    $("#show_comment").click(function () {
        $("#myiframe").attr("src","showComment.jsp");
    })
    $(function () {
        var permissions = ${user.permissions};
        if(permissions == 1){
            $("#admin_management").hide();
        }
    })
</script>