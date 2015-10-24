<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="res/Site.css"/>
<title>
    Online Pooling : ADMIN LOGIN
</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">


<div id="wrapper">
    <header id="top">
        <h1 id ="heading">Login for a Better India<br>
        </h1>
        <nav id="mainnav">
            <ul>
                <li><a href="index.html" >Home</a></li>
                <li><a href="candidatelogin.jsp">Candidate Login</a></li>
                <li><a href="login.jsp">Voter Login</a></li>
                <li><a href="register.jsp">Voter Registration</a></li>
                <li><a href="adminlogin.jsp"class="thispage">Admin Login</a></li>
            </ul>
        </nav>
    </header>
</div>

<hr>
<center>
    <pre>
     <img src="res/login.png" width="50" height="50"/> <font size="5">LOGIN HERE</font>
<form action="autha" method="POST">
    Login ID : <input type="text" name="name"/>
   
    Password : <input type="password" name="pass"/>
    <hr>
    <h4 style="color: red">${requestScope.msg}</h4>
    
    <input class="button green" type="submit" value="Login"/> <input class="button red" type="reset"/>
</form>
    </pre>
</center>
