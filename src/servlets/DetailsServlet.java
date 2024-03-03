package servlets;

import classes.Category;
import classes.Comment;
import classes.DBManager;
import classes.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/detailsNews")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       Long id = Long.valueOf(req.getParameter("id"));
       News news = DBManager.getNews(id);
       req.setAttribute("news", news);

       List<Category> categories = DBManager.getCats();
       req.getSession().setAttribute("cat", categories);

       List<Comment> comments = DBManager.getCommentsOfNews(id);
       req.setAttribute("comments", comments);
       req.getRequestDispatcher("detailsNews.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
