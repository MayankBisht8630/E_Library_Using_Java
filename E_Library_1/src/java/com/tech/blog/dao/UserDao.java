package com.tech.blog.dao;
import com.tech.blog.entities.user;
import java.sql.*;
public class UserDao 
{
    private Connection con;

    public UserDao(Connection con) 
    {
        this.con = con;
    }
    //method to insert user to databse
    public boolean saveUser(user user)
    {
        boolean f = false;
        try
        {
            //user data-base
            String query ="insert into user (name , email , password , gender , about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getGender());
            pstmt.setString(5,user.getAbout());
            
            pstmt.executeUpdate();
            f=true;
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    //get user by user email and uer password
    public user getUserByEmailAndPassword(String email , String password)
    {
        user user = null;
        try 
        {
            String query = "select * from user where email =? and password =? ";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set = pstmt.executeQuery();
            if(set.next())
            {
                user = new user();
                //data from databse
                String name = set.getString("name");
                //set to user object
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setProfile(set.getString("profile"));   
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
     return user; 
    }
    
    public boolean updateUser(user user)
    {
        boolean f = false;
        try
        {
            String query = "update user set name = ? , email = ? , password = ? , gender = ? , about = ? , profile = ? where id = ?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1,user.getName());
            p.setString(2,user.getEmail());
            p.setString(3,user.getPassword());
            p.setString(4,user.getGender());
            p.setString(5,user.getAbout());
            p.setString(6,user.getProfile ());
            p.setInt(7,user.getId());
            
            p.executeUpdate();
            f= true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}
