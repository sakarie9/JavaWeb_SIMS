<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/18/018
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生主页</title>
</head>
<body>
<div>
    欢迎你，${ sessionScope.stuName }!

</div>
<div>
    <a href="student_info.jsp">我的信息</a>

</div>
<div>
    <a href="student_course.jsp">查看课程</a>
</div>
<div>
    <a href="student_score.jsp">查看成绩</a>
</div>
</body>
</html>
