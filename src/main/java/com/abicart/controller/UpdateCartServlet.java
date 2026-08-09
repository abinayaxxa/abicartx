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

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException {

        HttpSession session=request.getSession();

        try {

            int productId=Integer.parseInt(request.getParameter("productId"));
            int quantity=Integer.parseInt(request.getParameter("quantity"));

            Object cartObject=session.getAttribute("cart");

            if(cartObject instanceof List<?> list){

                for(Object object:list){

                    if(object instanceof CartItem item){

                        if(item.getProduct().getId()==productId){

                            if(quantity<=0){
                                list.remove(item);
                            }else{
                                item.setQuantity(quantity);
                            }

                            break;
                        }
                    }
                }

                session.setAttribute("cart",list);
            }

        }catch(NumberFormatException e){

        }

        response.sendRedirect("cart.jsp");
    }
}
