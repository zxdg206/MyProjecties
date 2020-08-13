<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="public-top.jsp"></jsp:include>
	<body>
		<div class="main-body">
			<div class="wrap">
				<ol class="breadcrumb">
					<li>
						<a href="${pageContext.request.contextPath}/project/toHome">Home</a>
					</li>
					<li class="active">${news.menu}</li>
					<li class="active">${news.type}</li>
					<li class="active">正文</li>
				</ol>
				<div class="single-page">
					<div class="col-md-2 share_grid">
						<ul>
							<li>
									<div class="views">
										<span>浏览量</span>
										<label>${news.views}</label>
									</div>
									<div class="clearfix"></div>
							</li>
							<li>
									<div class="views">
										<span>评论数</span>
										<label>${news.comments}</label>
									</div>
									<div class="clearfix"></div>
							</li>
							<li>
									<div class="views">
										<span>作者</span>
										<label>${news.author}</label>
									</div>
									<div class="clearfix"></div>
							</li>
							<li>
									<div class="views">
										<span>发布时间</span>
										<label>${news.ndate}</label>
									</div>
									<div class="clearfix"></div>
							</li>
							<li>
								<a href="javascript:updatelike(${news.nid})">
									<span ></span>
									<div class="views">
										<span class="glyphicon glyphicon-thumbs-up" style="width: 100px;height: 20px;margin: 0px;font-size: 14px"> 点赞</span>
										<label id="likes">${news.likes}</label>
									</div>
									<div class="clearfix"></div>
								</a>
							</li>
<%--							<li>--%>
<%--								<a href="#">--%>
<%--									<i class="email"></i>--%>
<%--									<div class="views">--%>
<%--										<span>收藏</span>--%>
<%--										<label>${news.collections}</label>--%>
<%--									</div>--%>
<%--									<div class="clearfix"></div>--%>
<%--								</a>--%>
<%--							</li>--%>
						</ul>
					</div>
					<div class="col-md-6 content-left single-post">
						<div class="blog-posts">
							<h3 class="post">${news.title}</h3>
							<hr>
							<h5 style="color: #4b646f;margin-bottom: 20px">导读：${news.brief}</h5>
							<c:if test="${not empty news.nsrc}">
							<div>
								<img src="${news.nsrc}" style="width: 100%;height: 320px" alt="图片加载失败">
							</div>
							</c:if>
							<div class="last-article">
								<p class="artext">
								${news.content}
								</p>
								<div class="clearfix"></div>
								<!--推荐新闻-->
								<div class="row related-posts">
									<h4>推荐新闻</h4>
									<hr>
									<c:forEach var="rec" items="${recommend}">
										<div class="col-xs-6 col-md-3 related-grids">
											<a href="/project/viewNews?nid=${rec.nid}" class="thumbnail">
												<img src=${rec.nimg} alt="图片加载失败" style="width: 120px;height: 100px"/>
											</a>
											<h5><a href="/project/viewNews?nid=${rec.nid}">${rec.title}</a></h5>
										</div>
									</c:forEach>

								</div>
								<!--推荐新闻-->

								<!--评论区-->
								<div class="response">
									<h4 id="loc">网友评论</h4>
									<hr>
									<div class="media response-info">
										<c:if test="${empty pageInfo.list}">
											<h4 align="center" style="color: slategrey">还没有用户发表评论</h4>
										</c:if>
										<c:forEach var="c" items="${pageInfo.list}">
											<div class="media">
												<div class="media-left">
													<img src="${c.uprofile}" alt="头像载入失败" style="width:60px;height: 60px;">
												</div>
												<div class="media-body">
													<h5 class="media-heading" style="color: #146EB4;">${c.uname}</h5>
													<p>
														${c.comment}
													</p>
													<ul>
														<p align="right" style="color: grey">${c.cdate}</p>
													</ul>
												</div>
											</div>
											<hr>
										</c:forEach>
										<div class="clearfix"> </div>
									</div>
								</div>
								<!--评论区-->
								<!--分页-->
							    <nav aria-label="...">
									  <ul class="pager">
										  <li><a href="${pageContext.request.contextPath}/project/viewNews?curpage=1&nid=${news.nid}">首页</a></li>
									    <li><a href="${pageContext.request.contextPath}/project/viewNews?curpage=${pageInfo.prePage}&nid=${news.nid}">上一页</a></li>
										  <c:forEach var="num" items="${pageInfo.navigatepageNums}">
											  <c:if test="${num==pageInfo.pageNum}">
												  <li><a style="color: #265a88;font-weight: bold" href="${pageContext.request.contextPath}/project/viewNews?curpage=${num}&nid=${news.nid}">${num}</a></li>
											  </c:if>
											  <c:if test="${num!=pageInfo.pageNum}">
												  <li><a href="${pageContext.request.contextPath}/project/viewNews?curpage=${num}&nid=${news.nid}">${num}</a></li>
											  </c:if>
										  </c:forEach>
									    <li><a href="${pageContext.request.contextPath}/project/viewNews?curpage=${pageInfo.nextPage}&nid=${news.nid}">下一页</a></li>
										  <li><a href="${pageContext.request.contextPath}/project/viewNews?curpage=${pageInfo.total}&nid=${news.nid}">尾页</a></li>
									  </ul>
								</nav>
								<!--分页-->
								<!--发表评论-->
								<hr>
								<div class="coment-form" style="margin-top: 5%;">
									<h4>发表评论</h4>
									<form action="/project/sendComment" id="commentform" method="post">
										<textarea id="ccontent" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Comment...';}" name="comment">Your Comment...</textarea>
										<c:if test="${not empty uname}">
											<input type="button"  class="btn btn-block btn-primary btn-lg" value="发表评论" onclick="csubmit()">
										</c:if>
										<c:if test="${empty uname}">
											<a href="${pageContext.request.contextPath}/project/toLogin"><input type="button" class="btn btn-block btn-primary btn-lg" value="登陆后发表评论"></a>
										</c:if>
										<input type="hidden" name="nid" value="${news.nid}">
										<input type="hidden" name="uname" value="${uname}">
										<input type="hidden" name="uprofile" value="${uprofile}">
									</form>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				<!--右侧栏-->
					<jsp:include page="public-right.jsp"/>
				<!--右侧栏-->
				</div>
			</div>
		</div>
		<!-- 底部栏 -->
		<jsp:include page="public-footer.jsp"/>
		<!-- 底部栏-->
		<script>

			function updatelike(nid) {
				if(${uname==null}){
					alert("登陆后才能对新闻点赞");
					return;
				}
				$.ajax({
					url:"${pageContext.request.contextPath}/project/likenews",
					data:{"nid": nid},
					success: function (data) {
						document.getElementById("likes").innerText = data;
					}
				});
			}
			
			
			function csubmit(){
				if(document.getElementById("ccontent").value == "Your Comment..."){
					alert("请填写评论内容")
				}else {
				document.getElementById("commentform").submit();
				}
			}
		</script>
	</body>
</html>