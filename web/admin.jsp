<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/5/005
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/servlet/AdminLoginServlet" method="post">
<div>
    <input type="text" placeholder="管理员账号" name="username"/>
</div>
<div>
    <input type="password" placeholder="密码" name="password"/>
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
