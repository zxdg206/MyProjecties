<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>用户管理</title>
<meta name="description" content="用户管理界面">
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

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                用户管理
                <small>全部用户</small>
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
                                    <button class="btn btn-default" data-toggle="modal" data-target="#myModal">
                                        <i class="fa fa-plus" data-target="#myModal"></i> 添加新用户
                                    </button>
                                    <!-- 添加用户模态框（Modal） -->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                         aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">
                                                        &times;
                                                    </button>
                                                    <h4 class="modal-title" id="myModalLabel">
                                                        添加新用户
                                                    </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row data-type">
                                                        <form action="/user/addUser" id="addwindow" method="post" enctype="multipart/form-data">
                                                            <div class="col-md-2 title">用户名</div>
                                                            <div class="col-md-4 data">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control"
                                                                           placeholder="用户名" name="uname" id="uname">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-2 title">密码</div>
                                                            <div class="col-md-4 data">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control"
                                                                           placeholder="密码" name="upassword" id="paswd">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-2 title">邮箱</div>
                                                            <div class="col-md-4 data">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control"
                                                                           placeholder="邮箱" name="uemail">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-2 title">联系方式</div>
                                                            <div class="col-md-4 data">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control"
                                                                           placeholder="电话号码" name="uphone">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2 title">性别</div>
                                                            <div class="col-md-10 data">
                                                                <div class="form-group form-inline">
                                                                    <div class="radio"><label><input type="radio"
                                                                                                     name="usex"
                                                                                                     value="男" checked="checked">
                                                                        男</label></div>
                                                                    <div class="radio"><label><input type="radio"
                                                                                                     name="usex"
                                                                                                     value="女">
                                                                        女</label></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2 title">角色</div>
                                                            <div class="col-md-10 data">
                                                                <select class="form-control" name="uidentity">
                                                                    <option value="普通用户">普通用户</option>
                                                                    <option value="新闻管理员">新闻管理员</option>
                                                                    <option value="超级用户">超级用户</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-2 title">头像上传</div>
                                                            <div class="col-md-10 data">
                                                                    <input type="file" name="uimg" id="img"/>
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
                                                            onclick="modelSubmit()">
                                                        添加用户
                                                    </button>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal -->
                                    </div>
                                    <!-- 添加用户模态框（Modal） -->
                                    <button type="button" class="btn btn-default" title="删除"
                                            onclick="delAllConfirm()"><i class="fa fa-trash-o"></i> 删除选中
                                    </button>
                                   <a href="${pageContext.request.contextPath}/user/admin-user?curpage=${pageInfo.pageNum}&pagesize=${pageInfo.pageSize}&uinfo=${uinfo}"> <button type="button" class="btn btn-default" title="刷新">
                                        <i class="fa fa-refresh"></i> 刷新
                                    </button>
                                   </a>
                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <form id="searchform" action="/user/admin-user" method="get">
                                <input type="text" class="form-control input-sm" placeholder="搜索" name="uinfo" value="${uinfo}" onkeydown="search(event)">
                                </form>
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <form id="selform" action="/user/delUsers" method="post">
                            <!--这里可能需要提交当前隐藏的分页数据-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                    </th>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">用户名</th>
                                    <th class="text-center">性别</th>
                                    <th class="text-center">角色</th>
                                    <th class="text-center">邮箱</th>
                                    <th class="text-center">联系方式</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${pageInfo.list}" varStatus="count">
                                    <tr>
                                        <td><input name="res" type="checkbox" value="${user.uid}"></td>
                                        <td class="text-center">${user.uid}</td>
                                        <td class="text-center">${user.uname}</td>
                                        <td class="text-center">${user.usex}</td>
                                        <td class="text-center">${user.uidentity}</td>
                                        <td class="text-center">${user.uemail}</td>
                                        <td class="text-center">${user.uphone}</td>
                                        <td class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                                    data-target="#details" onclick="findUser(${user.uid})">
                                                <i class="fa fa-bars"></i> 详情
                                            </button>
                                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                                    data-target="#edit" onclick="editUser(${user.uid})">
                                                <i class="fa fa-edit"></i> 编辑
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
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
                                <a href="${pageContext.request.contextPath}/user/admin-user?curpage=1&pagesize=${pageInfo.pageSize}&uinfo=${uinfo}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/user/admin-user?curpage=${pageInfo.prePage}&pagesize=${pageInfo.pageSize}&uinfo=${uinfo}">上一页</a></li>
                            <c:forEach var="num" items="${pageInfo.navigatepageNums}">
                                <c:if test="${num==pageInfo.pageNum}">
                                    <li class="active">
                                        <a href="${pageContext.request.contextPath}/user/admin-user?curpage=${num}&pagesize=${pageInfo.pageSize}&uinfo=${uinfo}">${num}</a>
                                    </li>
                                </c:if>
                                <c:if test="${num!=pageInfo.pageNum}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/admin-user?curpage=${num}&pagesize=${pageInfo.pageSize}&uinfo=${uinfo}">${num}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/user/admin-user?curpage=${pageInfo.nextPage}&pagesize=${pageInfo.pageSize}&uinfo=${uinfo}">下一页</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/admin-user?curpage=${pageInfo.total}&pagesize=${pageInfo.pageSize}&uinfo=${uinfo}" aria-label="Next">尾页</a>
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
        <!-- 详情（此模态框是内容居中样式） -->
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
                            用户详情
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row data-type">
                            <div class="col-md-2 title">用户名</div>
                            <div class="col-md-4 data text" id="dname">
                                <!--填充内容-->
                            </div>
                            <div class="col-md-2 title">密码</div>
                            <div class="col-md-4 data text" id="dpassword">
                                <!--填充内容-->
                            </div>
                            <div class="col-md-2 title">用户ID</div>
                            <div class="col-md-4 data text" id="did">
                                <!--填充内容-->
                            </div>
                            <div class="col-md-2 title">上次登陆</div>
                            <div class="col-md-4 data text" id="dtime">
                                <!--填充内容-->
                            </div>
                            <div class="col-md-2 title">邮箱</div>
                            <div class="col-md-4 data text" id="demail">
                                <!--填充内容-->
                            </div>
                            <div class="col-md-2 title">联系方式</div>
                            <div class="col-md-4 data text" id="dphone">
                                <!--填充内容-->
                            </div>
                            <div class="col-md-2 title">性别</div>
                            <div class="col-md-4 data text" id="dsex">
                                <!--填充内容-->
                            </div>
                            <div class="col-md-2 title">角色</div>
                            <div class="col-md-4 data text" id="didentity">
                                <!--填充内容-->
                            </div>
                            <div class="col-md-2 title">用户头像</div>
                            <div class="col-md-4 data text" style="width: 465px" >
                                <!--填充内容-->
                                <img id="dprofile" width="40px" height="40px" alt="头像不存在或者加载失败"></div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div>
        <!-- 详情（此模态框是内容居中样式） -->
        <!-- 编辑  -->
        <div class="modal fade" id="edit" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            编辑用户
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row data-type">
                            <form action="${pageContext.request.contextPath}/user/editUser?curpage=${pageInfo.pageNum}&pagesize=${pageInfo.pageSize}&uinfo=${uinfo}" method="post" id="editform" enctype="multipart/form-data">
                                <div class="col-md-2 title">用户ID</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" placeholder="文本" id="eid" disabled="disabled">
                                    <input type="hidden" name="uid" id="eid2">
                                </div>
                                <div class="col-md-2 title">用户名</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" placeholder="文本" name="uname" id="ename">
                                </div>
                                <div class="col-md-2 title">密码</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" placeholder="文本" name="upassword" id="epassword">
                                </div>

                                <div class="col-md-2 title">上次登陆</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" placeholder="无记录" name="ulastlogintime" id="etime" disabled="disabled">
                                </div>
                                <div class="col-md-2 title">邮箱</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" placeholder="无记录" name="uemail" id="eemail">
                                </div>
                                <div class="col-md-2 title">联系方式</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" placeholder="无记录" name="uphone" id="ephone">
                                </div>
                                <div class="col-md-2 title">性别</div>
                                <div class="col-md-10 data">
                                    <div class="form-group form-inline">
                                        <div class="radio"><label><input type="radio" name="usex" value="男" id="man">
                                            男</label></div>
                                        <div class="radio"><label><input type="radio" name="usex" value="女" id="female">
                                            女</label></div>
                                    </div>
                                </div>
                                <div class="col-md-2 title">角色</div>
                                <div class="col-md-10 data">
                                    <select class="form-control" name="uidentity" >
                                        <option value="普通用户" id="e0">普通用户</option>
                                        <option value="新闻管理员" id="e1">新闻管理员</option>
                                        <option value="超级用户" id="e2">超级用户</option>
                                    </select>
                                </div>
                                <div class="col-md-2 title">头像上传</div>
                                <div class="col-md-10 data">
                                    <div>
                                        <div style="float: right;margin-right: 30px">
                                    用户头像：<img id="eprofile" alt="出错/不存在" style="width: 30px;height: 30px">
                                        </div>
                                        <!--用户头像url用于后端判断接收-->
                                        <input type="hidden" name="uprofile" id="dprofile_hiden">
                                        <div style="float: left">
                                        <input type="file" name="eimg" width="30px">
                                        </div>
                                    </div>
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
                                onclick="editModelSubmit()">
                            保存
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <!-- 编辑  -->
    <!--模态框-->
</div>
<script>

    //框架js
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });

    // 设置菜单激活
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    //全选操作
    $(document).ready(function () {

        // 激活导航位置
        setSidebarActive("admin-user");

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

    //“添加”模态框提交
    function modelSubmit() {
        //添加表单验证：
        var uname = document.getElementById("uname").value;
        var paswd = document.getElementById("paswd").value;
        var img = document.getElementById("img").value;
        if(uname==null || uname==""){
            alert("用户名不能为空");
            return;
        }
        if(uname.length==0){
            alert("用户名不能为空");
            return;
        }
        if(!uname.match("^[\u4e00-\u9fa5_a-zA-Z0-9]+$")){
            alert("用户名不能包含特殊符号");
            return;
        }
        if(uname.length>12 || uname.length<2){
            alert("用户名长度必须在2-12之间");
            return;
        }
        if(paswd.length==0){
            alert("密码不能为空");
            return;
        }
        if(paswd.length>12 || paswd.length<6){
            alert("密码长度必须在6-12之间");
            return;
        }
        if(img==null || img==""){
            alert("请上传用户头像！");
            return;
        }
        if(confirm("确认添加吗？")){
            document.getElementById("addwindow").submit();
        }
    }

    //“编辑”模态框提交
    function editModelSubmit() {
        if(confirm("确认保存吗？")) {
            document.getElementById("editform").submit();
        }
    }

    //用户详情查询
    function findUser(uid) {
        $.post({
            url: "${pageContext.request.contextPath}/user/findUser",
            data: {"uid": uid},
            success: function (data) {
                document.getElementById("dname").innerText = data.uname;
                document.getElementById("demail").innerText = data.uemail;
                document.getElementById("dphone").innerText = data.uphone;
                document.getElementById("dtime").innerText = data.ulastlogintime;
                document.getElementById("did").innerText = data.uid;
                document.getElementById("dsex").innerText = data.usex;
                document.getElementById("dpassword").innerText = data.upassword;
                document.getElementById("dprofile").src = data.uprofile;
                document.getElementById("didentity").innerText = data.uidentity;
            }
        })
    }

    //用户编辑信息回显查询
    function editUser(uid) {
        $.post({
            url: "${pageContext.request.contextPath}/user/findUser",
            data: {"uid": uid},
            success: function (data) {
                document.getElementById("ename").value = data.uname;
                document.getElementById("eemail").value = data.uemail;
                document.getElementById("ephone").value = data.uphone;
                document.getElementById("etime").value = data.ulastlogintime;
                document.getElementById("eid").value = data.uid;
                document.getElementById("eid2").value = data.uid;
                if (data.usex == "女") {
                    document.getElementById("female").checked = "ckecked";
                } else {
                    document.getElementById("man").checked = "ckecked";
                }
                ;
                document.getElementById("epassword").value = data.upassword;
                document.getElementById("eprofile").src = data.uprofile;
                document.getElementById("dprofile_hiden").value = data.uprofile;
                if (data.uidentity == "普通用户") {
                    document.getElementById("e0").selected = "selected";
                } else if (data.uidentity == "新闻管理员") {
                    document.getElementById("e1").selected = "selected";
                } else {
                    document.getElementById("e2").selected = "selected";
                }
            }
        })
    }

    //设定每页显示记录
    function setPageSize(value){
        window.location.href="${pageContext.request.contextPath}/user/admin-user?uinfo=${uinfo}&pagesize="+value
    }
    //搜索
    function search(event) {
        var evt = window.event || e;
        if (evt.keyCode == 13) {
            document.getElementById("searchform").submit();
        }

    }
    //设置默认加载
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