<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>

<s:setDataSource driver="com.mysql.jdbc.Driver"
                 url="jdbc:mysql://localhost:3306/hpstp15"
                 user="root" password="givemefreedom"/>
${requestScope.name}

<s:update var="ur">
   insert into voter(name,pass,state,address,gender,education) values('${param.name}','${param.pass}',${param.state},'${param.address}','${param.gender}','${param.academics}')
</s:update>
      
    
   <jsp:forward page="login.jsp"/>   
