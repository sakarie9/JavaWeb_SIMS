<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/6/006
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
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


<br>
<div class="mdui-container">
    <div class="mdui-m-a-2"></div>

    <div class="mdui-row">
        <div class="mdui-col-xs-3"></div>
        <div class="mdui-col-xs-4 ">
            <div class="mdui-card">

                <div class="mdui-typo mdui-text-center">
                    <h1>重置密码</h1>
                </div>
                <div class="mdui-divider"></div>

                <div class="mdui-card-content">
                    <form action="${pageContext.request.contextPath}/servlet/SendEmailServlet" method="post">
                        <div class="mdui-textfield mdui-textfield-floating-label">
                            <label class="mdui-textfield-label">学号</label>
                            <input class="mdui-textfield-input" type="text" name="stuId"/>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label">
                            <label class="mdui-textfield-label">邮箱地址</label>
                            <input class="mdui-textfield-input" type="email" name="stuEmail"/>
                        </div>
                        <div class="mdui-col mdui-m-t-3">
                            <button class="mdui-btn mdui-btn-block mdui-color-theme-accent mdui-ripple" type="submit">
                                提交
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="mdui-col-xs-5"></div>
    </div>
</div>


<%--<%--%>
    <%--Object emailError = request.getSession().getAttribute("emailError");--%>
    <%--if (emailError != null) {--%>
        <%--System.out.println(emailError);--%>
<%--%>--%>
<%--<script>--%>
    <%--mdui.alert("<%=emailError%>");--%>
<%--</script>--%>
<%--<%--%>
        <%--request.getSession().removeAttribute("emailError");--%>
    <%--}--%>
<%--%>--%>
<%--<%--%>
    <%--Object resetOk = request.getSession().getAttribute("resetOk");--%>
    <%--if (resetOk != null) {--%>
        <%--System.out.println(resetOk);--%>
<%--%>--%>
<%--<script>--%>
    <%--mdui.alert("<%=resetOk%>");--%>
<%--</script>--%>
<%--<%--%>
        <%--request.getSession().removeAttribute("resetOk");--%>
        <%--response.sendRedirect("/logout.jsp");--%>
        <%--return;--%>
    <%--}--%>
<%--%>--%>


</body>
</html>

<script>
    var emailError = "${sessionScope.emailError}";
    if(emailError!==""){
        mdui.alert(emailError, function(){
            ${sessionScope.remove("emailError")}
            location.href='/login.jsp';
            mdui.close();
        });
    }
</script>
<script>
    var resetOk = "${sessionScope.resetOk}";
    if(resetOk!==""){
        mdui.alert(resetOk, function(){
            ${sessionScope.remove("resetOk")}
            location.href='/logout.jsp';
            mdui.close();
        });
    }
</script>
