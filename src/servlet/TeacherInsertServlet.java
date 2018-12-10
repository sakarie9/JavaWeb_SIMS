package servlet;

import bean.TeacherBean;
import dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TeacherInsertServlet",urlPatterns = "/servlet/TeacherInsertServlet")
public class TeacherInsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        TeacherDao td = new TeacherDao();
        TeacherBean teacher = new TeacherBean();
        teacher.setTeaId(request.getParameter("teaId"));
        teacher.setTeaPsw(request.getParameter("teaPsw"));

        teacher.setTitle(request.getParameter("title"));
        teacher.setTeaSex(request.getParameter("teaSex"));
        teacher.setTeaName(request.getParameter("teaName"));

        boolean isDone = td.insertTeacher(teacher);
        if(!isDone){
            request.getSession().setAttribute("insertErr","插入失败！");
        }else{
            request.getSession().setAttribute("insertOk","插入成功！");
        }

        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
