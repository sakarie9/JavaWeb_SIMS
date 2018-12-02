<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/18/018
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--<title>登陆</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="login" method="post">--%>
<%--账号：<input type="text" teaName="username"><br>--%>
<%--密码：<input type="teaPsw" teaName="teaPsw"><br>--%>
<%--<button type="submit">登陆</button>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>学生信息管理系统</title>
</head>

<body>
<form action="${pageContext.request.contextPath}/servlet/LoginServlet" method="post">
    <h1>学生信息管理系统登录界面</h1>
    <div>
        <input type="text" placeholder="登录名" name="username"/>
    </div>
    <div>
        <input type="password" placeholder="密码" name="password"/>
    </div>
    <div>
        <input type="radio" name="role" value="student" checked="checked">学生
        <input type="radio" name="role" value="teacher">教师
    </div>
    <div>
        <input type="submit" value="登录"/>
    </div>
</form>
</body>
</html>
