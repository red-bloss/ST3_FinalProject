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
import java.util.List;

@WebServlet(value = "/addNews")
public class AddNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = DBManager.getCats();
        req.getSession().setAttribute("cat", categories);

        User user = (User) req.getSession().getAttribute("current");
        if(user != null && user.getRoleId().equals("1")){
            req.getRequestDispatcher("addNews.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/login?errorRole");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        Long cat_id = Long.valueOf(req.getParameter("cat"));

        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        Category category = new Category();
        category.setId(cat_id);
        news.setCategory(category);

        DBManager.addNews(news);
        resp.sendRedirect("/news");
    }
}
