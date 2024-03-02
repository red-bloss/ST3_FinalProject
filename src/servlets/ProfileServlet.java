package servlets;


import classes.DBManager;
import classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("profile.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullName");
        String password = req.getParameter("password");
        String repPassword = req.getParameter("repPassword");
        String role = req.getParameter("role");
        Long id = Long.valueOf(req.getParameter("id"));

        if(password.equals(repPassword) && fullName != null){
            User user = new User();
            user.setId(id);
            user.setEmail(email);
            user.setFullName(fullName);
            user.setPassword(password);
            user.setRoleId(role);
            if(DBManager.updateUser(user)){
                resp.sendRedirect("/profile");
            }
        }
        else {
            resp.sendRedirect("/profile?error");
        }
    }
}
