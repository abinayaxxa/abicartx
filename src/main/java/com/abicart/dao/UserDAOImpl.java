package com.abicart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.abicart.model.User;
import com.abicart.util.DBConnection;

public class UserDAOImpl{

  public boolean registerUser(User user){

    Connection con=DBConnection.getConnection();

    String sql="INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)";

    try{

          PreparedStatement ps=con.prepareStatement(sql);
 
          ps.setString(1, user.getName());
          ps.setString(2, user.getEmail());
          ps.setString(3, user.getPassword());
          ps.setString(4, user.getRole());
  
          int rows=ps.executeUpdate();

          if(rows>0){
              return true;
        
            }
        }
        catch (SQLException e){
        e.printStackTrace();
    }
    return false;
  }
    public User loginUser(String email,String password){

        User user=null;

        try{

            Connection con=DBConnection.getConnection();

            String sql="SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet rs=ps.executeQuery();

            if(rs.next()){

                user=new User();

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));

            }
            rs.close();
            ps.close();
            con.close();
        } 
        catch(SQLException e){
            e.printStackTrace();
        }
        return user;
    }
    public User getUserByEmail(String email){
        return null;
    }
    public boolean updateUser(User user){
        return false;
    }
    public boolean deleteUser(int id){
        return false;
    }

}
