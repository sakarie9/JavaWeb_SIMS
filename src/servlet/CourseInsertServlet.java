package servlet;

import bean.CourseBean;
import dao.CourseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CourseInsertServlet",urlPatterns = "/servlet/CourseInsertServlet")
public class CourseInsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        CourseDao cd = new CourseDao();
        CourseBean course = new CourseBean();
        course.setCourseId(request.getParameter("courseId"));
        course.setCourseName(request.getParameter("courseName"));
        course.setCredit(Float.parseFloat(request.getParameter("credit")));
        course.setTeaId(request.getParameter("teaId"));


        boolean isDone = cd.insertCourse(course);
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
