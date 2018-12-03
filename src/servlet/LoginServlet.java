package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.StudentBean;
import bean.TeacherBean;
import dao.LoginDao;
import dao.StudentDao;
import dao.TeacherDao;

@WebServlet(name = "LoginServlet",urlPatterns = "/servlet/LoginServlet")
public class LoginServlet extends HttpServlet {
//service方法是必须的！在Servlet先执行这个方法
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");//设置字符集
//        String method = req.getParameter("method");//获取jsp界面的method参数来判断执行什么方法
//        if (method.equals("login")) {
//            login(req, resp);//登录方法
//        }
        String role = req.getParameter("role");
        if(role.equals("student")){
            login_student(req,resp);
        }
        else if(role.equals("teacher")){
            login_teacher(req,resp);
        }
    }

    private void login_student(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");//获取用户名密码
        LoginDao loginDao = new LoginDao();
        int flag = loginDao.login_student(username, password);//执行Userdao里面的login方法判断登录的用户名密码是否正确
        if (flag == 1) {
            System.out.println("登录成功！");
            StudentDao studentDao = new StudentDao();
            StudentBean studentBean = studentDao.getStudentByStuno(username);
            req.getSession().setAttribute("stuName",studentBean.getName());
            req.getSession().setAttribute("stuId",username);
            resp.sendRedirect(req.getContextPath() + "/student/student_index.jsp");//登录成功跳转到主界面
        } else {
            System.out.println("登录失败！");
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }

    private void login_teacher(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("utf-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");//获取用户名密码
        LoginDao loginDao = new LoginDao();
        int flag = loginDao.login_teacher(username, password);//执行Userdao里面的login方法判断登录的用户名密码是否正确
        if (flag == 1) {
            System.out.println("登录成功！");
            TeacherDao teacherDao = new TeacherDao();
            TeacherBean teacherBean = teacherDao.getTeacherByteaId(username);
            req.getSession().setAttribute("teaId",username);
            req.getSession().setAttribute("teaName",teacherBean.getTeaName());
            resp.sendRedirect(req.getContextPath() + "/teacher/teacher_index.jsp");//登录成功跳转到主界面
        } else {
            System.out.println("登录失败！");
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}