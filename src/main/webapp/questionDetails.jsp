<%--
  Created by IntelliJ IDEA.
  User: 卢仕龙
  Date: 2019/9/9
  Time: 0:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html style="min-height: 1600px">
<head>
    <title>Title</title>
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/profile.css">
    <link rel="stylesheet" href="assets/css/exam.css" />
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

        .a_hobby {
            line-height: 16px;
            display: inline-block;
            border: 1px solid #d1e8ff;
            font-size: 13px;
            padding: 2px 10px;
            margin-right: 2px;
            border-radius: 12px;
            margin-bottom: 5px;
        }

        .select_ques {
            height: 44px;
            line-height: 44px;
            font-size: 15px;
        }

        .question_type h1 {
            font-size: 14px;
        }

        .parse {
            height: auto;
            width: 100%;
            background: #F4F9FC;
        }

        .parse h1 {
            font-size: 14px;
        }

        .comment_area {
            min-height: 300px;
        }

        .post_area {
            /*height: 30%;*/
        }

        .post-list-item {
            margin: 10px 0 0 0;
        }


        .post-tip {
            height: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .poster-info {
            height: 50px;
        }

        .poster-pic {
            margin-left: 10px;
            margin-top: 0;
            margin-right: 10px;
        }

        .poster-name {
            display: inline-block;
            margin-top: 15px;
        }

        .post-content {
            min-height: 50px;
            line-height: 15px;
            margin: 10px 10px 0 10px;
        }

        .post_bottom {
            margin: 0 10px;
        }

        .comment-area-list {
            margin: 0 10px;
            background-color: #EFF0F2;
        }

        .comment-content {
            margin-bottom: 10px;
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
<body style="height: 100%;">
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
<div style="min-height: 1500px">
    <div class="col-md-1"></div>
    <div class="col-md-10">
        <div class="content">
            <div style="width: 100%;height:800px;display: inline-block;position: relative;margin-top:10px;">
                <div style="width: 100%;">
                    <div style="width: 80%;margin: 0px auto">
                        <div style="width: 100%;height:auto;display: inline-block;border: 1px solid #CCC;border-bottom:1px dashed #CCC;background:#FFF;">
                            <div style="width: 100%;height: 80%;padding:20px 20px 0px 20px;">
                                <!--试题区域-->
                                <ul class="list-unstyled question" id="" name="">
                                    <li class="question_title"></li>
                                </ul>
                                <!--考题的操作区域-->
                                <div class="operation" style="margin-top: 20px;">
                                    <div class="text-left"
                                         style="margin-left:20px;font-size: 15px;line-height: 30px;">
                                        <div id="unHeart" style="color:#999999;"><span
                                                class="glyphicon glyphicon-heart-empty"></span> <span>收藏本题</span></div>
                                        <div id="heart" style="color:#C40000;display: none;"><span
                                                class="glyphicon glyphicon-heart"></span> <span>已收藏</span></div>
                                    </div>
                                    <%--试题类型--%>
                                    <div class="question_type" style="margin-top: 30px">
                                        <h1>本题知识点</h1>

                                    </div>
                                    <%--本题解析--%>
                                    <div class="parse">
                                        <h1>本题解析</h1>
                                    </div>
                                </div>
                            </div>
                            <%--评论区--%>
                            <div class="comment_area">
                                <div class="post_area">

                                </div>
                                <!-- 显示分页信息 -->
                                <div class="row" style="text-align: center">
                                    <!-- 分页条信息 -->
                                    <div id="post_nav_area"></div>
                                    <!--分页文字信息  -->
                                    <div id="post_info_area"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-1"></div>

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
<script type="text/javascript" src="assets/js/layer-v3.1.1/layer/layer.js"></script>

</body>
</html>
</body>
</html>
<script>
    var user;//当前用户
    var text = "";
    var img_src = "assets/img/public.png";
    var questions = new Array();
    var exam_question; //当前题
    var question;//当前题内容
    var collection = [];//收藏题的集合
    var activeQuestion = 0; //当前操作的考题编号
    var postid; //帖子id
    var currentPage; //当前页
    var post_size = 0;//当前题下的帖子数
    var comment_pn = 1; //默认页数
    var commentnum = 0 ; //评论数
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/isLogin",
            type: "get",
            success: function (result) {
                user = result.map.user;
                console.log(result);
                if (result.msg == "成功") {
                    img_src = "assets/img/" + user.pic;
                    $("#b").addClass("caret");
                    $(".admin-pic").attr("src", img_src);
                    $("#login").hide();
                } else {
                    $("#b").removeClass("caret");
                    $("#login").show();
                }
            }
        });
        $.ajax({
            url: "${pageContext.request.contextPath}/getquestionSession",
            type: "get",
            async: false,
            success: function (result) {
                question = result.map.question;
            }
        });
        $.ajax({
            url: "${pageContext.request.contextPath}/getExam_question",
            data:"question_id="+question.question_id,
            type: "get",
            async: false,
            success: function (result) {
                exam_question = result.map.exam_question;
                console.log(exam_question);
            }
        });
        showQuestion();
        $("#login").click(function () {
            location.href = "${pageContext.request.contextPath}/login.jsp"
        });
    });

    function showQuestion() {
        $(".question_title").html(question.question_title);
        var answer = $("<li></li>").addClass("answer");
        var answer_span = "<span>" + "正确答案:" + question.question_answer + "&nbsp;你的答案:" + exam_question.myanswer +
            "</span>";
        var iscorrect = $("<span></span>");
        answer.append(answer_span).append(iscorrect);
        var item1 = "<li class='question_info'  id='item0'>" +
            "<input type='radio' name='item' value='A'>&nbsp;" + "A." + question.question_OptionA + "</li>";
        var item2 = "<li class='question_info'  id='item1'>" +
            "<input type='radio' name='item' value='B'>&nbsp;" + "B." + question.question_OptionB + "</li>";
        if (question.question_OptionC != "" && question.question_OptionD != "") {
            var item3 = "<li class='question_info'  id='item2'>" +
                "<input type='radio' name='item' value='C'>&nbsp;" + "C." + question.question_OptionC + "</li>";
            var item4 = "<li class='question_info'  id='item3'>" +
                "<input type='radio' name='item' value='D'>&nbsp;" + "D." + question.question_OptionD + "</li>";
        }
        $(".question").append(answer).append(item1).append(item2).append(item3).append(item4);
        if (exam_question.status == 0) {
            iscorrect.css("color", "red").append("&nbsp;&nbsp;(错误)");
            $.each($(".question_info>input[name='item']"), function (index,item) {
                if (item.value == question.question_answer) {
                    $(this).parent(".question_info").css("border-color", "#25BB9B");
                }
                if (item.value == exam_question.myanswer) {
                    $(this).parent(".question_info").css("border-color", "#FF431E");
                }
            })
        } else {
            iscorrect.css("color", "#25BB9B").append("&nbsp;&nbsp;(正确)");
            console.log($(".question_info>input[name='item']"));
            $.each($(".question_info>input[name='item']"), function (index,item) {
                if (item.value == question.question_answer) {
                    $(this).parent(".question_info").css("border-color", "#25BB9B");
                }
            })
        }
        $(".text-left").empty();
        var unHeart = "<div style='color:#999999;'id='unHeart" + activeQuestion + "' onclick='clickCollection(this)'>" +
            "<span class='glyphicon glyphicon-heart-empty'></span> <span>" + "收藏本题" + "</span></div>";
        var heart = "<div style='color:#C40000;display: none'id='heart" + activeQuestion + "'onclick='clickCollection(this)'>" +
            "<span class='glyphicon glyphicon-heart'></span> <span>" + "已收藏" + "</span></div>";
        // $(".question").attr("id", "question" + id);
        $(".text-left").append(unHeart).append(heart);
        isCollection(question.question_id);
        $(".question_type div").empty();
        var tags_box = $("<div></div>");
        $.each(question.question_type, function (index, item) {
            var tags = $("<a></a>").addClass("a_hobby").append(item.question_type);
            tags_box.append(tags);
        });
        $(".question_type").append(tags_box);
        $(".parse div").empty();
        var parse = "<div>" + question.question_parse + "</div>";
        $(".parse").append(parse);
        showPost_area(1, question.question_id);
    }


    // 判断是否已经被收藏了(collection_ques表中是否存在)
    function isCollection(question_id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/isCollection",
            data: "question_id=" + question_id,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                if (result.msg == "成功") {
                    $("#unHeart" + activeQuestion).hide();
                    $("#heart" + activeQuestion).show();
                }
            }
        })
    }

    function showPost_area(pn, question_id) {
        console.log(question_id);
        $.ajax({
            url: "${pageContext.request.contextPath}/getPost",
            data: "pn=" + pn + "&question_id=" + question_id,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                console.log(result);
                var post = new Array();
                post = result.map.pageinfo.list;
                $.ajax({
                    url: "${pageContext.request.contextPath}/getPostLength",
                    data: "question_id=" + question_id,
                    type: 'get',
                    async: false,
                    success: function (result) {
                        post_size = result.map.size;
                        console.log("接受的size：" + post_size);
                    }
                });
                build_post(post);
                $("#post_nav_area").empty();
                $("#post_info_area").empty();
                if (post_size > 5) {
                    build_post_nav_area(result);
                    build_post_info_area(result);
                }
            }
        })
    }

    function build_post(post) {
        $(".post_area").empty();
        var post_title = "<div><h1 style='font-size: 16px;margin-bottom: 20px'><span>" + "共有" + post_size + "条帖子" + "</span>" +
            "<button class='btn pull-right' id='addPost' style='margin:0 10px 17px 0'>添加</button></h1></div>";
        var post_edit = "<textarea style='width:100%;height:100px ;' id='post_content'></textarea>";
        var post_btn = "<div style='height: 20px'><button class='btn pull-right' style='margin:10px 10px 0 0' id='checkPost'>发表</button></div>";
        var edit_box = "<div class='edit-box' style='height: auto;display: none'></div>";
        var edit_box = $("<div></div>").addClass("edit-box").css({"height": "auto", "display": "none"});
        edit_box.append(post_edit).append(post_btn);
        $(".post_area").append(post_title).append(edit_box);
        if (post.length != 0) {
            $.each(post, function (index, item) {
                postid = item.postid;
                commentnum = item.commentnum;
                var post_list_item = $("<div></div>").addClass("post-list-item");
                var post_top = "<div class='poster-info'>" +
                    "<a href='javascript:void(0);' class='poster-pic'><img src='assets/img/" + item.user.pic
                    + "' class='poster-pic img-circle admin-pic'></a>" +
                    "<a href='javascript:void(0);' class='poster-name'  >" + item.user.username + "</a></div>";
                var post_content = "<div class='post-content'>" + item.post_content + "</div>";
                var post_bottom = "<div class='post_bottom'><span class='post-time'>发表于" + item.post_creattime + "</sapn>" +
                    "<a href='javascript:void(0);' class='click-comment pull-right' id='" + postid + "'  >"
                    + "评论(" + commentnum + ")" + "</a></div>";
                post_list_item.append(post_top).append(post_content).append(post_bottom);
                $(".post_area").append(post_list_item);
                showComment_area(comment_pn, postid);
            })
        } else {
            var post_tip = "<div class='post-tip'>" + "评论区空空如也,快来添加吧！" + "</div>";
            $(".post_area").append(post_tip);
        }
    }

    // 创建导航条
    function build_post_nav_area(result) {
        var ul = $("<ul></ul>").addClass("pagination");
        var first = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prepage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        var lastpage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var last = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

        if (result.map.pageinfo.hasPreviousPage == false) {
            first.addClass("disabled");
            prepage.addClass("disabled");
        } else {
            first.click(function () {
                showPost_area(1, question.question_id);
            });
            prepage.click(function () {
                showPost_area(result.map.pageinfo.pageNum - 1, question.question_id);
            })
        }
        ul.append(first).append(prepage);
        if (result.map.pageinfo.hasNextPage == false) {
            lastpage.addClass("disabled");
            last.addClass("disabled");
        } else {
            lastpage.click(function () {
                showPost_area(result.map.pageinfo.pageNum + 1, question.question_id);
            });
            last.click(function () {
                showPost_area(result.map.pageinfo.pages, question.question_id);
            })
        }
        $.each(result.map.pageinfo.navigatepageNums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            if (result.map.pageinfo.pageNum == item) {
                num.addClass("active");
            }
            num.click(function () {
                showPost_area(item, question.question_id);
            });
            ul.append(num);
        });
        ul.append(lastpage).append(last);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#post_nav_area");

    }

    function build_comment_nav_area(result) {
        var ul = $("<ul></ul>").addClass("pagination");
        var first = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prepage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        var lastpage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var last = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.map.pageinfo.hasPreviousPage == false) {
            first.addClass("disabled");
            prepage.addClass("disabled");
        } else {
            first.click(function () {
                showComment_area(1, postid);
            });
            prepage.click(function () {
                showComment_area(result.map.pageinfo.pageNum - 1, postid);
            })
        }
        ul.append(first).append(prepage);
        if (result.map.pageinfo.hasNextPage == false) {
            lastpage.addClass("disabled");
            last.addClass("disabled");
        } else {
            lastpage.click(function () {
                showComment_area(result.map.pageinfo.pageNum + 1, postid);
            });
            last.click(function () {
                showComment_area(result.map.pageinfo.pages, postid);
            })
        }
        $.each(result.map.pageinfo.navigatepageNums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            if (result.map.pageinfo.pageNum == item) {
                num.addClass("active");
            }
            num.click(function () {
                showComment_area(item, postid);
            });
            ul.append(num);
        });
        ul.append(lastpage).append(last);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#comment_nav_area");
    }

    // 创建分页文字信息
    function build_post_info_area(result) {
        $("#post_info_area").append("当前" + result.map.pageinfo.pageNum + "页,总" +
            result.map.pageinfo.pages + "页,总" +
            result.map.pageinfo.total + "条记录");
        currentPage = result.map.pageinfo.pageNum;
    }
    function build_comment_info_area(result){
        $("#comment_info_area").append("当前" + result.map.pageinfo.pageNum + "页,总" +
            result.map.pageinfo.pages + "页,总" +
            result.map.pageinfo.total + "条记录");
        currentPage = result.map.pageinfo.pageNum;
    }

    $(".post_area").on("click", "#addPost", function () {
        $(this).attr("id", "cancel");
        $(this).html("取消发表");
        $(".edit-box").slideDown();
    });
    $(".post_area").on("click", "#cancel", function () {
        $(this).attr("id", "addPost");
        $(this).html("添加");
        $(".edit-box").slideUp();
    });
    $(".post_area").on("click", "#checkPost", function () {
        console.log($(this));
        console.log($(this).parents(".post_area").find("#post_content").val());
        console.log(question.question_id);
        console.log(user.userid);
        var formdata = new FormData();
        formdata.set("question_id", question.question_id);
        formdata.set("posterid", user.userid);
        formdata.set("post_content", $(this).parents(".post_area").find("#post_content").val());
        $.ajax({
            url: "${pageContext.request.contextPath}/addPost",
            data: formdata,
            type: "post",
            processData: false,
            contentType: false,
            success: function (result) {
                showPost_area(1, question.question_id);
            }
        })
    });
    $(".post_area").on("click", ".click-comment", function () {
        console.log($(this));
        var click_postid = $(this).attr("id");
        console.log(click_postid);
        if ($("#com" + click_postid).css("display") == "none") {
            $("#com" + click_postid).slideDown();
        } else {
            $("#com" + click_postid).slideUp();
        }
    });

    function showComment_area(comment_pn, postid1) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getComment",
            data: "pn=" + comment_pn + "&postid=" + postid1,
            type: "post",
            async:false,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                build_Comment(result);
                $("#comment_nav_area").empty();
                $("#comment_info_area").empty();
                if(commentnum>5) {
                    build_comment_nav_area(result);
                    build_comment_info_area(result);
                }
            }
        })
    }

    function build_Comment(result) {
        console.log("`111111");
        var comment = result.map.pageinfo.list;
        var comment_area_list = $("<div></div>").addClass("comment-area-list").css({
            "display": "none",
            "padding-left": "10px"
        });
        comment_area_list.attr("id", "com" + postid);
        var comment_nav_area = "<div id='comment_nav_area'></div>";
        var comment_info_area = "<div id='comment_info_area'></div>";
        var addComment = "<textarea style='width: 90%;height: 30px;' placeholder='请输入你的观点' id='view' ></textarea>";
        var reply_btn = "<button class='btn pull-right' style='margin:0 10px 10px 0;padding-bottom: 10px' id='reply_btn'>"
            +"回复"+"</button>";
        $.each(comment, function (index, item) {
            var comment_list_item = $("<div></div>").addClass("comment-list-item");
            var commenter_info = "<h1 style='font-size: 14px;padding-top: 10px'>" + item.user.username + "</h1>";
            var comment_content = "<div class='comment-content'>" + item.comment_content + "</div>";
            var comment_bottom = "<div style='margin-bottom: 10px'>" + item.comment_creattime + "</div>";
            comment_list_item.append(commenter_info).append(comment_content).append(comment_bottom);
            comment_area_list.append(comment_list_item);
        });
        comment_area_list.append(comment_nav_area).append(comment_info_area).append(addComment).append(reply_btn);
        $(".post_area").append(comment_area_list);
    }
    $(".post_area").on("click","#reply_btn",function () {
        var com_postid = $(this).parent(".comment-area-list").attr("id").split('com');
        var formdata = new FormData();
        formdata.set("postid",com_postid[1]);
        formdata.set("commenter_id",user.userid);
        formdata.set("comment_content",$(this).parent(".comment-area-list").find("#view").val())
        $.ajax({
            url:"${pageContext.request.contextPath}/addComment",
            data:formdata,
            type:"post",
            processData:false,
            contentType:false,
            success:function (result) {
                showPost_area(1,question.question_id);
            }
        })
    })
</script>
