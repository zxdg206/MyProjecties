<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${uprofile}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${uname}</p>
                <i class="fa fa-male text-success">${uidentity}</i>
            </div>
        </div>


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="/web/welcome"><i class="fa fa-th-large"></i> <span>系统首页</span></a></li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i> <span>个人中心</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="admin-personal">
                        <a href="/web/toPersonal">
                            <i class="fa fa-circle-o"></i> 编辑个人信息
                        </a>
                    </li>

                </ul>
            </li>

            <!-- 菜单 -->

            <c:if test="${uidentity =='新闻管理员' or uidentity =='超级用户'}">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>新闻管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="admin-news-add">
                        <a href="/news/toAdminNewsAdd">
                            <i class="fa fa-circle-o"></i> 添加新闻
                        </a>
                    </li>

                    <li id="admin-news-manage">
                        <a href="/news/toNewsManage">
                            <i class="fa fa-circle-o"></i> 管理新闻
                        </a>
                    </li>

                </ul>
            </li>
            </c:if>

            <c:if test="${uidentity == '超级用户'}">
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>用户管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="admin-user">
                        <a href="/user/admin-user">
                            <i class="fa fa-circle-o"></i> 用户管理
                        </a>
                    </li>

                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>公告管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="admin-notice">
                        <a href="/notice/toNotice">
                            <i class="fa fa-circle-o"></i> 管理公告
                        </a>
                    </li>

                </ul>
            </li>
            </c:if>

            <li ><a href="/project/toHome" target="_blank"><i class="fa fa-home"></i> <span>网站首页</span></a></li>

            <!-- 菜单 /-->

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->
