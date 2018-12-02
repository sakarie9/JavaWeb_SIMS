package servlet;

import dao.ScoreDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateScoreServlet")
public class UpdateScoreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stuId = request.getParameter("stuId");
        String courseId = request.getParameter("courseId");
        short score = Short.parseShort(request.getParameter("score"));
        if(score<0||score>100){
            //PrintWriter pw = response.getWriter();
            //pw.println("分数输入错误！");
            response.sendRedirect(request.getHeader("Referer"));
            return;
        }

        ScoreDao scoreDao = new ScoreDao();
        scoreDao.setScoreBystuIdAndCourseId(stuId,courseId,score);

        response.sendRedirect(request.getHeader("Referer"));

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
