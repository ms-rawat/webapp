 <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="style.css" />" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <jsp:include page="nav.html"/>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/mydb" user="root"  password=""/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * FROM data;
</sql:query>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td>${row.id}</td>
            <td>${row.name}</td>
            <td>${row.email}</td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="footer.html"/>
</body>
</html>