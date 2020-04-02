<%--
  Created by IntelliJ IDEA.
  User: miade
  Date: 01-04-2020
  Time: 19:19
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
<body style="background: rgb(184,36,62) linear-gradient(0deg, rgba(184,36,62,1) 0%, rgba(224,202,174,1) 44%)">

<img src="Images/LoginBackground.png" style="border-bottom: 2px solid black;" class="img-fluid" alt="Logo" width="100%" height=auto>

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



<div class="container mt-4">
    <div class="row">
        <div class="col text-center">
            <h1 class="mb-4">Login</h1>
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
            </form>
        </div> <!-- /.colonne 1 -->

        <div class="col text-center">
            <h1 class="mb-4">Registrer</h1>

            <form name="registrer" action="FrontController" method="post">
                <input type="hidden" name="target" value="registrer"/>

                <div class="form-group">
                    <label for="navn">Indtast dit navn:</label>
                    <input type="text" name="navn" class="form-control" id="navn" aria-describedby="navnHelp">
                </div>
                <div class="form-group">
                    <label for="email">Indtast din email:</label>
                    <input type="text" name="email" class="form-control" id="email" aria-describedby="emailHelp">
                </div>
                <div class="form-group">
                    <label for="password1">Indtast dit password:</label>
                    <input type="password" name="password1" class="form-control" id="password1">
                </div>
                <div class="form-group">
                    <label for="password2">Indtast dit password igen:</label>
                    <input type="password" name="password2" class="form-control" id="password2">
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-dark mt-3">Registrer</button>
                </div>
            </form>
        </div> <!-- /.colonne 2 -->
    </div> <!-- /.row -->

    <div class="text-center mt-3">
        <a class="btn btn-outline-dark" href="FrontController?target=redirect&destination=index" role="button">Tilbage til start</a>
    </div>

</div> <!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark mt-5">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Olskers Cupcakes</p>
    </div>
    <!-- /.container -->
</footer>

</body>
</html>
