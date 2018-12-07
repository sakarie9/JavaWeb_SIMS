<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/5/005
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdui.css">
    <script src="${pageContext.request.contextPath}/js/mdui.js"></script>
</head>

<div class="mdui-drawer" id="drawer">
    <ul class="mdui-list">
        <li class="mdui-list-item mdui-ripple">
            <i class="mdui-list-item-icon mdui-icon material-icons">account_circle</i>
            <a href="admin_select_student.jsp" class="mdui-list-item-content">学生信息</a>
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

<div class="mdui-container">
    <div class="mdui-m-a-2"></div>
    <div class="mdui-row">
        <div class="mdui-col-xs-3"></div>
        <div class="mdui-col-xs-4 ">
            <div class="mdui-card">
                <div class="mdui-card-media mdui-img-fluid">
                    <img src="${pageContext.request.contextPath}/res/card.jpg"/>
                </div>
                <div class="mdui-card-primary">
                    <div class="mdui-card-primary-title">${ sessionScope.admin }</div>
                </div>
                <div class="mdui-card-content">欢迎您，管理员${ sessionScope.teaName }</div>
            </div>
        </div>
        <div class="mdui-col-xs-5"></div>
    </div>
</div>
</body>
</html>
