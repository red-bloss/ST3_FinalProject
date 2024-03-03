package servlets;

import classes.Comment;
import classes.DBManager;
import classes.News;
import classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/comment")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String comment = req.getParameter("comment");
        Long user_id = Long.valueOf(req.getParameter("user_id"));
        Long news_id = Long.valueOf(req.getParameter("news_id"));
        Comment comment1 = new Comment();
        comment1.setComment(comment);
        User user =new User();
        user.setId(user_id);
        News news = new News();
        news.setId(news_id);
        comment1.setUser(user);
        comment1.setNews(news);

        if(DBManager.addComment(comment1)){
            resp.sendRedirect("/news");
        } else {
            resp.sendRedirect("/news");
        }
    }
}
