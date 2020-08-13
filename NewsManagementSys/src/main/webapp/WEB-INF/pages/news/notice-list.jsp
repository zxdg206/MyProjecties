<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<title>全部公告</title>
	<jsp:include page="public-top.jsp"/>
	<head>
		<style>
			p.text {
				/*多行省略*/
				width: 200px;
				overflow:hidden;
				text-overflow:ellipsis;
				display:-webkit-box;
				-webkit-line-clamp:3;
				-webkit-box-orient:vertical;
			}
		</style>
	</head>
	<body>

	<div class="main-body">
		<div class="wrap">
			<div class="col-md-8 content-left">
				<div class="articles sports">
					<header>
						<h3 class="title-head">公告列表</h3>
					</header>

					<c:forEach var="n" items="${pageInfo.list}">
						<div class="article">
							<div class="article-left">
								<div class="article-title">
									<a class="title" href="/project/viewsNotice?oid=${n.oid}">${n.otitle}</a>
									<p>${n.otime}</p>
								</div>
								<div class="article-text">
									<p class="text" style="width: 700px">
										${n.ocontent}
									</p>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</c:forEach>
					<!--分页-->
					<nav aria-label="...">
						<ul class="pager">
							<li><a href="${pageContext.request.contextPath}/project/toNoticeList?curpage=1">首页</a></li>
							<li><a href="${pageContext.request.contextPath}/project/toNoticeList?curpage=${pageInfo.prePage}">上一页</a></li>
							<li><a>${pageInfo.pageNum}</a></li>
							<li><a href="${pageContext.request.contextPath}/project/toNoticeList?curpage=${pageInfo.nextPage}">下一页</a></li>
							<li><a href="${pageContext.request.contextPath}/project/toNoticeList?curpage=${pageInfo.total}">尾页</a></li>
						</ul>
					</nav>
					<!--分页-->
				</div>
			</div>
			<jsp:include page="public-right.jsp"/>
			<div class="clearfix"></div>
		</div>
	</div>
	<jsp:include page="public-footer.jsp"/>
	<script>

	</script>
	</body>
</html>