<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>

<s:setDataSource driver="com.mysql.jdbc.Driver"
                 url="jdbc:mysql://localhost:3306/hpstp15"
                 user="root" password="givemefreedom"/>

<s:update var="ur">
    insert into question values('${sessionScope.vid}','${requestScope.question}','${sessionScope.cid}')
</s:update>
    
    <jsp:forward page="User_Module.jsp"/>   
