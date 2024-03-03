
<%@ page import="classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp" %>
<body>
<%@include file="/vendor/navbar.jsp" %>
<div class="container mt-3">
    <div class="card ms-5 me-5 mb-3">
        <h5 class="card-header">
            Profile Page
        </h5>
        <div class="card-body">
            <form action="/profile" method="post">
                <%User user = (User) request.getSession().getAttribute("current");
                if (user != null){
                    %>
                <div class="mb-3">
                    <input type="hidden" name="id" class="form-control" id="id" value="<%=user.getId()%>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" value="<%=user.getEmail()%>"
                           aria-describedby="emailHelp" readonly>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" value="<%=user.getPassword()%>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword2" class="form-label">Repeat Password</label>
                    <input type="password" name="repPassword" class="form-control" id="exampleInputPassword2">
                </div>
                <div class="mb-3">
                    <label for="fullName" class="form-label">FullName</label>
                    <input type="text" name="fullName" class="form-control" id="fullName" value="<%=user.getFullName()%>">
                </div>
                <div class="mb-3">
                    <input type="hidden" name="role" class="form-control" id="role" value="<%=user.getRoleId()%>">
                </div>
                <button type="submit" class="btn btn-success">Update</button>
                <%
                }
                %>
            </form>
        </div>
    </div>
</div>
</body>
</html>
