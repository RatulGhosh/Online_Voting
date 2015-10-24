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

<c:if test="${sessionScope.namea eq null}">
    <c:set var="msg" value="Login to continue" scope="request"></c:set>
    <c:redirect url="adminlogin.jsp"/>

</c:if>

<div id="wrapper">
    <header id="top">
        <h1 id ="heading">Login for a Better India<br>
        </h1>
        <nav id="mainnav">
            <ul>
                <li><a href="index.html" >Home</a></li>
                <li><a href="Admin_Module.jsp" class="thispage">Admin Home</a></li>
                <li><a href="Voter.jsp">View Voters</a></li>
                <li><a href="Candidate1.jsp">View Candidates</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </nav>
    </header>
</div>
<br><br>
<center>
    <c:set var="now" value="<%=new java.util.Date()%>" />
    Current time: <fmt:formatDate value="${now}" type="time" />

    <span style="font-family: 'Courier New';">${now}</span><br>
</center>
    <center><h2 style="color: greenyellow"><br>${sessionScope.msga}<hr><br></h2></center>


