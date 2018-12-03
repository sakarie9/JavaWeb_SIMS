<%@ page import="java.awt.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.awt.image.BufferedImage" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/18/018
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>学生信息管理系统</title>
</head>

<script type="text/javascript">
    //刷新验证码
    function changeImg(){
        document.getElementById("validateCodeImg").src="servlet/DrawValidateCodeServlet?t=" + Math.random();
    }
</script>

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
        <input type="checkbox" name="autoLogin" value="autoLogin">两周内自动登录
    </div>
    <div>
        <input type="text" name="validateCode" style="width:50px" placeholder="验证码">
        <img alt="看不清？换一张" src="servlet/DrawValidateCodeServlet" id="validateCodeImg" onclick="changeImg()">
    </div>
    <div>
        <input type="submit" value="登录"/>
    </div>

</form>
</body>
</html>
