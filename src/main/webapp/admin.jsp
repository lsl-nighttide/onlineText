<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/8/20
  Time: 19:46
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
        <!-- 按钮 -->
        <div class="row">
            <div class="col-md-3 col-md-offset-8 text-right" style="margin-top: 8px">
                <button class="btn " id="userinfo_delete_all">批量删除</button>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <div class="nest" style="margin: -20px 15px;">
                    <div class="title-alt">
                        <h6>管理员信息</h6>
                    </div>
                    <div class="body-nest">
                        <table class="table table-hover text-center" id="user_table">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="check_all"/>
                                </th>
                                <td>id</td>
                                <td>姓名</td>
                                <td>性别</td>
                                <td>电话</td>
                                <td>地址</td>
                                <td>个人简介</td>
                                <td>方向</td>
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
    var currentPage;
    var arr = new Array();
    console.log(arr);
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        console.log(pn);
        var permissions = 1;
        $.ajax({
            url: "${pageContext.request.contextPath}/getuserAll",
            data: "pn=" + pn + "&permissions=" + permissions,
            type: "post",
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
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
        console.log($("#check_all"));
        $("#check_all").prop("checked", false);
        var userinfo = result.map.pageinfo.list;
        $.each(userinfo, function (index, item) {
            var checkBox = $("<th><input type='checkbox'class='check_item'></th>");
            var userid = $("<td></td>").append(item.userid);
            var name = $("<td></td>").append(item.username);
            var sex = $("<td></td>").append(item.sex);
            var phone = $("<td></td>").append(item.phone);
            var address = $("<td></td>").append(item.address);
            var introduce = $("<td></td>").append(item.introduce);
            var majorType = $("<td></td>");
            $.each(item.majorType, function (index, item1) {
                majorType.append(item1.majorType + " ");
            });
            var del = $("<button></button>").addClass("btn btn-danger btn-sm del_btn").append("删除");
            var btn = $("<td></td>").append(del);
            $("<tr></tr>").append(checkBox).append(userid).append(name).append(sex).append(phone).append(address)
                .append(introduce).append(majorType).append(btn).appendTo("table>tbody");
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

    // 鼠标移入时触发事件
    $("#userinfo_delete_all").hover(function () {
        $(this).addClass("btn-danger")
    }, function () {
        $(this).removeClass("btn-danger")
    });
    // 点击单选框触发的事件
    $(document).on("change", ".check_item", function () {
        /*    console.log($(".edit_btn"));
            console.log($(".edit_btn").attr("update_id"));
            console.log($("td").eq(0).siblings());
            console.log($(this).parent().siblings());
            console.log($(this).prop("checked"));
            console.log($(this).parents("tr"));
            console.log($(this).parents("tr").prop("innerText")[0]);
            console.log($(this).parents("tr").prop("children")[7]);*/
        console.log($(this).parents("tr").find("td:eq(0)").html());
        var id = $(this).parents("tr").find("td:eq(0)").html();
        console.log(id);
        if ($(this).prop("checked") == true)
            arr.push(id);
        else
            arr = $.grep(arr, function (value) {
                return value != id;
            });
        console.log(arr);
    });
    // 点击除单选框的那一行触发的事件
    $(document).on("click", "td", function () {
        console.log($(this));
        console.log($(this).parent("tr").find("th .check_item"));
        console.log($(this).parents("tr").find("th"));
        console.log($(this).parents("tr").find("td:eq(0)").html());
        var id = $(this).parents("tr").find("td:eq(0)").html();
        if ($(this).parents("tr").find("th .check_item").prop("checked") == true) {
            $(this).parents("tr").find("th .check_item").prop("checked", false);
            arr = $.grep(arr, function (value) {
                return value != id;
            });
        } else {
            $(this).parent("tr").find("th .check_item").prop("checked", true);
            arr.push(id);
        }
        console.log(arr);
    });
    // 点表头那个单选框触发的事件
    $("#check_all").change(function () {
        arr = new Array();
        if ($(this).prop("checked") == true) {
            $(".check_item").prop("checked", true);
            // 遍历当前页的所有tbody，将userid添加到arr中
            ($(".check_item").parents("tr").find("td:eq(0)")).each(function () {
                arr.push($(this).html());
            });
        } else {
            $(".check_item").prop("checked", false);
            // 遍历当前页的所有tbody，将userid从arr一个个删除
            ($(".check_item").parents("tr").find("td:eq(0)")).each(function () {
                // $.grep()用来过滤数组，有三个参数，第三个用来是否取反，默认为false，这里用来删除指定id
                arr = $.grep(arr, function (value) {
                    return value != $(this).html();
                })
            });
        }
        console.log(arr);
    });
    // 当点击删除按钮是触发的事件
    $(document).on("click", ".del_btn", function () {
        console.log($(this));
        var userid = $(this).parents("tr").find("td:eq(0)").html();
        $.ajax({
            url: "${pageContext.request.contextPath}/deleteUser",
            data: "userid=" + userid,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                var msg = result.msg;
                if (msg == '成功') {
                    to_page(currentPage);
                } else {
                    alert("出现异常，可能是userid没有值");
                }
            }
        })
    });
    // 点击批量删除是触发的事件
    $("#userinfo_delete_all").click(function () {
        console.log(arr);
        $.ajax({
            url: "${pageContext.request.contextPath}/deleteUsers",
            data: "arr=" + arr,
            type: "post",
            contextType: "application/x-www-form-urlencoded;charset=utf-8",
            traditional: true,
            success: function (result) {
                var msg = result.msg;
                if (msg == '成功') {
                    to_page(currentPage);
                }
            }
        })
    });

</script>
