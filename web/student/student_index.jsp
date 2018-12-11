<%@ page import="java.io.File" %>
<%@ page import="bean.StudentBean" %>
<%@ page import="dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/18/018
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdui.css">
    <script src="${pageContext.request.contextPath}/js/mdui.js"></script>
</head>

<script>

    function getFileName(path) {
        var pos1 = path.lastIndexOf('/');
        var pos2 = path.lastIndexOf('\\');
        var pos = Math.max(pos1, pos2);
        if (pos < 0)
            return path;
        else
            return path.substring(pos + 1);
    }

    function fileUpload() {
        var fileName;
        //fileName = document.getElementById("dialog").value;
        fileName = document.getElementById("dialog").value;
        fileName = getFileName(fileName);

        if(confirm("确定上传"+fileName+"吗？")){
            document.forms[0].submit();
        }
    }

</script>

<%
    String fileName = request.getSession().getAttribute("stuId").toString();
    String avatarDir = "/avatars/" + fileName;
    //System.out.println(avatarDir);

    String realPath = request.getSession().getServletContext().getRealPath(avatarDir);
    //System.out.println(realPath);

    File file = new File(realPath);
    if (!file.exists() || file.length() == 0) {
        fileName = "default.png";
        avatarDir = "/res/" + fileName;
        //System.out.println(avatarDir);
    }

    StudentDao sd = new StudentDao();
    StudentBean student = sd.getStudentBystuId(fileName);

%>

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

<div class="mdui-container">
    <div class="mdui-m-a-2"></div>
    <div class="mdui-row">
        <div class="mdui-col-xs-3"></div>
        <div class="mdui-col-xs-4 ">
            <div class="mdui-card">
                <div class="mdui-card-media mdui-img-fluid">
                    <img src="<%=avatarDir%>" alt="avatar"/>
                </div>
                <div class="mdui-card-primary">
                    <div class="mdui-card-primary-title">${ sessionScope.stuName }</div>
                    <div class="mdui-card-primary-subtitle">${ sessionScope.stuId }<br><%=student.getStuEmail()%></div>
                </div>
                <div class="mdui-card-content">笃信仁厚，慎思勤勉。</div>
                <div class="mdui-card-actions">
                    <div>
                        <form method="post" action="${pageContext.request.contextPath}/servlet/UploadServlet"
                              enctype="multipart/form-data" id="upload">
                            <input type="file" name="uploadFile" id="dialog" onchange="fileUpload()"
                                   style="display: none">
                            <button class="mdui-btn mdui-ripple" type="button" onclick="dialog.click()">修改头像</button>
                        </form>
                    </div>
                    <div>
                        <button class="mdui-btn mdui-ripple" onclick="{location.href='/reset_psw.jsp'}">修改密码</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="mdui-col-xs-5"></div>
    </div>
</div>


<div class="mdui-drawer" id="drawer">
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">account_circle</i>
            <a href="student_index.jsp" class="mdui-list-item-content">我的信息</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">local_library</i>
            <a href="student_course.jsp" class="mdui-list-item-content">查看课程</a>
        </li>
        <li class="mdui-list-item mdui-ripple ">
            <i class="mdui-list-item-icon mdui-icon material-icons">book</i>
            <a href="student_score.jsp" class="mdui-list-item-content">查看成绩</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">library_add</i>
            <a href="student_select_course.jsp" class="mdui-list-item-content">选课</a>
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


</body>
</html>
