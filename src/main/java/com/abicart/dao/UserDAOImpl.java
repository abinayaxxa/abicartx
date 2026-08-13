package com.abicart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.abicart.model.User;
import com.abicart.util.DBConnection;
import com.abicart.util.PasswordUtil;

public class UserDAOImpl{

  public boolean registerUser(User user){

    String sql="INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)";

    try(Connection con=DBConnection.getConnection();
             PreparedStatement ps=con.prepareStatement(sql)){

          ps.setString(1, user.getName());
          ps.setString(2, user.getEmail());
          ps.setString(3, user.getPassword());
          ps.setString(4, user.getRole());
  
          int rows=ps.executeUpdate();

            return rows>0;
        }
        catch (SQLException e){
        e.printStackTrace();
        return false;
    }
    
  }
    public User loginUser(String email,String password){

        User user=null;

        String sql = "SELECT * FROM users WHERE email=?";
        try(Connection con=DBConnection.getConnection();
             PreparedStatement ps=con.prepareStatement(sql)){

            ps.setString(1, email);

            try(ResultSet rs=ps.executeQuery()){
                if(rs.next()){
                    String hashedPassword = rs.getString("password");
                    
                    if (PasswordUtil.checkPassword(password, hashedPassword)) {
                        
                        user=new User();
 
                        user.setId(rs.getInt("id"));
                        user.setName(rs.getString("name"));
                        user.setEmail(rs.getString("email"));
                        user.setPassword(hashedPassword);
                        user.setRole(rs.getString("role"));
                    }
                }
            }
        
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
