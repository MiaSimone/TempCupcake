<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="UtilClass.Initializer" %>
<%@ page import="FunctionLayer.LoginSampleException" %><%--
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


    <title>Employee</title>

</head>
<body style="background: rgb(184,36,62) linear-gradient(0deg, rgba(184,36,62,1) 0%, rgba(224,202,174,1) 44%)">

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
            <li class="nav-item">
                <a class="nav-link" href="FrontController?target=redirect&destination=ordreDetaljer"> Ordre detaljer</a>
            </li>
        </ul>
    </div>
</nav>
<!-- End og navigation -->

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

<!-- Page content -->
<div class="container mt-5">

    <div class="row">
        <div class="col-md-6 text-center">
            <h6>Indsæt beløb på kundekonto:</h6>
            <form name="insertAmount" action="FrontController" method="POST" >
                <input type="hidden" name="target" value="insertAmount">

                <div class="form-group text-left">
                    <label for="email">Indtast email:</label>
                    <input type="text" name="email" class="form-control" id="email" placeholder="Email">
                </div>
                <div class="form-group text-left">
                    <label for="amount">Indtast beløbet der skal indsættes:</label>
                    <input type="number" name="amount" class="form-control" id="amount" placeholder="Beløb">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-dark mt-3">Indsæt beløb</button>
                </div>
            </form>
        </div>

        <div class="col-md-6 text-center mt-5">
            <br>
            <h6>Slet ordre:</h6>
            <form name="sletOrdre" action="FrontController" method="POST" >
                <input type="hidden" name="target" value="sletOrdre">
                <div class="input-group mb-3">
                    <input type="number" class="form-control" name="orderID" placeholder="OrderID" aria-label="OrderID" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-dark" type="submit">Delete</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
    <!-- /.row -->

    <div class="text-center mt-3">
        <a class="btn btn-outline-dark"
           href="FrontController?target=redirect&destination=index" role="button">Log ud</a>
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
