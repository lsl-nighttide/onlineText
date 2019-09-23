<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/8/27
  Time: 10:31
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
        .improve_btn {
            margin-right: 5px;
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
                            <h6>普通用户</h6>
                        </div>
                        <div class="body-nest">
                            <table class="table table-hover text-center" id="user_table">
                                <thead>
                                <tr>
                                    <td>id</td>
                                    <td>姓名</td>
                                    <td>性别</td>
                                    <td>电话</td>
                                    <td>地址</td>
                                    <td>个人简介</td>
                                    <td>身份</td>
                                    <td>操作</td>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

                            <!-- 显示分页信息 -->
                            <div class="row" style="text-align: center">
                                <!-- 分页条信息 -->
                                <div id="page_nav_area"></div>
                                <!--分页文字信息  -->
                                <div id="page_info_area"></div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="adminTable">
                    <div class="col-sm-12"></div>
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
        </div>
        <script type="text/javascript" src="assets/js/preloader.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.js"></script>
        <script type="text/javascript" src="assets/js/app.js"></script>
        <script type="text/javascript" src="assets/js/load.js"></script>
        <script type="text/javascript" src="assets/js/main.js"></script>
    </div>
</div>
</body>
</html>
<script>
    var currentPage;
    var arr = new Array();
    var per = ${user.permissions};
    console.log("当前的权限:"+per);
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        console.log(pn);
        $.ajax({
            url: "${pageContext.request.contextPath}/getAll",
            data: "pn=" + pn,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                console.log(result);
                console.log(result.map.pageinfo.list);
                build_table(result);
                build_page_nav_area(result);
                build_page_info_area(result);
            }
        });
    }

    // 创建表格数据
    function build_table(result) {
        console.log(result);
        $("table tbody").empty();
        var userinfo = result.map.pageinfo.list;
        $.each(userinfo, function (index, item) {
            var userid = $("<td></td>").append(item.userid);
            var name = $("<td></td>").append(item.username);
            var sex = $("<td></td>").append(item.sex);
            var phone = $("<td></td>").append(item.phone);
            var address = $("<td></td>").append(item.address);
            var introduce = $("<td></td>").append(item.introduce);
            var permissions = $("<td></td>");
            var improve = $("<button></button>").addClass("btn btn-sm improve_btn").append("提升");
            var reduce = $("<button></button>").addClass("btn btn-sm reduce_btn").append("降低");
            var best = $("<button></button>").addClass("btn btn-sm best_btn").append("操作");
            var btn = $("<td></td>");
            switch (per) {
                case 1:
                    switch (item.permissions) {
                        case 0:
                            permissions.append("普通用户");
                            btn.append(improve);
                            break;
                        case 1:
                            permissions.append("管理员");
                            break;
                        case 2:
                            permissions.append("老大");
                            break;
                    }
                    break;
                case 2:
                    switch (item.permissions) {
                        case 0:
                            permissions.append("普通用户");
                            btn.append(improve);
                            break;
                        case 1:
                            permissions.append("管理员");
                            btn.append(improve).append(reduce);
                            break;
                        case 2:
                            permissions.append("老大");
                            btn.append(best);
                            break;
                        default:
                            permissions.append("不知道啥品种");
                            break;
                    }
                    break;
                default:
                    break;
            }

            $("<tr></tr>").append(userid).append(name).append(sex).append(phone).append(address)
                .append(introduce).append(permissions).append(btn).appendTo("table>tbody");
        })
    }

    // 创建导航条
    function build_page_nav_area(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var first = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prepage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.map.pageinfo.hasPreviousPage == false) {
            first.addClass("disabled");
            prepage.addClass("disabled");
        } else {
            first.click(function () {
                to_page(1);
            });
            prepage.click(function () {
                to_page(result.map.pageinfo.pageNum - 1);
            })
        }
        ul.append(first).append(prepage);
        var lastpage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var last = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.map.pageinfo.hasNextPage == false) {
            lastpage.addClass("disabled");
            last.addClass("disabled");
        } else {
            lastpage.click(function () {
                console.log("111");
                console.log(result.map.pageinfo.pageNum + 1);
                to_page(result.map.pageinfo.pageNum + 1);
            });
            last.click(function () {
                to_page(result.map.pageinfo.pages);
            })
        }
        $.each(result.map.pageinfo.navigatepageNums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            if (result.map.pageinfo.pageNum == item) {
                num.addClass("active");
            }
            num.click(function () {
                to_page(item);
            });
            ul.append(num);
        });
        ul.append(lastpage).append(last);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");
    }

    // 创建分页文字信息
    function build_page_info_area(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.map.pageinfo.pageNum + "页,总" +
            result.map.pageinfo.pages + "页,总" +
            result.map.pageinfo.total + "条记录");
        currentPage = result.map.pageinfo.pageNum;
    }
// 点击提升按钮
    $("table>tbody").on("click",".improve_btn",function () {
        var permissions;
        var identity = $(this).parents("tr").find("td:eq(6)").html();
        console.log(identity);
        switch (identity) {
            case "普通用户":
                permissions = 0;
                break;
            case "管理员" :
                permissions = 1;
                break;
            default :
                permissions = "不知道";
                break;
        }
        permissions++;
        var userid = $(this).parents("tr").find("td:eq(0)").html();
        $.ajax({
            url: "${pageContext.request.contextPath}/updatePermissions",
            data: "userid=" + userid + "&permissions=" + permissions,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                console.log(result);
                var msg = result.msg;
                if (msg == '成功') {
                    per = result.map.user.permissions;
                    console.log("当前的权限:"+per);
                    to_page(currentPage);
                }
            }
        })
    });
    // 点击降低按钮
    $("table>tbody").on("click",".reduce_btn",function () {
        var permissions = 0;
        var userid = $(this).parents("tr").find("td:eq(0)").html();
        $.ajax({
            url: "${pageContext.request.contextPath}/updatePermissions",
            data: "userid=" + userid + "&permissions=" + permissions,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=urf-8",
            success: function (result) {
                var msg = result.msg;
                if (msg == "成功") {
                    to_page(currentPage);
                }
            }
        })
    });
    $("table>tbody").on("click",".best_btn",function () {
            alert("操作自己干什么，有毒吧?");
    })
</script>