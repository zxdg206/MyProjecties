<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>添加新闻</title>
<meta name="description" content="公共头">
<jsp:include page="backstage-header.jsp"></jsp:include>
<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">
    <!-- 页面头部 -->
    <jsp:include page="backstage-top.jsp"/>
    <!-- 页面头部 /-->
    <!--左侧导航-->
    <jsp:include page="backstage-left.jsp"/>
    <!--左侧导航-->
    <!-- 内容区域 -->
    <div class="content-wrapper">
        <c:if test="${not empty requestScope.msg}">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-check"></i> ${msg}</h4>

            </div>
        </c:if>
        <section class="content-header">
            <h1>
                新闻管理
                <small>添加新闻</small>
            </h1>
        </section>
        <section class="content" style="margin-top: 20px">
            <div class="box box-primary">
                    <div class="tab-pane active" id="tab-common">
                        <div class="row data-type">
                            <form action="/news/newsadd" id="addNewsform" method="post" enctype="multipart/form-data">
                            <div class="col-md-2 title">新闻标题</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" placeholder="标题不超过30字" name="title" id="title">
                            </div>
                            <div class="col-md-2 title">新闻作者</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control"  value="${uname}" disabled="disabled">
                                <input type="hidden" name="author" value="${uname}">
                            </div>

                            <div class="col-md-2 title">新闻主类</div>
                            <div class="col-md-4 data">
                                    <select class="form-control" id="sel1" name="menu" onchange="changeType(value)">
                                        <option value="运动">运动</option>
                                        <option value="娱乐">娱乐</option>
                                        <option value="健康">健康</option>
                                        <option value="财经">财经</option>
                                        <option value="游戏">游戏</option>
                                        <option value="科技">科技</option>
                                    </select>
                            </div>
                            <div class="col-md-2 title" id="sel2">新闻次类</div>
                            <div class="col-md-4 data">
                                <select class="form-control" name="type">
                                    <option id="o1">足球</option>
                                    <option id="o2">篮球</option>
                                    <option id="o3">网球</option>
                                    <option id="o4">其他</option>
                                </select>
                            </div>
                            <div class="col-md-2 title" name="location">新闻位置</div>
                            <div class="col-md-10 data line-height36">
                                <div class="form-group form-inline">
                                    <div class="checkbox"><label><input type="checkbox" name="rollnews" value="1">滚动首页</label></div>
                                    <div class="checkbox"><label><input type="checkbox" name="topnews" value="1">固定侧栏</label></div>
                                </div>
                            </div>
                                <!--上传-->
                            <div class="col-md-2 title">新闻封面</div>
                            <div class="col-md-10 data">
                                    <input type="file" name="n_img" id="img">
                            </div>
                            <div class="col-md-2 title">新闻图片</div>
                            <div class="col-md-10 data">
                                    <input type="file" name="n_src">
                            </div>

                            <div class="col-md-2 title rowHeight2x">新闻简介</div>
                            <div class="col-md-10 data rowHeight2x">
                                <textarea class="form-control" rows="3" name="brief" id="brief" placeholder="不超过100字"></textarea>
                            </div>
                            <div class="col-md-2 title rowHeight2x">内容输入框</div>
                            <div class="col-md-10 data rowHeight2x">
                                <textarea class="form-control" rows="3" name="content" id="content" placeholder="请输入..."></textarea>
                            </div>
                        </div>
                    </div>
                <div class="col-md-10 data text-center">
                    <button type="button" class="btn bg-maroon" onclick="addNews()">添加新闻</button>
                    <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
                    </form>
                </div>
                </div>
        </section>
    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.8
        </div>
        <strong><a href="#">新闻管理系统</a> </strong>.
    </footer>
    <!-- 底部导航 /-->
</div>
<script>
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();
        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function () {
        setSidebarActive("admin-news-add");
    });
    //更改分类选项
    function changeType(menu) {
        if(menu == "娱乐"){
            document.getElementById("o1").innerText = "明星";
            document.getElementById("o2").innerText = "影音";
            document.getElementById("o3").innerText = "综艺";
            document.getElementById("o4").innerText = "其他";
        }
        if(menu == "运动"){
            document.getElementById("o1").innerText = "足球";
            document.getElementById("o2").innerText = "篮球";
            document.getElementById("o3").innerText = "网球";
            document.getElementById("o4").innerText = "其他";
        }
        if(menu == "财经"){
            document.getElementById("o1").innerText = "股票";
            document.getElementById("o2").innerText = "基金";
            document.getElementById("o3").innerText = "外汇";
            document.getElementById("o4").innerText = "其他";
        }
        if(menu == "游戏"){
            document.getElementById("o1").innerText = "网游";
            document.getElementById("o2").innerText = "手游";
            document.getElementById("o3").innerText = "单机";
            document.getElementById("o4").innerText = "其他";
        }
        if(menu == "科技"){
            document.getElementById("o1").innerText = "互联网";
            document.getElementById("o2").innerText = "手机";
            document.getElementById("o3").innerText = "数码";
            document.getElementById("o4").innerText = "其他";
        }
        if(menu == "健康"){
            document.getElementById("o1").innerText = "疫情";
            document.getElementById("o2").innerText = "食品";
            document.getElementById("o3").innerText = "医疗";
            document.getElementById("o4").innerText = "其他";
        }
    }
    //添加新闻
    function addNews(){
        //新闻编辑表单验证：
        var title = document.getElementById("title").value;
        var brief = document.getElementById("brief").value;
        var content = document.getElementById("content").value;
        var img = document.getElementById("img").value;
        if(title==null || title==""){
            alert("新闻标题不能为空");
            return;
        }
        if(brief==null || brief==""){
            alert("新闻简介不能为空");
            return;
        }
        if(content==null || content==""){
            alert("新闻内容不能为空");
            return;
        }
        if(img==null || img==""){
            alert("请上传新闻封面");
            return;
        }
        if(confirm("确认上传吗？")){
            document.getElementById("addNewsform").submit();
        }
    }

</script>
</body>
</html>