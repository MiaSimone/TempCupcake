<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="UtilClass.Initializer" %>
<%@ page import="FunctionLayer.LoginSampleException" %>
<%@ page import="DBAccess.UserMapper" %>
<%@ page import="DBAccess.OrderMapper" %><%--
  Created by IntelliJ IDEA.
  User: miade
  Date: 20-03-2020
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <style>
        .div {
            background-color: floralwhite;
            width: 300px;
            height: auto;
            padding: 50px;
        }
    </style>


    <title>Order Details</title>

</head>
<body style="background: rgb(184,36,62) linear-gradient(0deg, rgba(184,36,62,1) 0%, rgba(224,202,174,1) 44%)">

<%
    try {
        request.setAttribute("orderdetails", OrderMapper.getOrdersDetails());
    } catch (LoginSampleException e) {
        e.printStackTrace();
    }
%>

<!-- Start Picture -->
<img src="./Images/LoginBackground.png" alt="Logo" width="100%" height=auto>


<!-- Navigation -->
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light" style="border-bottom: 2px solid black;">
    <a class="navbar-brand ml-4 c" href="FrontController?target=redirect&destination=employeepage">
        <img src="Images/LogoUdenBaggrund.png" width="90" height="auto">
        ${sessionScope.email}
    </a>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="FrontController?target=redirect&destination=index">(log ud)</a>
        </li>
    </ul>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse mr-4" id="navbarNavDropdown" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="FrontController?target=redirect&destination=alleKunder">Alle kunder </a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="FrontController?target=redirect&destination=alleOrdre"> Alle ordre </a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="FrontController?target=redirect&destination=ordreDetaljer"> Ordre detaljer</a>
            </li>
        </ul>
    </div>
</nav>
<!-- End og navigation -->


<div class="container">
    <h1 class="text-center mt-4 mb-4">Order detaljer:</h1>


    <div class="row mt-2">
        <div class="div col-md-12 text-center">
            <c:forEach var="order" items="${requestScope.orderdetails}">
                Ordre${order.orderID} - Lavet af ${order.email} ${order.date}: ${order.bottomName} bund med ${order.toppingName} topping,
                 ${order.quantity} stk. Total: ${order.sum}
                <br>
            </c:forEach>
        </div>
    </div>


    <div class="text-center mt-4">
        <a class="btn btn-outline-dark"
           href="FrontController?target=redirect&destination=employeepage" role="button">Gå til oversigt</a>
    </div>

</div>
<!-- /.Container-->

<br>

<!-- Footer -->
<footer class="py-5 bg-dark mt-5">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Olskers Cupcakes</p>
    </div>
    <!-- /.container -->
</footer>

</body>
</html>
