<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="res/Site.css"/>


<s:setDataSource driver="com.mysql.jdbc.Driver"
                 url="jdbc:mysql://localhost:3306/hpstp15"
                 user="root" password="givemefreedom"/>

<link rel="stylesheet" href="res/Site.css"/>
<title>
    Voter : Home Page
</title>

<div id="wrapper">
    <header id="top">
        <h1 id ="heading">Login for a Better India<br>
        </h1>
        <nav id="mainnav">
            <ul>
                <li><a href="index.html" >Home</a></li>
                <li><a href="User_Module.jsp" >Voter Home</a></li>
                <li><a href="EditPassword.jsp">Change Password</a></li>
                <li><a href="Candidate.jsp"class="thispage">View Candidates</a></li>
                <li><a href="LogOut">Logout</a></li>
            </ul>
        </nav>
    </header>
</div>
<br><br><br><br><br>
<center>
    <form action="saveques.jsp" method="POST">
        Question : <textarea rows="4" name="question" required ></textarea><br><br><br>
        <input class="button green" type="submit" value="Submit"/> <input class="button red" type="reset"/>
    </form>
</center>
id:${sessionScope.cid}
