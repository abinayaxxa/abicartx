package com.abicart.dao;

import com.abicart.model.User;

public class UserDAOImpl{

    public boolean registerUser(User user){
        return true;
    }
    public User loginUser(String email,String password){
        return null;
    }
    public User getUserByEmail(String email){
        return null;
    }
    public boolean updateUser(User user){
        return true;
    }
    public boolean deleteUser(int id){
        return true;
    }

}