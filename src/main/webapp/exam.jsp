<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>jQuery仿牛客网在线答题进度代码 </title>

<!--    <link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.4.css">-->
<!--    <link href="css/index.css" rel="stylesheet" type="text/css">-->
<!--    <script src="js/jquery-1.9.1.min.js"></script>-->
<!--    <script src="js/bootstrap.js"></script>-->
<!--    <script type="text/javascript" src="js/Questions.js"></script>-->
<script type="text/javascript" src="assets/js/jquery.js"></script>
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/loader-style.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/profile.css">
<link rel="stylesheet" href="assets/css/exam.css">
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
<body>
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
<div style="min-height: 700px">
    <div class="col-md-1"></div>
    <div class="col-md-10">
        <div class="content">
            <div class="row">
                <div class="btn-group">
                    <button class="btn btn-default" type="button" onClick="history.go(-1);">返回上一个页面</button>
                    <button class="btn btn-default" type="button" onClick="location.reload()">刷新</button>
                </div>
            </div>
            <div style="width: 100%;height:500px;display: inline-block;position: relative;margin-top:10px;">
                <div style="width: 100%;">
                    <div style="width: 80%;margin: 0px auto">
                        <div style="width: 100%;height:100px;border: 1px solid #CCC;border-bottom:none;background:#FFF;">
                            <div class="middle-top"
                                 style="width: 100%;height: 50px;border-bottom: 1px solid #CCC;background:#2D3339; position:relative;">
                                <div class="middle-top-left pull-left"
                                     style="height: 100%;padding-left: 20px;;background:#232C31;color:#FFF;">
                                    <div class="text-center pull-left progress-left"
                                         style="border: 1px solid #A2C69A;background:#FFF;border-radius:10px;line-height:20px;height:20px;margin:15px 0px 15px 0px;font-size: 11px;position:relative;">
                                        <div class="progress pull-left"
                                             style="background: #609E53;width: 0px;height:18px;position:absolute;left: 0px;"></div>
                                        <div class="pro-text"
                                             style="left: 0px;color: #609E53;position:absolute;top:0px;width:100%;"> 已完成<span
                                                class="progres"></span></div>
                                    </div>
                                    <div class="pull-left"
                                         style=" width:135px;line-height:20px;height:20px;margin:15px;font-size:15px;">
                                        <!--已做答的数量和考题总数-->
                                        当前第<span class="questioned"></span>题/共<span class="question_sum"></span>题
                                    </div>
                                </div>
                                <div class="middle-top-right text-center pull-left"
                                     style="width:160px; height: 100%;border-left: 1px solid red;position: absolute;right: 0px;">
                                    <div class="stop pull-left" style="width: 50px; height: 100%;padding: 10px;"><a
                                            href="javascript:void(0);" class="text-center" style="color: #FE6547;">
                                        <div class="time-stop glyphicon glyphicon-pause" title="暂停"
                                             style="width:30px;height: 30px;line-height:30px; border-radius:15px;border: 1px solid #FE6547;"></div>
                                        <div class="time-start glyphicon glyphicon-play" title="开始"
                                             style="width:30px;height: 30px;line-height:30px;border-radius:15px;border: 1px solid #FE6547;display:none;"></div>
                                    </a></div>
                                    <div class="pull-left"
                                         style="width: 100px; height: 100%;padding: 10px 0px 10px 0px;">
                                        <div class="time"
                                             style="width:100px;height: 30px;line-height:30px; border-radius:15px;font-size:20px;color:#FFF;"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 100%;height: 50px;font-size:15px;color: #000;line-height: 50px;padding-left: 20px;">
                                <div style="color:#FFF;background: red;width: 22px;height: 22px;border-radius:11px;line-height:22px;font-size:13px; text-align: center;"
                                     class="glyphicon glyphicon-map-marker"></div>
                                [单选题]
                            </div>
                        </div>
                        <div style="width: 100%;height:auto;display: inline-block;border: 1px solid #CCC;border-bottom:1px dashed #CCC;background:#FFF;">
                            <div style="width: 100%;height: 90%;padding:20px 20px 0px 20px;">
                                <!--试题区域-->
                                <ul class="list-unstyled question" id="" name="">
                                    <li class="question_title"></li>
                                </ul>
                                <!--考题的操作区域-->
                                <div class="operation" style="margin-top: 20px;">
                                    <div class="text-left"
                                         style="margin-left:20px;font-size: 15px;float: left;line-height: 30px;">
                                        <div id="unHeart" style="color:#999999;"><span
                                                class="glyphicon glyphicon-heart-empty"></span> <span>收藏本题</span></div>
                                        <div id="heart" style="color:#C40000;display: none;"><span
                                                class="glyphicon glyphicon-heart"></span> <span>已收藏</span></div>
                                    </div>
                                    <div class="text-right" style="margin-right: 20px;">
                                        <div class="form-group" style="color: #FFF;">
                                            <button class="btn btn-success" id="submitQuestions">提交试卷</button>
                                            <button class="btn btn-info" id="nextQuestion">下一题</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="width: 100%;height:auto;display: inline-block;border: 1px solid #CCC;border-top:none;background:#FFF;">
                            <div style="width: 100%;padding:20px;">
                                <div class="panel-default">
                                    <div class="panel-heading" class="panel-heading" id="closeCard"
                                         style="color: #DCE4EC;font-size: 15px;display: none;background: none;">
                                        <span>收起答题卡</span> <span class="glyphicon glyphicon-chevron-up"></span></div>
                                    <div class="panel-heading" id="openCard" style="font-size: 15px;background: none;">
                                        <span>展开答题卡</span> <span class="glyphicon glyphicon-chevron-down"></span></div>
                                    <div id="answerCard" style="display: none;">
                                        <div class="panel-body form-horizontal" style="padding: 0px;">
                                            <ul class="list-unstyled">
                                            </ul>
                                        </div>
                                    </div>
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
<script>
    var HH = 0;//时
    var mm = 0;//分
    var ss = 0;//秒
    var timeState = true;//时间状态 默认为true 开启时间
    var questions = new Array();
    var question; //当前题
    var collection = [];//收藏题的集合
    var activeQuestion = 0; //当前操作的考题编号
    var questioned = 0; //
    var checkQues = []; //已做答的题的集合
    $(function () {
        $(".middle-top-left").width($(".middle-top").width() - $(".middle-top-right").width())
        $(".progress-left").width($(".middle-top-left").width() - 200);
        $.ajax({
            url: "${pageContext.request.contextPath}/isLogin",
            type: "get",
            async: false,
            success: function (result) {
                console.log(result);
                if (result.msg == "成功") {
                    img_src = "assets/img/" + result.map.user.pic;
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
            url: "${pageContext.request.contextPath}/getQuestionSession",
            async: false,
            type: "get",
            success: function (result) {
                console.log(result);
                questions = result.map.select_question;
            }
        });
        console.log(questions);
        progress();
        answerCard();
        showQuestion(0);
        /*alert(QuestionJosn.length);*/
        /*实现进度条信息加载的动画*/
        var str = '';
        /*开启或者停止时间*/
        $(".time-stop").click(function () {
            timeState = false;
            $(this).hide();
            $(".time-start").show();
        });
        $(".time-start").click(function () {
            timeState = true;
            $(this).hide();
            $(".time-stop").show();
        });
        /*答题卡的切换*/
        $("#openCard").click(function () {
            $("#closeCard").show();
            $("#answerCard").slideDown();
            $(this).hide();
        });
        $("#closeCard").click(function () {
            $("#openCard").show();
            $("#answerCard").slideUp();
            $(this).hide();
        });

        //提交试卷
        $("#submitQuestions").click(function () {
            /*alert(JSON.stringify(checkQues));*/
            var flag = false;
            console.log(checkQues);
            if (checkQues.length != 10) {
                var arr = [];
                for (var i = 0; i < checkQues.length; i++) {
                    console.log(checkQues[i].id);
                    arr[i] = checkQues[i].id;
                }
                if (!confirm("您还有题目尚未做,还继续提交吗")) {
                    for (var j = 0; j < 10; j++) {
                        if (arr.indexOf(j) == -1) {
                            var id = j;
                            layer.msg("您现在完成了" + arr.length + "道题,将在3秒后跳到最先未做题页面", {shift: -1}, function () {
                                console.log(j);
                                showQuestion(id);
                            });
                        }
                    }
                } else {
                    // 自动补全未做题的答案
                    for (var k = 0; k < 10; k++) {
                        if (arr.indexOf(k) == -1) {
                            var check = {};
                            check.id = k;
                            check.item = "没做";
                            check.answer = "没做";
                            checkQues.push(check);
                            console.log(checkQues);
                        }
                    }
                    console.log(checkQues);
                    flag = true;
                }
            }
            if (flag || checkQues.length == 10) {
                // 保证与试题顺序相同
                for (var m = 0; m < checkQues.length; m++) {
                    for (var n = m + 1; n < checkQues.length; n++) {
                        if (checkQues[m].id > checkQues[n].id) {
                            var emp = checkQues[m];
                            checkQues[m] = checkQues[n];
                            checkQues[n] = emp;
                        }
                    }
                }
                console.log(checkQues);
                var checkQues1 = [];
                for (var i = 0; i < checkQues.length; i++) {
                    checkQues1[i] = checkQues[i].answer;
                }
                console.log(checkQues1);
                console.log(collection);
                $.ajax({
                    url: "${pageContext.request.contextPath}/submitQuestion",
                    data: "checkQues=" + checkQues1 + "&collection=" + collection,
                    type: "post",
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    success: function (result) {
                        console.log(result);
                        var exam_id = result.map.exam.exam_id;
                        layer.confirm("您此次得了" + result.map.exam.grade + "分,正确率为" + result.map.exam.grade + "%<br>" +
                            "确定前往答案解析页面吗？", {btn:['确定','取消'],
                            btn1: function () {
                                location.href = "${pageContext.request.contextPath}/answer_key?exam_id="+exam_id;

                            }, btn2: function () {
                                location.href = "${pageContext.request.contextPath}/myinfomation.jsp";
                            }
                        });
                    }
                });
            }
        });
        //进入下一题
        $("#nextQuestion").click(function () {
            if ((activeQuestion + 1) != questions.length) showQuestion(activeQuestion + 1);
            showQuestion(activeQuestion)
        });
        $("#login").click(function () {
            location.href = "${pageContext.request.contextPath}/login.jsp"
        });
    })
    ;
    /*实现计时器*/
    var time = setInterval(function () {
        if (timeState) {
            if (HH == 24) HH = 0;
            str = "";
            if (++ss == 60) {
                if (++mm == 60) {
                    HH++;
                    mm = 0;
                }
                ss = 0;
            }
            str += HH < 10 ? "0" + HH : HH;
            str += ":";
            str += mm < 10 ? "0" + mm : mm;
            str += ":";
            str += ss < 10 ? "0" + ss : ss;
            $(".time").text(str);
        } else {
            $(".time").text(str);
        }
    }, 1000);
    console.log($("#ques" + activeQuestion));

    //展示考卷信息
    function showQuestion(id) {
        $(".questioned").text(id + 1);
        questioned = (id + 1) / questions.length;
        if (activeQuestion != undefined) {
            $("#ques" + activeQuestion).removeClass("question_id").addClass("active_question_id");
        }
        activeQuestion = id;
        $(".question").find(".question_info").remove();
        question = questions[id];
        $(".question_title").html("<strong>第 " + (id + 1) + " 题 、</strong>" + question.question_title);
        var item1 = "<li class='question_info' onclick='clickTrim(this)' id='item0'>" +
            "<input type='radio' name='item' value='A'>&nbsp;" + "A." + question.question_OptionA + "</li>";
        var item2 = "<li class='question_info' onclick='clickTrim(this)' id='item1'>" +
            "<input type='radio' name='item' value='B'>&nbsp;" + "B." + question.question_OptionB + "</li>";
        if (question.question_OptionC != "" && question.question_OptionD != "") {
            var item3 = "<li class='question_info' onclick='clickTrim(this)' id='item2'>" +
                "<input type='radio' name='item' value='C'>&nbsp;" + "C." + question.question_OptionC + "</li>";
            var item4 = "<li class='question_info' onclick='clickTrim(this)' id='item3'>" +
                "<input type='radio' name='item' value='D'>&nbsp;" + "D." + question.question_OptionD + "</li>";
        }
        $(".text-left").empty();
        var unHeart = "<div style='color:#999999;'id='unHeart" + activeQuestion + "' onclick='clickCollection(this)'>" +
            "<span class='glyphicon glyphicon-heart-empty'></span> <span>" + "收藏本题" + "</span></div>";
        var heart = "<div style='color:#C40000;display: none'id='heart" + activeQuestion + "'onclick='clickCollection(this)'>" +
            "<span class='glyphicon glyphicon-heart'></span> <span>" + "已收藏" + "</span></div>";
        $(".question").attr("id", "question" + id);
        $(".text-left").append(unHeart).append(heart);
        isCollection(question.question_id);
        for (var i = 0; i < collection.length; i++) {
            if (collection[i] == question.question_id) {
                $("#unHeart" + activeQuestion).hide();
                $("#heart" + activeQuestion).show();
            }
        }
        $(".question").append(item1).append(item2).append(item3).append(item4);
        $("#ques" + id).removeClass("active_question_id").addClass("question_id");
        for (var i = 0; i < checkQues.length; i++) {
            if (checkQues[i].id == id) {
                $("#" + checkQues[i].item).find("input").prop("checked", "checked");
                $("#" + checkQues[i].item).addClass("clickTrim");
                $("#ques" + activeQuestion).removeClass("question_id").addClass("clickQue");
            }
        }
        progress();
    }

    /* 收藏*/

    /*答题卡*/
    function answerCard() {
        $(".question_sum").text(questions.length);
        for (var i = 0; i < questions.length; i++) {
            var questionId = "<li id='ques" + i + "'onclick='saveQuestionState(" + i + ")' class='questionId'>" + (i + 1) + "</li>";
            $("#answerCard ul").append(questionId);
        }
    }

    function clickCollection(source) {
        console.log(source);
        if (source.id == ("unHeart" + activeQuestion)) {
            console.log($("#" + source.id));
            $("#" + source.id).hide();
            $("#heart" + activeQuestion).show();
            collection.push(question.question_id);
            console.log(collection);
        } else {
            $("#" + source.id).hide();
            $("#unHeart" + activeQuestion).show();
            collection = $.grep(collection, function (value) {
                return value != question.question_id;
            });
            console.log(collection);
        }
    }

    /*选中考题*/
    var Question;

    function clickTrim(source) {
        console.log(source);
        var id = source.id;
        $("#" + id).find("input").prop("checked", "checked");
        $("#" + id).addClass("clickTrim");
        $("#ques" + activeQuestion).removeClass("question_id").addClass("clickQue");
        var ques = 0;
        for (var i = 0; i < checkQues.length; i++) {
            if (checkQues[i].id == activeQuestion && checkQues[i].item != id) {
                ques = checkQues[i].id;
                checkQues[i].item = id;//获取当前考题的选项ID
                checkQues[i].answer = $("#" + id).find("input[name=item]:checked").val();//获取当前考题的选项值
            }
        }
        if (checkQues.length == 0 || Question != activeQuestion && activeQuestion != ques) {
            var check = {};
            check.id = activeQuestion;//获取当前考题的编号
            check.item = id;//获取当前考题的选项ID
            check.answer = $("#" + id).find("input[name=item]:checked").val();//获取当前考题的选项值
            checkQues.push(check);
        }
        $(".question_info").each(function () {
            var otherId = $(this).attr("id");
            if (otherId != id) {
                $("#" + otherId).find("input").prop("checked", false);
                $("#" + otherId).removeClass("clickTrim");
            }
        })
        Question = activeQuestion;
    }

    /*设置进度条*/
    function progress() {
        var prog = ($(".active_question_id").length + 1) / questions.length;
        var pro = $(".progress").parent().width() * prog;
        $(".progres").text((prog * 100).toString().substr(0, 5) + "%");
        $(".progress").animate({
            width: pro,
            opacity: 0.5
        }, 1000);
    }

    /*保存考题状态 已做答的状态*/
    function saveQuestionState(clickId) {
        showQuestion(clickId)
    }
// 判断是否已经被收藏了(collection_ques表中是否存在)
    function isCollection(question_id){
        $.ajax({
            url:"${pageContext.request.contextPath}/isCollection",
            data:"question_id="+question_id,
            type:"post",
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            success:function (result) {
                if(result.msg =="成功"){
                    $("#unHeart" + activeQuestion).hide();
                    $("#heart" + activeQuestion).show();
                }
            }
        })
    }
</script>
