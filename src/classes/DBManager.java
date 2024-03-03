package classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    static {
        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/news_portal",
                    "postgres", "admin");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<News> getNews(){
        ArrayList<News> news = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT n.id, n.post_date, n.title, n.content, c.id, c.name FROM news AS n " +
                    "INNER JOIN news_categories c on n.category_id = c.id");
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()){
                News news1 = new News();
                news1.setId(resultSet.getLong("id"));
                news1.setPostDate(resultSet.getTimestamp("post_date"));
                news1.setTitle(resultSet.getString("title"));
                news1.setContent(resultSet.getString("content"));
                Category category = new Category();
                category.setId(resultSet.getLong("id"));
                category.setName(resultSet.getString("name"));
                news1.setCategory(category);

                news.add(news1);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return news;
    }

    public static User getUser(String email) {
        User user = null;
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
            stmt.setString(1, email);
            ResultSet resultSet = stmt.executeQuery();
            if(resultSet.next()){
                user = new User();
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFullName(resultSet.getString("full_name"));
                user.setRoleId(resultSet.getString("role_id"));
                user.setId(resultSet.getLong("id"));
            }
            return user;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public static boolean addUser(User user){
        int rows = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO users(email, password, full_name, role_id) " +
                    "VALUES (?, ?, ?, '2')");
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFullName());
            rows = stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static boolean updateUser(User user){
        int rows = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE users SET email=?, password=?, " +
                    "full_name=?, role_id = ? WHERE id = ?;");
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getRoleId());
            stmt.setLong(5, user.getId());
            rows = stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows > 0;
    }

    public static List<Category> getCats(){
        List<Category> categories = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM news_categories");
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()){
                Category category = new Category();
                category.setId(resultSet.getLong("id"));
                category.setName(resultSet.getString("name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categories;
    }

    public static boolean addNews(News news){
        int rows = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO news (post_date, category_id, title, content) " +
                    "VALUES (Now(), ?, ?, ?)");
            stmt.setLong(1, news.getCategory().getId());
            stmt.setString(2, news.getTitle());
            stmt.setString(3, news.getContent());
            rows = stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static News getNews(Long id){
        News news = null;
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT n.id, n.post_date, n.title, n.content, c.id, c.name FROM news AS n " +
                    "INNER JOIN news_categories c on n.category_id = c.id WHERE n.id = ?");
            stmt.setLong(1, id);
            ResultSet resultSet = stmt.executeQuery();
            if (resultSet.next()){
                news = new News();
                news.setId(resultSet.getLong("id"));
                news.setTitle(resultSet.getString("title"));
                news.setContent(resultSet.getString("content"));
                news.setPostDate(resultSet.getTimestamp("post_date"));
                Category c = new Category();
                c.setId(resultSet.getLong("id"));
                c.setName(resultSet.getString("name"));
                news.setCategory(c);
            }
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return news;
    }

    public static boolean updateNews(News news){
        int rows = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE news SET title=?, content =?, category_id=? " +
                    "WHERE id = ?");
            stmt.setString(1, news.getTitle());
            stmt.setString(2, news.getContent());
            stmt.setLong(3, news.getCategory().getId());
            stmt.setLong(4, news.getId());

            rows = stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rows>0;
    }

    public static void deleteNews(Long id){
        try {
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM news WHERE id = ?");
            stmt.setLong(1, id);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean addComment(Comment comment){
        int row = 0;
        try {
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO comments (comment, post_date, user_id, news_id ) " +
                    "VALUES (?, Now(), ?, ?)");
            stmt.setString(1, comment.getComment());
            stmt.setLong(2, comment.getUser().getId());
            stmt.setLong(3, comment.getNews().getId());
            row = stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return row>0;
    }

    public static List<Comment> getCommentsOfNews(Long id){
        List<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT c.id, c.comment, c.post_date, u.id, u.email\n" +
                    "FROM comments AS c\n" +
                    "    INNER JOIN users u on u.id = c.user_id\n" +
                    "                      WHERE c.news_id = ? ");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPostDate(resultSet.getTimestamp("post_date"));
                User user = new User();
                user.setId(resultSet.getLong("id"));
                user.setEmail(resultSet.getString("email"));
                comment.setUser(user);
                comments.add(comment);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return comments;
    }

}
