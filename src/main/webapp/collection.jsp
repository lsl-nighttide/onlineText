<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/9/8
  Time: 23:59
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
            background: none;
            background-color: #f8f8f8;
            padding-left: 50px;
            min-height: 100%;
            z-index: -2;
        }
    </style>
</head>
<body>
<div class="wrap-fluid">
    <div class="container-fluid bevel " style="min-height: 1000px">
        <div class="profile-name">
            <div class="title-alt" style="margin-top: 20px"><h4>我的收藏</h4></div>
            <table class="table table-hover text-center">
                <thead>
                <tr>
                    <td width="56%">题目</td>
                    <td width="22%">类型</td>
                    <td width="22%">操作</td>
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
    console.log(arr);
    var question;
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        console.log(pn);
        var userid = ${user.userid};
        $.ajax({
            url: "${pageContext.request.contextPath}/getCollectionAll",
            data: "pn=" + pn + "&userid=" + userid,
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
        $("table>tbody").empty();
        var collections = result.map.pageinfo.list;
        $.each(collections, function (index, item) {
            console.log(item);
            $.ajax({
                url: "${pageContext.request.contextPath}/getQuestion",
                data: "question_id=" + item.question_id,
                type: "post",
                async: false,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                success: function (result) {
                    question = result.map.question;
                    console.log(question);
                }
            });
            var question_title = "<td>" + question.question_title + "</td>";
            var question_type = $("<td></td>");
            $.each(question.question_type, function (index, item) {
                question_type.append(item.question_type);
            });
            var btn = "<td><button class='btn' id='check_btn' ques_id = '" + item.question_id + "'>" + "查看详情" +
                "</button></td>";
            $("<tr></tr>").append(question_title).append(question_type).append(btn).appendTo("table>tbody");
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

    $("table>tbody").on("click", "#check_btn", function () {
        console.log($(this));
        var question_id = $(this).attr("ques_id");
        console.log(question_id);
        parent.location.href = "${pageContext.request.contextPath}/questionDetails?question_id=" + question_id;
    })
</script>