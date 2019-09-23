<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/8/30
  Time: 14:21
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
            <%--  <li class="pull-right">
                  <div class="input-group input-widget">
                      <input style="border-radius:15px" type="text" placeholder="Search..." class="form-control">
                  </div>
              </li>--%>
        </ul>
        <div class="content-wrap">
            <div class="row">
                <div class="col-sm-12">
                    <div class="nest" style="margin: -20px 15px 0 15px;">
                        <div class="title-alt">
                            <h6>评论信息</h6>
                            <div class="input-group input-widget pull-right">
                                <input style="border-radius:15px;margin: 17px 0 0 0 " type="text"
                                       placeholder="Search..." class="form-control" id="searchComment">
                                <%--                                <a href="#"><span class="entypo-search" style="float: right"></span></a>--%>
                            </div>
                        </div>
                    </div>
                    <div id="build_Commentinfo" style="margin: 10px 0 0 0">
                    </div>
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
</body>
</html>
<script>
    var currentPage;
    var arr = new Array();
    var type = 0;
    console.log(arr);
    var content;
    $(function () {
        to_page(1, 0);
    });

    function to_page(pn, type) {
        console.log(pn);
        switch (type) {
            case 0 :
                $.ajax({
                    url: "${pageContext.request.contextPath}/getCommentAll",
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
                break;
            case 1:
                $.ajax({
                    url: "${pageContext.request.contextPath}/queryByPostid",
                    data: "pn=" + pn + "&content=" + content,
                    type: "post",
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    success: function (result) {
                        build_table(result);
                        build_page_nav_area(result);
                        build_page_info_area(result);
                    }
                });
                break;
        }

    }

    // 创建表格数据
    function build_table(result) {
        console.log(result);
        $("#build_Commentinfo").empty();
        var commentinfo = result.map.pageinfo.list;
        $.each(commentinfo, function (index, item) {
            build_Comment(item);
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
                to_page(1, type);
            });
            prepage.click(function () {
                to_page(result.map.pageinfo.pageNum - 1, type);
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
                to_page(result.map.pageinfo.pageNum + 1, type);
            });
            last.click(function () {
                to_page(result.map.pageinfo.pages, type);
            })
        }
        $.each(result.map.pageinfo.navigatepageNums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            if (result.map.pageinfo.pageNum == item) {
                num.addClass("active");
            }
            num.click(function () {
                to_page(item, type);
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
    $("#build_Commentinfo").on("click",".entypo-cancel",function () {
        console.log($(this));
        var comment_id = $(this).parents(".title-alt").find("#comment_id").html();
        console.log(comment_id);
        $.ajax({
            url:"${pageContext.request.contextPath}/deleteComment",
            data:"comment_id="+comment_id,
            type:"post",
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            success:function (result) {
                if(result.msg = "成功"){
                    to_page(currentPage,type);
                }
            }
        })
    });
    // 键盘输入事件
    $("#searchComment").keydown(function (event) {
        console.log(event.keyCode);
        if(event.keyCode == 13){
            content = $(this).val();
            var intnum = /^[0-9]+.?[0-9]*/;
            if(intnum.test(content)){
                type =1 ;
                to_page(1,type);
            }else {
                to_page(1,type);
            }
        }
    });
    function build_Comment(item) {
        var comment_id = $("<h6></h6>").append(item.comment_id);
        comment_id.attr("id", "comment_id");
        var span = $("<span></span>").addClass("entypo-cancel");
        var a = $("<a></a>").addClass("gone").attr("href", "#").append(span);
        var div = $("<div></div>").addClass("titleClose").append(a);
        var title_div = $("<div></div>").addClass("title-alt").append(comment_id).append(div);
        var postid_dt = $("<dt></dt>").append("所属帖子ID");
        var postid_dd = $("<dd></dd>").append(item.postid);
        var username_dt = $("<dt></dt>").append("发评人姓名");
        var username_dd = $("<dd></dd>").append(item.user.username);
        var comment_content_dt = $("<dt></dt>").append("评论内容");
        var comment_content_dd = $("<dd></dd>").append(item.comment_content);
        var comment_creattime_dt = $("<dt></dt>").append("发评时间");
        var comment_creattime_dd = $("<dd></dd>").append(item.comment_creattime);
        var dl = $("<dl></dl>").addClass("dl-horizontal-profile").append(postid_dt).append(postid_dd)
            .append(username_dt).append(username_dd).append(comment_content_dt).append(comment_content_dd)
            .append(comment_creattime_dt).append(comment_creattime_dd);
        var body_div = $("<div></div>").addClass("body-nest").append(dl);
        $("<div><div>").addClass("nest").css("margin", "-20px 15px").append(title_div).append(body_div)
            .appendTo("#build_Commentinfo");
    }
</script>