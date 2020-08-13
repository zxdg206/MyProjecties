<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册新用户</title>
    <link href="/bootstrap/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/bootstrap/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <link href="/bootstrap/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="application/x-javascript">
        //注册表单提交
        function dataSafe() {
            var a = document.getElementById("nameinfo").innerText;
            var b = document.getElementById("paswdinfo").innerText;
            var c = document.getElementById("emailinfo").innerText;
            var d = document.getElementById("phoneinfo").innerText;
            var e = document.getElementById("imginfo").value;

            if(a=="*"&&b=="*"&&c=="*"&&d=="*"){
                if(e!="") {
                    document.getElementById("registform").submit();
                }else {
                    alert("请上传头像！")
                }
            }else {
                alert("请完善注册信息后提交！")
            }
        }

    addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <!-- for bootstrap working -->
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
    <!-- //for bootstrap working -->
    <script src="/bootstrap/js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
    <script type="text/javascript" src="/bootstrap/js/move-top.js"></script>
    <script type="text/javascript" src="/bootstrap/js/easing.js"></script>
    <!--/script-->
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });
    </script>
</head>

<body>
<!-- 导航 -->
<div class="header">
    <div class="header-top" style="background-color:#3D3D3D">
        <div class="wrap">
            <div class="top-menu" style="margin-left: 86%;">
                <ul style="width: 300px">
                    <li>
                        <a href="/project/toHome">首页</a>
                    </li>
                    <li>
                        <a href="/project/toLogin">登陆</a>
                    </li>
                    <li>
                        <a href="/project/toNoticeList">站内公告</a>
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="logo text-center">
            <a href="/project/toHome"><img src="/bootstrap/images/logo.png" alt=""/></a>
        </div>
        </nav>
    </div>
</div>
<div class="wrap">
    <!-- 二级标签 -->
    <ol class="breadcrumb">
        <li>
            <a href="/project/toHome">主页</a>
        </li>
        <li class="active">注册</li>
    </ol>
    <!-- 注册界面 -->
    <div class="main-body">
        <div class="container" style="width: 400px;">
            <h2 style="text-align: center;">注册新用户</h2>
            <hr>
            <form name="registform" id="registform" method="post" enctype="multipart/form-data" action="/web/userRegist">
                <div class="form-group">
                    <label for="username" style="margin-bottom: 10px">用户名：</label>
                    <span id="nameinfo" style="color: red"></span>
                    <input type="text" name="uname" class="form-control" id="username" placeholder="输入用户名" onblur="inname(this.value)"/>
                </div>

                <div class="form-group">
                    <label for="password" style="margin-bottom: 10px">密码：</label>
                    <span id="paswdinfo" style="color: red"></span>
                    <input type="text" name="upassword" class="form-control" id="password" placeholder="输入密码" onblur="inpaswd(this.value)"/>
                </div>

                <div class="form-group">
					<label for="password" style="margin-bottom: 10px">性别：</label>
                            <input type="radio" name="usex" id="man" value="男" checked="checked"> 男
                            <input type="radio" name="usex" id="feman" value="女" style="margin-left: 20px">女
                </div>

                <div class="form-group">
                    <label for="username" style="margin-bottom: 10px">邮箱：</label>
                    <span id="emailinfo" style="color: red"></span>
                    <input type="text" name="uemail" class="form-control" id="uemail" placeholder="输常用邮箱..." onblur="inemail(this.value)"/>
                </div>

                <div class="form-group">
                    <label for="username" style="margin-bottom: 10px">电话：</label>
                    <span id="phoneinfo" style="color: red"></span>
                    <input type="text" name="uphone" class="form-control" id="uphone" placeholder="输入联系电话..." onblur="inphone(this.value)"/>
                </div>

                <!--身份-->
                <div class="form-group">
                    <label style="margin-bottom: 10px">身份：</label>
                    <select  class="form-control" disabled="disabled">
                        <option value="普通用户" selected="selected">普通用户</option>
                    </select>
                </div>
                <!--头像-->
                <div class="form-group">
                    <label for="username" style="margin-bottom: 10px">头像：</label>
                    <input type="file" name="uimg"  id="imginfo"/>
                </div>
                <hr/>
                <div class="form-group" style="text-align: center;">
                    <input class="btn btn-primary btn-lg" type="button" value="注&emsp;册" id="logbtn" style="width: 50%;"
                           onclick="dataSafe()">
                </div>
            </form>
            <!-- 出错显示的信息框 -->
            <c:if test="${not empty requestScope.msg}">
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert">
                        <span>&times;</span></button>
                    <h4 align="center" style="color: tomato">${msg}</h4>
                </div>
            </c:if>
        </div>
    </div>
    <!-- 登陆界面 -->
</div>

<!-- 底部栏 -->
<div class="footer">
    <div class="footer-bottom">
        <div class="wrap" align="center">
            <div class="copyrights col-md-6" style="margin-left: 25%;">
                <p>欢迎使用  |
                    <a href="#"> © 2020 ZC新闻</a>
                </p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- 底部栏 -->
<script type="text/javascript">

    $(document).ready(function () {
        $().UItoTop({
            easingType: 'easeOutQuart'
        });
    });
<!--表单验证-->

    function inname(name) {

        if(name.length==0){
            document.getElementById("nameinfo").innerText = "用户名不能为空";
            return;
        }
        if(!name.match("^[\u4e00-\u9fa5_a-zA-Z0-9]+$")){
            document.getElementById("nameinfo").innerText = "用户名不能包含特殊符号";
            return;
        }
        if(name.length>12 || name.length<2){
            document.getElementById("nameinfo").innerText = "用户名长度必须在2-12之间";
            return;
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/web/checkName",
            data:{"uname":name},
            success: function (data) {
                if(data==1){
                    document.getElementById("nameinfo").innerText = "用户名已存在";
                }else {
                    document.getElementById("nameinfo").innerText = "*";
                }
            }
        });
        document.getElementById("nameinfo").innerText = "*";
    }
    function inpaswd(pswd) {
        if(pswd.length==0){
            document.getElementById("paswdinfo").innerText = "密码不能为空";
            return;
        }
        if(pswd.length>12 || pswd.length<6){
            document.getElementById("paswdinfo").innerText = "密码长度必须在6-12之间";
            return;
        }
        document.getElementById("paswdinfo").innerText = "*";
    }

    function inemail(email) {
        if(!email.match("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")){
            document.getElementById("emailinfo").innerText = "邮箱格式不正确";
            return;
        }
        document.getElementById("emailinfo").innerText = "*";
    }
    function inphone(num) {
        if(!num.match("^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\\d{8}$")){
            document.getElementById("phoneinfo").innerText = "电话格式不正确";
            return;
        }
        document.getElementById("phoneinfo").innerText = "*";
    }
<!--表单验证-->
</script>
<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>

</html>