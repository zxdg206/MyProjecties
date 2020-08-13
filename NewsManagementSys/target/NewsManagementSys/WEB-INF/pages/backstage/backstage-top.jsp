<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 页面头部 -->
<header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
        <span class="logo-mini"><b>后台</b></span>
        <span class="logo-lg"><b>后台</b>管理系统</span>
    </a>

    <!--左侧状态-->
    <nav class="navbar navbar-static-top">
        <!--伸缩按钮-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${uprofile}" class="user-image" alt="User Image">
                        <span class="hidden-xs">${uname}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="${uprofile}" class="img-circle" alt="User Image">
                            <p>
                                ${uname} - ${uidentity}
                                <small>最后登录 ${ulastlogintime}</small>
                            </p>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="/web/toPersonal" class="btn btn-default btn-flat">个人中心</a>
                            </div>
                            <div class="pull-right">
                                <a href="/web/exitLogin" class="btn btn-default btn-flat">退出登陆</a>
                            </div>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
</header>
<!-- 页面头部 /-->
