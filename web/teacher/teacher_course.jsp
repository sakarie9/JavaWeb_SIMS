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
    <title>查看课程</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdui.css">
    <script src="${pageContext.request.contextPath}/js/mdui.js"></script>
</head>


<body class="mdui-appbar-with-toolbar mdui-theme-primary-indigo mdui-theme-accent-pink mdui-loaded mdui-drawer-body-left">
<header class="mdui-appbar mdui-appbar-fixed">
    <div class="mdui-toolbar mdui-color-theme">
        <span mdui-drawer="{target: '#drawer', swipe: true}"
              class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"><i class="mdui-icon material-icons">menu</i></span>
        <span class="mdui-typo-title">学生信息管理系统</span>
        <div class="mdui-toolbar-spacer"></div>

        <a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>
    </div>
</header>

<div class="mdui-text-left mdui-m-l-2">
    <h1 class="mdui-typo">我的课程</h1>
</div>
<div class="mdui-divider"></div>

<div class="mdui-container">
    <table border="1" align="center" class="mdui-table mdui-table-hoverable mdui-typo">
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
        <div>
        第<%=currentPage%>页/共<%=pageUtil.getPageCount()%>页
        <a href="teacher_course.jsp?page=1">首页</a>
        <a href="teacher_course.jsp?page=<%=(pageUtil.getPrePage())%>">上页</a>
        <a href="teacher_course.jsp?page=<%=(pageUtil.getNextPage())%>">下页</a>
        <a href="teacher_course.jsp?page=<%=pageUtil.getPageCount()%>">末页</a>
        </div>
    </td></tr>
    </table>
</div>



<div class="mdui-drawer" id="drawer">
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">account_circle</i>
            <a href="teacher_index.jsp" class="mdui-list-item-content">我的主页</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">book</i>
            <a href="teacher_course.jsp" class="mdui-list-item-content">查看课程</a>
        </li>
    </ul>
    <div class="mdui-divider"></div>
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">clear</i>
            <a href="${pageContext.request.contextPath}/logout.jsp" class="mdui-list-item-content">注销</a>
        </li>
    </ul>
</div>

</body>
</html>
