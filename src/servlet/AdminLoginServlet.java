package servlet;

import bean.StudentBean;
import dao.LoginDao;
import dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminLoginServlet",urlPatterns = "/servlet/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        login_admin(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void login_admin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("utf-8");
        LoginDao loginDao = new LoginDao();
        String username = req.getParameter("username");
        String password = req.getParameter("password");//获取用户名密码
        int flag = loginDao.login_admin(username, password);//执行Userdao里面的login方法判断登录的用户名密码是否正确
        if (flag == 1) {
            System.out.println("登录成功！");
            req.getSession().setAttribute("admin",username);//设置session
            resp.sendRedirect(req.getContextPath() + "/admin/admin_index.jsp");//登录成功跳转到主界面
        } else {
            System.out.println("登录失败！");
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}
