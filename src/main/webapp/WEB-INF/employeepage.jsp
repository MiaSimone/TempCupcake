<%@ page import="UtilClass.Initializer" %><%--
    Document   : customerpage
    Created on : Aug 22, 2017, 2:33:37 PM
    Author     : Mia
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>

    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Administrator</title>

    <style>
        a.c {
            font-size: 200%;
        }
    </style>

</head>
<body style="background: rgb(184,36,62) linear-gradient(0deg, rgba(184,36,62,1) 0%, rgba(224,202,174,1) 44%)">

<%
    if (request.getServletContext().getAttribute("customerList") == null) {
        request.getServletContext().setAttribute("customerList", Initializer.getCustomerList());
    }
%>

<img src="Images/LoginBackground.png" class="img-fluid mb-4" alt="Logo" width="100%" height=auto>


<!-- Navigation -->
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light" style="border-bottom: 2px solid black;">
    <a class="navbar-brand ml-4 c" href="FrontController?target=redirect&destination=employeepage">
        <img src="Images/LogoUdenBaggrund.png" width="90" height="auto">
        Olsker Cupcakes
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse mr-4" id="navbarNavDropdown" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="FrontController?target=redirect&destination=employeepage"><i
                        class="fa fa-fw fa-home"></i>Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li>
                <span style="margin-right:10px;">${sessionScope.email}</span>
            </li>
        </ul>
    </div>
</nav>

<h1 class="text-center mt-4 mb-4">Velkommen ${sessionScope.navn}</h1>

<div class="container">
    <div class="row">
        <div class="col-md-4 text-center">
            <h6>Indsæt beløb på kundekonto:</h6>
            <form name="employee" action="FrontController" method="POST">
                <input type="hidden" name="target" value="employee">

                <div class="form-group text-left">
                    <label for="email">Indtast email:</label>
                    <input type="text" name="email" class="form-control" id="email" placeholder="Email">
                </div>
                <div class="form-group text-left">
                    <label for="amount">Indtast beløbet der skal indsættes:</label>
                    <input type="number" name="amount" class="form-control" id="amount" placeholder="Beløb">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-secondary mt-3">Indsæt beløb</button>
                </div>
            </form>
        </div>

        <div class="col-md-6 text-center">
            <h6>Se alle kunder:</h6>
            <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#AlleKunder"
                    aria-expanded="false" aria-controls="AlleKunder">
                Alle kunder
            </button>
            <div class="collapse" id="AlleKunder">
                <div class="card card-body">
                    <c:forEach var="customer" items="${applicationScope.customerList}">
                        Kunde-${customer.userID}: ${customer.name}, ${customer.email}. Saldo: ${customer.balance}
                        <br><br>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
