<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/9/3
  Time: 15:10
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

        .tags_margin {
            margin-right: 5px;
        }

        .dl-horizontal-profile > dd {
            padding: 20px 0;
        }

        .dl-horizontal-profile > dt {
            padding: 20px 0;
        }

        .profile-name {
            border: none;
        }

        dd {
            margin-left: 158px;
        }

        .a_hobby {
            line-height: 30px;
            display: inline-block;
            border: 1px solid #d1e8ff;
            font-size: 13px;
            padding: 2px 10px;
            margin-right: 5px;
            border-radius: 16px;
            margin-bottom: 5px;
        }

        .select {
            background-color: skyblue;
        }
    </style>
</head>
<body>
<div class="wrap-fluid">
    <div class="container-fluid bevel " style="min-height: 1000px">
        <div class="profile-name">

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
    $(function () {
        var userid = ${user.userid};
        $.ajax({
            url: "${pageContext.request.contextPath}/getuser",
            data: "userid=" + userid,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                build_info(result.map.user);
            }
        })
    });

    function build_info(result) {
        console.log(result);
        $(".profile-name").empty();
        var button = $("<button></button>").addClass("btn pull-right").css("margin-right", "20px").append("修改资料");
        button.attr("id", "update_btn");
        var h2 = $("<h2></h2>").append(result.username).append(button);
        var userid1 = $("<dt></dt>").append("用户ID");
        var userid2 = $("<dd></dd>").append(result.userid);
        var username = $("<dt></dt>").append("姓名");
        var username1 = $("<dd></dd>").append(result.username);
        var sex = $("<dt></dt>").append("性别");
        var sex1 = $("<dd></dd>").append(result.sex);
        var phone = $("<dt></dt>").append("电话");
        var phone1 = $("<dd></dd>").append(result.phone);
        var address = $("<dt></dt>").append("地址");
        var address1 = $("<dd></dd>").append(result.address);
        var introduce = $("<dt></dt>").append("个人简介");
        var introduce1 = $("<dd></dd>").append(result.introduce);
        var major1 = $("<dt></dt>").append("爱好");
        var major = $("<dd></dd>");
        $.each(result.majorType, function (index, item) {
            var major2 = $("<span></span>").addClass("tags tags_margin").append(item.majorType);
            major.append(major2);
        });
        var dl = $("<dl></dl>").addClass("dl-horizontal-profile").append(userid1).append(userid2).append(username)
            .append(username1).append(sex).append(sex1).append(phone).append(phone1).append(address).append(address1)
            .append(introduce).append(introduce1).append(major1).append(major);
        var hr = $("<hr>");
        $("<div></div>").append(h2).append(hr).append(dl).appendTo(".profile-name");
    }
// 点击修改资料按钮
    $(".profile-name").on("click", "#update_btn", function () {
        console.log($(this));
        $(this).parents(".profile-name").find(".dl-horizontal-profile").wrap("<form id='pre_form'></form>");
        var save_btn = $("<button></button>").addClass("btn pull-right").css("margin", "0 15px 0 0").append("保存");
        save_btn.attr("id", "save_btn");
        $(this).attr("id", "cancel_btn");
        $(this).html("取消");
        $(this).parent("h2").append(save_btn);
        console.log($(this).parents(".profile-name").find(".dl-horizontal-profile dd"));
        $(this).parents(".profile-name").find(".dl-horizontal-profile dd").each(function () {
            var content = $(this).html();
            $(this).empty();
            $(this).append("<div contenteditable='true'>" + content + "</div>");
        });
        console.log($(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(0)"));
        $(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(0) div").removeAttr("contenteditable");
        $(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(6)").empty();
        build_hobby();
    });
// 创建爱好信息
    function build_hobby() {
        console.log($(".dl-horizontal-profile dd:eq(6) div"));
        var java = $("<a></a>").addClass("a_hobby").append("java");
        var html5 = $("<a></a>").addClass("a_hobby").append("html5");
        var javascript = $("<a></a>").addClass("a_hobby").append("javascript");
        var css3 = $("<a></a>").addClass("a_hobby").append("css3");
        var bootstrap3 = $("<a></a>").addClass("a_hobby").append("bootstrap3");
        var python = $("<a></a>").addClass("a_hobby").append("python");
        var vue = $("<a></a>").addClass("a_hobby").append("vue");
        var jquery = $("<a></a>").addClass("a_hobby").append("jquery");
        $("<div></div>").css("width", "200px").append(java).append(html5).append(javascript).append(css3).append(bootstrap3)
            .append(python).append(vue).append(jquery).appendTo(".dl-horizontal-profile dd:eq(6)");
    }

    $(".profile-name").on("click", ".a_hobby", function () {
        var item = $(this).html();
        if ($(this).hasClass("select")) {
            $(this).removeClass("select");
            arr = $.grep(arr, function (value) {
                return value != item;
            })
        } else {
            $(this).addClass("select");
            arr.push(item);
        }
    });
    // 点击取消按钮
    $(".profile-name").on("click", "#cancel_btn", function () {
        window.location.reload();
    });
    // 点击保存按钮
    $(".profile-name").on("click", "#save_btn", function () {
        var userid = $(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(0)>div").html();
        var username = $(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(1)>div").html();
        var sex = $(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(2)>div").html();
        var phone = $(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(3)>div").html();
        var address = $(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(4)>div").html();
        var introduce = $(this).parents(".profile-name").find(".dl-horizontal-profile dd:eq(5)>div").html();
        var formdata = new FormData($("#form")[0]);
        formdata.set("userid", userid);
        formdata.set("username", username);
        formdata.set("sex", sex);
        formdata.set("phone", phone);
        formdata.set("address", address);
        formdata.set("introduce", introduce);
        formdata.set("arr", arr);
        $.ajax({
            url: "${pageContext.request.contextPath}/updateUser",
            data: formdata,
            type: "post",
            processData: false,
            contentType: false,
            success: function (result) {
                console.log(result.msg);
                parent.location.reload();
            }
        })
    });
</script>