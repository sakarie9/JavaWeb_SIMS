package servlet;

import bean.StudentBean;
import dao.LoginDao;
import dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static servlet.LoginServlet.convertToCapitalString;

@WebServlet(name = "AdminLoginServlet",urlPatterns = "/servlet/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        if(!validateCodeAuth(req, resp)){
            resp.sendRedirect("/admin.jsp");
            return;
        }
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
            resp.sendRedirect(req.getContextPath() + "/admin.jsp");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private boolean validateCodeAuth(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        //获取验证码
        String validateCode = req.getParameter("validateCode").trim();
        Object checkcode = session.getAttribute("checkcode");
        //将输入的验证码中的小写字母转换成大写，再和验证码生成时保存在session中的字符串比较
        if(checkcode != null && checkcode.equals(convertToCapitalString(validateCode))){
            session.removeAttribute("checkcode");
        }
        else{
            req.getSession().setAttribute("checkcodeErr","验证码错误！");
            return false;
            //resp.sendRedirect("/admin.jsp");
        }
        return true;
    }
}
