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
    <meta charset="UTF-8">
    <title>My Products - AbiCart</title>
    <style>
        *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body{
            background: #f1f3f6;
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
            max-width: 1100px;
            margin: 35px auto;
        }

        .top{
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .title{
            font-size: 28px;
            color: #212121;
        }

        .add-btn{
            background: #ff9f00;
            color: white;
            padding: 12px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
        }

        .add-btn:hover{
            opacity: 0.9;
        }

        .card{
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.10);
            overflow: hidden;
        }

        table{
            width: 100%;
            border-collapse: collapse;
        }

        th{
            background: #f5f5f5;
            padding: 16px;
            text-align: left;
            color: #555;
            border-bottom: 1px solid #ddd;
        }

        td{
            padding: 16px;
            border-bottom: 1px solid #eee;
            color: #333;
        }

        tr:hover{
            background: #fafafa;
        }

        .price{
            font-weight: bold;
            color: #2874f0;
        }

        .stock{
            font-weight: bold;
        }

        .empty{
            background: white;
            padding: 50px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.10);
        }

        .empty h3{
            margin-bottom: 10px;
            color: #333;
        }

        .empty p{
            color: #777;
            margin-bottom: 20px;
        }

        .back{
            display: inline-block;
            margin-top: 25px;
            color: #2874f0;
            text-decoration: none;
            font-weight: bold;
        }

        .back:hover{
            text-decoration: underline;
        }

        @media (max-width: 700px){

            .header{
                padding: 15px 5%;
            }

            .logo{
                font-size: 23px;
            }

            .container{
                width: 95%;
            }

            .top{
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .card{
                overflow-x: auto;
            }

            table{
                min-width: 700px;
            }
        }

    </style>

</head>
<body>

<header class="header">

    <div class="logo">
        AbiCart
    </div>

    <div class="seller">
        Seller: <strong><%= user.getName() %></strong>
    </div>

</header>


<div class="container">

    <div class="top">

        <h2 class="title">
            My Products
        </h2>

        <a href="addProduct.jsp" class="add-btn">
            + Add Product
        </a>

    </div>


    <%
    if(products.isEmpty()){
    %>

        <div class="empty">

            <h3>No Products Yet</h3>

            <p>
                You haven't added any products to AbiCart.
            </p>

            <a href="addProduct.jsp" class="add-btn">
                Add Your First Product
            </a>

        </div>

    <%
    } 
    else{
    %>

        <div class="card">

            <table>

                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                </tr>

                <%
                for (Product product : products){
                %>

                <tr>

                    <td>
                        <strong>
                            <%= product.getName() %>
                        </strong>
                    </td>

                    <td>
                        <%= product.getDescription() %>
                    </td>

                    <td>
                        <%= product.getCategory() %>
                    </td>

                    <td class="price">
                        Rs. <%= product.getPrice() %>
                    </td>

                    <td class="stock">
                        <%= product.getStock() %>
                    </td>

                </tr>

                <%
                }
                %>

            </table>

        </div>

    <%
    }
    %>


    <a href="home.jsp" class="back">
        ← Back to Home
    </a>

</div>

</body>
</html>


