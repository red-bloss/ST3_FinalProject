package servlets;

import classes.DBManager;
import classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = DBManager.getUser(email);

        HttpSession session = req.getSession();
        session.setAttribute("current", user);

        if(user != null){
            if(user.getEmail().equals(email) && user.getPassword().equals(password)){
                resp.sendRedirect("/profile");
            }
            else {
                resp.sendRedirect("/login?errorEmailOrPassword");
            }
        }
        else {
            resp.sendRedirect("/login?error");
        }
    }
}
