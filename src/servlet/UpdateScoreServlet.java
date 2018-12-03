package servlet;

import dao.ScoreDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateScoreServlet",urlPatterns = "/servlet/UpdateScoreServlet")
public class UpdateScoreServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
        String stuId = req.getParameter("stuId");
        String courseId = req.getParameter("courseId");
        float score = Float.parseFloat(req.getParameter("score"));
        ScoreDao scoreDao = new ScoreDao();
        scoreDao.setScoreBystuIdAndCourseId(stuId,courseId,score);

        resp.sendRedirect(req.getHeader("Referer"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        if(score<0||score>100){
//            //PrintWriter pw = response.getWriter();
//            //pw.println("分数输入错误！");
//            String referer = request.getHeader("Referer");
//
//            PrintWriter out=response.getWriter();
//            out.print("<script language='javascript'> " +
//                    "alert('fsagfgehrhsahtsjrjrj');" +
//                    "</script>");
//
//            response.sendRedirect(referer);
//            return;
//        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
