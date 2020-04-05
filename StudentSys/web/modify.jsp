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
    <title>修改信息</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->

</head>
<body>
<div class="container" style="width: 400px;">
    <center><h3>修改学生信息</h3></center>
    <form action="${pageContext.request.contextPath}/ModifyServlet?c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}" method="post">

        <div class="form-group">
            <label for="sname">姓名：</label>
            <input type="text" class="form-control" id="sname" name="sname" placeholder="请输入姓名"
                   value="${requestScope.student.sname}">
        </div>

        <div class="form-group">
            <label for="sno">学号：</label>
            <input type="text" class="form-control" id="sno" name="sno" readonly placeholder="请输入学号"
                   value="${requestScope.student.sno}">
        </div>

        <c:if test="${requestScope.student.ssex eq '男'}">
            <div class="form-group">
                <label>性别：</label>
                <input type="radio" name="ssex" value="男" checked="checked">男
                <input type="radio" name="ssex" value="女"/>女
            </div>
        </c:if>
        <c:if test="${requestScope.student.ssex eq '女'}">
            <div class="form-group">
                <label>性别：</label>
                <input type="radio" name="ssex" value="男">男
                <input type="radio" name="ssex" value="女" checked="checked"/>女
            </div>
        </c:if>
        <c:if test="${empty requestScope.student.ssex}">
            <div class="form-group">
                <label>性别：</label>
                <input type="radio" name="ssex" value="男" checked="checked">男
                <input type="radio" name="ssex" value="女"/>女
            </div>
        </c:if>
        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" class="form-control" id="age" name="sage" placeholder="请输入年龄"
                   value="${requestScope.student.sage}">
        </div>

        <div class="form-group">
            <label for="sdept">学院：</label>
            <select name="sdept" class="form-control" id="sdept">
                <c:if test="${requestScope.student.sdept eq '计算机学院'}">
                    <option value="计算机学院" selected>计算机学院</option>
                    <option value="理学院">理学院</option>
                    <option value="艺术学院">艺术学院</option>
                    <option value="外语学院">外语学院</option>
                    <option value="纺织学院">纺织学院</option>
                </c:if>
                <c:if test="${requestScope.student.sdept eq '理学院'}">
                    <option value="计算机学院">计算机学院</option>
                    <option value="理学院" selected>理学院</option>
                    <option value="艺术学院">艺术学院</option>
                    <option value="外语学院">外语学院</option>
                    <option value="纺织学院">纺织学院</option>
                </c:if>
                <c:if test="${requestScope.student.sdept eq '艺术学院'}">
                    <option value="计算机学院">计算机学院</option>
                    <option value="理学院">理学院</option>
                    <option value="艺术学院" selected>艺术学院</option>
                    <option value="外语学院">外语学院</option>
                    <option value="纺织学院">纺织学院</option>
                </c:if>
                <c:if test="${requestScope.student.sdept eq '纺织学院'}">
                    <option value="计算机学院">计算机学院</option>
                    <option value="理学院">理学院</option>
                    <option value="艺术学院" >艺术学院</option>
                    <option value="外语学院">外语学院</option>
                    <option value="纺织学院" selected>纺织学院</option>
                </c:if>
                <c:if test="${requestScope.student.sdept eq '外语学院'}">
                    <option value="计算机学院">计算机学院</option>
                    <option value="理学院">理学院</option>
                    <option value="艺术学院" >艺术学院</option>
                    <option value="外语学院" selected>外语学院</option>
                    <option value="纺织学院">纺织学院</option>
                </c:if>
            </select>
        </div>

        <div class="form-group">
            <label for="phone">联系方式：</label>
            <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入联系方式"
                   value="${requestScope.student.phone}"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交修改"/>
            <input class="btn btn-default" type="reset" value="恢复默认"/>
            <a href="${pageContext.request.contextPath}/PagingServlet"><input class="btn btn-default" type="button"
                                                                              value="返回"/></a>
        </div>
    </form>

    <%--    此处应该作为JS检测错误的提示框--%>
    <c:if test="${not empty existmsg}">
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert">
                <span>&times;</span></button>
            <strong>${requestScope.existmsg}</strong>
        </div>
    </c:if>
</div>
</body>
</html>
