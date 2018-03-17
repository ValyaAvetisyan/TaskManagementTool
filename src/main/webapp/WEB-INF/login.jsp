<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 2/28/2018
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>


<%--<spring:form action="/addAdmin" method="post" >--%>
    <%--email:<spring:input path="email" title="email"/><br>--%>
    <%--password:<spring:input path="password" title="password"/><br>--%>
    <%--<input type="submit" value="ok">--%>
<%--</spring:form>--%>
<div class="loginDiv">
    <p class="loginForAdmin">login for Admin</p><br>

<form action="<c:url value="/loginPage"/> " method="post" name="loginForm">
    <input type="text" placeholder="email" name="j_email"/><br>
    <input type="password" placeholder="password" name="j_password"/><br>
    <button type="submit" class="btn btn-default">Login</button>
</form>
</div>
<br>
</body>
</html>
