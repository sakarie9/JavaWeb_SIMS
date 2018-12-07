<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/18/018
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>学生信息管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdui.css">
    <script src="${pageContext.request.contextPath}/js/mdui.js"></script>

    <script type="text/javascript">
        //刷新验证码
        function changeImg() {
            document.getElementById("validateCodeImg").src = "servlet/DrawValidateCodeServlet?t=" + Math.random();
        }
    </script>
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

<form action="${pageContext.request.contextPath}/servlet/LoginServlet" method="post">
    <div class="mdui-container">
        <div class="mdui-m-a-2"></div>
        <div class="mdui-row">
            <div class="mdui-col-xs-3"></div>
            <div class="mdui-col-xs-4 ">
                <div class="mdui-card">

                    <div class="mdui-typo mdui-text-center">
                        <h1>登陆</h1>
                    </div>
                    <div class="mdui-divider"></div>

                    <div class="mdui-card-content">
                        <div class="mdui-textfield mdui-textfield-floating-label col">
                            <label class="mdui-textfield-label">用户名</label>
                            <input class="mdui-textfield-input" type="text" name="username" required/>
                            <div class="mdui-textfield-error">用户名不能为空</div>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label col">
                            <label class="mdui-textfield-label">密码</label>
                            <input class="mdui-textfield-input" type="password" name="password" required/>
                            <div class="mdui-textfield-error">密码至少 6 位，且包含大小写字母</div>
                            <div class="mdui-textfield-helper">请输入至少 6 位，且包含大小写字母的密码</div>
                        </div>
                        <div class="mdui-row-xs-2 mdui-m-a-2">
                            <div class="mdui-col">
                                <label class="mdui-radio">
                                    <input type="radio" name="role" value="student" checked/>
                                    <i class="mdui-radio-icon"></i>
                                    学生
                                </label>
                            </div>
                            <div class="mdui-col">
                                <label class="mdui-radio">
                                    <input type="radio" name="role" value="teacher"/>
                                    <i class="mdui-radio-icon"></i>
                                    教师
                                </label>
                            </div>
                        </div>
                        <div class="mdui-col mdui-m-a-2">
                            <label class="mdui-checkbox">
                                <input type="checkbox" name="autoLogin" value="autoLogin"/>
                                <i class="mdui-checkbox-icon"></i>
                                两周内自动登录
                            </label>
                        </div>

                        <div class="mdui-row-xs-2">
                            <div class="mdui-col mdui-textfield mdui-textfield-floating-label ">
                                <label class="mdui-textfield-label">验证码</label>
                                <input class="mdui-textfield-input" type="text" name="validateCode"/>
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
