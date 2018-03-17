<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Admin</title>
</head>
<body>
Add user:
<spring:form action="/admin/addUser" modelAttribute="user" method="post" enctype="multipart/form-data">
    name: <spring:input path="name"/><br>
    surname: <spring:input path="surname"/><br>
    gender: <br> <form:radiobutton path="gender" value="male" label="male"/><br>
    <form:radiobutton path="gender" value="female" label="female"/><br>
    phone: <spring:input path="phone"/><br>
    email: <form:input path="email" type="email"/><br>
    password:<form:input path="password" type="password"/><br>
    type:<br> <form:radiobutton path="role" value="USER" label="USER"/><br>
    <form:radiobutton path="role" value="TEAM_LEAD" label="TEAM_LEAD"/><br>
    <label for="image">Image:</label>
    <input type="file" id="image" name="image"/><br>
    <input type="submit" value="Save"/><br>
</spring:form><br>

Add project:
<spring:form action="/admin/addProject" modelAttribute="project" method="post">
    name: <spring:input path="name"/><br>
    endDate: <form:input type="date" path="endDate"/>
    <input type="submit" value="Save"/><br>
</spring:form><br>

Add issue
<spring:form action="/admin/addIssue" modelAttribute="issue" method="post">
    reporter: <spring:select path="reporterId" items="${users}" itemLabel="name"/> <br>
    assign to: <spring:select path="assignToId" items="${users}" itemLabel="name"/> <br>
    project: <spring:select path="projectId" items="${projects}" itemLabel="name"/> <br>
    <%--<form:select multiple="true" path="projectId">--%>
        <%--<form:options items="${projects}" itemValue="name" itemLabel="name"/>--%>
    <%--</form:select>--%>
    name: <spring:input path="name"/><br>
    description: <input type="text" name="description"><br>
    status: <br> <form:radiobutton path="status" value="TODO" label="TODO"/><br>
   <form:radiobutton path="status" value="INPROGRESS" label="INPROGRESS"/><br>
   <form:radiobutton path="status" value="DONE" label="DONE"/><br>
    endDate: <form:input type="date" path="endDate"/>
    <input type="submit" value="Save"/><br>
</spring:form><br>

</body>
</html>
