package com.abicart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.abicart.dao.ProductDAOImpl;
import com.abicart.model.CartItem;
import com.abicart.model.Product;
import com.abicart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException {

    HttpSession session=request.getSession();

    User user=(User)session.getAttribute("user");

    if(user==null){
        response.sendRedirect("login.jsp");
        return;
    }

    String productIdText=request.getParameter("productId");

    try{
        int productId=Integer.parseInt(productIdText);

        ProductDAOImpl productDAO=new ProductDAOImpl();
        Product product=productDAO.getProductById(productId);

        if(product==null){
            response.sendRedirect("products.jsp");
            return;
        }
        List<CartItem> cart=new ArrayList<>();
        Object cartObject=session.getAttribute("cart");

        if(cartObject instanceof List<?>){ 
            for(Object item: (List<?>)cartObject){ 
                if(item instanceof CartItem){ 
                    cart.add((CartItem)item); 
                } 
            } 
        }
        boolean found=false;

        for(CartItem item:cart){
            if(item.getProduct().getId()==productId){
                item.setQuantity(item.getQuantity()+1);
                found=true;
                break;
            }
        }

        if(!found){
            cart.add(new CartItem(product,1));
        }

        session.setAttribute("cart",cart);

        response.sendRedirect("cart.jsp");

    }catch(NumberFormatException e){
        response.sendRedirect("products.jsp");
    }
}

}
