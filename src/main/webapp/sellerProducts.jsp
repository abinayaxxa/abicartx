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

if(!"SELLER".equals(user.getRole())){
    response.sendRedirect("home.jsp");
    return;
}

ProductDAOImpl productDAO=new ProductDAOImpl();
List<Product> products=productDAO.getProductsBySeller(user.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Products - AbiCart</title>
</head>
<body>

<h1>AbiCart</h1>
<h2>My Products</h2>

<a href="addProduct.jsp">Add Product</a>
<br><br>

<%
if(products.isEmpty()){
%>

<p>No products added yet.</p>

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