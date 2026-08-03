package com.abicart.controller;

import java.io.IOException;

import com.abicart.dao.UserDAOImpl;
import com.abicart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String role=request.getParameter("role");

        User user=new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);

        UserDAOImpl userDAO=new UserDAOImpl();

        boolean result=userDAO.registerUser(user);

        if(result)
            response.getWriter().println("Registration Successful");
        else
            response.getWriter().println("Registration Failed");

    }

}