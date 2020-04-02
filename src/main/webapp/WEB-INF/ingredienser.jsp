<%@ page import="FunctionLayer.User" %><%--
  Created by IntelliJ IDEA.
  User: miade
  Date: 31-03-2020
  Time: 21:58
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

    <title>Info</title>
</head>
<body style="background: rgb(184,36,62) linear-gradient(0deg, rgba(184,36,62,1) 0%, rgba(224,202,174,1) 44%)">


<!-- Start Picture -->
<img src="./Images/LoginBackground.png" alt="Logo" width="100%" height=auto>

<!-- Page Content -->
<div class="container mt-4">
    <h1 class="text-center mt-4 mb-4">Olskers Cupcakes</h1>


    <div class="row mt-2">
        <div class="div col-md-12 text-center">
            Ingredienser
        </div>
    </div>


    <div class="text-center mt-4">
        <a class="btn btn-outline-dark"
           href="FrontController?target=redirect&destination=index" role="button">Gå tilbage</a>
    </div>
</div>
<!-- /.Container-->

<!-- Footer -->
<footer class="py-5 bg-dark mt-5">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Olskers Cupcakes</p>
    </div>
</footer>


</body>
</html>
