<%-- 
    Document   : login
    Created on : Apr 17, 2021, 6:12:11 PM
    Author     : dylan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="css/login_style.css">
</head>

<body>
    <div class="container">
        <div class="login">
            <div class="header">
                <h1>Login</h1>
            </div>
            <div class="main">
                <form action="loginControl" method="POST">
                    <input type="text" required=""  name="Username" placeholder="USERNAME">
                    <br>
                    <input type="password" name="Password" placeholder="PASSWORD" >
                    <br>
                    <input id="remeber" type="checkbox" name="remember">Remember me!
                    <br>
                    <input type="submit" value="LOGIN">
                    <br>
                    <a href="forgotPassWordPage.jsp">Forgot password?</a>
                    <p>${requestScope.mess}</p><br>
                </form>

            </div>
        </div>
        <div class="img">
            <span>
                <h1>Welcome</h1>
                <br>
                <h3>Fall Detection Technology<br>For Basic Security Camera<br>The Power from Artificial Intelligence</h3>
            </span>
        </div>
    </div>
</body>

</html>
