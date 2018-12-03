<%@ page import="dao.CourseDao" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.CourseBean" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/3/003
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生选课</title>
</head>
<body>
<form action="/servlet/SelectCourseServlet" method="post">
<table border="1" align="center">
    <tr>
        <td>课程编号</td>
        <td>课程名</td>
        <td>教工号</td>
        <td>教师</td>
        <td>学分</td>
        <td>选课</td>
    </tr>
    <%
        CourseDao cd=new CourseDao();
        String stuId = session.getAttribute("stuId").toString();
        List list=cd.getAllCourseNotSelected(stuId);

        for(int i=0;i<list.size();i++){
            CourseBean course=(CourseBean)list.get(i);
    %>

             <tr>
                 <td><%=course.getCourseId() %></td>
                 <td><%=course.getName() %></td>
                 <td><%=course.getTeaId() %></td>
                 <td><%=course.getTeaName() %></td>
                             <td><%=course.getCredit() %></td>
                             <td>
                                 <input value="<%=course.getCourseId() %>" name="courseId" type="hidden">
                                 <label>
                                     <input type="checkbox" name="selectCourse" value="1">
                                 </label>
                             </td>
             </tr>

    <%
        }
    %>
<tr><td colspan="6" align="right">
    <input type="submit" value="确定选课">
</td></tr>
</table>
</form>
</body>
</html>
