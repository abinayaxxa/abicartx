<%@ page language="java" %>
<%@ page import="com.abicart.model.User"%>

<%
    User user=(User) session.getAttribute("user");

    if(user==null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html> 

<html> <head> <title>AbiCart - Home</title> </head> <body>

<h1>Welcome to AbiCart</h1>

<p>Login Successful</p>

<h2>Your Profile</h2>

<p><strong>Name:</strong> <%= user.getName() %></p>
<p><strong>Email:</strong> <%= user.getEmail() %></p>
<p><strong>Role:</strong> <%= user.getRole() %></p>
<hr>
<h2>Shopping</h2>

<a href="products.jsp">Browse Products</a>
<%
if("SELLER".equals(user.getRole())){
%>

<hr>

<h2>Seller Menu</h2>

<a href="addProduct.jsp">Add Product</a>

<br><br>

<a href="sellerProducts.jsp">My Products</a>

<%
}
%>

<br><br>

<a href="logout">Logout</a>

</body> </html>