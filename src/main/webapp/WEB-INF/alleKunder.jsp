<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="UtilClass.Initializer" %><%--
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


<div class="container">
    <img src="Images/LoginBackground.png" class="img-fluid mb-4" alt="Logo" width="100%" height=auto>

    <h1 class="text-center mb-4">Velkommen ${sessionScope.navn}</h1>

    <!-- Dropdowns -->
    <form action="FrontController" method="post">
        <input type="hidden" name="target" value="employee">

        <div class="row mt-4">

            <div class="col-md-12 text-center">
                <h6>Se alle kunder:</h6>
                <c:forEach var="customer" items="${requestScope.customers}">
                    Kunde${customer.userID}: ${customer.name}, ${customer.email}. Saldo: ${customer.balance}
                    <br><br>
                </c:forEach>
            </div>
        </div>
    </form>

    <br>
    <br>

    <div class="text-center mt-3">
        <a class="btn btn-outline-dark"
           href="FrontController?target=redirect&destination=employeepage" role="button">Gå tilbage</a>
    </div>

</div>

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
