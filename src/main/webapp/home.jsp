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
<html lang="en"> 

<head> 
    <meta charset="UTF-8">
    <title>AbiCartX - Home</title>  

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
            padding: 15px 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .logo{
            width: 150px;
            height: auto;
        }

        .header-right{
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .hello{
            font-weight: bold;
            color: #111b45;
        }

        .logout{
            background: #ff6500;
            color: white;
            padding: 9px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .logout:hover{
            background: #e85b00;
        }

        .main{
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .welcome{
            background: white;
            padding: 35px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .welcome h1{
            color: #111b45;
            margin-bottom: 10px;
        }

        .welcome p{
            color: #777;
            font-size: 16px;
        }

        .success{
            color: #198754;
            font-weight: bold;
        }

        .profile{
            background: white;
            margin-top: 25px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .profile h2{
            color: #111b45;
            margin-top: 0;
        }

        .profile-row{
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }

        .profile-row:last-child{
            border-bottom: none;
        }

        .profile-row strong{
            font-weight: bold;
            display: inline-block;
            width: 80px;
        }

        .role{
            background: #fff0e6;
            color: #ff6500;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .section-title{
            margin-top: 25px;
            color: #111b45;
        }

        .cards{
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card{
            background: white;
            padding: 25px;
            border-radius: 12px;
            flex: 1;
            min-width: 250px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .card h3{
            color: #111b45;
            margin-top: 0;
        }

        .card p{
            color: #777;
            line-height: 1.5;
        }

        .button{
            display: inline-block;
            margin-top: 10px;
            padding: 11px 18px;
            background: #ff6500;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .button:hover{
            background: #e85b00;
        }

        footer{
            text-align: center;
            margin-top: 50px;
            padding: 20px;
            color: #777;
        }

        @media (max-width: 600px){

            .header{
                padding: 15px 20px;
            }

            .hello{
                display: none;
            }

            .cards{
                flex-direction: column;
            }
        }

    </style>
</head>
    
<body>

<header class="header">

    <img
        src="<%= request.getContextPath() %>/images/logo.png"
        alt="AbiCartX Logo"
        class="logo">

    <div class="header-right">

        <span class="hello">
            Hello, <%= user.getName() %>
        </span>

        <a href="logout" class="logout">
            Logout
        </a>

    </div>

</header>

<main class="main"> 
    <section class="welcome">
        <h1>Welcome to AbiCartX</h1>

        <pclass="success">
            Login Successful
        </p>

        <p>
            Welcome back, <strong><%= user.getName() %></strong>!
        </p>

    </section>


    <section class="profile">
    
        <h2>Your Profile</h2>

        <div class="profile-row">
            <strong>Name:</strong>
            <%= user.getName() %>
        </div>

        <div class="profile-row">
            <strong>Email:</strong>
            <%= user.getEmail() %>
        </div>

        <div class="profile-row">
            <strong>Role:</strong>
            <span class="role">
                <%= user.getRole() %>
            </span>
        </div>

    </section>

    <h2 class="section-title">Shopping</h2>

    <div class="cards">

        <div class="card">

            <h3>Browse Products</h3>

            <p>
                Explore products available on AbiCartX
                and find what you're looking for.
            </p>
            
            <a href="products.jsp" class="button">
                Browse Products
            </a>

        </div>
    
    </div>

<%
if("SELLER".equals(user.getRole())){
%>
    
    <h2 class="section-title">Seller Menu</h2>

    <div class="cards">

    <div class="card">

        <h3>Add Product</h3>

        <p>
            Add new products to your AbiCartX store.
        </p>
        
        <a href="addProduct.jsp" class="button">
            Add Product
        </a>

    </div>

    <div class="card">

        <h3>My Products</h3>

        <p>
            View and manage the products you have listed on AbiCartX.
        </p>

        <a href="sellerProducts.jsp" class="button">
            My Products
        </a>

    </div>

</div>

<%
}
%>

<main>

<footer>
     AbiCartX
</footer>

</body> 
</html>