<%@ page language="java" %>
<%@ page import="com.abicart.model.User"%>
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
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Product - AbiCart</title>
</head>
<body>

<h1>AbiCart</h1>
<h2>Add Product</h2>

<form action="addProduct" method="post">

    <label>Product Name</label><br>
    <input type="text" name="name" required><br><br>

    <label>Description</label><br>
    <textarea name="description" required></textarea><br><br>

    <label>Category</label><br>
    <select name="category" required>
        <option value="">Select Category</option>
        <option value="TOYS">Toys</option>
        <option value="GIFTS">Gifts</option>
        <option value="STATIONERY">Stationery</option>
    </select><br><br>

    <label>Price</label><br>
    <input type="number" name="price" step="0.01" min="0" required><br><br>

    <label>Stock</label><br>
    <input type="number" name="stock" min="0" required><br><br>

    <button type="submit">Add Product</button>

</form>

<br>

<a href="home.jsp">Back to Home</a>

</body>
</html>