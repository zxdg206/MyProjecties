<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>个人中心</title>
<meta name="description" content="个人中心">
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
    <div class="content-wrapper" style="min-height: 622px;">
        <section class="content-header">
            <h1>
                个人中心
                <small>编辑个人信息</small>
            </h1>
        </section>
        <section class="content" style="margin-top: 20px">
            <div class="box box-primary">
                <div class="modal-body">
                    <div class="row data-type">
                        <form action="/web/editPersonal" method="post" id="editform" enctype="multipart/form-data">
                            <div class="col-md-2 title">用户ID</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" placeholder="文本" id="eid" value="${uid}"
                                       disabled="disabled">
                                <input type="hidden" name="uid" id="eid2" value="${uid}" value="${uid}">
                            </div>
                            <div class="col-md-2 title">用户名</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" placeholder="用户名" name="uname" id="ename"
                                       value="${uname}">
                            </div>
                            <div class="col-md-2 title">密码</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" placeholder="用户密码" name="upassword" id="epassword"
                                       value="${user.upassword}">
                            </div>

                            <div class="col-md-2 title">上次登陆</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" placeholder="无记录" name="ulastlogintime"
                                       value="${user.ulastlogintime}" id="etime" disabled="disabled">
                            </div>
                            <div class="col-md-2 title">邮箱</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" placeholder="无记录" name="uemail" id="eemail"
                                       value="${user.uemail}">
                            </div>
                            <div class="col-md-2 title">联系方式</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" placeholder="无记录" name="uphone" id="ephone"
                                       value="${user.uphone}">
                            </div>
                            <div class="col-md-2 title">性别</div>
                            <div class="col-md-10 data">
                                <div class="form-group form-inline">
                                    <c:if test="${user.usex eq '男'}">
                                        <div class="radio"><label><input type="radio" name="usex" value="男"
                                                                         checked="checked">
                                            男</label></div>
                                        <div class="radio"><label><input type="radio" name="usex" value="女" id="female">
                                            女</label></div>
                                    </c:if>
                                    <c:if test="${user.usex eq '女'}">
                                        <div class="radio"><label><input type="radio" name="usex" value="男">
                                            男</label></div>
                                        <div class="radio"><label><input type="radio" name="usex" value="女"
                                                                         checked="checked">
                                            女</label></div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-md-2 title">角色</div>
                            <div class="col-md-10 data">
                                <c:if test="${uidentity == '普通用户'}">
                                    <input class="form-control" type="text" name="uidentity" value="${uidentity}" disabled="disabled"/>
                                </c:if>
                                <c:if test="${uidentity == '新闻管理员'}">
                                    <input class="form-control" type="text" name="uidentity" value="${uidentity}" disabled="disabled"/>
                                </c:if>
                                <c:if test="${uidentity == '超级用户'}">
                                    <input class="form-control" type="text" name="uidentity" value="${uidentity}" disabled="disabled"/>
                                </c:if>
                                <input type="hidden" name="uidentity" value="${uidentity}">
                            </div>
                            <div class="col-md-2 title">头像上传</div>
                            <div class="col-md-10 data">
                                <div>
                                    <div style="float: right;margin-right: 30px">
                                        用户头像：<img id="eprofile" alt="出错/不存在" id="img" style="width: 30px;height: 30px"
                                                  src=${uprofile}>
                                    </div>
                                    <!--用户头像url用于后端判断接收-->
                                    <input type="hidden" name="uprofile" id="dprofile_hiden" value="${uprofile}">
                                    <div style="float: left">
                                        <input type="file" name="eimg" width="30px">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
            <button type="button" class="btn btn-block btn-primary btn-lg" style="width: 50%;margin-left: 25%" onclick="editModelSubmit()">保存修改</button>
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
    //“编辑”模态框提交
    function editModelSubmit() {
        var name = document.getElementById("ename").value;
        var paswd = document.getElementById("epassword").value;
        if(name.length==0 || name==null || name==""){
            alert("用户名不能为空")
            return;
        }
        if(!name.match("^[\u4e00-\u9fa5_a-zA-Z0-9]+$")){
            alert("用户名不能包含特殊符号");
            return;
        }
        if(name.length>12 || name.length<2){
            alert("用户名长度必须在2-12之间");
            return;
        }
        if(paswd.length==0 || paswd=="" || paswd==null){
            alert("密码不能为空");
            return;
        }
        if(paswd.length>12 || paswd.length<3){
            alert("密码长度必须在3-12之间");
            return;
        }
        if(confirm("确认保存吗？")) {
            document.getElementById("editform").submit();
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
        setSidebarActive("admin-personal");
    });
</script>
</body>
</html>