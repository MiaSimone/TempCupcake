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

<%!
    @Override
    public void jspInit(){
        try {
            Initializer.initCustomers();
        } catch (LoginSampleException e) {
            e.printStackTrace();
        }
    }
%>

<div class="container">
    <img src="Images/LoginBackground.png" class="img-fluid mb-4" alt="Logo" width="100%" height=auto>

    <h1 class="text-center mb-4">Velkommen ${sessionScope.navn}</h1>

    <div class="row">
        <div class="col-md-6 text-center">
            <h6>Indsæt beløb på kundekonto:</h6>
            <form name="employee" action="FrontController" method="POST" >
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
            <div class="text-center mt-3">
                <a class="btn btn-dark"
                   href="FrontController?target=redirect&destination=alleKunder" role="button">Alle kunder</a>
            </div>
        </div>

    </div>

    <br>
    <hr>
    <br>

    <div class="row">

        <div class="col-md-6 text-center">
            <h6>Se alle ordre:</h6>
            <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#AlleOrdre" aria-expanded="false" aria-controls="AlleOrdre">
                Alle ordre
            </button>

            <br>
            <div class="collapse" id="AlleOrdre">
                <div class="card card-body">
                    <c:forEach var="order" items="${applicationScope.orderList}">
                        Ordre: ${order.orderID}. Dato: ${order.date}. Ordren er lavet af: ${order.email} (${order.customerID})
                        <br><br>
                    </c:forEach>
                </div>
            </div>

            <br>

            <h6>Slet ordre:</h6>
            <form name="employee" action="FrontController" method="POST" >
                <input type="hidden" name="target" value="employee">
                <div class="input-group mb-3">
                    <input type="number" class="form-control" name="orderID" placeholder="OrderID" aria-label="OrderID" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit">Delete</button>
                    </div>
                </div>
            </form>
            ${requestScope.messageOrdre}

        </div>

        <div class="col-md-6 text-center">
            <h6>Se alle kunder og deres ordre:</h6>
            <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#Ordre" aria-expanded="false" aria-controls="Ordre">
                Ordre
            </button>
            <div class="collapse" id="Ordre">
                <div class="card card-body">
                    <c:forEach var="CO" items="${applicationScope.indiOrderList}">
                        OrderID-${CO.orderID}. Dato: ${CO.date}. Lavet af ${CO.email}:
                        <br>Topping: ${CO.toppingName} (${CO.toppingPrice}). Bund: ${CO.bottomName} (${CO.bottomPrice})
                        Antal: ${CO.quantity}.
                        <br>Samlet beløb: ${CO.sum}
                        <br><br>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
    <br>
    <br>
    <div class="text-center mt-3">
        <a class="btn btn-outline-dark"
           href="FrontController?target=redirect&destination=index" role="button">Tilbage til start</a>
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
