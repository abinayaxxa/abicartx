package com.abicart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{

    protected void doGet(HttpServletRequest request,HttpServletResponse response)
            throws IOException,ServletException{

        response.setContentType("text/html");

        PrintWriter out=response.getWriter();

        out.println("<h1>Welcome to AbiCartX App</h1>");
    }

}