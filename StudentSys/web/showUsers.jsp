<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
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
    <title>用学生信息管理</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>

    <script>
        <%--    跳转输入的页面    --%>
        function toPage() {
        var page = parseInt(document.getElementById("skip").value);
        if(page<=${page.all_page}&&page!=0){
        window.location.href="${pageContext.request.contextPath}/PagingServlet?c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&cur_page="+page;
        }else if(page==0){
            window.location.href="#";
        }else{
            alert("超过最大页数!")
        }
    }
        <%--    确认分页前进后退边界--%>
    function isBorder(nextPage, maxpage) {
        var next = parseInt(nextPage);
        var max = parseInt(maxpage);
        if (next > max) {
            location.href = "${pageContext.request.contextPath}/PagingServlet?c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&cur_page=" + (next - 1);
        } else if (next <= 0) {
            location.href = "${pageContext.request.contextPath}/PagingServlet?c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&cur_page=1";
        } else {
            location.href = "${pageContext.request.contextPath}/PagingServlet?c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&cur_page=" + next;
        }

    }
    <%--    删除选中    --%>
    function delAllConfirm() {
        //先判断有没有至少被选中的
        var checkboxs = document.getElementsByName('selectedSno');
        var flag = 0;//0代表没有勾选任何框，1代表至少勾选，-1代表勾选了，但取消删除。
        for (var i = 0; i < checkboxs.length; i++) {
            if(checkboxs[i].checked == true){
                if (confirm("确认删除勾选的学生吗？")) {
                    flag = 1;
                    break;
                }else {
                    //选择了否
                    flag = -1;
                    break;
                }
            }

        }
        if (flag==1) {
            document.getElementById("checkform").submit();
        } else if(flag==0){
            alert("未勾选任何记录！")
        }

    }

    //删除按钮
    function delconfirm(sno) {
        if (confirm("确认删除此学生吗？")) {
            location.href = "${pageContext.request.contextPath}/DeleteServlet?&cur_page=${page.cur_page}&c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&dsno=" + sno;
        }
    }

    //全选框
    function SelectAll(obj) {
        if (obj.checked) {
            //获取所有同名的参数，有一个length属性标识参数个数
            var checkboxs = document.getElementsByName('selectedSno');
            for (var i = 0; i < checkboxs.length; i++) {
                checkboxs[i].checked = true;
            }
        } else {
            var checkboxs = document.getElementsByName('selectedSno');
            for (var i = 0; i < checkboxs.length; i++) {
                checkboxs[i].checked = false;
            }
        }
    }
    </script>

    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 style="text-align: center"><a href="${pageContext.request.contextPath}/PagingServlet">学生信息列表</a></h1>

    <%--    查询表单    --%>
    <div style="float: left;margin:15px">
        <form class="form-inline" action="${pageContext.request.contextPath}/PagingServlet?cur_page=${page.cur_page}" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="c_name" value="${query[0]}" class="form-control"
                       id="exampleInputName2">
            </div>
            <div class="form-group">
                <label for="exampleInputName3">学号</label>
                <input type="text" name="c_no" value="${query[1]}" class="form-control"
                       id="exampleInputName3">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2">学院</label>
                <input type="text" name="c_sdept" value="${query[2]}" class="form-control"
                       id="exampleInputEmail2">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>
    <%--    勾选表单    --%>
    <form action="${pageContext.request.contextPath}/checkedServlet" id="checkform">
        <input type="hidden" name="cur_page" value="${page.cur_page}">
        <input type="hidden" name="c_name" value="${query[0]}">
        <input type="hidden" name="c_no" value="${query[1]}">
        <input type="hidden" name="c_sdept" value="${query[2]}">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" onclick="SelectAll(this)"></th>
                <th>序号</th>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>学院</th>
                <th>联系方式</th>
                <th>操作</th>
            </tr>
            <c:forEach var="stu" items="${requestScope.page.reslist}" varStatus="count">
                <tr>
                    <td><input type="checkbox" name="selectedSno" value="${stu.sno}"></td>
                    <td>${page.no[count.index]}</td>
                    <td>${stu.sno}</td>
                    <td>${stu.sname}</td>
                    <td>${stu.ssex}</td>
                    <td>${stu.sage}</td>
                    <td>${stu.sdept}</td>
                    <td>${stu.phone}</td>
                    <td>
                        <a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/PackageServlet?sno=${stu.sno}&c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:delconfirm(${stu.sno})">删除</a>
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/test.jsp?sno=${stu.sno}&c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}">详细</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <div style="margin: -10px">
        <%--    两个按钮    --%>
        <div style="float:right;margin-top: 20px;">
            <td colspan="8" align="center"><a class="btn btn-primary btn-lg"
                                              href="${pageContext.request.contextPath}/add.jsp?&c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}">添加学生</a></td>
            <td colspan="8" align="center"><a class="btn btn-primary btn-lg" id="delChecked"
                                              href="javascript:delAllConfirm()">删除选中</a></td>
        </div>
        <%--    分页条     --%>
        <div style="float: left">
            <nav aria-label="Page navigation">
                <ul class="pagination pagination-lg">
                    <%--向后换页器--%>
                    <li id="pre">
                        <a href="${pageContext.request.contextPath}/PagingServlet?&c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&cur_page=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                        <a href="javascript:isBorder('${page.cur_page-1}','${page.all_page}')" aria-label="Previous">
                            <span aria-hidden="true"><</span>
                        </a>
                    </li>
                    <%--    页码     --%>
                    <c:forEach begin="1" end="${page.size}" varStatus="s">

                        <c:if test="${page.cur_page==s.count+page.fix}">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/PagingServlet?c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&cur_page=${s.count+page.fix}">${s.count+page.fix}</a>
                            </li>
                        </c:if>

                        <c:if test="${page.cur_page!=s.count+page.fix}">
                            <li>
                                <a href="${pageContext.request.contextPath}/PagingServlet?c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&cur_page=${s.count+page.fix}">${s.count+page.fix}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <%--向前换页器--%>

                    <li id="next">
                        <a href="javascript:isBorder('${page.cur_page+1}','${page.all_page}')"
                           aria-label="Previous">
                            <span aria-hidden="true">></span>
                        </a>
                        <a href="${pageContext.request.contextPath}/PagingServlet?c_name=${query[0]}&c_no=${query[1]}&c_sdept=${query[2]}&cur_page=${page.all_page}"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <div style="float: left;margin-left: 10px;margin-top: 30px">
            <span style="font-size: 16px;margin-top: 40px">共${page.all_res}条记录/${page.all_page}页 转至
            <input id="skip" type="text" aria-describedby="sizing-addon3" style="width:45px;" oninput="value=value.replace(/[^\d]/g,'')"/>页</span>
            <input type="button" style="width:56px;height: 28px" value="跳转" onclick="toPage()"/>
        </div>
    </div>
</div>
</body>
</html>
