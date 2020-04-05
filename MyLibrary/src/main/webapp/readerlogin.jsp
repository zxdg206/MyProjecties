<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <style>
        #baoti{
            font-family:楷体;
            font-size: 3.125rem;
            text-align: center;
        }
        #denlu{
            font-family: 楷体;
            font-size: 1.875rem;
            text-align: center;
        }
        #zhenti{
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
            background: url(img/2.jpg);
        }
        a{
            font-family: 楷体;
            font-size: 15px;
        }
    </style>
</head>
<body>



<div id="zhenti">
    <div id="baoti">
        欢迎来到我的图书管理系统！
    </div>
    <div id="denlu" >
        <form action="reader/login" method="post">
            <div>
                用户名<input type="text" name="id" />
            </div>
            <div>
                密&nbsp&nbsp码<input type="password" name="password" />
            </div>
            <div>
                <input type="submit" value="登录" />
            </div>
        </form>
        <div>
            <a href="readerregister.jsp">还没有账号？</a>
        </div>
    </div>
</div>
</body>
</html>
