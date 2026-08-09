package com.abicart.controller;

import java.io.IOException;

import com.abicart.dao.UserDAOImpl;
import com.abicart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        String email=request.getParameter("email");
        String password=request.getParameter("password");

        UserDAOImpl userDAO=new UserDAOImpl();

        User user=userDAO.loginUser(email,password);

        if(user!=null){

            HttpSession session=request.getSession();

            session.setAttribute("user",user);

            response.sendRedirect("home.jsp");
 
        }
        else
            response.sendRedirect("login.jsp?error=invalid");
    }

}