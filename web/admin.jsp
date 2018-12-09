<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/5/005
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdui.css">
    <script src="${pageContext.request.contextPath}/js/mdui.js"></script>
</head>

<script type="text/javascript">
    //刷新验证码
    function changeImg() {
        document.getElementById("validateCodeImg").src = "servlet/DrawValidateCodeServlet?t=" + Math.random();
    }
</script>



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


<form action="${pageContext.request.contextPath}/servlet/AdminLoginServlet" method="post">
    <div class="mdui-container">
        <div class="mdui-m-a-2"></div>
        <div class="mdui-row">
            <div class="mdui-col-xs-3"></div>
            <div class="mdui-col-xs-4 ">
                <div class="mdui-card">

                    <div class="mdui-typo mdui-text-center">
                        <h1>管理员登陆</h1>
                    </div>
                    <div class="mdui-divider"></div>

                    <div class="mdui-card-content">
                        <div class="mdui-textfield mdui-textfield-floating-label col">
                            <label class="mdui-textfield-label">管理员账号</label>
                            <input class="mdui-textfield-input" type="text" name="username" required/>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label col">
                            <label class="mdui-textfield-label">密码</label>
                            <input class="mdui-textfield-input" type="password" name="password" required/>
                        </div>

                        <div class="mdui-row-xs-2">
                            <div class="mdui-col mdui-textfield mdui-textfield-floating-label ">
                                <label class="mdui-textfield-label">验证码</label>
                                <input class="mdui-textfield-input" type="text" name="validateCode" required/>
                            </div>
                            <div class="mdui-col">
                                <img class="mdui-img-fluid mdui-m-t-5" alt="看不清？换一张"
                                     src="servlet/DrawValidateCodeServlet"
                                     id="validateCodeImg" onclick="changeImg()">
                            </div>
                        </div>

                        <div class="mdui-m-a-2">
                            <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent mdui-btn-block "
                                    type="submit">登录
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mdui-col-xs-5"></div>
        </div>
    </div>
</form>

</body>
</html>

<script>
    var err = "${sessionScope.checkcodeErr}";
    if(err!==""){
        mdui.alert(err, function(){
            ${sessionScope.remove("checkcodeErr")}
            location.href='/admin.jsp';
            mdui.close();
        });
    }
</script>

<script>
    var loginErr = "${sessionScope.loginErr}";
    if(loginErr!==""){
        mdui.alert(loginErr, function(){
            ${sessionScope.remove("loginErr")}
            location.href='/admin.jsp';
            mdui.close();
        });
    }
</script>