<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/28/028
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师主页</title>
</head>
<body>
<div>
    欢迎你，${sessionScope.teaName}!
</div>
<div>
    <a href="teacher_info.jsp">我的信息</a>
</div>
<div>
    <a href="teacher_course.jsp">查看课程</a>
</div>
<div>
    <a href="/logout.jsp">注销</a>
</div>
</body>
</html>
