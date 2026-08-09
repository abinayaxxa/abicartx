<%@ page language="java" %>

<!DOCTYPE html>

<html>

<head>

<title>Login</title>

</head>

<body>

<h2>User Login</h2>

<% if ("invalid".equals(request.getParameter("error"))) { %>
    <p>Invalid Email or Password</p>
<% } %>

<form action="login" method="post">

Email

<input type="email" name="email">

<br><br>

Password

<input type="password" name="password">

<br><br>

<input type="submit" value="Login">

</form>

</body>

</html>