package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import bean.StudentBean;
import bean.TeacherBean;
import dao.LoginDao;
import dao.StudentDao;
import dao.TeacherDao;

@WebServlet(name = "LoginServlet",urlPatterns = "/servlet/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");//设置字符集
        HttpSession session = req.getSession();



        String username="";
        String password="";
        String role;


        if(session.getAttribute("role")!=null){
            role = session.getAttribute("role").toString();
            if("teacher".equals(role)){
                username = session.getAttribute("teaId").toString();
                password = session.getAttribute("teaPsw").toString();
                login_teacher(req,resp,username,password,true);
                return;
            }else if("student".equals(role)){
                username = session.getAttribute("stuId").toString();
                password = session.getAttribute("stuPsw").toString();
                login_student(req,resp,username,password,true);
                return;
            }

        }
        else{
            username = req.getParameter("username");
            password = req.getParameter("password");//获取用户名密码
            role = req.getParameter("role");
        }

        if(!validateCodeAuth(req, resp)){
            return;
        }


        if("student".equals(role)){
            login_student(req,resp,username,password,false);
        }
        else if("teacher".equals(role)){
            login_teacher(req,resp,username,password,false);
        }
    }

    private void login_student(HttpServletRequest req, HttpServletResponse resp, String username, String password,boolean isAutoLogin) throws IOException {
        req.setCharacterEncoding("utf-8");
        LoginDao loginDao = new LoginDao();
        int flag = loginDao.login_student(username, password);//执行Userdao里面的login方法判断登录的用户名密码是否正确
        if (flag == 1) {
            System.out.println("登录成功！");
            StudentDao studentDao = new StudentDao();
            StudentBean studentBean = studentDao.getStudentByStuno(username);
            req.getSession().setAttribute("stuName",studentBean.getStuName());
            req.getSession().setAttribute("stuId",username);

            if(!isAutoLogin)
                setAutoLogin(req, resp);

            resp.sendRedirect(req.getContextPath() + "/student/student_index.jsp");//登录成功跳转到主界面
        } else {
            System.out.println("登录失败！");
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }

    private void login_teacher(HttpServletRequest req, HttpServletResponse resp, String username, String password,boolean isAutoLogin) throws IOException {
        req.setCharacterEncoding("utf-8");

        LoginDao loginDao = new LoginDao();
        int flag = loginDao.login_teacher(username, password);//执行Userdao里面的login方法判断登录的用户名密码是否正确
        if (flag == 1) {
            System.out.println("登录成功！");
            TeacherDao teacherDao = new TeacherDao();
            TeacherBean teacherBean = teacherDao.getTeacherByteaId(username);
            req.getSession().setAttribute("teaId",username);
            req.getSession().setAttribute("teaName",teacherBean.getTeaName());

            if(!isAutoLogin)
                setAutoLogin(req, resp);

            resp.sendRedirect(req.getContextPath() + "/teacher/teacher_index.jsp");//登录成功跳转到主界面
        } else {
            System.out.println("登录失败！");
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }

    private void setAutoLogin(HttpServletRequest req, HttpServletResponse resp){
        String str = req.getParameter("autoLogin");
        if("autoLogin".equals(str)){
            String host = req.getServerName();
            // 保存用户名到Cookie
            Cookie cookie = new Cookie("username", req.getParameter("username"));
            cookie.setPath("/");
            cookie.setDomain(host);
            cookie.setMaxAge(60 * 60 * 24 * 14);
            resp.addCookie(cookie);
            // 保存密码到Cookie
            cookie = new Cookie("password", req.getParameter("password"));
            cookie.setPath("/");
            cookie.setDomain(host);
            cookie.setMaxAge(60 * 60 * 24 * 14);
            resp.addCookie(cookie);
            //保存角色到cookie
            cookie = new Cookie("role", req.getParameter("role"));
            cookie.setPath("/");
            cookie.setDomain(host);
            cookie.setMaxAge(60 * 60 * 24 * 14);
            resp.addCookie(cookie);
        }
    }

    private boolean validateCodeAuth(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        //获取验证码
        String validateCode = req.getParameter("validateCode").trim();
        Object checkcode = session.getAttribute("checkcode");
        //将输入的验证码中的小写字母转换成大写，再和验证码生成时保存在session中的字符串比较
        if(checkcode != null && checkcode.equals(convertToCapitalString(validateCode))){
            session.removeAttribute("checkcode");
            return true;
        }
        else{
            req.getSession().setAttribute("checkcodeErr","验证码输入错误！");
            resp.sendRedirect("/login.jsp");
            return false;
        }
    }

    /**
     * 将一个字符串中的小写字母转换为大写字母
     *
     * */
    public static String convertToCapitalString(String src)
    {
        char[] array = src.toCharArray();
        int temp = 0;
        for (int i = 0; i < array.length; i++)
        {
            temp = (int) array[i];
            if (temp <= 122 && temp >= 97){ // array[i]为小写字母
                array[i] = (char) (temp - 32);
            }
        }
        return String.valueOf(array);
    }

}