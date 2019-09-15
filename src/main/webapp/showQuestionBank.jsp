<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/8/27
  Time: 22:01
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
        dd {
            margin-left: 163px;
        }

        dd > div {
            display: inline-block;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="modal fade" id="addQuestionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="ModalLabel">增加试题</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">题目</label>
                        <div class="col-sm-10">
                            <div id="question_title" contenteditable="true"></div>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">A选项</label>
                        <div class="col-sm-10">
                            <div id="question_OptionA" contenteditable="true"></div>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">B选项</label>
                        <div class="col-sm-10">
                            <div id="question_OptionB" contenteditable="true"></div>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">C选项</label>
                        <div class="col-sm-10">
                            <div id="question_OptionC" contenteditable="true"></div>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">D选项</label>
                        <div class="col-sm-10">
                            <div id="question_OptionD" contenteditable="true"></div>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">答案</label>
                        <div class="col-sm-10">
                            <div id="question_answer" contenteditable="true"></div>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">解析</label>
                        <div class="col-sm-10">
                            <div id="question_parse" contenteditable="true" aria-placeholder="解析"></div>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <label class="col-sm-2 control-label">题型</label>
                    <div class="col-sm-10 sb ">
                        <input type="checkbox" name="question_type" value="java">java
                        <input type="checkbox" name="question_type" value="html5">html5
                        <input type="checkbox" name="question_type" value="javascript">javascript
                        <input type="checkbox" name="question_type" value="css3">css3
                        <input type="checkbox" name="question_type" value="bootstrap3">bootstrap3
                        <input type="checkbox" name="question_type" value="python">python
                        <input type="checkbox" name="question_type" value="vue">vue
                        <input type="checkbox" name="question_type" value="jquery">jquery
                        <span class="help-block"></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
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
                            <h6>题库信息</h6>
                            <div class="input-group input-widget pull-right">
                                <input style="border-radius:15px;margin: 17px 0 0 0 " type="text"
                                       placeholder="Search..." class="form-control" id="searchQuestion">
                                <%--                                <a href="#"><span class="entypo-search" style="float: right"></span></a>--%>
                            </div>
                            <button class="btn pull-right" style="margin: 10px 15px 0 0" id="addQuestion">增加</button>

                        </div>
                    </div>
                    <div id="build_Questioninfo" style="margin: 10px 0 0 0">
                    </div>
                    <!-- 显示分页信息 -->
                    <div class="row" style="text-align: center" id="pageinfo">
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
                    url: "${pageContext.request.contextPath}/getQuestionAll",
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
                    url: "${pageContext.request.contextPath}/queryById",
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
            case 2:
                $.ajax({
                    url: "${pageContext.request.contextPath}/queryByType",
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
        $("#build_Questioninfo").empty();
        var questioninfo = result.map.pageinfo.list;
        $.each(questioninfo, function (index, item) {
            build_question(item);
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

    $("#build_Questioninfo").on("click", "#update_btn", function () {
        $(this).parents(".nest").find(".body-nest dl").wrap("<form id='form'></form>");
        var save_btn = $("<button></button>").addClass("btn pull-right").css("margin", "10px 15px 0 0").append("保存");
        save_btn.attr("id", "save_btn");
        $(this).attr("id", "cancel_btn");
        $(this).html("取消");
        $(this).parent(".title-alt").append(save_btn);
        $(this).parents(".nest").find(".body-nest dl dd").each(function () {
            var content = $(this).html();
            $(this).empty();
            $(this).append("<div contenteditable='true'>" + content + "</div>");
        })
    });
    $("#build_Questioninfo").on("click", "#cancel_btn", function () {
        to_page(currentPage, type);
    });
    $("#build_Questioninfo").on("click", "#save_btn", function () {
        var question_id = $(this).parent(".title-alt").find("#question_id").html();
        var question_title = $(this).parents(".nest").find(".dl-horizontal-profile dd:eq(0)>div").html();
        var question_OptionA = $(this).parents(".nest").find(".dl-horizontal-profile dd:eq(1)>div").html();
        var question_OptionB = $(this).parents(".nest").find(".dl-horizontal-profile dd:eq(2)>div").html();
        var question_OptionC = $(this).parents(".nest").find(".dl-horizontal-profile dd:eq(3)>div").html();
        var question_OptionD = $(this).parents(".nest").find(".dl-horizontal-profile dd:eq(4)>div").html();
        var question_type_str = $(this).parents(".nest").find(".dl-horizontal-profile dd:eq(5)>div").html();
        var question_answer = $(this).parents(".nest").find(".dl-horizontal-profile dd:eq(6)>div").html();
        var question_parse = $(this).parents(".nest").find(".dl-horizontal-profile dd:eq(7)>div").html();
        var formdata1 = new FormData($("#form")[0]);
        formdata1.set("question_id", question_id);
        formdata1.set("question_title", question_title);
        formdata1.set("question_OptionA", question_OptionA);
        formdata1.set("question_OptionB", question_OptionB);
        formdata1.set("question_OptionC", question_OptionC);
        formdata1.set("question_OptionD", question_OptionD);
        formdata1.set("question_answer", question_answer);
        formdata1.set("question_parse", question_parse);
        formdata1.set("question_type_str", question_type_str);
        console.log(formdata1.get("question_id"));
        $.ajax({
            url: "${pageContext.request.contextPath}/updateQuestion",
            data: formdata1,
            type: "post",
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                if (result.msg == "成功") {
                    to_page(currentPage, type);
                }
            }
        })
    });
    $("#build_Questioninfo").on("click", ".entypo-cancel", function () {
        console.log($(this).parents(".title-alt").find("#question_id").html());
        var question_id = $(this).parents(".title-alt").find("#question_id").html();
        $.ajax({
            url: "${pageContext.request.contextPath}/deleteQuestion",
            data: "question_id=" + question_id,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                if (result.msg == "成功") {
                    to_page(currentPage, type);
                }
            }
        })
    });
    $("#searchQuestion").keydown(function (event) {
        console.log(event.keyCode);
        if (event.keyCode == 13) {
            console.log("提交");
            console.log($(this).val());
            content = $(this).val();
            var intnum = /^[0-9]+.?[0-9]*/;
            if (content == "") {
                alert("请输入内容")
            }
            if (intnum.test(content)) {
                type = 1;
                to_page(1, type);
            } else {
                type = 2;
                to_page(1, type);
            }
        }
    });
    $("#addQuestion").click(function () {
        reset_form("#addQuestionModal form");
        $("#addQuestionModal").modal({
            backdrop: "static"
        });
    });
    $(".modal").on("mouseenter", "#user_save_btn", function () {
        arr = new Array();
        var items = $("input[name='question_type']");
        console.log(items);
        for (i = 0; i < items.length; i++) {
            if (items[i].checked) {
                arr.push(items[i].value);
            }
        }
        console.log(arr);
    });
    $("#addQuestionModal").on("click", "#user_save_btn", function () {
        var formdata = new FormData($("#addQuestionModal form")[0]);
        var question_title = $("#question_title").html();
        var question_OptionA = $("#question_OptionA").html();
        var question_OptionB = $("#question_OptionB").html();
        var question_OptionC = $("#question_OptionC").html();
        var question_OptionD = $("#question_OptionD").html();
        var question_answer = $("#question_answer").html();
        var question_parse = $("#question_parse").html();
        formdata.set("question_title", question_title);
        formdata.set("question_OptionA", question_OptionA);
        formdata.set("question_OptionB", question_OptionB);
        formdata.set("question_OptionC", question_OptionC);
        formdata.set("question_OptionD", question_OptionD);
        formdata.set("question_answer", question_answer);
        formdata.set("question_parse", question_parse);
        formdata.set("arr", arr);
        $.ajax({
            url: "${pageContext.request.contextPath}/addQuestion",
            data: formdata,
            type: "post",
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                console.log(result);
                $("#addQuestionModal").modal('hide');
                to_page(1, type);
            }
        })
    });

    /*     /清空表单样式及内容*/
    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    function build_question(item) {
        var question_id = $("<h6></h6>").append(item.question_id);
        question_id.attr("id", "question_id");
        var span = $("<span></span>").addClass("entypo-cancel");
        var a = $("<a></a>").addClass("gone").attr("href", "#").append(span);
        var div = $("<div></div>").addClass("titleClose").append(a);
        var update_btn = $("<button></button>").addClass("btn pull-right").css("margin", "10px 15px 0 0").append("修改");
        update_btn.attr("id", "update_btn");
        var title_div = $("<div></div>").addClass("title-alt").append(question_id).append(div)
            .append(update_btn);
        var question_title_dt = $("<dt></dt>").append("题目");
        var question_title_dd = $("<dd></dd>").append(item.question_title);
        var question_OptionA_dt = $("<dt></dt>").append("A");
        var question_OptionA_dd = $("<dd></dd>").append(item.question_OptionA);
        var question_OptionB_dt = $("<dt></dt>").append("B");
        var question_OptionB_dd = $("<dd></dd>").append(item.question_OptionB);
        if (item.question_OptionC != "" && item.question_OptionD != "") {
            var question_OptionC_dt = $("<dt></dt>").append("C");
            var question_OptionC_dd = $("<dd></dd>").append(item.question_OptionC);
            var question_OptionD_dt = $("<dt></dt>").append("D");
            var question_OptionD_dd = $("<dd></dd>").append(item.question_OptionD);
        }
        var question_type_dt = $("<dt></dt>").append("试题类型");
        var question_type_dd = $("<dd></dd>");
        $.each(item.question_type, function (index, item1) {
            question_type_dd.append(item1.question_type + " ");
        });
        var question_answer_dt = $("<dt></dt>").append("答案");
        var question_answer_dd = $("<dd></dd>").append(item.question_answer);
        var question_parse_dt = $("<dt></dt>").append("解析");
        var question_parse_dd = $("<dd></dd>").append(item.question_parse);
        var dl = $("<dl></dl>").addClass("dl-horizontal-profile").append(question_title_dt).append(question_title_dd)
            .append(question_OptionA_dt).append(question_OptionA_dd).append(question_OptionB_dt).append(question_OptionB_dd)
            .append(question_OptionC_dt).append(question_OptionC_dd).append(question_OptionD_dt).append(question_OptionD_dd)
            .append(question_type_dt).append(question_type_dd).append(question_answer_dt).append(question_answer_dd)
            .append(question_parse_dt).append(question_parse_dd);
        var body_div = $("<div></div>").addClass("body-nest").append(dl);
        $("<div><div>").addClass("nest").css("margin", "-20px 15px").append(title_div).append(body_div).appendTo("#build_Questioninfo");
    }
</script>