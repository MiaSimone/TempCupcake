<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="UtilClass.Initializer" %>
<%--
  Created by IntelliJ IDEA.
  User: miade
  Date: 16-03-2020
  Time: 09:28
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
    <!-- Bootstrap carousel -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        a.c {
            font-size: 200%;
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
<div class="container mt-4">

    <h4>Cart
        <span class="price" style="color:black">
                        <i class="fa fa-shopping-cart"></i>
                    </span>
    </h4>

        <table class="table table-striped ">
            <thead>
            <tr>
                <th>Bund</th>
                <th>Topping</th>
                <th>Antal</th>
                <th>Pris</th>
                <th>I alt</th>
                <th>Fjern</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="orderItem" items="${sessionScope.kurv.orderlist}">
                    <tr>
                        <td>${orderItem.bottom.name}</td>
                        <td>${orderItem.topping.name}</td>
                        <td>${orderItem.antal}</td>
                        <td>${orderItem.cupcakePrice}</td>
                        <td>${orderItem.orderPrice}</td>
                        <td>
                            <form action="FrontController" method="post">
                                <input type="hidden" name="target" value="fjernOrdre">
                                <button type="submit" value="${requestScope.orderItem}"
                                        class="btn btn-danger btn-xs">
                                    Fjern
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

            <tr>
                <td colspan="4">I alt</td>
                <td>${sessionScope.kurv.totalSum}</td>
                <td>&nbsp;</td>
            </tr>
            </tbody>
        </table>

    <form action="FrontController" method="post">
        <input type="hidden" name="target" value="kurv">

        <div class="row">
            <div class="col-md-4 text-center mt-3 mb-3">
                <a href="FrontController?target=redirect&destination=bestilling"
                   class="btn btn-secondary mt-4 mb-3" role="button" aria-pressed="true">Bestil flere</a>
            </div>

            <div class="col-md-4 text-center mt-3 mb-3">
                <button type="submit" class="btn btn-dark mt-4 mb-3">Betal</button>
            </div>

            <div class="col-md-4 text-center mt-3 mb-3">
                <a href="FrontController?target=redirect&destination=customerpage"
                   class="btn btn-secondary mt-4 mb-3" role="button" aria-pressed="true">Gå til hovedmenu</a>
            </div>
        </div>
    </form>

</div>
<!-- Container -->

<!-- Footer -->
<footer class="py-5 bg-dark mt-5">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Olskers Cupcakes</p>
    </div>
</footer>


</body>
</html>
