package com.abicart.controller;

import java.io.IOException;
import java.math.BigDecimal;

import com.abicart.dao.ProductDAOImpl;
import com.abicart.model.Product;
import com.abicart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{

        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");

        if(user==null){
            response.sendRedirect("login.jsp");
            return;
        }

        if(!"SELLER".equals(user.getRole())){
            response.sendRedirect("home.jsp");
            return;
        }

        String name=request.getParameter("name");
        String description=request.getParameter("description");
        String category=request.getParameter("category");
        String priceText=request.getParameter("price");
        String stockText=request.getParameter("stock");
        String imageUrl=request.getParameter("imageUrl");

        try{
            BigDecimal price=new BigDecimal(priceText);
            int stock=Integer.parseInt(stockText);

            Product product=new Product();
            product.setSellerId(user.getId());
            product.setName(name);
            product.setDescription(description);
            product.setCategory(category);
            product.setImageUrl(imageUrl);
            product.setPrice(price);
            product.setStock(stock);

            ProductDAOImpl productDAO=new ProductDAOImpl();

            if(productDAO.addProduct(product)){
                response.sendRedirect("sellerProducts.jsp");
            }
            else{
                response.sendRedirect("addProduct.jsp?error=failed");
            }

        }
        catch(NumberFormatException e){
            response.sendRedirect("addProduct.jsp?error=invalid");
        }
    }
}
