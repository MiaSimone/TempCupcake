<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: miade
  Date: 16-03-2020
  Time: 09:28
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
    <!-- Bootstrap carousel -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        a.c {
            font-size: 200%;
        }
        .div {
            background-color: floralwhite;
            align-content: center;
            width: 75%;
            height: auto;
            padding: 50px;
        }
        .column {
            float: left;
            width: 25%;
        }
        .column3 {
            float: left;
            width: 50%;
        }
        .prisliste {
            text-align: left;
            margin-left: 18%;
        }
    </style>

    <title>Olsker Cupcakes</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body style="background: rgb(184,36,62) linear-gradient(0deg, rgba(184,36,62,1) 0%, rgba(224,202,174,1) 44%)">


<!-- Start Picture -->
<img src="./Images/LoginBackground.png" alt="Logo" width="100%" height=auto>


<!-- Navigation -->
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light" style="border-bottom: 2px solid black;">
    <a class="navbar-brand ml-4 c" href="FrontController?target=redirect&destination=customerpage">
        <img src="Images/LogoUdenBaggrund.png" width="90" height="auto">
        Olsker Cupcakes
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse mr-4" id="navbarNavDropdown" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="FrontController?target=redirect&destination=customerpage"><i class="fa fa-fw fa-home"></i>Hjem <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li>
                <span>${sessionScope.email}</span>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li>
                <a class="nav-link" href="FrontController?target=redirect&destination=index">(log ud)</a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li>
                <span style="margin-right:20px;">(saldo: ${sessionScope.balance} DKK)</span>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="FrontController?target=redirect&destination=kurv"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Kurv</a>
            </li>
        </ul>
    </div>
</nav>

<%  String besked = (String) request.getAttribute("message");
    String status = (String) request.getAttribute("status");
    if (besked != null && status != null) {
        String alert = "";
        if (status.equals("ok")) {
            alert = "<div class=\"alert alert-success\">_message_</div>";
        } else {
            alert = "<div class=\"alert alert-danger\">_message_</div>";
        }
        alert = alert.replace("_message_", besked);
        out.println(alert);
    }
%>

<!-- Page Content -->
<div class="container">

    <!-- Dropdowns -->

    <form action="FrontController" method="post">
        <input type="hidden" name="target" value="bestilling">

        <div class="row mt-4">

            <div class="col-md-5 school-options-dropdown text-center">
                <div class="form-group">
                    <label>Vælg bund:</label>
                    <select class="form-control" name="bund">
                        <option selected disabled>Vælg bund</option>
                        <c:forEach var="bottom" items="${bottoms}">
                            <option name="bund">${bottom.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="col-md-5 school-options-dropdown text-center">
                <div class="form-group">
                    <label>Vælg topping:</label>
                    <select class="form-control" name="top">
                        <option selected disabled>Vælg topping</option>
                        <c:forEach var="topping" items="${toppings}">
                            <option name="top">${topping.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="col-md-2 school-options-dropdown text-center">
                <div class="form-group">
                    <label>Vælg topping:</label>
                    <select name="quantity" class="form-control">
                        <option selected disabled>Vælg antal</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-6 text-center">
                <button type="submit" class="btn btn-dark mt-4">Tilføj til kurv</button>
            </div>
            <div class="col-md-6 text-center">
                <a href="FrontController?target=redirect&destination=kurv"
                   class="btn btn-dark mt-4" role="button" aria-pressed="true">Gå til kurv</a>
            </div>
        </div>
    </form>
</div>

<!-- Prisliste -->
<div class="div container mt-4">
    <h3 class="mb-4 prisliste">Prisliste:</h3>
    <div class="row text-center">
        <div class="column">
            <h6>Bunde:</h6>
            <c:forEach var="bottom" items="${bottoms}">
                ${bottom.name}: ${bottom.bottomPrice} DKK
                <br>
            </c:forEach>
        </div>
        <div class="column">
            <h6>Toppings:</h6>
            <c:forEach var="topping" items="${toppings}">
                ${topping.name}: ${topping.toppingPrice} DKK
                <br>
            </c:forEach>
        </div>
        <div class="column3">
            <img src="./Images/baking2.jpg" alt="Logo" width="100%" height=auto>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="py-5 bg-dark mt-5">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Olskers Cupcakes</p>
    </div>
    <!-- /.container -->
</footer>


</body>
</html>
