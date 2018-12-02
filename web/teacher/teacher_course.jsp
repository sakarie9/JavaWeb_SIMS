<%@ page import="dao.CourseDao" %>
<%@ page import="java.util.List" %>
<%@ page import="util.PageUtil" %>
<%@ page import="bean.CourseBean" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/28/028
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程查看</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <td>课程编号</td>
        <td>课程名</td>
        <td>学分</td>
        <td>成绩</td>
    </tr>
    <%
        CourseDao cd=new CourseDao();
        String teaId = session.getAttribute("teaId").toString();
        List list=cd.getCourseByteaId(teaId);

        String pageStr = request.getParameter("page");
        int currentPage = 1;
        if (pageStr != null)
            currentPage = Integer.parseInt(pageStr);
        PageUtil pageUtil = new PageUtil(10, list.size(), currentPage);
        currentPage = pageUtil.getCurrentPage();

        List currentPageList = pageUtil.getCurrentList(list);

        for(int i=0;i<currentPageList.size();i++){
            CourseBean course=(CourseBean)currentPageList.get(i);
    %>
             <tr>
                 <td><%=course.getCourseId() %></td>
                 <td><%=course.getName() %></td>
                 <td><%=course.getCredit() %></td>
                             <td><a href="teacher_score.jsp?courseId=<%=course.getCourseId()%>">查看成绩</a></td>
             </tr>
    <%
        }
    %>
    <tr><td width=100% bgcolor="#eeeeee" colspan=4 align="center">
        第<%=currentPage%>页/共<%=pageUtil.getPageCount()%>页
        <a href="teacher_course.jsp?page=1">首页</a>
        <a href="teacher_course.jsp?page=<%=(pageUtil.getPrePage())%>">上页</a>
        <a href="teacher_course.jsp?page=<%=(pageUtil.getNextPage())%>">下页</a>
        <a href="teacher_course.jsp?page=<%=pageUtil.getPageCount()%>">末页</a>
    </td></tr>
</table>
</body>
</html>
