<%@ page import="java.io.File" %><%--
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

    //mdui.JQ('#dialog').on('click', function(){
    function fileUpload() {
        var fileName;
        //fileName = document.getElementById("dialog").value;
        fileName = document.getElementById("dialog").value;
        fileName = getFileName(fileName);
        //document.forms[0].submit();
        mdui.dialog({
            title: '上传头像',
            content: '你确定要上传 ' + fileName + ' 吗？',
            destroyOnClosed: 'false',
            buttons: [
                {
                    text: '取消'
                },
                {
                    text: '确认',
                    onClick: function (inst) {
                        //mdui.alert('点击确认按钮的回调');
                        document.forms[0].submit();
                        //document.getElementById("upload")[0].submit();
                    }
                }
            ]
        });

    }

    //});
</script>

<%


    String fileName = request.getSession().getAttribute("stuId").toString();
    String avatarDir = "/avatars/" + fileName;
    //System.out.println(avatarDir);

    String realPath = request.getSession().getServletContext().getRealPath(avatarDir);
    //System.out.println(realPath);

    File file = new File(realPath);
    if (!file.exists() || file.length() == 0) {
        fileName = "default";
        avatarDir = "/avatars/" + fileName;
        //System.out.println(avatarDir);
    }
%>

<body class="mdui-appbar-with-toolbar mdui-theme-primary-indigo mdui-theme-accent-pink mdui-loaded mdui-drawer-body-left">
<header class="mdui-appbar mdui-appbar-fixed">
    <div class="mdui-toolbar mdui-color-theme">
        <span mdui-drawer="{target: '#drawer', swipe: true}"
              class="mdui-btn mdui-btn-icon mdui-ripple mdui-ripple-white"><i class="mdui-icon material-icons">menu</i></span>
        <span class="mdui-typo-title">Title</span>
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
                    <div class="mdui-card-primary-subtitle">${ sessionScope.stuId }</div>
                </div>
                <div class="mdui-card-content">子曰：「学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知，而不愠，不亦君子乎？」</div>
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
            <i class="mdui-list-item-icon mdui-icon material-icons">move_to_inbox</i>
            <a href="student_index.jsp" class="mdui-list-item-content">我的信息</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">send</i>
            <a href="student_course.jsp" class="mdui-list-item-content">查看课程</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon"></i>
            <a href="student_score.jsp" class="mdui-list-item-content">查看成绩</a>
        </li>
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon"></i>
            <a href="student_select_course.jsp" class="mdui-list-item-content">选课</a>
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
