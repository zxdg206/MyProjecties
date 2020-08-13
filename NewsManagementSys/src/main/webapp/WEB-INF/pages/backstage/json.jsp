<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<title>json测试页面</title>
<jsp:include page="backstage-header.jsp"></jsp:include>
<body>


<hr>
    输入用户名:<input type="text" id="name"  onblur="a1(this.value)" /><span id="nameinfo" style="color: red"></span><br>
    输入密码:<input type="password" id="paswd"  onblur="a2(this.value)" /><span id="paswdinfo" style="color: red"></span><br>
    <input type="button" value="提交" onclick="a3()" /><span id="btn"></span><br>
</div>


<script>

    function a3() {
        var n = document.getElementById("nameinfo").innerText;
        var p = document.getElementById("paswdinfo").innerText;
        if(n =="*" && p=="*"){
            alert("可以提交")
        }else {
            alert("请按要求填写信息")
        }
    }
</script>
</body>
</html>
