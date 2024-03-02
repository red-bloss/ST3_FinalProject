<%@ page import="classes.User" %><%--
  Created by IntelliJ IDEA.
  User: VivoBook
  Date: 07.02.2024
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <style>
      .navbar-brand-gap {
      margin-right: 600px;}
  </style>
  <body>
  <div class="container">
      <nav class="navbar navbar-expand-lg ">
          <div class="container-fluid">
              <a class="navbar-brand fw-bold navbar-brand-gap" href="#">BITLAB NEWS</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-5 mb-2 mb-lg-0 ">
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="/news">News</a>
                      </li>
                      <%User user1 = (User) request.getSession().getAttribute("current");
                      if (user1 != null && user1.getRoleId().equals("1")){
                          %>
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="/addNews">Add News</a>
                      </li>
                      <%
                      }%>
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="/register">Register</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="#">By Category</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="/login">Sign in</a>
                      </li>
                      <%
                          if (user1 != null){
                      %>
                      <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="/logout">Logout</a>
                      </li>
                      <%
                          }%>
                  </ul>
              </div>
          </div>
      </nav>
      <hr>
  </div>
  </body>
</html>
