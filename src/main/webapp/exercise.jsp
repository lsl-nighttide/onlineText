<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/9/3
  Time: 21:15
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

        .exam-box-item {
            width: 230px;
            height: 200px;
            background-color: #EEEEEE;
            float: left;
            list-style: none;
            margin: 10px 20px;
        }

        .exam-h3 {
            font-size: 15px;
            text-align: center;
            color: #666;
            vertical-align: middle;
        }

        .ul-content {
            list-style: none;
            color: #666;
            margin: 50px 0 0 0;
            padding-left: 20px;
            font-size: 13px;
        }

        .ul-content > li {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="wrap-fluid">
    <div class="container-fluid bevel " style="min-height: 1000px">
        <div class="profile-name">
            <ul class="exam-box"></ul>
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
    var arr = new Array();
    var currentPage;
    $(function () {
        to_page(1)
    });

    function to_page(pn) {
        var userid = ${user.userid};
        $.ajax({
            url: "${pageContext.request.contextPath}/getExamAll",
            data: "pn=" + pn + "&userid=" + userid,
            type: 'post',
            success: function (result) {
                build_exam(result);
                build_page_nav_area(result);
                build_page_info_area(result);
            }
        })
    }

    function build_exam(result) {
        $(".exam-box").empty();
        var exams = result.map.pageinfo.list;
        var title = "<h1 style='font-size: 18px'>" + "做过的试卷" + "</h1>";
        $(".exam-box").append(title);
        $.each(exams, function (index, item) {
            var exam_list_item = $("<li class='exam-box-item'></li>");
            var exam_id = "<div style='display: none' class='exam_id'>"+item.exam_id+"</div>";
            var exam_content = "<a href='#' class='exam_li_item'><h3 class='exam-h3' '>" + "java专项练习" + "</h3>" +
                "<ul class='ul-content'><li><i class='fontawesome-time' style='margin-right: 10px'></i>" + "完成时间:&nbsp;" + item.completion_time + "</li>" +
                "<li><i class='fontawesome-pencil' style='margin-right: 10px'></i>" + "得分:&nbsp;" + item.grade + " </li></ul></a>";
            exam_list_item.append(exam_id).append(exam_content);
            $(".exam-box").append(exam_list_item);
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

    $(".exam-box").on("click", ".exam_li_item", function () {
        console.log($(this));
        console.log($(this).parent(".exam-box-item").find(".exam_id").html());
        var exam_id = $(this).parent(".exam-box-item").find(".exam_id").html();
        parent.location.href = "${pageContext.request.contextPath}/answer_key?exam_id="+exam_id;
    })
</script>