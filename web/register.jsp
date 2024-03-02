<%--
  Created by IntelliJ IDEA.
  User: VivoBook
  Date: 01.03.2024
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp" %>
<body>
<%@include file="/vendor/navbar.jsp" %>
<div class="container mt-5">
    <%
        if(request.getParameter("emailBusy") != null){
    %>
    <div class="alert alert-danger ms-5 me-5" role="alert">
         This <b>email</b> already exists!
    </div>
    <%
        } else if(request.getParameter("passwordsNotEqual") != null){
    %>
    <div class="alert alert-danger ms-5 me-5" role="alert">
        Passwords are not the same!
    </div>
    <%
        }
    %>
    <div class="card ms-5 me-5">
        <h5 class="card-header">
            Register Page
        </h5>
        <div class="card-body">
            <form action="/register" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword2" class="form-label">Repeat Password</label>
                    <input type="password" name="repPassword" class="form-control" id="exampleInputPassword2">
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
</body>
</html>
