<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/5/005
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
</head>
<script type="text/javascript">
    //刷新验证码
    function changeImg(){
        document.getElementById("validateCodeImg").src="servlet/DrawValidateCodeServlet?t=" + Math.random();
    }
</script>
<body>
<form action="${pageContext.request.contextPath}/servlet/SendEmailServlet" method="post">
    <div>
        <input type="text" placeholder="学号" name="username"/>
    </div>
    <div>
        <input type="text" name="validateCode" style="width:50px" placeholder="验证码">
        <img alt="看不清？换一张" src="servlet/DrawValidateCodeServlet" id="validateCodeImg" onclick="changeImg()">
    </div>
    <div>
        <input type="submit" value="发送邮件"/>
    </div>

</form>
</body>
</html>
