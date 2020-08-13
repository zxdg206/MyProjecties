<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>Z.C新闻后台管理系统</title>
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
    <div class="content-wrapper" style="min-height: 841px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <c:if test="${uidentity !='普通用户'}">
            <h1 style="color: #265a88">
                欢迎使用Z.C新闻管理系统
            </h1>
            </c:if>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-3">
                    <!-- 简介框 -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle" src="${uprofile}" alt="User profile picture">

                            <h3 class="profile-username text-center">${uname}</h3>



                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>账号ID</b> <a class="pull-right">${uid}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>用户身份</b> <a class="pull-right">${uidentity}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>上次登陆</b> <a class="pull-right">${ulastlogintime}</a>
                                </li>
                            </ul>

                            <a href="/web/toPersonal" class="btn btn-primary btn-block"><b>修改信息</b></a>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- 左上 -->
                    <!-- 左下 -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">系统信息</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <p>前端：AdminLTE</p>
                            <p>版本：Ver 1.0.8</p>
                            <p>时间：2020-5-20 </p>
                            <p>邮箱：zxdg206@163.com</p>
                            <p style="color: #0f74a8">西安工程大学-计算机学院</p>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- 左下 -->
                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <iframe src="${pageContext.request.contextPath}/project/toHome" style="width: 930px;height: 573px">
                        <p>您的浏览器不支持  iframe 标签。</p>
                    </iframe>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

        </section>
        <!-- /.content -->
    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="backstage-footer.jsp"/>
    <!-- 底部导航 /-->
</div>
<script>
    $(document).ready(function() {
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

    $(document).ready(function() {
        setSidebarActive("admin-index");
    });
</script>
</body>
</html>