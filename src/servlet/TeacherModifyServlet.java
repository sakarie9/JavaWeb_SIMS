package servlet;

import bean.TeacherBean;
import dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TeacherModifyServlet",urlPatterns = "/servlet/TeacherModifyServlet")
public class TeacherModifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        TeacherBean teacher = (TeacherBean) request.getSession().getAttribute("originTeacher");

        String teaName,teaSex,title,teaPsw;
        teaName = request.getParameter("teaName");
        teaSex = request.getParameter("teaSex");
        title = request.getParameter("title");
        teaPsw = request.getParameter("teaPsw");
        if(!teaName.equals("")){
            teacher.setTeaName(teaName);
        }
        if(teaSex!=null){
            teacher.setTeaSex(teaSex);
        }
        if(!title.equals("")){
            teacher.setTitle(title);
        }
        if(!teaPsw.equals("")){
            teacher.setTeaPsw(teaPsw);
        }

        TeacherDao td = new TeacherDao();
        td.updateTeacher(teacher);

        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
