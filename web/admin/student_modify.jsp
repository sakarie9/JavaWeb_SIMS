<%@ page import="bean.StudentBean" %>
<%@ page import="dao.StudentDao" %>
<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/5/005
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生信息</title>
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
    <h1 class="mdui-typo">修改学生信息</h1>
</div>
<div class="mdui-divider"></div>
<%
    StudentDao sd = new StudentDao();
    String stuId = request.getParameter("stuId");
    StudentBean student = sd.getStudentBystuId(stuId);
    request.getSession().setAttribute("originStudent", student);

    //System.out.println(stuId);
%>


<form action="${pageContext.request.contextPath}/servlet/StudentModifyServlet" method="post">
    <div class="mdui-m-t-2">
    <div class="mdui-container">
        <table border="1" align="center" class="mdui-table mdui-table-hoverable mdui-typo">
            <tr>
                <th></th>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>电子邮箱</th>
                <th>密码</th>
            <tr>
            <tr>
                <td>旧信息</td>
                <td><%=stuId%></td>
                <td><%=student.getStuName()%></td>
                <td><%=student.getStuSex()%></td>
                <td><%=student.getStuEmail()%></td>
                <td><%=student.getStuPsw()%></td>
            </tr>
            <tr>
                <td >新信息</td>
                <td><%=stuId%><input value="<%=stuId%>" type="hidden" name="stuId"></td>
                <%--<td><input placeholder="姓名" name="stuName"></td>--%>
                <td><div class="mdui-textfield mdui-textfield-floating-label">
                    <label class="mdui-textfield-label">学生姓名</label>
                    <input class="mdui-textfield-input" type="text" name="stuName"/>
                </div></td>
                <%--<td><input placeholder="性别" name="stuSex"></td>--%>
                <td><div class="mdui-row-xs-2">
                    <div class="mdui-col">
                        <label class="mdui-radio">
                            <input type="radio" name="stuSex" value="男" />
                            <i class="mdui-radio-icon"></i>
                            男
                        </label>
                    </div>
                    <div class="mdui-col">
                        <label class="mdui-radio">
                            <input type="radio" name="stuSex" value="女"/>
                            <i class="mdui-radio-icon"></i>
                            女
                        </label>
                    </div>
                </div></td>
                <%--<td><input placeholder="电子邮箱" name="stuEmail"></td>--%>
                <td><div class="mdui-textfield mdui-textfield-floating-label">
                    <label class="mdui-textfield-label">电子邮箱</label>
                    <input class="mdui-textfield-input" type="email" name="stuEmail" />
                    <div class="mdui-textfield-error">请输入正确的电子邮箱地址</div>
                </div></td>
                <%--<td><input placeholder="密码" name="stuPsw"></td>--%>
                <td><div class="mdui-textfield mdui-textfield-floating-label">
                    <label class="mdui-textfield-label">密码</label>
                    <input class="mdui-textfield-input" type="text" name="stuPsw"/>
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
