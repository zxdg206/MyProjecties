<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Pragma","No-Cache");
    response.setHeader("Cache-Control","No-Cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<title>新闻管理</title>
<meta name="description" content="公共头">
<jsp:include page="backstage-header.jsp"></jsp:include>
<head>
    <style>
        table {
            table-layout: fixed;
        }

        td.text {
            /*不自动换行*/
            white-space: nowrap;
            /*超出隐藏*/
            overflow: hidden;
            /*超出用省略号代替*/
            text-overflow: ellipsis;
            width: 8em;
        }
    </style>
</head>
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

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                新闻管理
                <c:if test="${uidentity == '超级用户'}">
                    <small>全部新闻</small>
                </c:if>
                <c:if test="${uidentity == '新闻管理员'}">
                    <small>我发布的新闻</small>
                </c:if>
            </h1>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="删除"
                                            onclick="delAllConfirm()"><i class="fa fa-trash-o"></i> 删除选中
                                    </button>
                                    <a href="${pageContext.request.contextPath}/news/toNewsManage?curpage=${pageInfo.pageNum}&pagesize=${pageInfo.pageSize}&search=${search}">
                                        <button type="button" class="btn btn-default" title="刷新">
                                            <i class="fa fa-refresh"></i> 刷新
                                        </button>
                                    </a>
                                </div>
                                <c:if test="${uidentity == '超级用户'}">
                                <div class="btn-group" style="margin-left: 50px">
                                    <div>
                                        <div style="float: left">
                                            <button class="btn btn-block btn-primary" data-toggle="modal"
                                                    onclick="showNews('rollnews')" data-target="#M_index_news">
                                                <i class="fa fa-newspaper-o" data-target="M_index_news"></i> 滑动新闻管理
                                            </button>
                                        </div>
                                        <div style="float: right;margin-left: 5px">
                                            <button class="btn btn-block btn-primary" data-toggle="modal"
                                                    onclick="showNews('topnews')" data-target="#M_index_news">
                                                <i class="fa fa-navicon" data-target="M_index_news"></i> 置顶新闻管理
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                </c:if>

                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <form id="searchform" action="/news/toNewsManage" method="get">
                                    <input type="text" class="form-control input-sm" placeholder="搜索" name="search"
                                           value="${search}" onkeydown="search(event)">
                                </form>
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <form id="selform" action="/news/delCheckNews" method="post">
                            <!--这里可能需要提交当前隐藏的分页数据-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th style="padding-right:0px;" width="4%">
                                        <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                    </th>
                                    <th class="text-center" width="6%">ID</th>
                                    <th class="text-center" width="26%">标题</th>
                                    <th class="text-center" width="8%">作者</th>
                                    <th class="text-center" width="6%">主类</th>
                                    <th class="text-center" width="6%">次类</th>
                                    <th class="text-center" width="6%">浏览</th>
                                    <th class="text-center" width="6%">点赞</th>
                                    <th class="text-center" width="12%">发布时间</th>
                                    <th class="text-center" width="14%">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="news" items="${pageInfo.list}" varStatus="count">
                                    <tr>
                                        <td><input name="res" type="checkbox" value="${news.nid}"></td>
                                        <td class="text-center">${news.nid}</td>
                                        <td class="text">${news.title}</td>
                                        <td class="text-center">${news.author}</td>
                                        <td class="text-center">${news.menu}</td>
                                        <td class="text-center">${news.type}</td>
                                        <td class="text-center">${news.views}</td>
                                        <td class="text-center">${news.likes}</td>
                                        <td class="text-center">${news.ndate}</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                                    data-target="#M_comment" onclick="commentAdmin('${news.nid}')">
                                                评论管理
                                            </button>
                                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                                    data-target="#M_edit" onclick="editNews(${news.nid})">
                                                编辑内容
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                        <!--msg提示信息-->
                        <c:if test="${not empty msg}">
                            <h3 align="center" style="color: red">${msg}</h3>
                        </c:if>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>
                <!-- /.box-body -->

                <!--分页-->
                <div class="box-footer">
                    <div class="pull-left" style="margin-top: 20px">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages} 页，共${pageInfo.total} 条数据。 每页
                            <select class="form-control" onchange="setPageSize(value)">
                                <option id="p10">10</option>
                                <option id="p15">15</option>
                                <option id="p20">20</option>
                                <option id="p50">50</option>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/news/toNewsManage?curpage=1&pagesize=${pageInfo.pageSize}&search=${search}"
                                   aria-label="Previous">首页</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/news/toNewsManage?curpage=${pageInfo.prePage}&pagesize=${pageInfo.pageSize}&search=${search}">上一页</a>
                            </li>
                            <c:forEach var="num" items="${pageInfo.navigatepageNums}">
                                <c:if test="${num==pageInfo.pageNum}">
                                    <li class="active">
                                        <a href="${pageContext.request.contextPath}/news/toNewsManage?curpage=${num}&pagesize=${pageInfo.pageSize}&search=${search}">${num}</a>
                                    </li>
                                </c:if>
                                <c:if test="${num!=pageInfo.pageNum}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/news/toNewsManage?curpage=${num}&pagesize=${pageInfo.pageSize}&search=${search}">${num}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <li>
                                <a href="${pageContext.request.contextPath}/news/toNewsManage?curpage=${pageInfo.nextPage}&pagesize=${pageInfo.pageSize}&search=${search}">下一页</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/news/toNewsManage?curpage=${pageInfo.total}&pagesize=${pageInfo.pageSize}&search=${search}"
                                   aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--分页-->
            </div>
        </section>
        <!-- 正文区域 /-->
    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="backstage-footer.jsp"/>
    <!-- 底部导航 /-->
    <!--模态框-->
    <!-- 编辑  -->
    <div class="modal fade" id="M_edit" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        编辑新闻
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row data-type">
                        <form id="editNewsForm" action="/news/editNews" id="addNewsform" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="nid" id="nid">
                            <div class="col-md-2 title">新闻标题</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" placeholder="标题不超过30字" name="title" id="title">
                            </div>
                            <div class="col-md-2 title">新闻作者</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control"  id ="author1" disabled="disabled">
                                <input type="hidden" name="author" id="author2">
                            </div>

                            <div class="col-md-2 title">新闻主类</div>
                            <div class="col-md-4 data">
                                <select class="form-control" id="sel1" name="menu" onchange="changeType(value)">
                                    <option id="s0" selected="selected">默认</option>
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
                                    <option id="o0" selected="selected">默认</option>
                                    <option id="o1">足球</option>
                                    <option id="o2">篮球</option>
                                    <option id="o3">网球</option>
                                    <option id="o4">其他</option>
                                </select>
                            </div>
                            <div class="col-md-2 title" name="location">新闻位置</div>
                            <div class="col-md-10 data line-height36">
                                <div class="form-group form-inline">
                                    <div class="checkbox"><label><input type="checkbox" name="rollnews" id="rollnews"
                                                                        value="yes" >滑动首页</label></div>
                                    <div class="checkbox"><label><input type="checkbox" name="topnews" id="topnews"
                                                                        value="yes">固定侧栏</label></div>
                                </div>
                            </div>
                            <!--上传-->
                            <div class="col-md-2 title">新闻封面</div>
                            <div class="col-md-10 data">
                                <div>
                                    <div style="float: right;margin-right: 15px">
                                        <a id="showImg" target="_blank">
                                        <input type="button"  value="查看原始封面">
                                        </a>
                                    </div>
                                    <!--新闻首页url用于后端判断接收此新闻的图片的Url-->
                                    <input type="hidden" name="nimg" id="hidden_img">
                                    <div style="float: left">
                                        <input type="file" name="news_img" width="30px">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 title">新闻图片</div>
                            <div class="col-md-10 data">
                                <div>
                                    <div style="float: right;margin-right: 15px">
                                        <a id="showSrc" target="_blank">
                                            <input type="button"  value="查看原始图片">
                                        </a>
                                    </div>
                                    <!--新闻图片url用于后端判断接收-->
                                    <input type="hidden"name="nsrc" id="hidden_src">
                                    <div style="float: left">
                                        <input type="file" name="news_src" width="30px">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2 title rowHeight2x">新闻简介</div>
                            <div class="col-md-10 data rowHeight2x">
                                <textarea class="form-control" rows="3" name="brief" placeholder="不超过100字" id="brief"></textarea>
                            </div>
                            <div class="col-md-2 title rowHeight2x">内容输入框</div>
                            <div class="col-md-10 data rowHeight2x">
                                <textarea class="form-control" rows="3" name="content" placeholder="请输入..." id="content"></textarea>
                            </div>
                        </form>
                    </div>
                </div>
                <!--模态窗口尾部-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary"
                            onclick="editNewsModelSubmit()">
                        保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 编辑  -->
    <!-- 首页新闻   -->
    <div class="modal fade" id="M_index_news" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="m_title">
                        首页新闻管理
                    </h4>
                </div>
                <div class="modal-body">
                    <!--模态窗内容-->
                    <table class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th class="text-center" width="15%">新闻ID</th>
                            <th class="text" width="45%">新闻标题</th>
                            <th class="text-center">发布时间</th>
                            <th class="text-center" width="15%">操作</th>
                        </tr>
                        </thead>
                        <tbody id="show1">
                        </tbody>
                    </table>
                    <!--模态窗内容-->
                </div>
                <!--模态窗口尾部-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" >
                        关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 首页新闻   -->
    <!-- 评论管理 -->
    <div class="modal fade" id="M_comment" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        评论管理
                    </h4>
                </div>
                <div class="modal-body">
                    <!--模态窗内容-->
                    <div class="row pre-scrollable" style="height: 300px">
                        <table class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="text-center" width="15%">评论ID</th>
                                <th class="text-center" width="25%">用户</th>
                                <th class="text-center" width="45%">评论内容</th>
                                <th class="text-center" width="15%">操作</th>
                            </tr>
                            </thead>
                            <tbody id="commentShow">
                            </tbody>
                        </table>
                    </div>
                    <!--模态窗内容-->
                </div>
                <!--模态窗口尾部-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 评论管理 -->
    <!--模态框-->
</div>


<!--




底部JS代码块





-->
<script>
    function imgalert() {
        alert("图片为空")
    }
    //删除评论
    function delCommentByCid(cid) {
        if(confirm("确认删除这条评论吗？")){
            $.post({
                url: "${pageContext.request.contextPath}/news/delCommentByCid",
                data: {"cid": cid},
                success: function (data) {
                    window.location = "${pageContext.request.contextPath}/news/toNewsManage?curpage=${pageInfo.pageNum}&pagesize=${pageInfo.pageSize}&search=${search}";
                }
            })
        }
    }
    //评论管理
    function commentAdmin(cnid){
        $.get({
            url: "${pageContext.request.contextPath}/news/comment",
            data:{"nid":cnid},
            success: function (data) {
                var html ="";
                for (var i = 0; i < data.length; i++) {
                    html +='' +
                        '                            <tr>\n' +
                        '                                <td class="text-center" width="15%">'+data[i].cid+'</td>\n' +
                        '                                <td class="text-center">'+data[i].uname+'</td>\n' +
                        '                                <td class="text" width="45%">'+data[i].comment+'</td>\n' +
                        '                            <td class="text-center">\n' +
                        '                                <button type="button" onclick="delCommentByCid('+data[i].cid+')" class="btn bg-olive btn-xs">删除</button>\n' +
                        '                            </td>\n' +
                        '                            </tr>';
                }
                $("#commentShow").html(html)
            }
        })
        }
    //新闻编辑
    function editNews(nid) {
        //回显编辑数据
        $.post({
            url: "${pageContext.request.contextPath}/news/findNewsByNid",
            data: {"nid": nid},
            success: function (data) {
                document.getElementById("title").value = data.title;
                document.getElementById("nid").value = data.nid;
                document.getElementById("author1").value = data.author;
                document.getElementById("author2").value = data.author;

                //图片展示
                if(data.nimg!=null && data.nimg != ''){
                    document.getElementById("showImg").href = data.nimg;
                }else {
                    document.getElementById("showImg").href = "javascript:imgalert()";
                }
                if(data.nsrc!=null && data.nsrc != ''){
                    document.getElementById("showSrc").href = data.nsrc;
                }else {
                    document.getElementById("showSrc").href = "javascript:imgalert()";
                }

                document.getElementById("hidden_img").value = data.nimg;
                document.getElementById("hidden_src").value = data.nsrc;

                document.getElementById("s0").value = data.menu
                document.getElementById("o0").value = data.type
                document.getElementById("s0").innerText = "默认("+data.menu+")";
                document.getElementById("o0").innerText = "默认("+data.type+")";

                //编辑时,只能选择添加而不是撤销
                if (data.rollnews == "yes") {
                    document.getElementById("rollnews").checked = "checked";
                    document.getElementById("rollnews").disabled = "disabled";
                }else {
                    document.getElementById("rollnews").checked = null;
                    document.getElementById("rollnews").disabled = null;

                };
                if (data.topnews == "yes") {
                    document.getElementById("topnews").checked = "checked";
                    document.getElementById("topnews").disabled = "disabled";
                }else {
                    document.getElementById("topnews").checked = null;
                    document.getElementById("topnews").disabled = null;
                };

                document.getElementById("brief").innerText = data.brief;
                document.getElementById("content").innerText = data.content;
            }
        })
    }
    //新闻提交
    function editNewsModelSubmit() {
        //新闻编辑表单验证：
        var title = document.getElementById("title").value;
        var brief = document.getElementById("brief").value;
        var content = document.getElementById("content").value;
        // var img = document.getElementById("img").value;
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
        if(confirm("确认保存吗？")){
        document.getElementById("editNewsForm").submit();
        }
    }
    function preShowImg(url){
        window.open(url,'_blank');
    }


    //回显前端表格数据
    function showNews(local) {
        $.post({
            url: "${pageContext.request.contextPath}/news/showIndexNews",
            data: {"local": local},
            success: function (data) {
                var html = "";
                for (var i = 0; i < data.length; i++) {
                    html += '                        <tr>\n' +
                        '                            <td class="text-center">'+data[i].nid+'</td>\n' +
                        '                            <td class="text">'+data[i].title+'</td>\n' +
                        '                            <td class="text">'+data[i].ndate+'</td>\n' +
                        '                            <td class="text-center">\n' +
                        '                                <button type="button" onclick="removeIndexNews('+'&apos;'+data[i].nid+'&apos;'+','+'&apos;'+local+'&apos;'+')" class="btn bg-olive btn-xs">撤销</button>\n' +
                        '                            </td>\n' +
                        '                        </tr>'
                }
                //取ID或者类添入数据
                $("#show1").html(html)
            }
        })
    }
    //撤销topnews
    function removeIndexNews(nid,local2) {
        if(confirm("确认从栏位撤销新闻吗？")){
        $.post({
            url: "${pageContext.request.contextPath}/news/delIndexNews",
            data: {"nid": nid,"local": local2},
            success: function () {
                window.location = "${pageContext.request.contextPath}/news/toNewsManage";
            }
        })
        }
    }

    $(document).ready(function () {
        // 选择框
        $(".select2").select2();
        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
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
    //更改次级分类选项
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

    $(document).ready(function () {
        setSidebarActive("admin-news-manage");
    });

    //设置默认加载
    function setPageSize(value){
        window.location.href="${pageContext.request.contextPath}/news/toNewsManage?search=${search}&pagesize="+value
    }

    //全选框的提交
    function delAllConfirm() {
        //先判断有没有至少被选中的
        var checkboxs = document.getElementsByName("res");
        var flag = 0;//0代表没有勾选任何框，1代表至少勾选，-1代表勾选了，但取消删除。
        for (var i = 0; i < checkboxs.length; i++) {
            if (checkboxs[i].checked == true) {
                if (confirm("确认删除勾选记录？")) {
                    flag = 1;
                    break;
                } else {
                    //选择了否
                    flag = -1;
                    break;
                }
            }

        }
        if (flag == 1) {
            document.getElementById("selform").submit();
        } else if (flag == 0) {
            alert("未勾选任何记录！")
        }
    }

    //设定每页显示
    function setDef() {
        switch (${pageInfo.pageSize}) {
            case 10:document.getElementById("p10").selected = "selected";break;
            case 15:document.getElementById("p15").selected = "selected";break;
            case 20:document.getElementById("p20").selected = "selected";break;
            case 50:document.getElementById("p50").selected = "selected";break;
        }
    }
    window.onLoad= setDef();
</script>
</body>
</html>