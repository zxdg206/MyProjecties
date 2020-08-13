<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>公告管理</title>
<meta name="description" content="公告管理">
<head>
    <style>
        table {
            table-layout: fixed;
        }

        td.text {
            /*不自动换行*/
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head>
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
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">公告列表</h3>
            </div>
            <div class="box-body">
                <!-- 数据表格 -->
                <div class="table-box">
                    <!--工具栏-->
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            <div class="btn-group">
                                <button class="btn btn-default" data-toggle="modal" data-target="#addNoticeModal">
                                    <i class="fa fa-plus" data-target="#addNoticeModal"></i> 添加公告
                                </button>
                                <!-- 添加公告模态框（Modal） -->
                                <div class="modal fade" id="addNoticeModal" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    ×
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">
                                                    添加公告
                                                </h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row data-type">

                                                    <form id="addNotice" action="/notice/addNotice" method="post">
                                                        <div class="col-md-2 title">公告标题</div>
                                                        <div class="col-md-10 data text">
                                                            <input name="otitle" id="title" type="text" class="form-control"
                                                                   placeholder="请输入公告标题" style="width: 442px">
                                                        </div>

                                                        <div class="col-md-2 title rowHeight2x">公告内容</div>
                                                        <div class="col-md-10 data rowHeight2x">
                                                            <textarea name="ocontent" id="content" style="width: 442px"
                                                                      class="form-control" rows="3"
                                                                      placeholder="请输入公告内容..."></textarea>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                            <!--模态窗口尾部-->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    关闭
                                                </button>
                                                <button type="button" class="btn btn-primary" onclick="addNotice()">
                                                    添加公告
                                                </button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal -->
                                </div>
                                <!-- 添加公告模态框（Modal） -->

                                <button type="button" class="btn btn-default" title="删除" onclick="delAllConfirm()"><i
                                        class="fa fa-trash-o"></i> 删除选中
                                </button>
                                <a href="/notice/toNotice?curpage=1&amp;search=${search}">
                                    <button type="button" class="btn btn-default" title="刷新">
                                        <i class="fa fa-refresh"></i> 刷新
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="box-tools pull-right">
                        <div class="has-feedback">
                            <form id="searchform" action="/notice/toNotice" method="get">
                                <input type="text" class="form-control input-sm" placeholder="搜索" name="search" value="${search}"
                                       onkeydown="search(event)">
                            </form>
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </div>
                    <!--工具栏/-->

                    <!--数据列表-->
                    <form id="selform" action="/notice/delNoties" method="post">
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right:0px;width: 5%">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="text-center" width="5%">ID</th>
                                <th class="text-center" width="20%">公告标题</th>
                                <th class="text-center" width="40%">公告内容</th>
                                <th class="text-center" width="10%">发布时间</th>
                                <th class="text-center" width="6%">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="n" items="${pageInfo.list}">
                                <tr>
                                    <td><input name="res" type="checkbox" value="${n.oid}"></td>
                                    <td class="text-center">${n.oid}</td>
                                    <td class="text">${n.otitle}</td>
                                    <td class="text">${n.ocontent}</td>
                                    <td class="text-center">${n.odate}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                                data-target="#details" onclick="findNotice(${n.oid})">
                                            <i class="fa fa-bars"></i> 详情
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <!--分页-->
            <div class="box-footer">
                <div class="box-tools pull-right">
                    <ul class="pagination">
                        <li>
                            <a href="/notice/toNotice?curpage=1&search=${search}" aria-label="Previous">首页</a>
                        </li>
                        <li><a href="/notice/toNotice?curpage=${pageInfo.prePage}&search=${search}">上一页</a></li>


                        <li class="active">
                            <a href="/notice/toNotice?curpage=${pageInfo.pageNum}&search=${search}">1</a>
                        </li>

                        <li><a href="/notice/toNotice?curpage=${pageInfo.nextPage}&search=${search}">下一页</a></li>
                        <li>
                            <a href="/notice/toNotice?curpage=${pageInfo.pages}&search=${search}"
                               aria-label="Next">尾页</a>
                        </li>
                    </ul>
                </div>

            </div>
            <!--分页-->
        </div>
    </div>
    <!-- 内容区域 /-->

    <!--模态窗-->
    <div class="modal fade" id="details" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        公告详情
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row data-type">
                        <div class="col-md-2 title">公告标题</div>
                        <div class="col-md-10 data text">
                            <input id="otitle" name="otitle" type="text" disabled="disabled" class="form-control" style="width: 442px">
                        </div>

                        <div class="col-md-2 title rowHeight2x">公告内容</div>
                        <div class="col-md-10 data rowHeight2x">
                            <textarea id="ocontent" name="ocontent" disabled="disabled" style="width: 442px" class="form-control"
                                      rows="3"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div>
    <!--模态窗-->
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
    //添加模态提交
    function addNotice() {
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;
        if(title.length==0){
            alert("请输入公告标题")
            return;
        }
        if(content.length==0){
            alert("请输入公告内容")
            return;
        }
        if(confirm("确认发布吗？")){
            document.getElementById("addNotice").submit();
        }
    }

    //新闻详情查询
    function findNotice(oid) {
        $.post({
            url: "${pageContext.request.contextPath}/notice/findNotice",
            data: {"oid": oid},
            success: function (data) {
                document.getElementById("ocontent").innerText = data.ocontent;
                document.getElementById("otitle").value = data.otitle;
            }
        })
    }

    //搜索
    function search(event) {
        var evt = window.event || e;
        if (evt.keyCode == 13) {
            document.getElementById("searchform").submit();
        }

    }

    //删除选择提交
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
        setSidebarActive("admin-notice");
    });
    //全选操作
    $(document).ready(function () {

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
</script>
</body>
</html>