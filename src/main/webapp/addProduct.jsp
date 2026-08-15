<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

     <meta charset="UTF-8">
    <title>Add Product - AbiCartX</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body{
            background:#f1f3f6;
        }

        .header{
            background: #2874f0;
            color: white;
            padding: 18px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo{
            font-size: 28px;
            font-weight: bold;
        }

        .seller{
            font-size: 15px;
        }

        .container{
            width: 90%;
            max-width: 750px;
            margin: 40px auto;
        }

        .card{
            background: white;
            padding: 35px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.12);
        }

        .title{
            font-size: 25px;
            margin-bottom: 8px;
            color: #212121;
        }

        .subtitle{
            color: #777;
            margin-bottom: 30px;
        }

        .form-group{
            margin-bottom: 20px;
        }

        label{
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        input,
        textarea,
        select{
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
        }

        textarea{
            height: 110px;
            resize: vertical;
        }

        input:focus,
        textarea:focus,
        select:focus{
            outline: none;
            border-color: #2874f0;
        }

        .row{
            display: flex;
            gap: 20px;
        }

        .row .form-group{
            flex: 1;
        }

        .add-btn{
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 4px;
            background: #ff9f00;
            color: white;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
        }

        .add-btn:hover{
            opacity: 0.9;
        }

        .back{
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #2874f0;
            text-decoration: none;
            font-weight: bold;
        }

        .back:hover{
            text-decoration: underline;
        }

        .error{
            background: #ffe5e5;
            color: #d32f2f;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 4px;
        }

        @media (max-width: 600px){
            .header {
                padding: 15px 5%;
            }

            .logo{
                font-size: 23px;
            }

            .container{
                width: 95%;
                margin: 20px auto;
            }

            .card{
                padding: 22px;
            }

            .row{
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
<header class="header">
    <div class="logo">AbiCartX</div>

    <div class="seller">
        Seller: <strong><%= user.getName() %></strong>
    </div>
</header>

<div class="container">

    <div class="card">

        <h2 class="title">Add New Product</h2>

        <p class="subtitle">
            Enter your product details to list it on AbiCartX.
        </p>

        <%
        String error=request.getParameter("error");

        if("failed".equals(error)){
        %>
            <div class="error">
                Failed to add product. Please try again.
            </div>
        <%
        }else if ("invalid".equals(error)){
        %>
            <div class="error">
                Please enter a valid price and stock quantity.
            </div>
        <%
        }
        %>

        <form action="addProduct" method="post">

            <div class="form-group">
                <label>Product Name</label>
                <input type="text" 
                       name="name" 
                       placeholder="Enter product name"
                       required>
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea
                    name="description"
                    placeholder="Describe your product"
                    required></textarea>
            </div>

            <div class="form-group">
                <label>Category</label>
                <select name="category" required>
                    <option value="">Select Category</option>
                    <option value="TOYS">Toys</option>
                    <option value="GIFTS">Gifts</option>
                    <option value="STATIONERY">Stationery</option>
                </select>
            </div>
            <div class="form-group">
                    <label>Product Image URL</label>
                    <input type="url"
                    name="imageUrl"
                    placeholder="https://example.com/product.jpg"
                    required>
            </div>
            
            <div class="row">

                <div class="form-group">
                    <label>Price (Rs.)</label>
                    <input type="number" 
                           name="price" 
                           step="0.01" 
                           min="0" 
                           placeholder="100.00" 
                           required>
                </div>

                <div class="form-group">
                    <label>Stock Quantity</label>
                    <input type="number" 
                           name="stock" 
                           min="0" 
                           placeholder="0" 
                           required>
                </div>
            </div>
            <button type="submit" class="add-btn">Add Product</button>
        </form>
        <a href="home.jsp" class="back">
            ← Back to Home
        </a>
    </div>
        
</div>

</body>
</html>