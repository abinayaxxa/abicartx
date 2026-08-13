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

String keyword=request.getParameter("search");

List<Product>products;

if (keyword != null && !keyword.trim().isEmpty()){
    products=productDAO.searchProducts(keyword);
}
else{
    products=productDAO.getAllProducts();
}

%>

<!DOCTYPE html>

<html>
<head>
    <title>Products - AbiCart</title>
</head>
<body>

<h1>AbiCart</h1>

<h2>Products</h2>

<form action="products.jsp" method="get">

    <input
        type="text"
        name="search"
        placeholder="Search products..."
    >

    <button type="submit">🔎 Search</button>

    <%
        if (keyword != null && !keyword.trim().isEmpty()){
    %>

        <a href="products.jsp">Clear</a>

    <%
        }
    %>

</form>

<br>
<%
if(products.isEmpty()){
%>

<p>No products available.</p>

<%
}else{
%>

<table border="1" cellpadding="8">

<tr>
    <th>Image</th>
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
    <td>
        <img src="<%= product.getImageUrl() %>"
             alt="<%= product.getName() %>"
             width="120"
             height="120"
             style="object-fit: contain;">
    </td>
    <td><%= product.getName() %></td>
    <td><%= product.getDescription() %></td>
    <td><%= product.getCategory() %></td>
    <td>Rs. <%= product.getPrice() %></td>
    <td><%= product.getStock() %></td>
    <td> 
        <form action="addToCart" method="post"> 
            <input type="hidden" 
                   name="productId" 
                   value="<%= product.getId() %>"> 
            <button type="submit">Add to Cart</button> 
        </form> 
    </td> 
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
