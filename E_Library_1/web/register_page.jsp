<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!--bootstrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 70% 100%, 28% 90%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background p-5 banner-background ">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            <h5>Register Here !!</h5>
                        </div>

                        <div class="card-body">
                            <form id="reg-form" action ="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name ="user_name" type="text" class="form-control" id="user_name" aria-describedby="userHelp" placeholder="Enter User Name">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name ="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="gender1">Select Gender</label>
                                    <br>
                                    <input name ="gender" type="radio" id="gender" name="gender" value="male">Male
                                    <input name ="gender" type="radio" id="gender" name="gender" value="female">Female
                                    <input name ="gender" type="radio" id="gender" name="gender" value="else">Rather Not To Say
                                </div>
                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="" cols="30" row="5" placeholder="About You !"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name ="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-check">
                                    <input name ="check"type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Terms And Conditions</label>
                                </div>
                                <br>
                                <div class="container text-center " style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h3>Please Wait !!</h3>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary"> Register</button>
                                <a href="login_page.jsp" class="btn btn-primary"> <span class=" fa fa-sign-in"></span> Alredy A User ! </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--java script--> 
        <script
            src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
        <script src="js/myjs.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">

        </script>

        <script>
            $(document).ready(function () {
                console.log("loaded.....")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();

//                    send register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                            console.log(data)
                            $("#submit-btn").show();
                            $("#loader").hide();

                           if(data.trim()=== 'Done')
                           {
                            swal("Register Successful !! Redirect To Login Page")
                                    .then((value) => {
                                        window.location="login_page.jsp"
                                    });
                            }
                            else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            console.log(jqXHR)
                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            swal("Something Went Wrong Try Again")
                                    .then((value) => {
                                        window.location="register_page.jsp"
                                    });
                        },
                        processData: false,
                        contentType: false,
                    });
                });
            });
        </script>
    </body>
</html>
