package servlet;

import bean.StudentBean;
import dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

import static servlet.LoginServlet.convertToCapitalString;


@WebServlet(name = "SendEmailServlet",urlPatterns = "/servlet/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        validateCodeAuth(request,response);
        String stuId = request.getParameter("stuId");
        String stuEmail = request.getParameter("stuEmail");
        String randomStr = getRandomString(6);
        StudentDao sd = new StudentDao();
        StudentBean student = sd.getStudentByStuno(stuId);
        if(student.getStuEmail().equals(stuEmail)){

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void validateCodeAuth(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        //获取验证码
        String validateCode = req.getParameter("validateCode").trim();
        Object checkcode = session.getAttribute("checkcode");
        //将输入的验证码中的小写字母转换成大写，再和验证码生成时保存在session中的字符串比较
        if(checkcode != null && checkcode.equals(convertToCapitalString(validateCode))){
            session.removeAttribute("checkcode");
        }
        else{
            resp.sendRedirect("/login.jsp");
            return;
        }
    }

    public static String getRandomString(int length){
        String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<length;i++){
            int number=random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }

    public void sendEmail(){

    }
}
