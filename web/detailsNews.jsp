
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="classes.*" %><%--
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
            <div class="card ms-5 me-5 mb-3">
                <h5 class="card-header">
                    Details of News Page
                </h5>
                <div class="card-body">
                    <%News news = (News) request.getAttribute("news");
                    if(news != null){
                        if(user1 != null && user1.getRoleId().equals("1")){
                    %>
                    <form action="/update" method="post">
                        <div class="mb-3">
                            <input type="hidden" name="id" class="form-control" id="id" value="<%=news.getId()%>">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Title</label>
                            <input type="text" name="title" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" value="<%=news.getTitle()%>">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Content</label>
                            <textarea class="form-control" id="exampleInputPassword1" rows="5" name="content"><%=news.getContent()%></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Category</label>
                            <select name="cat" class="form-select">
                                <%List<Category> categories = (List<Category>) request.getSession().getAttribute("cat");
                                    if (categories != null){
                                        for(Category cat: categories){%>
                                <option value="<%=cat.getId()%>"> <%=cat.getName()%> </option>
                                <%
                                        }
                                    }%>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">Update News</button>
                    </form>
                    <form action="/delete" method="post">
                        <input type="hidden" name="id" class="form-control" value="<%=news.getId()%>">
                        <button type="submit" class="btn btn-danger">Delete News</button>
                    </form>

                    <%
                    } else {
                    %>
                    <div class="card-body">
                        <h5 class="card-title flex-grow-1"><%=news.getTitle()%></h5>
                        <p class="text-secondary"><%=news.getPostDate()%></p>
                        <p class="text-success"><%=news.getCategory().getName()%></p>
                        <p class="text-secondary"><%=news.getContent()%></p>
                    </div>
                    <div class="col-4 mt-2">
                        <%List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                        if (comments != null){
                            for (Comment comm: comments){
                                %>
                      <div class="col-9 mt-2">
                          <div class="card">
                              <div class="card-body">
                                  <h5 class="card-title flex-grow-1"><%=comm.getComment()%></h5>
                                  <p class="text-secondary"><%=comm.getPostDate()%></p>
                                  <p class="text-success"><%=comm.getUser().getEmail()%></p>
                              </div>
                          </div>
                      </div>

                        <%
                                }
                            }%>
                    </div>
                    <div class="col-12 mt-2">
                        <%if (user1 != null) {
                            %>
                        <form action="comment" method="post">
                            <div class="mb-3">
                                <label  class="form-label">Comment</label>
                                <input type="text" name="comment" class="form-control" aria-describedby="emailHelp" >
                            </div>
                            <div class="mb-3">
                                <input type="hidden" name="user_id" class="form-control" value="<%=user1.getId()%>">
                                <input type="hidden" name="news_id" class="form-control" value="<%=news.getId()%>">
                            </div>
                            <button type="submit" class="btn btn-danger">Comment</button>
                        </form>
                        <%
                        }%>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>

            </div>
        </div>

</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
