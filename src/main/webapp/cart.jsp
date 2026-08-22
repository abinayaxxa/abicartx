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

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart - AbiCartX</title>

    <style>
        *{
            box-sizing:border-box;
        }

        body{
            margin:0;
            font-family:Arial,sans-serif;
            background:#f4f6f8;
            color:#333;
        }

        .header{
            height:75px;
            background:white;
            padding:10px 45px;
            display:flex;
            align-items:center;
            justify-content:space-between;
            box-shadow:0 2px 10px rgba(0,0,0,0.10);
        }

        .logo img{
            width:110px;
            height:50px;
            object-fit:contain;
            display:block;
        }

        .header-right{
            display:flex;
            align-items:center;
            gap:18px;
        }

        .user-name{
            color:#111b45;
            font-weight:bold;
        }

        .home-btn{
            background:#ff6500;
            color:white;
            padding:9px 18px;
            border-radius:6px;
            text-decoration:none;
            font-weight:bold;
        }

        .home-btn:hover{
            background:#e85b00;
        }

        .container{
            width:92%;
            max-width:1200px;
            margin:35px auto;
        }

        .page-title{
            color:#111b45;
            margin:0 0 8px;
            font-size:32px;
        }

        .subtitle{
            color:#777;
            margin:0 0 25px;
        }

        .cart-layout{
            display:grid;
            grid-template-columns:1fr 320px;
            gap:25px;
            align-items:start;
        }

        .cart-box{
            background:white;
            border-radius:12px;
            box-shadow:0 3px 12px rgba(0,0,0,0.08);
            overflow:hidden;
        }

        .cart-header{
            padding:18px 22px;
            border-bottom:1px solid #eee;
            color:#111b45;
            font-size:18px;
            font-weight:bold;
        }

        .cart-item{
            padding:20px;
            display:grid;
            grid-template-columns:110px 1fr auto;
            gap:20px;
            border-bottom:1px solid #eee;
        }

        .cart-item:last-child{
            border-bottom:none;
        }

        .product-image{
            width:110px;
            height:110px;
            object-fit:contain;
            background:#fafafa;
            border-radius:8px;
            padding:8px;
        }

        .product-name{
            margin:0 0 7px;
            color:#111b45;
            font-size:19px;
        }

        .description{
            color:#777;
            font-size:14px;
            line-height:1.5;
            margin-bottom:8px;
        }

        .category{
            display:inline-block;
            padding:5px 10px;
            background:#f1f3f6;
            color:#555;
            border-radius:15px;
            font-size:12px;
        }

        .price{
            color:#ff6500;
            font-weight:bold;
            font-size:17px;
            margin-top:10px;
        }

        .item-right{
            min-width:150px;
            text-align:right;
        }

        .quantity-label{
            color:#777;
            font-size:13px;
            margin-bottom:7px;
        }

        .quantity-box{
            display:inline-flex;
            align-items:center;
            border:1px solid #ddd;
            border-radius:6px;
            overflow:hidden;
            background:white;
        }

        .quantity-btn{
            width:32px;
            height:32px;
            border:none;
            background:#f1f3f6;
            color:#111b45;
            font-size:18px;
            cursor:pointer;
            font-weight:bold;
        }

        .quantity-btn:hover{
            background:#e5e7eb;
        }

        .quantity{
            width:35px;
            text-align:center;
            font-weight:bold;
        }

        .item-total{
            margin:12px 0;
            font-size:18px;
            font-weight:bold;
            color:#111b45;
        }

        .remove-btn{
            border:none;
            background:none;
            color:#dc3545;
            cursor:pointer;
            font-weight:bold;
            padding:5px;
        }

        .remove-btn:hover{
            text-decoration:underline;
        }

        .summary{
            background:white;
            border-radius:12px;
            padding:25px;
            box-shadow:0 3px 12px rgba(0,0,0,0.08);
            position:sticky;
            top:20px;
        }

        .summary h2{
            color:#111b45;
            margin:0 0 20px;
            font-size:21px;
        }

        .summary-row{
            display:flex;
            justify-content:space-between;
            margin:15px 0;
            color:#666;
        }

        .summary-total{
            border-top:1px solid #eee;
            padding-top:18px;
            margin-top:18px;
            display:flex;
            justify-content:space-between;
            color:#111b45;
            font-size:21px;
            font-weight:bold;
        }

        .checkout-btn{
            width:100%;
            margin-top:20px;
            padding:13px;
            border:none;
            border-radius:6px;
            background:#ff6500;
            color:white;
            font-size:16px;
            font-weight:bold;
            cursor:pointer;
        }

        .checkout-btn:hover{
            background:#e85b00;
        }

        .continue-btn{
            display:block;
            text-align:center;
            margin-top:15px;
            color:#ff6500;
            text-decoration:none;
            font-weight:bold;
        }

        .empty{
            background:white;
            padding:60px 30px;
            text-align:center;
            border-radius:12px;
            box-shadow:0 3px 12px rgba(0,0,0,0.08);
        }

        .empty-icon{
            font-size:55px;
            margin-bottom:15px;
        }

        .empty h2{
            color:#111b45;
            margin:0 0 10px;
        }

        .empty p{
            color:#777;
            margin-bottom:25px;
        }

        .shop-btn{
            display:inline-block;
            padding:11px 22px;
            background:#ff6500;
            color:white;
            border-radius:6px;
            text-decoration:none;
            font-weight:bold;
        }

        .shop-btn:hover{
            background:#e85b00;
        }

        footer{
            text-align:center;
            padding:30px;
            margin-top:30px;
            color:#888;
        }

        @media(max-width:800px){
            .header{
                padding:10px 20px;
            }

            .user-name{
                display:none;
            }

            .cart-layout{
                grid-template-columns:1fr;
            }

            .summary{
                position:static;
            }
        }

        @media(max-width:600px){
            .cart-item{
                grid-template-columns:80px 1fr;
            }

            .product-image{
                width:80px;
                height:80px;
            }

            .item-right{
                grid-column:1 / -1;
                text-align:left;
            }

            .page-title{
                font-size:26px;
            }
        }
    </style>

</head>
<body>

<header class="header">

    <div class="logo">
        <img
            src="<%= request.getContextPath() %>/images/logo.png"
            alt="AbiCartX Logo">
    </div>

    <div class="header-right">
        <span class="user-name">
            Hello, <%= user.getName() %>
        </span>

        <a href="home.jsp" class="home-btn">
            Home
        </a>
    </div>

</header>

<div class="container">

    <h1 class="page-title">My Cart</h1>
    <p class="subtitle">Review your selected toys, gifts and stationery.</p>

<%
if(cart==null || cart.isEmpty()){
%>

    <div class="empty">

        <div class="empty-icon">🛒</div>
        <h2>Your cart is empty</h2>
        <p>
            Looks like you haven't added anything to your cart yet.
        </p>

        <a href="products.jsp" class="shop-btn">
            Browse Products
        </a>

    </div>

<%
}else{
    BigDecimal grandTotal=BigDecimal.ZERO;
%>

    <div class="cart-layout">

        <div class="cart-box">

            <div class="cart-header">
                Cart Items
            </div>
<%
    for(CartItem item:cart){
        BigDecimal total=item.getProduct().getPrice().multiply(BigDecimal.valueOf(item.getQuantity())); 
        grandTotal=grandTotal.add(total);
%>
    
            <div class="cart-item">

                <img
                    src="<%= item.getProduct().getImageUrl() %>"
                    alt="<%= item.getProduct().getName() %>"
                    class="product-image">

                <div>
                    <h2 class="product-name"><%= item.getProduct().getName() %></h2>
                    <div class="description"><%= item.getProduct().getDescription() %></div>
                    <span class="category"><%= item.getProduct().getCategory() %></span>
                    <div class="price">Rs. <%= item.getProduct().getPrice() %></div>
                </div>

                <div class="item-right">

                    <div class="quantity-label">Quantity</div>

                    <form action="updateCart" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">

                        <div class="quantity-box">

                        <button type="submit" name="quantity" value="<%= item.getQuantity()-1 %>" class="quantity-btn">-</button>

                        <span class="quantity"><%= item.getQuantity() %></span>

                        <button type="submit" name="quantity" value="<%= item.getQuantity()+1 %>" class="quantity-btn">+</button>
                        </div>
                    </form>

                    <div class="item-total">
                        Total: Rs. <%= total %>
                    </div>

                    <form action="removeFromCart" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">

                        <button type="submit" class="remove-btn">
                          🗑 Remove
                        </button>
                    </form>

                </div>

            </div>
<%   
    }
%>

    </div>

        <div class="summary">

            <h2>Order Summary</h2>

            <div class="summary-row">
                <span>Items</span>
                <span><%= cart.size() %></span>
            </div>

            <div class="summary-row">
                <span>Delivery</span>
                <span>Free</span>
            </div>

            <div class="summary-total">
                <span>Total</span>
                <span>Rs. <%= grandTotal %></span>
            </div>

            <button
                type="button"
                class="checkout-btn"
                onclick="alert('Checkout will be available soon!')">
                Proceed to Checkout
            </button>

            <a href="products.jsp" class="continue-btn">
                ← Continue Shopping
            </a>

        </div>

    </div>

<%
}
%>

</div>


</body>
</html>
