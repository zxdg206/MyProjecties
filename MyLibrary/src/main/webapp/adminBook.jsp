<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.zc.domain.LibraryInFoVo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            background: url("/src/main/webapp/img/1.jpg");
        }
    </style>
</head>
<body>
<form action="addBook">
    书名<input name="bookname"><br>
    作者<input name="bookauthor"><br>
    位置<input name="bookposition"><br>
    出版社<input name="bookpress"><br>
    书状态<input name="bookstate"><br>
    出版时间<input name="bookpublish"><br>
    简介<input name="bookdescibe"><br>
    <input type="submit" value="添加书籍">
</form>
<form action="delBook">
    输入书号进行删除<input name="bookid">
    <input type="submit" value="谨慎删除">
</form>
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
