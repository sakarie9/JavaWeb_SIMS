<%@ page import="bean.StudentBean" %>
<%@ page import="dao.StudentDao" %>
<%@ page import="util.PageUtil" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/5/005
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息</title>
</head>

<script type="text/javascript">
    var buttonClicked;

    function jump(id) {
        var form = document.forms[id];
        var stuId = form.getAttributeNode("stuId");
        if (buttonClicked === 1) {
            form.action = "admin_modify.jsp?stuId=" + stuId;
            form.submit();
        } else {
            form.action = "/servlet/DeleteStudentServlet?stuId=" + stuId;
            form.submit();
        }
    }

</script>


<body>

<table border="1" align="center">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>电子邮箱</td>
        <td>修改</td>
        <td>删除</td>
    </tr>
    <%
        StudentDao sd=new StudentDao();
        List list=sd.getAllStudent();

        String pageStr = request.getParameter("page");
        int currentPage = 1;
        if (pageStr != null)
            currentPage = Integer.parseInt(pageStr);
        PageUtil pageUtil = new PageUtil(10, list.size(), currentPage);
        currentPage = pageUtil.getCurrentPage();

        List currentPageList = pageUtil.getCurrentList(list);

        for(int i = 0; i<currentPageList.size(); i++){
            StudentBean student=(StudentBean)currentPageList.get(i);
    %>
    <form id="form" onsubmit="jump(<%=i%>)">
        <tr>
              <td><%=student.getStuId() %><input value=<%=student.getStuId()%> name="stuId" type="hidden"></td>
              <td><%=student.getStuName() %></td>
              <td><%=student.getStuSex() %></td>
            <td><%=student.getStuEmail() %></td>
            <%--<td><button onclick="location.href='admin_modify.jsp?stuId=<%=student.getStuId()%>'">修改</button></td>--%>
            <%--<td><button onclick="location.href='admin_delete.jsp?stuId=<%=student.getStuId()%>'">删除</button></td>--%>
            <td>
                <button onclick="buttonClicked=1">修改</button>
            </td>
            <td>
                <button onclick="buttonClicked=2">删除</button>
            </td>
        </tr>
    </form>
    <%
        }
    %>
    <tr><td bgcolor="#eeeeee" colspan=6 align="center">
        第<%=currentPage%>页/共<%=pageUtil.getPageCount()%>页
        <a href="admin_select_student.jsp?page=1">首页</a>
        <a href="admin_select_student.jsp?page=<%=(pageUtil.getPrePage())%>">上页</a>
        <a href="admin_select_student.jsp?page=<%=(pageUtil.getNextPage())%>">下页</a>
        <a href="admin_select_student.jsp?page=<%=pageUtil.getPageCount()%>">末页</a>
    </td></tr>
</table>

<div align="center">
    <a href="admin_insert.jsp">新增学生</a>
</div>
</body>
</html>
