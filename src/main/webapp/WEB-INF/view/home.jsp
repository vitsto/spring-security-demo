<%--
  Created by IntelliJ IDEA.
  User: Vitalij
  Date: 23.02.2023
  Time: 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>luv2code Company Home Page</title>
</head>
<body>
<h2>luv2code Company Home Page - Yoohoo</h2>
<hr/>
<p>
Welcome to the luv2code company home page
</p>

<hr/>

<%--Display user name and role --%>

<p>
    User: <security:authentication property="principal.username" />
    <br><br>
    Role (s): <security:authentication property="principal.authorities" />
</p>

<security:authorize access="hasRole('MANAGER')">
<%--Add a link to point to /leaders .. this is for the managers--%>
<p>
    <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
    (Only for Manager peeps)
</p>
</security:authorize>
<hr>
<%--Add a link to point to /systems .. this is for the admins--%>

<security:authorize access="hasRole('ADMIN')">
<p>
    <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
    (Only for Admin peeps)
</p>
</security:authorize>

<%--Add a logout button--%>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout" />
</form:form>
</body>
</html>
