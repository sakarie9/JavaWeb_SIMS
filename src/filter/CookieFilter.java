package filter;

import com.mysql.cj.Session;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "CookieFilter",urlPatterns = "/login.jsp")
public class CookieFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);

        HttpServletRequest servletRequest = (HttpServletRequest) req;
        HttpServletResponse servletResponse = (HttpServletResponse) resp;
        Cookie[] cookies = servletRequest.getCookies();
        HttpSession session = servletRequest.getSession();
        String usernameCookie = null;
        String passwordCookie = null;
        String roleCookie = null;
        if(cookies!=null){
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    usernameCookie = cookie.getValue(); // 得到cookie的用户名
                    //System.out.println(usernameCookie);
                }
                if ("password".equals(cookie.getName())) {
                    passwordCookie = cookie.getValue(); // 得到cookie的密码
                    //System.out.println(passwordCookie);
                }
                if ("role".equals(cookie.getName())) {
                    roleCookie = cookie.getValue(); // 得到cookie的role
                    //System.out.println(roleCookie);
                }
            }
            if (usernameCookie != null && passwordCookie != null && roleCookie != null) { // 如果存在
                if(roleCookie.equals("student")){
                    session.setAttribute("stuId",usernameCookie);
                    session.setAttribute("stuPsw",passwordCookie);
                    session.setAttribute("role",roleCookie);
                    servletResponse.sendRedirect("/servlet/LoginServlet");
                    return;
                }
                else if(roleCookie.equals("teacher")){
                    session.setAttribute("teaId",usernameCookie);
                    session.setAttribute("teaPsw",passwordCookie);
                    session.setAttribute("role",roleCookie);
                    servletResponse.sendRedirect("/servlet/LoginServlet");
                    return;
                }
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
