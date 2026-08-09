package com.abicart.controller;

import java.io.IOException;
import java.util.List;

import com.abicart.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        HttpSession session=request.getSession();

        String productIdText=request.getParameter("productId");

        try{

            int productId=Integer.parseInt(productIdText);

            Object cartObject=session.getAttribute("cart");

            if(cartObject instanceof List<?>){

                List<?> list=(List<?>)cartObject;

                list.removeIf(item ->
                    item instanceof CartItem &&
                    ((CartItem)item).getProduct().getId()==productId
                );

                session.setAttribute("cart",list);
            }

            response.sendRedirect("cart.jsp");

        }catch(NumberFormatException e){

            response.sendRedirect("cart.jsp");
        }
    }
}

