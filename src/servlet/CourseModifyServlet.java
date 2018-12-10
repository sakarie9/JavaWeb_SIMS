package servlet;

import bean.CourseBean;
import dao.CourseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CourseModifyServlet",urlPatterns = "/servlet/CourseModifyServlet")
public class CourseModifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        CourseBean course = (CourseBean) request.getSession().getAttribute("originCourse");

        String courseName,credit,teaId;
        courseName = request.getParameter("courseName");
        credit = request.getParameter("credit");
        teaId = request.getParameter("teaId");

        if(!courseName.equals("")){
            course.setCourseName(courseName);
        }
        if(!credit.equals("")){
            course.setCredit(Float.parseFloat(credit));
        }
        if(!teaId.equals("")){
            course.setTeaId(teaId);
        }

        CourseDao sd = new CourseDao();
        sd.updateCourse(course);

        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
