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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products - AbiCartX</title>

    <style>

        *{
            box-sizing: border-box;
        }

        body{
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            color: #333;
        }

        .header{
            background: white;
            height: 75px;
            padding: 10px 45px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            box-shadow: 0 2px 10px rgba(0,0,0,0.10);
        }

        .logo img{
            width: 110px;
            height: 50px;
            object-fit:contain;
            display: block;
        }

        .header-right{
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-name{
            color: #111b45;
            font-weight: bold;
        }

        .home-btn{
            background: #ff6500;
            color: white;
            padding: 9px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .home-btn:hover{
            background: #e85b00;
        }

        .container{
            width: 92%;
            max-width: 1200px;
            margin: 35px auto;
        }

        .page-title{
            color: #111b45;
            margin-bottom: 20px;
        }

        .search-box{
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .search-form{
            display: flex;
            gap: 10px;
        }

        .search-input{
            flex: 1;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .search-input:focus{
            outline: none;
            border-color: #ff6500;
        }

        .search-btn{
            padding: 12px 22px;
            border: none;
            border-radius: 6px;
            background: #ff6500;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .search-btn:hover{
            background: #e85b00;
        }

        .clear-btn{
            display: inline-block;
            margin-top: 12px;
            color: #ff6500;
            text-decoration: none;
            font-weight: bold;
        }

        .products-grid{
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 22px;
        }

        .product-card{
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .product-card:hover{
            transform: translateY(-4px);
            box-shadow: 0 7px 20px rgba(0,0,0,0.14);
        }

        .product-image{
            width: 100%;
            height: 210px;
            object-fit: contain;
            background: #fafafa;
            padding: 15px;
        }

        .product-info{
            padding: 20px;
        }

        .product-name{
            color: #111b45;
            font-size: 19px;
            margin: 0 0 10px;
        }

        .description{
            color: #777;
            font-size: 14px;
            line-height: 1.5;
            min-height: 42px;
        }

        .category{
            display: inline-block;
            margin: 10px 0;
            padding: 5px 10px;
            background: #f1f3f6;
            color: #555;
            border-radius: 15px;
            font-size: 12px;
        }

        .price{
            color: #ff6500;
            font-size: 20px;
            font-weight: bold;
            margin: 10px 0;
        }

        .stock{
            color: #198754;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .cart-btn{
            width: 100%;
            padding: 11px;
            border: none;
            border-radius: 6px;
            background: #ff6500;
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        .cart-btn:hover{
            background: #e85b00;
        }

        .empty{
            background: white;
            padding: 50px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .empty h3{
            color: #111b45;
        }

        .empty p{
            color: #777;
        }

        footer{
            text-align: center;
            padding: 30px;
            margin-top: 40px;
            color: #888;
        }

        @media(max-width: 600px){

            .header{
                padding: 10px 20px;
            }

            .user-name{
                display: none;
            }

            .search-form{
                flex-direction: column;
            }

            .products-grid{
                grid-template-columns: 1fr;
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

    <h1 class="page-title">
        Browse Products
    </h1>

    <div class="search-box">
        <form action="products.jsp" method="get">

    <input
        type="text"
        name="search"
        class="search-input"
        placeholder="Search products..."
        value="<%= keyword != null ? keyword : "" %>">

    <button type="submit" class="search-btn">🔎 Search</button>
    </form>
    <%
        if (keyword != null && !keyword.trim().isEmpty()){
    %>

        <a href="products.jsp" class="clear-btn">Clear</a>

    <%
        }
    %>

    </div>
    <%
    if(products.isEmpty()){
    %>

    <div class="empty">

            <h3>No Products Available</h3>

            <p>
                We couldn't find any products matching your search.
            </p>

        </div>

    <%
    }
    else{
    %>

        <div class="products-grid">

        <%
        for(Product product : products){
        %>

            <div class="product-card">

                <img
                    src="<%= product.getImageUrl() %>"
                    alt="<%= product.getName() %>"
                    class="product-image">


                <div class="product-info">

                    <h2 class="product-name">
                        <%= product.getName() %>
                    </h2>


                    <div class="description">
                        <%= product.getDescription() %>
                    </div>


                    <span class="category">
                        <%= product.getCategory() %>
                    </span>


                    <div class="price">
                        Rs. <%= product.getPrice() %>
                    </div>


                    <div class="stock">
                        Stock: <%= product.getStock() %>
                    </div>


                    <form action="addToCart" method="post">

                        <input
                            type="hidden"
                            name="productId"
                            value="<%= product.getId() %>">

                        <button
                            type="submit"
                            class="cart-btn">

                            🛒 Add to Cart

                        </button>

                    </form>

                </div>

            </div>

        <%
        }
        %>

        </div>

    <%
    }
    %>

</div>

</body>

</html>