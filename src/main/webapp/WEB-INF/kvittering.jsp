<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: miade
  Date: 29-03-2020
  Time: 20:25
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


    <title>Kvittering</title>
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
                    <a class="nav-link" href="FrontController?target=redirect&destination=customerpage"><i class="fa fa-fw fa-home"></i>Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li>
                    <span style="margin-right:10px;">${sessionScope.email}</span>
                </li>
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


    <div class="jumbotron">
        <h1>Kvittering</h1>

        <%  String besked = (String) request.getAttribute("message");
            String status = (String) request.getAttribute("status");
            String alertType;

            if (status != null && status.equals("OK")) {
                alertType = "alert-success";
                besked = besked + "<p>Tak for din bestilling. Du kan afhente dine cupcakes i Olsker allerede om 10 minutter.</p>";
            } else {
                alertType = "alert-danger";
            }
            if (besked != null ) {
                String alert = "<div class=\"alert " + alertType +  "\">_message_</div>";
                alert = alert.replace("_message_", besked);
                out.println(alert);
            }

        %>

        <form action="FrontController" method="post">
            <div class="float-right">
                <input type="hidden" name="source" value="cartcontrol"/>
                <button type="submit" name="action" value="shop" class="btn btn-primary">Shop videre</button>
            </div>
        </form>

    </div>

</body>
</html>
