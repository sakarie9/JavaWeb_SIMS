package servlet;

import bean.StudentBean;
import dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "ModifyStudentServlet",urlPatterns = "/servlet/ModifyStudentServlet")
public class ModifyStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentBean student = (StudentBean) request.getSession().getAttribute("originStudent");
        if(student==null)
            return;
        String stuName,stuSex,stuEmail,stuPsw;
        stuName = request.getParameter("stuName");
        stuSex = request.getParameter("stuSex");
        stuEmail = request.getParameter("stuEmail");
        stuPsw = request.getParameter("stuPsw");
        if(stuName!=null){
            student.setStuName(stuName);
        }
        if(stuSex!=null){
            student.setStuSex(stuSex);
        }
        if(stuEmail!=null){
            student.setStuEmail(stuEmail);
        }
        if(stuPsw!=null){
            student.setStuPsw(stuPsw);
        }

        StudentDao sd = new StudentDao();
        sd.updateStudent(student);

        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
