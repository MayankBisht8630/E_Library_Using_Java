<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.tech.blog.entities.*" %>
<%@page import ="com.tech.blog.dao.*" %>
<%@page import ="com.tech.blog.helper.*" %>
<%@page import ="com.tech.blog.servlet.*" %>
<%@page import ="java.util.*" %>
<%@page errorPage = "error_page.jsp" %>
<%
    user user =(user) session.getAttribute("currentuser");
    if(user == null)
    {
      response.sendRedirect("login_page.jsp");
}   
%>
<% int postId = Integer.parseInt(request.getParameter("post_id")); 
   Postdao d = new Postdao(ConnectionProvider.getConnection());
   Post p = d.getPostByPostId(postId);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || E Library By Mayank Bisht</title>
        <!--css-->
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
         <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="#"> <span class="fa fa-asterisk"> </span> E Library</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class ="fa fa-bar-chart"></span>Library Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class ="fa fa-exclamation-triangle"> </span> Books Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#"><span class ="fa fa-graduation-cap2"></span> Fiction Books </a>
                            <a class="dropdown-item" href="#"><span class ="fa fa-graduation-cap2"></span> Adventure Books</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><span class ="fa fa-graduation-cap2"></span> Historical Books</a>
                        </div>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> Add Books</a>
                    </li>
                </ul>
                <ul class = "navbar-nav nr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-users"></span> <%= user.getName() %></a>
                    </li> 

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> LogOut</a>
                    </li>    
                </ul>
            </div>
        </nav>
        <!--End of navber-->
        
<!--        main content of body-->
        <div class ="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center">
                            <h4><%= p.getpTitle() %></h4>
                        </div>
                        
                        <div class="card-body text-center">
                            <p><h4>Written By : <%= p.getpContent() %></h4></p>
                            <br>
                            <br>
                            <h5><p><%= p.getpCode() %></p></h5>
                        </div>
                        
                        <div class ="card-footer text-center">
                            <a href="profile.jsp" class="btn btn-outline-light btn-lg primary-background"> <span class=" fa fa-hand-o-left"></span> Back </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end content of main body-->
        
        <!-- Profile Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white ">
                    <h5 class="modal-title" id="exampleModalLabel">E Library !!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img src ="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50% ; max-width: 180px;">
                    <br>
                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>

                    <!--details-->
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">ID :</th>
                                    <td><%= user.getId() %></td>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Status :</th>
                                    <td><%= user.getAbout() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!--Profile Edit-->
                    <div id="profile-edit" style ="display: none;">
                        <h3 class="mt-2">Please Edit Carefully !!</h3>
                        <form action="EditServlet" method ="post" enctype="multipart/form-data">
                            <table class="text-center">
                                <tr>
                                    <td>Id :</td>
                                    <td> <%= user.getId() %></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type ="text" class="form-control" name="user_name" value ="<%= user.getName() %>"></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input class="form-control" type ="email" name="user_email" value ="<%= user.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type ="password" class="form-control" name="user_password" value ="<%= user.getPassword() %>"></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td>
                                        <textarea rows="2" class="form-control" name="user_about" ><%= user.getAbout() %></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>New Profile Photo :</td>
                                    <td>
                                        <input type="file" name="image" class="form-control">  
                                    </td>
                                </tr>
                            </table>
                            <div class ="container text-center mt-3">
                                <button type ="submit" class="btn btn-outline-primary"> Save </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id ="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <!--End of Profile Modal-->

    <!--add post modal-->
    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="add-post-form" action="AddPostServlet" method ="post">
                        <div class="form-group"> 
                            <select class="form-control" name="cid">
                                <option selected disabled>--Select Category--</option>
                                <% 
                                    Postdao postd = new Postdao(ConnectionProvider.getConnection());
                                ArrayList<Category> list = postd.getAllCategories();
                                for(Category c:list)
                                {
                                %>
                                <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control" />
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="pContent" style="height:200px;" placeholder="Enter Your Content"></textarea>
                        </div>
                        <div class="form-group">
                            <textarea name="pCode" class="form-control" style="height:200px;" placeholder="Enter Your Program (if any)"></textarea>
                        </div>
                        <div class="form-group" >
                            <label>Select Your File :</label>
                            <br>
                            <input type="file" name="pic"/>
                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary">Post </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--end of add post model-->

    <!--Java Script-->
    <script
        src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>        
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"> </<script>
            <script src="js/myjs.js" type="text/javascript"></scrip    t>
      
            <  script >
                    $(docu ment).r   e a d  y(fu n ction () {

        let editStatus = false;
$('#edit-profile-button').click(function () {
if (editStatus == false)
{
$("#profile-details").hide();
$("#profile-edit").show();
editStatus = true;
$(this).text("Back")
} else
{
$("#profile-details").show();
$("#profile-edit").hide();
editStatus = false;
$(this).text("Edit")
}
})

        });         </script>

        <!--now add post js-->
        <script>
        $(document).ready(function (e) {$("#add-post-form").on("submit", function (event) {
            //this code runs when form is submitted..
event.preventDefault();
console.log("You Have clicked on submit");
let form = new FormData(this);
//requesting the server
$.ajax({
url: "AddPostServlet",
        type: "POST",
        data: form,
        success: function (data, textStatus, jqXHR) {
        //success   
        console.log(data);
        if (data.trim() == 'done')
        {
        swal("Good job!", "Saved Successfully !!", "success");
        }
        else
        {
        swal("Opps !", "Something Went Wrong !!", "error");
        }
        },
        error: function (jqXHR, tetStatus, errorThrown) {
        //error
        swal("Opps !", "Something Went Wrong !!", "error");
        }, processData: false,
        contentType: false

        })
        })
            })
            </script>
    </body>
</html>
