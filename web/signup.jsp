<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h1>Sign Up</h1>
    <form action="SignupServlet" method="post">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Sign Up</button>
    </form>
    <p>Already have an account? <a href="index.jsp">Login</a></p>
</body>
</html>