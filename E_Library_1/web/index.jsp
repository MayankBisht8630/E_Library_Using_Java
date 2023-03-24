<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E Libray</title>
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .back-img
            {
                background: url("img_main/books.jpg");
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .banner-background{
               clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 70% 100%, 28% 90%, 0 100%, 0 0);
            }
        </style>  
    </head>
    <body>

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--banner-->
        <div class="container-fluid-0 m-0  ">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3 text-center"> Welcome To Library!! </h3>
                    <p> A library is a place where books and sources of information are stored. They make it easier for people to get access to them for various purposes </p>
                    <p> Libraries play a vital role in providing people with reliable content. They encourage and promote the process of learning and grasping knowledge. <br>The book worms can get loads of books to read from and enhance their knowledge. Moreover, the variety is so wide-ranging that one mostly gets what they are looking for. </p>
                    <button class="btn btn-outline-light btn-lg"> <span class="fa fa-send"></span> Library Management </button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class=" fa fa-sign-in fa-spin"></span> LogIn </a>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"> <span class=" fa fa-user-circle fa-spin"></span> Register </a>
                </div>
            </div>
        </div>

        <!--cards-->
        <div class ="container">
            <div class="row mb-2">
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 18rem; height: 600px">
                        <img class="card-img-top" src="books_images/bhagvad gita.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Bhagavad Gita </h5>
                            <p class="card-text"><h6> Author Name :<br> Veda-Vyasa </h6></p>
                            <a href="register_page.jsp" class="btn primary-background text-white"> More Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                   <div class="card" id="main" style="width: 18rem; height: 600px" >
                        <img class="card-img-top" src="books_images/ramayan.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Ramayana </h5>
                            <p class="card-text"><h6> Author Name :<br> Valmiki </h6></p>
                         <br>
                            <a href="register_page.jsp" class="btn primary-background text-white"> More Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 18rem; height: 600px">
                        <img class="card-img-top" src="books_images/mahabharat.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Mahabharata </h5>
                            <p class="card-text"><h6> Author Name :<br> Veda-Vyasa </h6> </p>
                            <a href="register_page.jsp" class="btn primary-background text-white">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 18rem; height: 600px">
                        <img class="card-img-top" src="books_images/carol.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> The Christmas Carol </h5>
                            <p class="card-text"><h6> Author Name :<br> Charles Dickens</h6></p>
                            <a href="register_page.jsp" class="btn primary-background text-white">More Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 18rem; height: 600px">
                        <img class="card-img-top" src="books_images/don.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Don Quixote </h5>
                            <p class="card-text"><h6> Author Name :<br>Miguel de Cervantes</h6></p>
                         <br>
                         <br>
                            <a href="register_page.jsp" class="btn primary-background text-white">More Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="card" id="main" style="width: 18rem; height: 600px">
                        <img class="card-img-top" src="books_images/pride.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"> Pride and Prejudice </h5>
                            <p class="card-text"><h6> Author Name :<br>Jane Austen </h6> </p>
                        <br>
                        <br>
                        <br>
                        <a href="register_page.jsp" class="btn primary-background text-white">More Details</a>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    

        <!--Java Script-->
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
        <script src="js/myjs.js" type="text/javascript"></script>
        

    </body>
</html>
