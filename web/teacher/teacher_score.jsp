<%@ page import="bean.ScoreBean" %>
<%@ page import="dao.ScoreDao" %>
<%@ page import="util.PageUtil" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/28/028
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<script type="text/javascript">

    function validate(id) {
        var form = document.forms[id];
        var score = document.getElementsByName("score")[id];
        var numPattern = /^(\d|[1-9]\d|100)(\.\d)?$/;
        //alert(score.value);
        if (numPattern.test(score.value)){
            form.action="/servlet/UpdateScoreServlet";
            form.submit();
        }else{
            alert("成绩输入错误！\n请输入0-100的数字，只允许有一位小数！");
            return false;
        }
    }
</script>

<body>
<table border="1" align="center" >
    <tr>
        <td>学号</td>
        <td>学生名</td>
        <td>成绩</td>
        <td>修改成绩</td>
    </tr>
    <%
        ScoreDao sd=new ScoreDao();
        String teaId = session.getAttribute("teaId").toString();
        if(teaId==null) response.sendRedirect("/login.jsp");
        String courseId = request.getParameter("courseId");
        List list=sd.getScoreBycourseId(courseId);

        String pageStr = request.getParameter("page");
        int currentPage = 1;
        if (pageStr != null)
            currentPage = Integer.parseInt(pageStr);
        PageUtil pageUtil = new PageUtil(10, list.size(), currentPage);
        currentPage = pageUtil.getCurrentPage();

        List currentPageList = pageUtil.getCurrentList(list);

        for(int i=0; i<currentPageList.size(); i++){
            ScoreBean score=(ScoreBean)currentPageList.get(i);
    %>
    <form id="editScoreForm" onsubmit="validate(<%=i%>)">
        <tr>
            <td><%=score.getStuId() %></td>
              <td><%=score.getStuName() %></td>
              <td><%=score.getScore() %></td>
            <td>
                <input value="<%=score.getStuId() %>" name="stuId" type="hidden">
                <input value="<%=courseId %>" name="courseId" type="hidden">
                <label>
                    <input name="score" size="4">
                </label>
            </td>
            <td>
                <input type="submit" value="修改" >
            </td>
        </tr>
    </form>
    <%
        }
    %>


    <tr><td bgcolor="#eeeeee" colspan=4 align="center">
        第<%=currentPage%>页/共<%=pageUtil.getPageCount()%>页
        <a href="teacher_score.jsp?courseId=<%=courseId%>&page=1">首页</a>
        <a href="teacher_score.jsp?courseId=<%=courseId%>&page=<%=(pageUtil.getPrePage())%>">上页</a>
        <a href="teacher_score.jsp?courseId=<%=courseId%>&page=<%=(pageUtil.getNextPage())%>">下页</a>
        <a href="teacher_score.jsp?courseId=<%=courseId%>&page=<%=pageUtil.getPageCount()%>">末页</a>
    </td></tr>
</table>
</body>
</html>
