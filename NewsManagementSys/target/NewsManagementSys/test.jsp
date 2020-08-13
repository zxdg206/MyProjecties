<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>test/root页</title>
    <script>
        <!--
        身份选择-->
        function a() {
            var num = document.formname.value
            if (num == 1) {
                document.formname.action = "backstage/managerlogin"
            } else if (num == 2){
                document.formname.action = "test/toLoginJSP"
            }
        }

        <!--ID属性选择-->
        function writerUsername() {
            alert("确认点击");
            document.getElementById("showName").value = "XXXXXXX";

        }

        function loca() {
            alert("确认点击");
            window.location = "OK.jsp"
        }
    </script>
</head>
<body>
<h1 align="center">测试页面</h1>
　　
<div align="center">
    <form name="formname" action="" method="post">
        　　　　<select name="m">　　　
        <option value="1">OK</option>
        　　　　
        <option value="2">LoginJSP</option>
        　　　　</select>
        　　　　<input type="submit" value="登录" onclick="a()">　
    </form>
    <hr>
    <br>
    用户名:<input type="text" id="showName"><input type="button" name="b" value="写名字" onclick="writerUsername()"><br>
    <hr>
    <input type="text"><input type="button" name="b" value="测试windowLocation" onclick="loca()">
    　　

</div>
　　
</body>
</body>
</html>
