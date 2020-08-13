<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
			<!--右侧栏-->
			<div class="col-md-4 side-bar">
				<div class="first_half">
					<div class="side-bar-articles">
						<c:forEach var="top" items="${topnews}">
							<div class="side-bar-article">
								<a href="/project/viewNews?nid=${top.nid}"><img src="${top.nimg}" alt="图片显示错误"  width="280px" height="220px"/></a>
								<div class="side-bar-article-title" style="width: 100%">
									<a href="/project/viewNews?nid=${top.nid}">${top.title}</a>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>


				<div class="secound_half">
					<div class="popular-news">
						<header style="margin-top: 80px">
							<h3 class="title-popular">热点新闻</h3>
						</header>
						<div class="popular-grids">
							<c:forEach var="hot" items="${hotnews}">
								<div class="popular-grid">
									<a style="width: 100px;height: 10px" href="${pageContext.request.contextPath}/project/viewNews?nid=${hot.nid}"><img src="${hot.nimg}" width="320px" height="240px" alt="图片显示错误"/></a>
									<a class="title" href="${pageContext.request.contextPath}/project/viewNews?nid=${hot.nid}"><h3>${hot.title}</h3></a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
			<!--右侧栏-->


</html>