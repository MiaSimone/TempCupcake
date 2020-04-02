
<%@ page import="FunctionLayer.User" %><%--
    Document   : index
    Created on : Aug 22, 2017, 2:01:06 PM
    Author     : kasper
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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

        <title>Olsker Cupcakes</title>

        <style>
            a.c {
                font-size: 200%;
            }
        </style>

    </head>
    <body style="background: rgb(184,36,62) linear-gradient(0deg, rgba(184,36,62,1) 0%, rgba(224,202,174,1) 44%)">
    <!-- Start Picture -->
    <img src="./Images/Background.jpg" alt="Logo" width="100%" height=auto>





    <!-- Navigation -->
    <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light" style="border-bottom: 2px solid black;">
        <a class="navbar-brand ml-4 c" href="FrontController?target=redirect&destination=index">
            <img src="Images/LogoUdenBaggrund.png" width="90" height="auto">
            Olsker Cupcakes
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse mr-4" id="navbarNavDropdown" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="FrontController?target=redirect&destination=index"><i class="fa fa-fw fa-home"></i>Hjem <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="FrontController?target=redirect&destination=login">Login</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Cards -->
    <div class="container mt-5">

        <div class="row mt-3">
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <a href="FrontController?target=redirect&destination=login"><img class="card-img-top" src="./Images/bestil.jpg" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="FrontController?target=redirect&destination=login" style="text-decoration: none">Bestil Cupcakes</a>
                        </h4>
                        <p class="card-text">Her kan De bestille Danmarks bedste cupcakes! De kan frit mikse bunde
                            med toppings efter Deres smag. God fornøjelse!</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <a href="FrontController?target=redirect&destination=ingredienser"><img class="card-img-top" src="./Images/ingrediens.jpg" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="FrontController?target=redirect&destination=ingredienser" style="text-decoration: none">Vores Ingredienser</a>
                        </h4>
                        <p class="card-text">Hvis De er interesseret i at vide mere om vores økologiske ingredienser,
                            kan de klikke her.</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <a href="FrontController?target=redirect&destination=infosite"><img class="card-img-top" src="./Images/Bornholm.jpg" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="FrontController?target=redirect&destination=infosite" style="text-decoration: none">Olsker Cupcakes</a>
                        </h4>
                        <p class="card-text">Her vil De finde vores kontakt information.</p>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.row -->
    </div>
    <!-- /.col-lg-9 -->
    </div>
    <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark mt-5">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Olskers Cupcakes</p>
        </div>
    </footer>

    </body>
</html>
