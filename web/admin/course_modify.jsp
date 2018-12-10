<%@ page import="dao.CourseDao" %>
<%@ page import="bean.CourseBean" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/10/010
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改课程信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdui.css">
    <script src="${pageContext.request.contextPath}/js/mdui.js"></script>
</head>


<div class="mdui-drawer" id="drawer">
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">account_circle</i>
            <a href="student_select.jsp" class="mdui-list-item-content">学生信息</a>
        </li>
    </ul>
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">person</i>
            <a href="teacher_select.jsp" class="mdui-list-item-content">教师信息</a>
        </li>
    </ul>
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">book</i>
            <a href="course_select.jsp" class="mdui-list-item-content">课程信息</a>
        </li>
    </ul>
    <div class="mdui-divider"></div>
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">cancel</i>
            <a href="${pageContext.request.contextPath}/logout.jsp" class="mdui-list-item-content">注销</a>
        </li>
    </ul>
</div>

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
    <h1 class="mdui-typo">修改课程信息</h1>
</div>
<div class="mdui-divider"></div>
<%
    CourseDao cd = new CourseDao();
    String courseId = request.getParameter("courseId");
    CourseBean course = cd.getCourseByCourseId(courseId);
    request.getSession().setAttribute("originCourse", course);


%>


<form action="${pageContext.request.contextPath}/servlet/CourseModifyServlet" method="post">
    <div class="mdui-m-t-2">
        <div class="mdui-container">
            <table border="1" align="center" class="mdui-table mdui-table-hoverable mdui-typo">
                <tr>
                    <th></th>
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>学分</th>
                    <th>教师号</th>
                <tr>
                <tr>
                    <td>旧信息</td>
                    <td><%=courseId%></td>
                    <td><%=course.getCourseName()%></td>
                    <td><%=course.getCredit()%></td>
                    <td><%=course.getTeaId()%></td>
                </tr>
                <tr>
                    <td >新信息</td>
                    <td><%=courseId%><input value="<%=courseId%>" type="hidden" name="courseId"></td>
                    <td><div class="mdui-textfield mdui-textfield-floating-label">
                        <label class="mdui-textfield-label">课程名</label>
                        <input class="mdui-textfield-input" type="text" name="courseName"/>
                    </div></td>
                    <td><div class="mdui-textfield mdui-textfield-floating-label">
                        <label class="mdui-textfield-label">学分</label>
                        <input class="mdui-textfield-input" type="text" name="credit"/>
                    </div></td>
                    <td><div class="mdui-textfield mdui-textfield-floating-label">
                        <label class="mdui-textfield-label">教师号</label>
                        <input class="mdui-textfield-input" type="text" name="teaId" />
                    </div></td>
                </tr>
            </table>
            <div class="mdui-float-right mdui-icon-right mdui-m-a-2">
                <button class="mdui-btn mdui-color-theme-accent mdui-ripple" type="submit">提交</button>
            </div>
        </div>
    </div>
</form>

</body>
</html>
