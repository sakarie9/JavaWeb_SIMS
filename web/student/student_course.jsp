<%@ page import="dao.CourseDao" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.CourseBean" %>
<%@ page import="util.PageUtil" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/19/019
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的课程</title>
</head>

<body>
<table border="1" align="center">
    <tr>
        <td>课程编号</td>
        <td>课程名</td>
        <td>学分</td>
        <td>教师</td>
    </tr>
    <%
        CourseDao cd=new CourseDao();
        String stuId = session.getAttribute("stuId").toString();
        List list=cd.getCourseBystuId(stuId);

        for(int i=0;i<list.size();i++){
            CourseBean course=(CourseBean)list.get(i);
    %>
             <tr>
                 <td><%=course.getCourseId() %></td>
                 <td><%=course.getName() %></td>
                 <td><%=course.getCredit() %></td>
                 <td><%=course.getTeaName() %></td>
             </tr>
    <%
    }
    %>

</table>

</body>
</html>
