<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: sk308
  Date: 2018/11/19/019
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的信息</title>
</head>
<%
    //不保存缓存
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);

    PrintWriter pw = response.getWriter();
    String avatarDir1 = "/avatars/";
    String avatarDir2 = request.getSession().getAttribute("stuId").toString();
    String avatarDir = avatarDir1+avatarDir2;

    String realPath = request.getSession().getServletContext().getRealPath(avatarDir);

    File file = new File(realPath);

    if(!file.exists()){
        pw.print("您没有头像，请上传");
    }else{
        pw.print("<div><img src=\""+avatarDir+"\" alt=\"我的头像\" height=\"200px\" width=\"200px\"></div>");

    }
%>
<body>

<div>
    <form method="post" action="${pageContext.request.contextPath}/servlet/UploadServlet" enctype="multipart/form-data">
        选择一个文件:
        <input type="file" name="uploadFile" />
        <br>
        <input type="submit" value="上传" />
    </form>
</div>
</body>
</html>
