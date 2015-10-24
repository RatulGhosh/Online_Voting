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
                <li><a href="Candidate_Module.jsp" >Voter Home</a></li>
                <li><a href="EditPassword1.jsp">Change Password</a></li>
                <li><a href="answer.jsp"class="thispage">Answer Questions</a></li>
                <li><a href="LogOut">Logout</a></li>
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
<center><h2 style="color: greenyellow"><br>${requestScope.msg}<hr><br></h2></center>
        <s:query var="rs">
    select *from question where cid='${sessionScope.cid}'
</s:query>
<c:forEach var="data" varStatus="s" items="${rs.rows}">

    <h2 align="center">${data.question}</h2>
    <center>
        <form action="saveans.jsp" method="POST">
            Answer </td><td><textarea rows="3" name="ans" required ></textarea>
            <br><br>
                <input type="submit" value="Answer"  class="button green"/>


        </form>
    </center>

</c:forEach>
