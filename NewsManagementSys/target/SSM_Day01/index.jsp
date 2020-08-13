<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2 align="center"><a href="account/findAccounts">toSuccess</a></h2>
<div align="center">

    <hr>
    <form action="account/addAccount" method="post">
    <table border="1" align="center">
<%--这里可以设置一个简单的异步传输，点击按钮后可以选择从数据库查询的用户--%>
        <caption>姓名：小兰</caption>
        <tr>
            <td width="75px">用户名：</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>金额：</td>
            <td><input type="text" name="money"></td>
        </tr>
    </table>
        <input type="hidden" name="name" value="小兰">
        <input type="submit" value="提交">
    </form>
    <hr>
    <form action="account/findAccountByName" method="post">
    <input type="text" name="name">
    <a href="account/findAccountByName"><input type="submit" value="查询"></a>
    </form>

</div>
</body>
</html>
