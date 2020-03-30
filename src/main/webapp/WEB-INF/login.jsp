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

    <title>Login</title>
</head>
<body>

<div class="container">
    <img src="Images/LoginBackground.png" class="img-fluid mb-4" alt="Logo" width="100%" height=auto>

    <h1 class="text-center mb-4">Login</h1>

    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">

            <form name="login" action="FrontController" method="post">

                <input type="hidden" name="target" value="login"/>

                <div class="form-group">
                    <label for="email">Indtast din email:</label>
                    <input type="text" name="email" class="form-control" id="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="password">Indtast dit password:</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-dark mt-3">Login</button>
                </div>
                <div class="text-center mt-3">
                    <a class="btn btn-outline-dark" href="FrontController?target=redirect&destination=registrer" role="button">Registrer</a>
                </div>

                <div class="text-center mt-3">
                    <a class="btn btn-outline-dark" href="FrontController?target=redirect&destination=index" role="button">Tilbage til start</a>
                </div>
            </form>
        </div>

        <div class="col-lg-4"></div>
    </div>  <!-- row -->
</div>


<!-- Footer -->
<footer class="py-5 bg-dark mt-4">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Gruppe4</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

</body>
</html>
