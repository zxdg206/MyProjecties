<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加学生</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container" style="width: 400px;">
    <center><h3>添加学生页面</h3></center>
<%--    添加表单    --%>
    <form action="${pageContext.request.contextPath}/AddServlet?c_name=${c_name}&c_no=${c_no}&c_sdept${c_sdept}" method="post">

        <div class="form-group">
            <label for="sname">姓名：</label><span id="jname">姓名不能为空</span>
            <input type="text" class="form-control" id="sname" name="sname" placeholder="请输入姓名" value="${requestScope.sname}" oninput="this">
        </div>

        <div class="form-group">
            <label for="sno">学号：</label>
            <input type="text" class="form-control" id="sno" name="sno" placeholder="请输入学号" value="${requestScope.sno}" oninput="value=value.replace(/[^\d]/g,'')">
        </div>

        <c:if test="${requestScope.ssex eq '男'}">
        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="ssex" value="男" checked="checked">男
            <input type="radio" name="ssex" value="女"/>女
        </div>
        </c:if>
        <c:if test="${requestScope.ssex eq '女'}">
            <div class="form-group">
                <label>性别：</label>
                <input type="radio" name="ssex" value="男" >男
                <input type="radio" name="ssex" value="女" checked="checked"/>女
            </div>
        </c:if>
        <c:if test="${empty requestScope.ssex}">
            <div class="form-group">
                <label>性别：</label>
                <input type="radio" name="ssex" value="男" checked="checked">男
                <input type="radio" name="ssex" value="女" />女
            </div>
        </c:if>
        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" name="sage" placeholder="请输入年龄" value="${requestScope.sage}">
        </div>

        <div class="form-group">
            <label for="sdept">学院：</label>
            <select name="sdept" class="form-control" id="sdept" value="${requestScope.sdept}">
                <option value="计算机学院">计算机学院</option>
                <option value="理学院">理学院</option>
                <option value="艺术学院">艺术学院</option>
                <option value="外语学院">外语学院</option>
                <option value="纺织学院">纺织学院</option>
            </select>
        </div>

        <div class="form-group">
            <label for="phone">联系方式：</label>
            <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入联系方式" value="${requestScope.phone}"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <a href="${pageContext.request.contextPath}/add.jsp"><input class="btn btn-default" type="button" value="重置"/></a>
            <a href="${pageContext.request.contextPath}/PagingServlet?c_name=${c_name}&c_no=${c_no}&c_sdept${c_sdept}"><input class="btn btn-default" type="button" value="返回" /></a>
        </div>
    </form>
    <c:if test="${not empty existmsg}">
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" >
                <span>&times;</span></button>
            <strong>${requestScope.existmsg}</strong>
        </div>
    </c:if>
</div>
</body>
</html>
