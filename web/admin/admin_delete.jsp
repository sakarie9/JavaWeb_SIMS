<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/6/006
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除</title>
</head>
<body>
<%
    StudentDao sd = new StudentDao();
    String stuId = request.getParameter("stuId");
    StudentBean student = sd.getStudentByStuno(stuId);
    request.getSession().setAttribute("originStudent", student);
%>
<form action="${pageContext.request.contextPath}/servlet/ModifyStudentServlet" method="post">
    <table border="1" align="center">
        <tr>
            <td>学号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>电子邮箱</td>
            <td>密码</td>
            <td></td>
        <tr>
        <tr>
            <td><%=stuId%>
            </td>
            <td><%=student.getStuName()%>
            </td>
            <td><%=student.getStuSex()%>
            </td>
            <td><%=student.getStuEmail()%>
            </td>
            <td><%=student.getStuPsw()%>
            </td>
            <td></td>
        </tr>
        <tr>

            <td><%=stuId%><input value="<%=stuId%>" type="hidden" name="stuId"></td>
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
