package servlet;

import bean.StudentBean;
import dao.StudentDao;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.Random;

import static util.Constants.myEmailAccount;
import static util.Constants.myEmailPassword;


@WebServlet(name = "ResetPswServlet",urlPatterns = "/servlet/ResetPswServlet")
public class ResetPswServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String inputEmailCode = req.getParameter("inputEmailCode");
        validateCodeAuth(req, resp, inputEmailCode);
        Object newPsw = req.getParameter("newPsw");
        Object stuId = req.getSession().getAttribute("notLoggedStuId");
        StudentDao sd = new StudentDao();
        StudentBean student = sd.getStudentByStuno(stuId.toString());
        student.setStuPsw(newPsw.toString());
        sd.updateStudent(student);

        req.getSession().setAttribute("resetOk", "重置密码成功");
        resp.sendRedirect("/reset_psw.jsp");
        return;

    }

    //第一步 发邮件等候输入校验码
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stuId = request.getParameter("stuId");
        request.getSession().setAttribute("notLoggedStuId", stuId);
        String stuEmail = request.getParameter("stuEmail");
        String randomStr = getRandomString(6);//获取随机校验码
        StudentDao sd = new StudentDao();
        StudentBean student = sd.getStudentByStuno(stuId);
        if(student.getStuEmail().equals(stuEmail)){
            try {
                if (sendEmail(stuEmail, randomStr)) {
                    request.getSession().setAttribute("emailCode", randomStr);
                    response.sendRedirect("/new_psw.jsp");
                }
            } catch (GeneralSecurityException e) {
                e.printStackTrace();
            }
        } else {
            request.getSession().setAttribute("emailError", "输入的邮箱错误");
            response.sendRedirect("/reset_psw.jsp");
        }
    }

    private void validateCodeAuth(HttpServletRequest req, HttpServletResponse resp, String input) throws IOException {
        HttpSession session = req.getSession();
        Object checkcode = session.getAttribute("emailCode");
        //和验证码生成时保存在session中的字符串比较
        if (checkcode != null && checkcode.equals(input)) {
            session.removeAttribute("emailCode");
        }
        else{
            req.getSession().setAttribute("emailError", "重置失败请重试");
            resp.sendRedirect("/reset_psw.jsp");
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

    public boolean sendEmail(String stuEmail, String randomStr) throws GeneralSecurityException {

        // 收件人电子邮箱

        // 发件人电子邮箱
        //String from = "sk308269317@gmail.com";

        // 指定发送邮件的主机为 localhost
        String host = "smtp.qq.com";

        // 获取系统属性
        Properties properties = System.getProperties();

        // 设置邮件服务器
        properties.setProperty("mail.smtp.host", host);


        properties.put("mail.smtp.auth", "true");
        // 获取默认session对象
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myEmailAccount, myEmailPassword); //发件人邮件用户名、授权码
            }
        });

        try {
            // 创建默认的 MimeMessage 对象
            MimeMessage message = new MimeMessage(session);

            // Set From: 头部头字段
            message.setFrom(new InternetAddress(myEmailAccount));

            // Set To: 头部头字段
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(stuEmail));

            // Set Subject: 头部头字段
            message.setSubject("重置密码");

            // 设置消息体
            message.setText(randomStr);

            // 发送消息
            Transport.send(message);
            System.out.println("Sent message successfully....");
            return true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        return false;
    }
}
