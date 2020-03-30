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
            <li class="nav-item active">
                <a class="nav-link"> Hello ${sessionScope.email}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="FrontController?target=redirect&destination=kurv"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Kurv</a>
            </li>
        </ul>
    </div>
</nav>