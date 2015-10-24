<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="res/Site.css"/>


<s:setDataSource driver="com.mysql.jdbc.Driver"
                 url="jdbc:mysql://localhost:3306/hpstp15"
                 user="root" password="givemefreedom"/>
<c:if test="${sessionScope.namea eq null}">
    <c:set var="msg" value="Login to continue" scope="request"></c:set>
    <c:redirect url="adminlogin.jsp"/>

</c:if>

<s:query var="rs">
    select *from candidate
</s:query>
<div id="wrapper">
    <header id="top">
        <h1 id ="heading">Login for a Better India<br>
        </h1>
        <nav id="mainnav">
            <ul>
                <li><a href="index.html" >Home</a></li>
                <li><a href="Admin_Module.jsp">Admin Home</a></li>
                <li><a href="Voter.jsp">View Voters</a></li>
                <li><a href="Candidate1.jsp" class="thispage">View Candidates</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </nav>
    </header>
</div>
<h2 align="center">
    <img src="res/students.jpg" width="50" height="50"/>
    CANDIDATE LIST
</h2>
<table align="center" border="1" width="900">

    <tr class="gridheader" >
        <th>NAME</th>
        <th>AGE</th>
        <th>QUALIFICATION</th>
        <th>PROMISE</th>
    </tr>
    <c:forEach var="data" varStatus="s" items="${rs.rows}">
        <c:if test="${s.count%2 != 0}">
            <tr class="gridrow">
                <td align="center">${data.name}</td>
                <td align="center">${data.age}</td>
                <td align="center">${data.education}</td>
                <td align="center">${data.promise}</td>

            </tr>
        </c:if>    
        <c:if test="${s.count%2 != 1}">
            <tr class="gridrow">
                <td align="center">${data.name}</td>
                <td align="center">${data.age}</td>
                <td align="center">${data.education}</td>
                <td align="center">${data.promise}</td>

            </tr>
        </c:if>   
    </c:forEach>  

</table> 
