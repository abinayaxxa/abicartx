package com.abicart.dao;

import com.abicart.model.User;

public interface UserDAO{
    boolean registerUser(User user);

    User loginUser(String email,String password);

    User getUserByEmail(String email);

    boolean deleteUser(int id);    
}
