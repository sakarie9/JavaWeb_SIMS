<%@ page import="dao.ScoreDao" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.ScoreBean" %>
<%@ page import="util.PageUtil" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/18/018
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生成绩</title>
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
        ScoreDao sd=new ScoreDao();
        String stuId = session.getAttribute("stuId").toString();
        List list=sd.getScoreBystuId(stuId);

        for(int i=0;i<list.size();i++){
            ScoreBean score=(ScoreBean)list.get(i);
    %>
             <tr>
                 <td><%=score.getCourseId() %></td>
                 <td><%=score.getCourseName() %></td>
                 <td><%=score.getCredit() %></td>
                 <td><%=score.getScore() %></td>
             </tr>
    <%
        }
    %>

</table>
</body>
</html>
