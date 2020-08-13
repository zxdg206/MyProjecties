<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<title>搜索“${search}”的相关结果</title>
	<jsp:include page="public-top.jsp"/>
	<body>
	<div class="main-body">
		<div class="wrap">
			<div class="col-md-8 content-left">
				<div class="articles sports">
					<header>
						<h3 class="title-head">搜索“${search}”的相关结果</h3>
					</header>
					<c:forEach var="n" items="${pageInfo.list}">
						<div class="article">
							<div class="article-left"">
								<a href="/project/viewNews?nid=${n.nid}"><img style="width: 420px;height: 220px" src="${n.nimg}"></a>
							</div>
							<div class="article-right">
								<div class="article-title">
									<p style="color: #aa5500">新闻类别：${n.menu}/${n.type}</p>
									<a class="title" href="/project/viewNews?nid=${n.nid}">${n.title}</a>
								</div>
								<div class="article-text">
									<p>${n.brief}</p>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</c:forEach>


					<!--分页-->
					<nav aria-label="...">
						<ul class="pager">
							<li><a href="${pageContext.request.contextPath}/project/searchNews?search=${search}&curpage=1">首页</a></li>
							<li><a href="${pageContext.request.contextPath}/project/searchNews?search=${search}&curpage=${pageInfo.prePage}">上一页</a></li>
							<li><a>${pageInfo.pageNum}</a></li>
							<li><a href="${pageContext.request.contextPath}/project/searchNews?search=${search}&curpage=${pageInfo.nextPage}">下一页</a></li>
							<li><a href="${pageContext.request.contextPath}/project/searchNews?search=${search}&curpage=${pageInfo.pages}">尾页</a></li>
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
	</body>

</html>