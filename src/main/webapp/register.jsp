<%@ page language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<title>Register</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container{
            width: 400px;
            margin: 60px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }
        
        .logo-container{
            text-align: center;
            margin-bottom: 15px;
        }

        .logo{
            width: 180px;
            height: auto;
            display: block;
            margin: 0 auto;
        }

        h2{
            text-align: center;
            margin-bottom: 25px;
        }

        label{
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input,
        select{
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input:focus,
        select:focus {
            outline: none;
            border-color: #ff6500;
        }

        button{
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover{
            background: #0056b3;
        }

        .error{
            margin-top: 15px;
            color: red;
            text-align: center;
        }

        .login{
            text-align: center;
            margin-top: 20px;
        }

        .login a{
            color: #ff6500;
            font-weight: bold;
            text-decoration: none;
        }

        .login a:hover{
            text-decoration: underline;
        }
    </style>

</head>

<body>
    <div class="container">
        <div class="logo-container">
           <img src="<%= request.getContextPath() %>/images/logo.png" alt="AbiCartX Logo" class="logo">
        </div>

        <h2>Create Account</h2>
        <%
            String error = request.getParameter("error");
            if (error != null && !error.isBlank()){
        
        %>
            <div class="error">
                <%= error %>
            </div>
        <%
            }
        %>

    <form action="register" method="post" autocomplete="off">

        <label for="name">Name</label>
        <input
                type="text"
                id="name"
                name="name"
                required
                autocomplete="off">

        <label for="email">Email</label>
        <input
                type="email"
                id="email"
                name="email"
                required
                autocomplete="off">

        <label for="password">Password</label>
        <input
                type="password"
                id="password"
                name="password"
                required
                autocomplete="new-password">

        <label for="role">Role</label>
        <select id="role" name="role" required>
            <option value="BUYER">BUYER</option>
            <option value="SELLER">SELLER</option>
        </select>

        <button type="submit">Register</button>
    </form>

    <div class="login">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

</div>

</body>

</html>