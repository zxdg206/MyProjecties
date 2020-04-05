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
        background: url(img/1.jpg);
    }
</style>
<body>
<table border="1" cellspacing="0">
    <tr>
        <td>书号</td>
        <td>书名</td>
        <td>作者</td>
        <td>位置</td>
        <td>出版社</td>
        <td>书状态</td>
        <td>出版时间</td>
        <td>简介</td>
    </tr>
    <c:forEach  var="book" items="${serachBookList}">
        <tr>
            <td>${book.bookid}</td>
            <td>${book.bookname}</td>
            <td>${book.bookauthor}</td>
            <td>${book.bookposition}</td>
            <td>${book.bookpress}</td>
            <td>${book.bookstate}</td>
            <td>${book.bookpublish}</td>
            <td>${book.bookdescibe}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
