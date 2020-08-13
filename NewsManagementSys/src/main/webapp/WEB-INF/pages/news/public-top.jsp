<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="/bootstrap/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="/bootstrap/js/jquery.min.js"></script>
		<!-- Custom Theme files -->
		<link href="/bootstrap/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<!-- for bootstrap working -->
		<script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
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
		<!-- 上方状态条，头部 -->
		<div class="header">
			<div class="header-top" style="background-color:#3D3D3D">
				<div class="wrap">
					<div class="top-menu" style="margin-left: 86%;">
						<ul style="width: 300px">
							<c:if test="${ empty uname}">
								<li>
									<a href="/project/toLogin">登陆</a>
								</li>
								<li>
									<a href="/project/toRegist">注册</a>
								</li>
							</c:if>
							<c:if test="${not empty uname}">
								<li style="margin-right: 5px">
									<a href="/web/welcome"><img style="width: 30px;height: 30px" class="img-circle" src=${uprofile}></a>
								</li>
								<li>
									<a href="/web/welcome">${uname}</a>
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
			<!--首页标题图片-->
			<div class="header-bottom">
				<div class="logo text-center">
					<a href="/project/toHome"><img src="/bootstrap/images/logo.png" style="height: 110px" alt="没有图片" /></a>
				</div>
				<div class="navigation">
					<nav class="navbar navbar-default" role="navigation">
						<div class="wrap">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
												<span class="sr-only">Toggle navigation</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>

							</div>

							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">
									<li class="active">
										<a href="/project/toHome">首页</a>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">运动<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=运动&type=足球">足球</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=运动&type=篮球">篮球</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=运动&type=网球">网球</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=运动&type=其他">其他</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">娱乐<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=娱乐&type=明星">明星</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=娱乐&type=影音">影音</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=娱乐&type=综艺">综艺</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=娱乐&type=其他">其他</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">健康<b class="caret"></b></a>
										<ul class="dropdown-menu">
												<li><a href="${pageContext.request.contextPath}/project/toList?menu=健康&type=疫情">疫情</a></li>
												<li class="divider"></li>
												<li><a href="${pageContext.request.contextPath}/project/toList?menu=健康&type=食品">食品</a></li>
												<li class="divider"></li>
												<li><a href="${pageContext.request.contextPath}/project/toList?menu=健康&type=医疗">医疗</a></li>
												<li class="divider"></li>
												<li><a href="${pageContext.request.contextPath}/project/toList?menu=健康&type=其他">其他</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">财经<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=财经&type=股票">股票</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=财经&type=基金">基金</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=财经&type=外汇">外汇</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=财经&type=其他">其他</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">游戏<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=游戏&type=网游">网游</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=游戏&type=手游">手游</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=游戏&type=单机">单机</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=游戏&type=其他">其他</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">科技<b class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=科技&type=互联网">互联网</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=科技&type=手机">手机</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=科技&type=数码">数码</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/project/toList?menu=科技&type=其他">其他</a></li>
										</ul>
									</li>
									<li>
										<a href="/project/toNoticeList">站内公告</a>
									</li>
									<div class="clearfix"></div>
								</ul>
								<!--搜索框-->
								<div class="search">
									<div class="search-box">
										<div id="sb-search" class="sb-search sb-search-open">
											<form action="/project/searchNews" id="searchform" method="get">
												<div>
													<div style="float: left">
												<input style="width: 175%" class="form-control" placeholder="输入感兴趣的内容..." type="search" name="search" id="search">
													</div>
													<div style="float: right">
														<input class="btn btn-block btn-primary" type="button" value="搜索" onclick="searchIsEmpty()">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!--搜索框-->

								<div class="clearfix"></div>
							</div>
						</div>
					</nav>
				</div>
				</nav>
			</div>
		</div>
		<!-- 导航栏和正文边界 -->
		<div style="margin-bottom: 2%;"></div>
		<script>
			function searchIsEmpty(){
				if(${empty uid}){
					if(confirm("你还没有登陆,现在登陆吗？")){
						document.location = "${pageContext.request.contextPath}/project/toLogin"
					}
					return;
				}

				if(document.getElementById('search').value == null || document.getElementById('search').value == ""){
					alert('请输入搜索内容')
				}else {
					document.getElementById('searchform').submit();
				}
			}
		</script>
	</body>
</html>
