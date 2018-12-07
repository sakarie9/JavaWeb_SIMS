package servlet;

import bean.StudentBean;
import dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "InsertStudentServlet",urlPatterns = "/servlet/InsertStudentServlet")
public class InsertStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        StudentDao sd = new StudentDao();
        StudentBean student = new StudentBean();
        student.setStuId(request.getParameter("stuId"));
        student.setStuPsw(request.getParameter("stuPsw"));

        student.setStuEmail(request.getParameter("stuEmail"));
        student.setStuSex(request.getParameter("stuSex"));
        student.setStuName(request.getParameter("stuName"));

        boolean isDone = sd.insertStudent(student);
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
