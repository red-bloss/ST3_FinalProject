package servlets;

import classes.Category;
import classes.DBManager;
import classes.News;
import classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/update")
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        Long cat_id = Long.valueOf(req.getParameter("cat"));

        Long id = Long.valueOf(req.getParameter("id"));

        if(title != null){
            News news = new News();
            news.setId(id);
            news.setTitle(title);
            news.setContent(content);
            Category cat = new Category();
            cat.setId(cat_id);
            news.setCategory(cat);
            if(DBManager.updateNews(news)){
                resp.sendRedirect("/news");
            }
        }
        else {
            resp.sendRedirect("/details?error");
        }
    }
}
