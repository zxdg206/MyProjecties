<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="public-top.jsp"/>
<body>
<!-- 新闻内容体 -->
<div class="main-body">
    <div class="wrap">
        <div class="col-md-8 content-left">
            <div class="slider">
                <div class="callbacks_wrap">
                    <ul class="rslides" id="slider">
                        <c:forEach var="roll" items="${rollnews}">
                            <li>
                                <img src="${roll.nimg}"  style="width: 900px;height: 500px" alt="图片显示错误">
                                <div class="caption" style="width: 900px">
                                    <a href="/project/viewNews?nid=${roll.nid}" style="font-size: 30px">${roll.title}</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <!--新闻栏目1-->
            <div class="sports-top">
                <div class="s-grid-left">
                    <div class="cricket">
                        <header>
                            <h3 class="title-head">运动</h3>
                        </header>
                        <!--运动新闻列表-->
						<c:forEach var="s" items="${sport}">
                        <div class="s-grid-small">
                            <div class="sc-image">
                                <a href="/project/viewNews?nid=${s.nid}"><img src="${s.nimg}" style="width: 120px;height: 100px"/></a>
                            </div>
                            <div class="sc-text">
                             
                                <a class="power" style="margin-top: 0;font-size: 20px" href="/project/viewNews?nid=${s.nid}">${s.title}</a>
                                <!--日期状态条-->
                                <p>${s.ndate}
                                    <span class="glyphicon glyphicon-comment"></span>${s.comments} </a>
                                    <!--评论数-->
                                    <span class="glyphicon glyphicon-eye-open"></span>${s.views} </a>
                                    <!--观看数-->
                                    <span class="glyphicon glyphicon-thumbs-up"></span>${s.likes}</a>
                                    <!--点赞数-->
                                </p>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
						</c:forEach>
                        <!--运动列表-->
                    </div>
                </div>

                <div class="s-grid-right">
                    <div class="cricket">
                        <header>
                            <h3 class="title-head">娱乐</h3>
                        </header>
                        <!--娱乐新闻列表-->
						<c:forEach var="s" items="${entertainment}">
							<div class="s-grid-small">
								<div class="sc-image">
									<a href="/project/viewNews?nid=${s.nid}"><img src="${s.nimg}" alt="图片显示错误"  style="width: 120px;height: 100px"/></a>
								</div>
								<div class="sc-text">

									<a class="power" style="margin-top: 0;font-size: 20px" style="margin-top: 0;font-size: 20px" href="/project/viewNews?nid=${s.nid}">${s.title}</a>
									<!--日期状态条-->
									<p>${s.ndate}
										<span class="glyphicon glyphicon-comment"></span>${s.comments} </a>
										<!--评论数-->
										<span class="glyphicon glyphicon-eye-open"></span>${s.views} </a>
										<!--观看数-->
										<span class="glyphicon glyphicon-thumbs-up"></span>${s.likes}</a>
										<!--点赞数-->
									</p>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
						</c:forEach>
                        <!--娱乐新闻列表-->
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
            <!--新闻栏目1-->
            <!--新闻栏目2-->
            <div class="sports-top">
                <div class="s-grid-left">
                    <div class="cricket">
                        <header>
                            <h3 class="title-head">健康</h3>
                        </header>
                        <!--新闻列表-->
						<c:forEach var="s" items="${health}">
							<div class="s-grid-small">
								<div class="sc-image">
									<a href="/project/viewNews?nid=${s.nid}"><img src="${s.nimg}" alt="图片显示错误"  style="width: 120px;height: 100px"/></a>
								</div>
								<div class="sc-text">
									
									<a class="power" style="margin-top: 0;font-size: 20px" href="/project/viewNews?nid=${s.nid}">${s.title}</a>
									<!--日期状态条-->
									<p>${s.ndate}
										<span class="glyphicon glyphicon-comment"></span>${s.comments} </a>
										<!--评论数-->
										<span class="glyphicon glyphicon-eye-open"></span>${s.views} </a>
										<!--观看数-->
										<span class="glyphicon glyphicon-thumbs-up"></span>${s.likes}</a>
										<!--点赞数-->
									</p>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
						</c:forEach>
                        <!--新闻列表-->
                    </div>
                </div>

                <div class="s-grid-right">
                    <div class="cricket">
                        <header>
                            <h3 class="title-head">财经</h3>
                        </header>
                        <!--新闻列表-->
						<c:forEach var="s" items="${business}">
							<div class="s-grid-small">
								<div class="sc-image">
									<a href="/project/viewNews?nid=${s.nid}"><img src="${s.nimg}" alt="图片显示错误"  style="width: 120px;height: 100px"/></a>
								</div>
								<div class="sc-text">
									
									<a class="power" style="margin-top: 0;font-size: 20px" href="/project/viewNews?nid=${s.nid}">${s.title}</a>
									<!--日期状态条-->
									<p>${s.ndate}
										<span class="glyphicon glyphicon-comment"></span>${s.comments} </a>
										<!--评论数-->
										<span class="glyphicon glyphicon-eye-open"></span>${s.views} </a>
										<!--观看数-->
										<span class="glyphicon glyphicon-thumbs-up"></span>${s.likes}</a>
										<!--点赞数-->
									</p>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
						</c:forEach>
                        <!--新闻列表-->
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--新闻栏目2-->
            <!--新闻栏目3-->
            <div class="sports-top">
                <div class="s-grid-left">
                    <div class="cricket">
                        <header>
                            <h3 class="title-head">游戏</h3>
                        </header>
                        <!--新闻列表-->
						<c:forEach var="s" items="${game}">
							<div class="s-grid-small">
								<div class="sc-image">
									<a href="/project/viewNews?nid=${s.nid}"><img src="${s.nimg}" alt="图片显示错误"  style="width: 120px;height: 100px"/></a>
								</div>
								<div class="sc-text">
									
									<a class="power" style="margin-top: 0;font-size: 20px" href="/project/viewNews?nid=${s.nid}">${s.title}</a>
									<!--日期状态条-->
									<p>${s.ndate}
										<span class="glyphicon glyphicon-comment"></span>${s.comments} </a>
										<!--评论数-->
										<span class="glyphicon glyphicon-eye-open"></span>${s.views} </a>
										<!--观看数-->
										<span class="glyphicon glyphicon-thumbs-up"></span>${s.likes}</a>
										<!--点赞数-->
									</p>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
						</c:forEach>
                        <!--新闻列表-->
                    </div>
                </div>

                <div class="s-grid-right">
                    <div class="cricket">
                        <header>
                            <h3 class="title-head">科技</h3>
                        </header>
                        <!--新闻列表-->
						<c:forEach var="s" items="${tech}">
							<div class="s-grid-small">
								<div class="sc-image">
									<a href="/project/viewNews?nid=${s.nid}"><img src="${s.nimg}" alt="图片显示错误"  style="width: 120px;height: 100px"/></a>
								</div>
								<div class="sc-text">
									
									<a class="power" style="margin-top: 0;font-size: 20px" href="/project/viewNews?nid=${s.nid}">${s.title}</a>
									<!--日期状态条-->
									<p>${s.ndate}
										<span class="glyphicon glyphicon-comment"></span>${s.comments} </a>
										<!--评论数-->
										<span class="glyphicon glyphicon-eye-open"></span>${s.views} </a>
										<!--观看数-->
										<span class="glyphicon glyphicon-thumbs-up"></span>${s.likes}</a>
										<!--点赞数-->
									</p>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
						</c:forEach>
                        <!--新闻列表-->
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--新闻栏目3-->
        </div>
        <!--右侧栏-->
        <jsp:include page="public-right.jsp"></jsp:include>
        <!--右侧栏-->
    </div>
</div>
<!-- 新闻内容体 -->
<!--底部栏-->
<jsp:include page="public-footer.jsp"/>
<!--底部栏-->
</body>
</html>