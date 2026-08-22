<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logout - AbiCartX</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-card {
            width: 420px;
            background: white;
            padding: 45px 35px;
            border-radius: 14px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.10);
        }

        .logo {
            width: 110px;
            height: 50px;
            object-fit: contain;
            margin-bottom: 20px;
        }

        .icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        h1 {
            margin: 0 0 10px;
            color: #111b45;
        }

        p {
            color: #777;
            margin-bottom: 28px;
        }

        .home-btn {
            display: inline-block;
            padding: 12px 25px;
            background: #ff6500;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            font-weight: bold;
        }

        .home-btn:hover {
            background: #e85b00;
        }
    </style>
</head>

<body>

<div class="logout-card">

    <img src="<%= request.getContextPath() %>/images/logo.png"
         alt="AbiCartX"
         class="logo">

    <div class="icon">👋</div>

    <h1>Logout Successful</h1>

    <p>You have been safely logged out of AbiCartX.</p>

    <a href="login.jsp" class="home-btn">
        Login Again
    </a>

</div>

</body>
</html>