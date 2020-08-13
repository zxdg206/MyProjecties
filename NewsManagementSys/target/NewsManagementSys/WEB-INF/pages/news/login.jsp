<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>登陆页</title>
		<link href="/bootstrap/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="/bootstrap/js/jquery.min.js"></script>
		<!-- Custom Theme files -->
		<link href="/bootstrap/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
			//刷新验证吗
			function refreshCode() {
				var code = document.getElementById("vcode");
				code.src = "/web/checkcode?time="+new Date().getTime();
			}
			//数据安全验证
			function dataSafe() {
                var name = document.getElementById("username").value;
                var paswd = document.getElementById("password").value;
                var check = document.getElementById("checkinfo").value;
				if(name.length==0){
					alert("请输入用户名！")
					return;
				}
				if(!name.match("^[\u4e00-\u9fa5_a-zA-Z0-9]+$")){
					alert("用户名中包含特殊符号")
					return;
				}
				if(name.length>12 || name.length<2){
					alert("用户名长度必须在2-12之间,请重新输入！")
					return;
				}
				if(paswd.length==0){
					alert("请输入密码！")
					return;
				}
				if(paswd.length>12 || paswd.length<3){
					alert("密码长度在3-12之间,请重新输入！")
					return;
				}
				if(check.length==0){
					alert("请输入验证码！")
					return;
				}
				if(check.length>5 || check<4){
					alert("验证码长度不正确！")
					return;
				}else {
					document.loginform.submit();
				}

            }
		</script>
		<!-- for bootstrap working -->
		<script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
		<!-- //for bootstrap working -->
		<script src="/bootstrap/js/responsiveslides.min.js"></script>
		<script>
			$(function() {
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
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event) {
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
							<c:if test="${ empty uname}">
								<li>
									<a href="/project/toHome">首页</a>
								</li>
								<li>
									<a href="/project/toRegist">注册</a>
								</li>
								<li>
									<a href="/project/toNoticeList">站内公告</a>
								</li>
							</c:if>
							<c:if test="${not empty uname}">
								<li style="margin-right: 5px">
									<img style="width: 30px;height: 30px" class="img-circle" src=${uprofile}>
								</li>
								<li>
									<a href="/web/toPersonal">${uname}</a>
								</li>
								<li>
									<a href="/web/exitLogin">退出</a>
								</li>
							</c:if>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="header-bottom">
				<div class="logo text-center">
					<a href="/project/toHome"><img src="/bootstrap/images/logo.png" alt="" /></a>
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
					<li class="active">登陆</li>
			</ol>
		<!-- 登陆界面 -->
		<div class="main-body">
			<div class="container" style="width: 400px;">
			    <h2 style="text-align: center;">登录</h2>
			    <hr>
			    <form name="loginform" method="post" action="/web/userlogin">
			        <div class="form-group">
			            <label for="username">用户名：</label>
			            <input type="text" name="uname" class="form-control" id="username" placeholder="输入用户名" value="${rname}" onblur="inname(this.value)"/>
			        </div>
			
			        <div class="form-group">
			            <label for="password">密码：</label>
			            <input type="password" name="upassword" class="form-control" id="password" placeholder="输入密码" value="${password}" onblur="inpaswd(this.value)"/>
			        </div>
			        <!--身份-->
			        <div class="form-group">
				        <label>身份：</label>
						<select name="uidentity" class="form-control">
								<option value="普通用户" selected>用户</option>
								<option value="新闻管理员">新闻管理员</option>
								<option value="超级用户">超级用户</option>
						</select>
					</div>
					<!--验证码-->
			        <div class="form-inline">
			            <label for="vcode">验证码：</label>
			            <input type="text" class="form-control" name="checkcode" id="checkinfo" placeholder="请输入验证码" style="width: 120px;"/>
			            <!-- 由js提交代码刷新 -->
			            <a href="javascript:refreshCode();">
			                <img src="/web/checkcode" title="看不清点击刷新" id="vcode" style="margin-left: 15%"/>
			            </a>
			        </div>
			        <hr/>
			        <div class="form-group" style="text-align: center;">
			            <input class="btn btn-default btn-lg" type="button" value="登&emsp;录" id="logbtn" style="width: 50%;" onclick="dataSafe()">
			        </div>
			    </form>
			    <!-- 出错显示的信息框 -->
			    <c:if test="${not empty requestScope.msg}">
			    <div class="alert alert-warning alert-dismissible" role="alert">
			        <button type="button" class="close" data-dismiss="alert" >
			            <span>&times;</span></button>
			        <h4  align="center"  style="color: tomato">${msg}</h4>
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
			$(document).ready(function() {
				$().UItoTop({
					easingType: 'easeOutQuart'
				});
			});

		</script>
		<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</body>

</html>