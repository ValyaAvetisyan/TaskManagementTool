<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 2/28/2018
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

Add project:
<spring:form action="/teamLead/addProject" modelAttribute="project" method="post">
    name: <spring:input path="name"/><br>
    endDate: <form:input type="date" path="endDate"/>
    <input type="submit" value="Save"/><br>
</spring:form><br>

Add issue
<spring:form action="/teamLead/addIssue" modelAttribute="issue" method="post">
    reporter: <spring:select path="reporterId" items="${users}" itemLabel="name"/> <br>
    assign to: <spring:select path="assignToId" items="${users}" itemLabel="name"/> <br>
    project: <spring:select path="projectId" items="${projects}" itemLabel="name"/> <br>
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
