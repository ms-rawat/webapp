<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/mydb" user="root"  password=""/>

<!DOCTYPE html>
<html>
<head>
  <link href="<c:url value="style.css" />" rel="stylesheet">
<title>Registration Form</title>
</head>
<body>
<jsp:include page="nav.html"/>

<div class="form">
<form action="" method="post">

<label for="name">Name:</label>
<input type="text" id="name" name="name"><br>

<label for="email">Email:</label>
<input type="email" id="email" name="email"><br>

<label for="password">Password:</label>
<input type="password" id="password" name="password"><br>

<input type="submit" value="Submit">

</form>
</div>
<c:if test="${param.name != null}">
    <sql:update dataSource="${snapshot}" var="result">
        INSERT INTO data (name, email, password) VALUES (?, ?, ?)
        <sql:param value="${param.name}"/>
        <sql:param value="${param.email}"/>
        <sql:param value="${param.password}"/>
    </sql:update>

   
</c:if>

 <jsp:include page="footer.html"/>

</body>
</html>
