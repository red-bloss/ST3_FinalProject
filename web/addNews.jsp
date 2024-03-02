
<%@ page import="java.util.ArrayList" %>
<%@ page import="classes.News" %>
<%@ page import="classes.Category" %>
<%@ page import="java.util.List" %><%--
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
    <div class="row mt-3">
        <div class="col">
            <div class="card ms-5 me-5">
                <h5 class="card-header">
                    Register Page
                </h5>
                <div class="card-body">
                    <form action="/addNews" method="post">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Title</label>
                            <input type="text" name="title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Content</label>
                            <textarea class="form-control" id="exampleInputPassword1" style="width: 100%; height: 40%;" name="content"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Category</label>
                            <select name="cat">
                                <%List<Category> categories = (List<Category>) request.getAttribute("cat");
                                    if (categories != null){
                                        for(Category cat: categories){%>
                                <option value="<%=cat.getId()%>"> <%=cat.getName()%> </option>
                                <%
                                        }
                                    }%>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="fullName" class="form-label">FullName</label>
                            <input type="text" name="fullName" class="form-control" id="fullName">
                        </div>
                        <button type="submit" class="btn btn-success">Register</button>
                    </form>
                </div>
            </div>

            </div>
        </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
