<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/12/6/006
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新密码</title>
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
                    <form action="${pageContext.request.contextPath}/servlet/ResetPswServlet" method="get"
                          name="form1">
                        <div class="mdui-textfield mdui-textfield-floating-label mdui-col">
                            <label class="mdui-textfield-label">邮箱验证码</label>
                            <input class="mdui-textfield-input" type="text" name="inputEmailCode"/>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label mdui-col">
                            <label class="mdui-textfield-label">新密码</label>
                            <%--pattern="^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$"--%>
                            <input type="password" class="mdui-textfield-input" name="newPsw" required/>
                            <div class="mdui-textfield-error">密码至少 6 位，且包含大小写字母</div>
                            <div class="mdui-textfield-helper">请输入至少 6 位，且包含大小写字母的密码</div>
                        </div>
                        <div class="mdui-textfield mdui-textfield-floating-label mdui-col">
                            <label class="mdui-textfield-label">重复密码</label>
                            <%--pattern="^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$"--%>
                            <input type="password" class="mdui-textfield-input" name="repPsw" onchange="checkpwd()"
                                   required/>
                            <div class="mdui-textfield-error">密码至少 6 位，且包含大小写字母</div>
                            <div class="mdui-textfield-helper">请输入至少 6 位，且包含大小写字母的密码</div>
                        </div>
                        <div class="mdui-textfield-helper" id="msg"></div>
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

</body>
<script>
    function checkpwd() {
        var p1 = document.form1.newPsw.value;//获取密码框的值
        var p2 = document.form1.repPsw.value;//获取重新输入的密码值
        if (p1 !== p2) {//判断两次输入的值是否一致，不一致则显示错误信息
            document.getElementById("msg").innerHTML = "两次输入密码不一致，请重新输入";//在div显示错误信息
            return false;
        } else {
            //密码一致，可以继续下一步操作
            document.getElementById("msg").innerHTML = "";//在div显示错误信息
        }
    }
</script>
</html>
