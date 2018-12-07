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
        request.setCharacterEncoding("UTF-8");
        StudentBean student = (StudentBean) request.getSession().getAttribute("originStudent");
        //System.out.println(student.getStuEmail());
//        if(student==null)
//            return;
        String stuName,stuSex,stuEmail,stuPsw;
        stuName = request.getParameter("stuName");
        stuSex = request.getParameter("stuSex");
        stuEmail = request.getParameter("stuEmail");
        //System.out.println(stuEmail);
        stuPsw = request.getParameter("stuPsw");
        if(!stuName.equals("")){
            student.setStuName(stuName);
        }
        if(stuSex!=null){
            student.setStuSex(stuSex);
        }
        if(!stuEmail.equals("")){
            student.setStuEmail(stuEmail);
        }
        if(!stuPsw.equals("")){
            student.setStuPsw(stuPsw);
        }

        StudentDao sd = new StudentDao();
        sd.updateStudent(student);

        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
