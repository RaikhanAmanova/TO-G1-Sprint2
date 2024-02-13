<%@ page import="models.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="db.DbManager" %><%--
<%@ page import="db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: Райхан
  Date: 13.02.2024
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br><br>
    <p class="fs-2" style="text-align: center"><b>Welcome To Bitlab Shop</b></p>
    <p class="fs-4" style="text-align: center">Electronic devices with high quality and service</p>
    <div class="row text-center">
        <%
            List<Item> items = (List<Item>) request.getAttribute("tovary");
            for(Item item : items){
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100">

                <div class="card-body">
                    <h5 class="card-header"><%= item.getName() %></h5>
                    <p class="card-text"><%= item.getDescription() %></p>
                    <div class="text-success" >$<%= item.getPrice() %></div>
                    <a href="#" class="btn btn-success">Buy Now</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>

</div>

</body>
</html>
