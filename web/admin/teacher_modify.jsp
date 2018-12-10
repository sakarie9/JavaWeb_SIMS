<%@ page import="dao.TeacherDao" %>
<%@ page import="bean.TeacherBean" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/10/010
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改教师信息</title>
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
    <h1 class="mdui-typo">修改教师信息</h1>
</div>
<div class="mdui-divider"></div>
<%
    TeacherDao td = new TeacherDao();
    String teaId = request.getParameter("teaId");
    TeacherBean teacher = td.getTeacherByteaId(teaId);
    request.getSession().setAttribute("originTeacher", teacher);

%>

<form action="${pageContext.request.contextPath}/servlet/TeacherModifyServlet" method="post">
    <div class="mdui-m-t-2">
    <div class="mdui-container">
        <table border="1" align="center" class="mdui-table mdui-table-hoverable mdui-typo">
            <tr>
                <th></th>
                <th>教工号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>职称</th>
                <th>密码</th>
            <tr>
            <tr>
                <td>旧信息</td>
                <td><%=teaId%></td>
                <td><%=teacher.getTeaName()%></td>
                <td><%=teacher.getTeaSex()%></td>
                <td><%=teacher.getTitle()%></td>
                <td><%=teacher.getTeaPsw()%></td>
            </tr>
            <tr>
                <td >新信息</td>
                <td><%=teaId%><input value="<%=teaId%>" type="hidden" name="teaId"></td>
                <td><div class="mdui-textfield mdui-textfield-floating-label">
                    <label class="mdui-textfield-label">教师姓名</label>
                    <input class="mdui-textfield-input" type="text" name="teaName"/>
                </div></td>
                <td><div class="mdui-row-xs-2">
                    <div class="mdui-col">
                        <label class="mdui-radio">
                            <input type="radio" name="teaSex" value="男" />
                            <i class="mdui-radio-icon"></i>
                            男
                        </label>
                    </div>
                    <div class="mdui-col">
                        <label class="mdui-radio">
                            <input type="radio" name="teaSex" value="女"/>
                            <i class="mdui-radio-icon"></i>
                            女
                        </label>
                    </div>
                </div></td>
                <td><div class="mdui-textfield mdui-textfield-floating-label">
                    <label class="mdui-textfield-label">职称</label>
                    <input class="mdui-textfield-input" type="text" name="title" />
                </div></td>

                <td><div class="mdui-textfield mdui-textfield-floating-label">
                    <label class="mdui-textfield-label">密码</label>
                    <input class="mdui-textfield-input" type="text" name="teaPsw"/>
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
