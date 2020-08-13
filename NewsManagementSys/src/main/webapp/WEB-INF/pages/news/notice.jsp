<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<title>公告内容</title>
	<jsp:include page="public-top.jsp"/>
	<body>
	<div class="main-body">
		<div class="wrap">
			<div class="col-md-8 content-left" style="margin-left: 230px">
				<div class="about">
					<h2 class="head">${notice.otitle}</h2>
					<h5>${notice.odate}</h5>
					<hr>
					<p style="font-size: 22px">${notice.ocontent}</p>
					<div class="more-address">
						<hr style="margin-top: 100px">
						<address>
							<strong>关于.ZC新闻.公告</strong><br>
							本公告的解释权归本网站管理人。<br>
							${notice.otime}<br>
							<abbr title="Phone">P :</abbr> (123) 456-7890
						</address>
						<address>
							<strong>联系管理员</strong><br>
							<a href="mailto:info@example.com">zxdg206@163.com</a>
						</address>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<jsp:include page="public-footer.jsp"/>
	</body>

</html>