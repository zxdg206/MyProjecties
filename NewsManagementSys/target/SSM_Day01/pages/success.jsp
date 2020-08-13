<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>成功页</title>
</head>
<body>
<h1 align="center"><a href="${pageContext.request.contextPath}/index.jsp">back</a></h1>
<table align="center" border="1">
    <c:if test="${not empty msg}">
        <br>
        <h2 align="center"> 提示信息：新增用户“${msg}”</h2>
    </c:if>
    <tr>
        <th>用户</th>
        <th>用户名</th>
        <th>金额</th>
    </tr>
    <c:forEach items="${accounts}" var="account">
    <tr>
        <td>${account.name}</td>
        <td>${account.username}</td>
        <td>${account.money}</td>
    </tr>
    </c:forEach>
    <hr>

</table>
</body>
</html>
