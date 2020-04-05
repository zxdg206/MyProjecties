<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.Student" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <title>学生信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
  <title>测试页面</title>
        <script type="text/javascript">

        function sure()
            {
                flag = false;
                var name =document.getElementById("name").value
                //名字空
                if(name==null){
                    document.getElementById("0").innerText="名字不能为空"
                    flag = false;
                }else {
                    document.getElementById("0").innerText="*"
                    flag = true;
                }
                //名字长度
                if(v.length>4){
                    document.getElementById("0").innerText="名字必须小于4个字符"
                    flag = false;
                }else {
                    document.getElementById("0").innerText="*"
                    flag = true;
                }
            }

        function validate_required(field,alerttxt)
        {
            with (field)
            {
                if (value==null||value=="")
                {alert(alerttxt);return false}
                else {return true}
            }
        }

        function validate_form(thisform)
        {
            with (thisform)
            {
                if (validate_required(email,"Email must be filled out!")==false)
                {email.focus();return false}
            }
        }
        </script>
    </head>

<body>

<h1>测试JS页面</h1>
<hr>

<form action="${pageContext.request.contextPath}/test2.jsp">
<center>姓&nbsp名：<input type="text" id="name"  /><span id="0"></span></center><br>
<center>密&nbsp码：<input type="password" id="password" /><span id="1"></span></center><br>
<center>确&nbsp认：<input type="text" id="repassword"/><span id="2"></span></center>
<center><input type="submit" id="submit" value="提交" onblur="sure()"></center>
    <hr>
    <form action="submitpage.htm" onsubmit="return validate_form(this)" method="post">
        Email: <input type="text" name="email" size="30">
        <input type="submit" value="Submit">
    </form>
</form>
</body>
</html>