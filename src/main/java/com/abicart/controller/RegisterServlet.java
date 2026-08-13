package com.abicart.controller;

import java.io.IOException;

import com.abicart.dao.UserDAOImpl;
import com.abicart.model.User;
import com.abicart.util.PasswordUtil;

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
        if (!"BUYER".equals(role) && !"SELLER".equals(role)) {
            role="BUYER";
        }
        User user=new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(PasswordUtil.hashPassword(password));
        user.setRole(role);

        UserDAOImpl userDAO=new UserDAOImpl();

        boolean result=userDAO.registerUser(user);

        if(result){
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("register.jsp?error=Registration failed");
        }
    }

}