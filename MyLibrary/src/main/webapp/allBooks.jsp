<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dgy.domain.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            background: url(/src/main/webapp/img/2.jpg);
        }
    </style>
</head>
<body>输入书号借书

<%
    response.setHeader("Pragma", "No-cache");

    response.setHeader("Cache-Control", "no-cache");

    response.setDateHeader("Expires",-10);
%>
    <form action="borrowbook" method="post">
        <input name="bookid">
        <input type="submit" value="借书">
    </form>输入书名搜索，可模糊搜索
    <form action="serach">
        <input name="bookname">
        <input type="submit" value="搜索">
    </form>
    <a href="myBorrow">我的借阅信息</a><br>
以下为全部书籍
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
        <c:forEach  var="book" items="${bookList}">
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
