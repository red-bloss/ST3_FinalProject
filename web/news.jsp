
<%@ page import="java.util.ArrayList" %>
<%@ page import="classes.News" %><%--
  Created by IntelliJ IDEA.
  User: VivoBook
  Date: 21.02.2024
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp" %>

<body>
<%@include file="/vendor/navbar.jsp" %>
<div class="container">
    <div class="container-fluid d-flex align-items-center justify-content-center mt-1 ">
        <h1>Welcome to BITLAB News</h1>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4 ms-5 mt-2">
        <% ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");
        if(news != null){
            for(News n: news){
                %>
    <div class="col-auto">
        <div class="card w-75">
            <div class="card-header"></div>
            <div class="card-body">
                <h5 class="card-title"><%=n.getTitle()%></h5>
                <p class="card-text"><%=n.getContent()%></p>
                <p class="text-secondary"><%=n.getPostDate()%></p>
                <p class="text-secondary"><%=n.getCategory().getName()%></p>
                <a href="/detailsBlog?id=<%n.getId();%>" class="btn btn-success">Read More</a>
            </div>
        </div>
    </div>
        <%
                }
            }
        %>
</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
