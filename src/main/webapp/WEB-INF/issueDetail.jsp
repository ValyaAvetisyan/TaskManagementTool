<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 3/19/2018
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Status</title>
</head>
<body>
<spring:form action="/user/updateIssue" modelAttribute="issue" method="post">
    reporter: <spring:select path="reporterId" items="${users}" itemLabel="name"/> <br>
    assign to: <spring:select path="assignToId" items="${users}" itemLabel="name" value="${issue.assignToId}"/> <br>
    project: <spring:select path="projectId" items="${projects}" itemLabel="name"/> <br>
    name: <spring:input path="name"/><br>
    description: <spring:input path="description" type="text"/><br>
    status: ${issue.status} <br>
    <form:radiobutton path="status" value="TODO" label="TODO"
                      checked="${issue.status == 'TODO' ? 'checked' : '' }"/><br>
    <form:radiobutton path="status" value="INPROGRESS" label="INPROGRESS"
                      checked="${issue.status == 'INPROGRESS' ? 'checked' : '' }"/><br>
    <form:radiobutton path="status" value="DONE" label="DONE"
                      checked="${issue.status == 'DONE' ? 'checked' : '' }"/><br>

    <input type="hidden" value="${issue.id}" name="id">
    <input type="submit" value="Save"/><br>
</spring:form><br>


<spring:form action="/user/issue/addComment" modelAttribute="comment" method="post">
    <spring:textarea path="text"/>

    <spring:hidden path="issueId"/>
    <input type="submit" value="Save"/><br>
</spring:form>

</body>
</html>
