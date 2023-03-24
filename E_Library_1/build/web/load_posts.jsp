<%@page errorPage="error_page.jsp" %>
<%@page import ="com.tech.blog.dao.*"%>
<%@page import ="com.tech.blog.helper.*"%>
<%@page import ="com.tech.blog.entities.*"%>
<%@page import ="java.util.List"%>
<div class="row">
<% 
Postdao d = new Postdao(ConnectionProvider.getConnection());

int cid = Integer.parseInt(request.getParameter("cid"));
List<Post> posts = null;
if(cid == 0)
{
 posts = d.getAllPosts();
}
else
{
 posts = d.getPostByCatId(cid);
}
if(posts.size() == 0)
{
out.println("<h1 class='display-3 text-center'> No Posts In This Category !!</h1>");
return;
}
for(Post p :posts)
{
%>
<div class="col-md-6 mt-2">
    <div class="card">
        <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
        <div class="card-body">
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent() %></p>
        </div>
        <div class="card-footer text-center primary-background">
            <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm" >Read More </a>
            <a href="#!" class="btn btn-outline-light btn-sm" ><i class="fa fa-thumbs-o-up"></i><span> 10</span></a>
            <a href="#!" class="btn btn-outline-light btn-sm" ><i class="fa fa-commenting-o"></i><span> 20</span></a>
        </div>
    </div>
</div>
<%
}
%>
</div>