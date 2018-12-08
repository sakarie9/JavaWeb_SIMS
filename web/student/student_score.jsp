<%@ page import="bean.ScoreBean" %>
<%@ page import="dao.ScoreDao" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/18/018
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的成绩</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdui.css">
    <script src="${pageContext.request.contextPath}/js/mdui.js"></script>
</head>
<%

%>
<script>
    function gradeCal(oriscore) {
        var score = parseInt(oriscore);
        var grade;
        if(score>=90){
            grade=4.0;
        }else if(score>=85){
            grade=3.7;
        }else if(score>=80){
            grade=3.2;
        }else if(score>=75){
            grade=2.7;
        }else if(score>=70){
            grade=2.2;
        }else if(score>=65){
            grade=1.7;
        }else if(score>=60){
            grade=1.2;
        }else{
            grade=0;
        }
        return grade;
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

<div class="mdui-text-left mdui-m-l-2">
    <h1 class="mdui-typo">我的成绩</h1>
</div>
<div class="mdui-divider"></div>

<div class="mdui-m-a-5">
    <table border="1" align="center" class="mdui-table mdui-table-hoverable mdui-typo">
        <tr>
            <th>课程编号</th>
            <th>课程名</th>
            <th>学分</th>
            <th>成绩</th>
            <th>绩点</th>
        </tr>
        <%
            ScoreDao sd = new ScoreDao();
            String stuId = session.getAttribute("stuId").toString();
            List list = sd.getScoreBystuId(stuId);

            for (int i = 0; i < list.size(); i++) {
                ScoreBean score = (ScoreBean) list.get(i);
        %>
                
        <tr id="<%=i%>">
                        
            <td><%=score.getCourseId() %>
            </td>
                        
            <td><%=score.getCourseName() %>
            </td>
                        
            <td><%=score.getCredit() %>
            </td>
            <script>
                var score = "<%=score.getScore()%>";
                score = parseFloat(score);
                if(score<60){
                    document.getElementById("<%=i%>").classList.add("mdui-color-red-a400");
                }
            </script>         
            <td><%=score.getScore() %>
            </td>

            <td>
                <script>
                    document.write(gradeCal(<%=score.getScore()%>));
                </script>
            </td>
                    
        </tr>
        <%
            }
        %>

    </table>
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
