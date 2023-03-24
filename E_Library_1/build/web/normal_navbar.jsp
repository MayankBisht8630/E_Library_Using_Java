<head>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="#"> <span class="fa fa-asterisk"> </span> E Library</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><span class ="fa fa-bar-chart"></span> Library Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class ="fa fa-exclamation-triangle"> </span> Books Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#" onclick="loginfirst();"><span class ="fa fa-graduation-cap2"></span> Fiction Books </a>
                    <a class="dropdown-item " href="#" onclick="loginfirst();"><span class ="fa fa-graduation-cap2"></span> Adventure Stories</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" onclick="loginfirst();"><span class ="fa fa-graduation-cap2"></span> Historical Fiction </a>
                </div>
            <li class="nav-item">
                <a class="nav-link" href="contact.jsp"><span class="fa fa-address-book"></span> Contact</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-plus"></span> Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register_page.jsp"><span class="fa fa-users"></span> Register</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<script>
    function loginfirst()
    {
        swal("Please Login First");
    }
</script>
