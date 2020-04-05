<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zc.domain.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    body{
        background: url("/src/main/webapp/img/2.jpg");
    }
</style>

<body>

<%
//    response.setHeader("Pragma", "No-cache");
//    response.setHeader("Cache-Control", "no-cache");
//    response.setDateHeader("Expires",0);
%>
请输入书号还书
<form action="returnBook">
    <input name="bookid">
    <input type="submit" value="立即还书">
</form>
请输入书号续借
<form action="reBorrow">
    <input name="bookid">
    <input type="submit" value="立即续借">
</form>
<table border="1" cellspacing="0">
    <tr>
        <td>书号</td>
        <td>书名</td>
        <td>借阅者ID</td>
        <td>借阅者姓名</td>
        <td>借阅日期</td>
    </tr>
    <c:forEach  var="borrow" items="${myBorrowList}">
        <tr>
            <td>${borrow.bookid}</td>
            <td>${borrow.bookname}</td>
            <td>${borrow.readerid}</td>
            <td>${borrow.readername}</td>
            <td>${borrow.borrowdate}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
