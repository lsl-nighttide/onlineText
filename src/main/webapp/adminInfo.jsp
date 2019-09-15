<!--
Created by IntelliJ IDEA.
User: 卢仕龙
Date: 2019/8/20
Time: 19:46
To change this template use File | Settings | File Templates.-->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <!--	<meta charset="utf-8">
        <title>Apricot 1.3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">-->
    <!-- Le styles -->
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/profile.css">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/minus.png">
    <style>
        .sb > input {
            margin-right: 20%;
        }

        #upload_form {
            position: relative;
            text-align: center;
        }

        .upload_img {
            width: 100%;
            height: 100%;
            opacity: 0;
            position: absolute;
            left: 0;
            top: 0;
        }

        .img_style {
            margin-top: 10px;
        }

        .tags_margin {
            margin-right: 5px;
        }
    </style>
</head>

<body id="admin_body">
<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="ModalLabel">用户修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input type="radio" name="sex" value="男">男
                            <input type="radio" name="sex" value="女">女
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="email" name="phone" class="form-control">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">个人简介</label>
                        <div class="col-sm-10">
                            <textarea name="introduce" style="width: 466px;height: 82px"></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
                <div class="form-group">
                    <label class="col-sm-2 control-label">爱好</label>
                    <div class="col-sm-10 check-box-list">
                        <li><input type="checkbox" name="major" value="java">java</li>
                        <li><input type="checkbox" name="major" value="html5">html5</li>
                        <li><input type="checkbox" name="major" value="javascript">javascript</li>
                        <li><input type="checkbox" name="major" value="css3">css3</li>
                        <li><input type="checkbox" name="major" value="bootstrap3">bootstrap3</li>
                        <li><input type="checkbox" name="major" value="python">python</li>
                        <li><input type="checkbox" name="major" value="vue">vue</li>
                        <li><input type="checkbox" name="major" value="jquery">jquery</li>
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
<div class="modal fade" id="uploadImg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width:400px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modalTitle">上传头像</h4>
            </div>
            <form class="form-horizontal" enctype="multipart/form-data" id="upload_form" method="post">
                <%--                <div class="modal-body text-center form-group">--%>
                <input type="file" class="pull-left upload_img" id="avatar_file" name="fileload" alt="选择并上传头像"/>
                <img src="assets/img/public.png" id="avatar_img" style="width: 180px;">
                <%--                </div>--%>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="img_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- END OF SIDE MENU -->

<!--  PAPER WRAP -->
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

        <!-- END OF BREADCRUMB -->
        <div class="content-wrap">
            <!-- PROFILE -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="well profile" style="min-height: 1000px; display: block">
                        <div class="col-sm-12">
                            <div class="col-xs-12 col-sm-4 text-center">
                                <ul class="list-group">
                                    <li class="list-group-item text-left">
                                        <span class="entypo-user"></span>&nbsp;&nbsp;Profile
                                    </li>
                                    <li class="list-group-item text-center">
                                        <img src="assets/img/${user.pic}" alt=""
                                             class="img-circle img-responsive img-profile" id="show_img">
                                        <button class="btn img_style" id="upload_btn">上传头像</button>
                                    </li>
                                    <%--       <li class="list-group-item text-center">

                                           </li>--%>
                                    <li class="list-group-item text-right">
												<span class="pull-left">
                                                <strong>Joined</strong>
                                            </span>2.13.2014
                                    </li>
                                    <li class="list-group-item text-right">
												<span class="pull-left">
                                                <strong>Last seen</strong>
                                            </span>Yesterday
                                    </li>
                                    <li class="list-group-item text-right">
												<span class="pull-left">
                                                <strong>Nickname</strong>
                                            </span>themesmile
                                    </li>

                                </ul>

                            </div>
                            <div class="col-xs-12 col-sm-8 profile-name">
                                <h2>${user.username}
                                    <button class="btn pull-right" id="update_btn">修改资料</button>
                                </h2>
                                <hr>

                                <dl class="dl-horizontal-profile">
                                    <dt>用户ID</dt>
                                    <dd>${user.userid}</dd>

                                    <dt>姓名</dt>
                                    <dd>${user.username}</dd>

                                    <dt>性别</dt>
                                    <dd>${user.sex}</dd>

                                    <dt>电话</dt>
                                    <dd>${user.phone}</dd>

                                    <dt>地址</dt>
                                    <dd>${user.address}</dd>

                                    <dt>个人简介</dt>
                                    <dd>${user.introduce}</dd>

                                    <%--<dt>About</dt>
                                    <dd>Web Designer / UI</dd>

                                    <dt>Hobbies</dt>
                                    <dd>Read, out with friends, listen to music, draw and learn new things</dd>--%>

                                    <dt>爱好</dt>
                                    <dd>
                                        <span class="tags">html5</span>
                                        <span class="tags">css3</span>
                                        <span class="tags">jquery</span>
                                        <span class="tags">bootstrap3</span>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END OF PROFILE -->
            <!-- /END OF CONTENT -->
            <!-- FOOTER -->
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
        <!--  END OF PAPER WRAP -->


        <!-- END OF RIGHT SLIDER CONTENT-->

        <!-- MAIN EFFECT -->
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
    var arr;
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
    $(".profile-name").on("click", "#update_btn", function () {
        console.log("111");
        reset_form("#userUpdateModal form");
        $("#userUpdateModal").modal({
            backdrop: "static"
        });
        console.log($(".modal"));

    });
    $(".modal").on("mouseenter", "#user_save_btn", function () {
        arr = new Array();
        var items = $("input[name='major']");
        console.log(items);
        for (i = 0; i < items.length; i++) {
            if (items[i].checked) {
                arr.push(items[i].value);
            }
        }
        console.log(arr);
    });
    $("#userUpdateModal").on("click", "#user_save_btn", function () {
        console.log($("#userUpdateModal form").serialize());
        var userid = ${user.userid};
        console.log(userid);
        console.log(arr);
        $.ajax({
            url: "${pageContext.request.contextPath}/updateAdmin",
            data: $("#userUpdateModal form").serialize() + "&userid=" + userid + "&arr=" + arr,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                console.log(result);
                var admin = result.map.admin;
                console.log(admin);
                $("#userUpdateModal").modal('hide');
                // 再次点击没有用，点别的按钮有用
                parent.location.reload();
            }
        })
    });

    function build_info(result) {
        console.log(result);
        $(".profile-name").empty();
        var button = $("<button></button>").addClass("btn pull-right").append("修改资料");
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

    $("#upload_btn").click(function () {
        console.log($("dl dd").eq(0).prop("innerText"));
        var userid = $("dl dd").eq(0).prop("innerText");
        $.ajax({
            url: "${pageContext.request.contextPath}/getuser",
            data: "userid=" + userid,
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (result) {
                var user = result.map.user;
                console.log(user);
                $("#uploadImg").modal({
                    backdrop: "static"
                });
                var img_src = "assets/img/" + user.pic;
                $("#avatar_img").attr("src", img_src);
            }
        });
    });
    // 头像预览
    $("#avatar_file").change(function () {
        // 获取上传文件对象
        var file = $(this)[0].files[0];
        // 读取文件URL
        var reader = new FileReader();
        reader.readAsDataURL(file);
        // 阅读文件完成后触发的事件
        reader.onload = function () {
            // 读取的URL结果：this.result
            $("#avatar_img").attr("src", this.result);
        };
        console.log(file);
    });
    $("#img_save_btn").click(function () {
        var userid = $("dl dd").eq(0).prop("innerText");
        var formdata = new FormData($("#upload_form")[0]);
        formdata.set("userid", userid);
        console.log(formdata);
        $.ajax({
            url: "${pageContext.request.contextPath}/upload",
            data: formdata,
            type: "post",
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                console.log(result);
                var user = result.map.img;
                $("#uploadImg").modal('hide');
                // $("#show_img").attr("src","assets/img/"+user.pic);
                parent.location.reload();
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
</script>