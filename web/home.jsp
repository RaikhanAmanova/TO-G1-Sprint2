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
    <div style="margin-bottom: 10px">
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal1">
            ADD ITEMS
        </button>
    </div>

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

    <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Новое задание</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/add" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="nameField" class="form-label">Name: </label>
                            <input name = "name" class="form-control" type="text" id = "nameField">
                        </div>
                        <div class="mb-3">
                            <label for="descriptionField" class="form-label">Description: </label>
                            <input name = "description" class="form-control" type="text" id = "descriptionField">
                        </div>
                        <div class="mb-3">
                            <label for="priceField" class="form-label">Price: </label>
                            <input name = "price" class="form-control" type="number" id = "priceField">
                        </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                            <button type="submit" class="btn btn-primary">Сохранить</button>
                        </div>
                </form>
            </div>
        </div>
    </div>

</div>

</body>
</html>
