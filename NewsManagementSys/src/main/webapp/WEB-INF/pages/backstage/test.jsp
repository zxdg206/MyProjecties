<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>这里输入标题</title>
<meta name="description" content="公共头">
<jsp:include page="backstage-header.jsp"></jsp:include>
<body class="hold-transition skin-purple sidebar-mini">

    <div class="wrapper">
        <!-- 页面头部 -->
        <header class="main-header">

            <!-- Logo -->
            <a href="#" class="logo">
                <span class="logo-mini"><b>后台</b></span>
                <span class="logo-lg"><b>后台</b>管理系统</span>
            </a>

            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="/adminlte/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">${manager}</span>
                    </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="/adminlte/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                    <p>
                                        ${manager} - 数据管理员
                                        <small>最后登录 11:20AM</small>
                                    </p>
                                </li>

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">修改密码</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">注销</a>
                                    </div>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </nav>
        </header>
        <!-- 页面头部 /-->
        <!--左侧导航-->
        <jsp:include page="backstage-left.jsp"/>
        <!--左侧导航-->
        <!-- 内容区域 -->
        <div class="content-wrapper">
            <h1 align="center">这是内容</h1>
        </div>
        <!-- 内容区域 /-->

        <!-- 底部导航 -->
        <footer class="main-footer" >
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0.8
            </div>
            <strong><a href="#">新闻管理系统</a>   </strong>.
        </footer>
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
            setSidebarActive("admin-404");
        });
    </script>
</body>
</html>