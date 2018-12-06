<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/5/005
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/servlet/InsertStudentServlet" method="post">
<table border="1" align="center">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>电子邮箱</td>
        <td>密码</td>
        <td></td>
    </tr>
    <tr>
        <td><input placeholder="学号" name="stuId"></td>
        <td><input placeholder="姓名" name="stuName"></td>
        <td><input placeholder="性别" name="stuSex"></td>
        <td><input placeholder="电子邮箱" name="stuEmail"></td>
        <td><input placeholder="密码" name="stuPsw"></td>
        <td><input type="submit"></td>
    </tr>
</table>
</form>
</body>
</html>
