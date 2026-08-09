<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.abicart.model.User" %>
<%@ page import="com.abicart.model.Product" %>
<%@ page import="com.abicart.dao.ProductDAOImpl" %>

<%
User user=(User)session.getAttribute("user");

if(user==null){
response.sendRedirect("login.jsp");
return;
}

ProductDAOImpl productDAO=new ProductDAOImpl();
List<Product> products=productDAO.getAllProducts();
%>

<!DOCTYPE html>

<html>
<head>
    <title>Products - AbiCart</title>
</head>
<body>

<h1>AbiCart</h1>

<h2>Products</h2>

<%
if(products.isEmpty()){
%>

<p>No products available.</p>

<%
}else{
%>

<table border="1" cellpadding="8">

<tr>
    <th>Name</th>
    <th>Description</th>
    <th>Category</th>
    <th>Price</th>
    <th>Stock</th>
    <th>Action</th>
</tr>

<%
for(Product product:products){
%>

<tr>
    <td><%= product.getName() %></td>
    <td><%= product.getDescription() %></td>
    <td><%= product.getCategory() %></td>
    <td>Rs. <%= product.getPrice() %></td>
    <td><%= product.getStock() %></td>
    <td> <form action="addToCart" method="post"> 
        <input type="hidden" name="productId" value="<%= product.getId() %>"> 
        <button type="submit">Add to Cart</button> </form> </td> 
</tr>

<%
}
%>

</table>

<%
}
%>

<br>

<a href="home.jsp">Back to Home</a>

</body>
</html>
