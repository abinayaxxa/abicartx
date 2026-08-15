<%@ page language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AbiCart</title>

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
            height: 55px;
            width: auto;
            display: block;
            object-fit: contain;
  }

        .login-btn{
            background: #111b45;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .main{
            min-height: calc(100vh - 75px);
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .welcome{
            background: white;
            width: 500px;
            padding: 45px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.10);
        }

        .welcome h1{
            color: #111b45;
            margin-bottom: 10px;
        }

        .welcome p{
            color: #777;
            margin-bottom: 30px;
        }

        .buttons{
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .button{
            padding: 12px 25px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .register{
            background: #ff6500;
            color: white;
        }

        .login{
            background: #111b45;
            color: white;
        }

        .button:hover{
            opacity: 0.9;
        }

        footer{
            text-align: center;
            padding: 20px;
            color: #888;
        }

        @media (max-width: 600px){
            .header {
                padding: 10px 20px;
            }

            .welcome{
                width: 90%;
                padding: 30px 20px;
            }

            .buttons{
                flex-direction: column;
            }
        }
    </style>

</head>

<body>

<header class="header">
    <div class="logo">
        <img src="<%= request.getContextPath() %>/images/logo.png" alt="AbiCartX Logo">
    </div>

    <a href="login.jsp" class="login-btn">Login</a>
</header>

<main class="main">
    <div class="welcome">
        <h1>Welcome to AbiCartX</h1>
        <p>Your simple and secure online shopping and selling platform.</p>

        <div class="buttons">
            <a href="register.jsp" class="button register">Create Account</a>
            <a href="login.jsp" class="button login">Login</a>
        </div>
    </div>
</main>

<footer>
    AbiCartX
</footer>

</body>
</html>