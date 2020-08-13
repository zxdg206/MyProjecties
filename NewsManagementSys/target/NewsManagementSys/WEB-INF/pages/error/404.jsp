<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>404资源不存在</title>
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
		<!-- 头部 -->
		<div class="header">
			<div class="header-top" style="background-color:#3D3D3D">
				<div class="wrap">

					<div class="clearfix"></div>
				</div>
			</div>
			<div class="header-bottom">
				<div class="logo text-center">
					<h2 style="color: grey">无法访问到资源，可能的原因是：${msg}</h2>
				</div>
				</nav>
			</div>
		</div>
		<div class="wrap">
			<div style="margin-left: 30%;margin-right: 30%">
				<img src="/bootstrap/images/404.jpg" width="100%" height="100%">
			</div>
		</div>

		<!-- 底部栏 -->
		<div class="footer">
			<div class="footer-bottom">
				<div class="wrap" align="center">
					<div class="copyrights col-md-6" style="margin-left: 25%;">
						<p> © 2020 ZC新闻 | 
							<a href="#"> 用户反馈</a>
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