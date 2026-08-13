<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %> 
<%@ page import="com.abicart.model.User" %>
<%@ page import="com.abicart.model.CartItem" %>

<%
User user=(User)session.getAttribute("user"); 

if(user==null){ 
    response.sendRedirect("login.jsp"); 
    return; 
} 

Object cartObject=session.getAttribute("cart"); 

List<CartItem> cart=null; 

    if(cartObject instanceof List<?>){ 
        List<?> list=(List<?>)cartObject; 

        boolean valid=true; 

        for(Object item:list){ 
            if(!(item instanceof CartItem)){ 
                valid=false; 
                break; 
            } 
        } 
        if(valid){ 
            cart=(List<CartItem>)list; 
            } 
        }

%>

<!DOCTYPE html>

<html>
<head>
    <title>Cart - AbiCart</title>
</head>
<body>

<h1>AbiCart</h1>

<h2>My Cart</h2>

<%
if(cart==null || cart.isEmpty()){
%>

<p>Your cart is empty.</p>

<%
}else{
%>

<table border="1" cellpadding="8">

<tr>
    <th>Name</th> 
    <th>Description</th>
    <th>Category</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Total</th>
    <th>Action</th>
</tr>

<%
BigDecimal grandTotal=BigDecimal.ZERO;

for(CartItem item:cart){
    BigDecimal total=item.getProduct().getPrice().multiply(BigDecimal.valueOf(item.getQuantity())); 
    grandTotal=grandTotal.add(total);

%>

<tr>
    <td><%= item.getProduct().getName() %></td>
    <td><%= item.getProduct().getDescription() %></td>
    <td><%= item.getProduct().getCategory() %></td>
    <td>Rs. <%= item.getProduct().getPrice() %></td>
    <td>
        <form action="updateCart" method="post" style="display:inline;">
            <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">

            <button type="submit" name="quantity" value="<%= item.getQuantity()-1 %>">-</button>

            <%= item.getQuantity() %>

            <button type="submit" name="quantity" value="<%= item.getQuantity()+1 %>">+</button>
        </form>
    </td>
    
    <td>Rs. <%= total %></td>
    <td> 
       <form action="removeFromCart" method="post" style="display:inline;">
       <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">

      <button type="submit">
        Remove </button>
      </form> 
    </td> 
</tr>

<%
}
%>

<tr> 
    <td colspan="3"><strong>Grand Total</strong></td> 
    <td colspan="2"><strong>Rs. <%= grandTotal %></strong></td> 
</tr>

</table>

<%
}
%>

<br>

<a href="products.jsp">Continue Shopping</a>

<br><br>

<a href="home.jsp">Back to Home</a>

</body>
</html>
