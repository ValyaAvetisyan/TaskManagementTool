<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>TeamLeadPage</title>
    <link rel="icon" href="/img/user.png" type="image/gif" sizes="16x16">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/mainUser.css" />
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <span class="avatar"><img src="/user/image?fileName=${user.picUrl}" alt="" /></span>
        <h1>Dear ${user.name}<strong>  this is </strong>, your  Tasks <br />
            Good Work</h1>
        <ul class="icons">
            <li><a href="https://twitter.com/?lang=en" ><img src="/img/twitter.png" class="iconsimg" alt=""><span class="label">Twitter</span></a></li>
            <li><a href="https://www.facebook.com/" ><img src="/img/fb.png" class="iconsimg" alt=""><span class="label">Facebook</span></a></li>
            <li><a href="https://www.instagram.com/?hl=en"><img src="/img/insta.png" class="iconsimg" alt=""><span class="label">Instagram</span></a></li>
            <li><a href="https://www.facebook.com/" ><img src="/img/500px.png" class="iconsimg" alt=""><span class="label">500px</span></a></li>
            <li><a href="https://mail.google.com/mail/u/0/#inbox"><img src="/img/gmail.png" class="iconsimg" alt=""><span class="label">Email</span></a></li>
        </ul>
    </header>

    <!-- Main -->


    <!-- Thumbnails -->
    <table class="tableSize">

        <tr>
            <th>Developer</th>
            <th>Issue's Name</th>
            <th>Issues's Status</th>
            <th>Edit</th>
            <th>Delete</th>

        </tr>
        <c:forEach items="${issues}" var="issue">
            <tr>
                <td><a href="/teamLead/issues?issueId=">${issue.name} </a> </td>
                <td> ${issue.assignToId.name}</td>
                <td>${issue.status}</td>
                <td><a href="/teamLead/editIssue?id=${issue.id}"><img src="/img/edit.png" alt="edit" class="editIcon"></a></td>
                <td> <a href="/teamLead/deleteIssue?id=${issue.id}"><img src="/img/delete.png" alt="delete" class="deleteIcon"></a></td>
            </tr>
        </c:forEach>
    </table>

    <section class="thumbnails">

        <div class="issueDivTeamLead">
        Add issue
        <spring:form action="/teamLead/addIssue" modelAttribute="issue" method="post">
            reporter: <spring:select path="reporterId" items="${users}" itemLabel="name" class="backCol"/> <br>
            assign to: <spring:select path="assignToId" items="${users}" itemLabel="name" class="backCol"/> <br>
            project: <spring:select path="projectId" items="${projects}" itemLabel="name" class="backCol"/> <br>
            name: <spring:input path="name"/><br>
            description: <spring:input path="description" type="text"/><br>
            status: <br> <form:radiobutton path="status" value="TODO" label="TODO"/><br>
            <form:radiobutton path="status" value="INPROGRESS" label="INPROGRESS"/><br>
            <form:radiobutton path="status" value="DONE" label="DONE"/><br>
            endDate: <form:input type="date" path="endDate"/>
            <input type="submit" value="Save"/><br>
        </spring:form><br>
        </div>
                <div class="projectDivTeamLead">
                    Add project:
                    <spring:form action="/teamLead/addProject" modelAttribute="project" method="post">
                        name: <spring:input path="name"/><br>
                        endDate: <form:input type="date" path="endDate"/>
                        <input type="submit" value="Save"/><br>
                    </spring:form><br><br><br>
                </div>
    </section></div>
    <!-- Footer -->
    <footer id="footer">

    </footer>

</div>

<!-- Scripts -->
<script src="js/jquery.min.user.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.user.js"></script>
<script src="js/mainUser.js"></script>

</body>
</html>
