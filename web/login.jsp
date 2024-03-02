<%--
  Created by IntelliJ IDEA.
  User: VivoBook
  Date: 25.02.2024
  Time: 00:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp" %>
<body>
<%@include file="/vendor/navbar.jsp" %>
<div class="container mt-5">
    <%
        String error = request.getParameter("error");
        if(error != null || request.getParameter("errorEmailOrPassword") != null){
            %>
    <div class="alert alert-danger ms-5 me-5" role="alert">
        Incorrect <b>password</b> or <b>email</b>!
    </div>
    <%
        }
    %>
    <div class="card ms-5 me-5">
        <h5 class="card-header">
            Login Page
        </h5>
        <div class="card-body">
            <form action="/login" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                </div>
                <button type="submit" class="btn btn-success">Login</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
