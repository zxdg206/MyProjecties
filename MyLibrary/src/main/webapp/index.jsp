<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--<%@ include file="WEB-INF/commons.jsp"%>--%>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎页</title>
    <style>
        #all{
            color: aliceblue;
            font-family: 楷体;
            font-size: 3.125rem;
            text-align: center;
            position: absolute;
            top: 30%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        body{
            background: url(img/4.jpg);
        }
        a{
            text-decoration: blink;
        }

    </style>
</head>
<body>
<div id="all">
    欢迎来到我的图书管理系统
    <div>请选择你的身份</div>
    <div>
        <a href="readerlogin.jsp">借阅者</a>
        <a href="ContorLogin.jsp">管理员</a>
    </div>
</div>
</body>
</html>
