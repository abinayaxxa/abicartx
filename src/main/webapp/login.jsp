<%@ page language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login - AbiCartX</title>

    <style>
        *{
            box-sizing: border-box;
        }

        body{
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container{
            width: 400px;
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }

        .logo-container{
            text-align: center;
            margin-bottom: 10px;
        }

        .logo{
            width: 180px;
            height: auto;
        }

        h2{
            text-align: center;
            color: #111b45;
            margin: 10px 0 25px;
        }

        .subtitle{
            text-align: center;
            color: #777;
            margin-bottom: 25px;
        }

        label{
            display: block;
            margin-top: 15px;
            margin-bottom: 6px;
            font-weight: bold;
            color: #333;
        }

        input[type="email"],
        input[type="password"]{
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="email"]:focus,
        input[type="password"]:focus{
            outline: none;
            border-color: #ff6500;
        }

        .login-button{
            width: 100%;
            margin-top: 25px;
            padding: 13px;
            border: none;
            border-radius: 6px;
            background: #ff6500;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-button:hover{
            background: #e85b00;
        }

        .error{
            background: #ffe5e5;
            color: #d00000;
            padding: 10px;
            border-radius: 6px;
            text-align: center;
            margin-bottom: 15px;
        }

        .register{
            text-align: center;
            margin-top: 22px;
            color: #555;
        }

        .register a{
            color: #ff6500;
            font-weight: bold;
            text-decoration: none;
        }

        .register a:hover{
            text-decoration: underline;
        }
    </style>

</head>

<body>

<div class="login-container">

    <div class="logo-container">
        <img
            src="<%= request.getContextPath() %>/images/logo.png"
            alt="AbiCartX Logo"
            class="logo">
    </div>

    <h2>User Login</h2>

    <div class="subtitle">
        Login to your AbiCartX account
    </div>

    <%
        if ("invalid".equals(request.getParameter("error"))) {
    %>

        <div class="error">
            Invalid Email or Password
        </div>

    <%
        }
    %>

    <form action="login" method="post">

        <label for="email">Email</label>

        <input
            type="email"
            id="email"
            name="email"
            placeholder="Enter your email"
            required>


        <label for="password">Password</label>

        <input
            type="password"
            id="password"
            name="password"
            placeholder="Enter your password"
            required>


        <button type="submit" class="login-button">
            Login
        </button>

    </form>

    <div class="register">
        Don't have an account?
        <a href="register.jsp">Create Account</a>
    </div>

</div>

</body>

</html>