<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/3/003
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>
<body>
<%
    //删除Cookie
    Cookie[] cookies;
    cookies = request.getCookies();
    if( cookies != null ){
        for (Cookie cookie:cookies){
                cookie.setMaxAge(0);
                response.addCookie(cookie);
        }
    }
    //删除session
    session.invalidate();

    // 定时跳转
    response.setHeader("refresh", "2; URL = /login.jsp");
%>
<div class="mdui-typo mdui-text-center">
    <h3>您已成功退出本系统，两秒钟后跳转到登陆页</h3>
    <h3>如果没有自动跳转，请点击<a href="login.jsp">这里</a></h3>
</div>


</body>
</html>
