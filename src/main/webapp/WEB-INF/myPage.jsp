<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 2/28/2018
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserPage</title>
    <link rel="icon" href="/img/user.png" type="image/gif" sizes="16x16">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="/css/mainUser.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<a href="/loginPage" class="btn btn-info btn-lg">
    <span class="glyphicon glyphicon-log-out"></span> Log out
</a>

<!-- Header -->
<header id="header">
    <span class="avatar"><img src="/user/image?fileName=${user.picUrl}" alt=""/></span>
    <h1>Dear ${user.name}<strong> this is </strong>, your Tasks<br/>
        Good Work</h1>
    <ul class="icons">
        <li><a href="https://twitter.com/?lang=en"><img src="/img/twitter.png" class="iconsimg" alt=""><span
                class="label">Twitter</span></a></li>
        <li><a href="https://www.facebook.com/"><img src="/img/fb.png" class="iconsimg" alt=""><span class="label">Facebook</span></a>
        </li>
        <li><a href="https://www.instagram.com/?hl=en"><img src="/img/insta.png" class="iconsimg" alt=""><span
                class="label">Instagram</span></a></li>
        <li><a href="https://www.facebook.com/"><img src="/img/500px.png" class="iconsimg" alt=""><span class="label">500px</span></a>
        </li>
        <li><a href="https://mail.google.com/mail/u/0/#inbox"><img src="/img/gmail.png" class="iconsimg" alt=""><span
                class="label">Email</span></a></li>
    </ul>
</header>

<!-- Main -->


<!-- Thumbnails -->
<div class="userTableDiv">
<table class="userTableSize">

    <tr>
        <th>Issue's Type</th>
        <th>Issue's Name</th>
        <th>Issue's description</th>
        <th>Issues's Status</th>
        <th>Reporter's name</th>
        <th>Start date</th>
        <th>End date</th>
        <th>Edit</th>

    </tr>
    <c:forEach items="${issues}" var="issue">
        <tr>
            <td style="color: #d0b5cc"><a href="/user/printIssues?issueId=" style="color: #d0b5cc"> ${issue.type}</a></td>
            <td style="color: #d0b5cc"> ${issue.name}</td>
            <td style="color: #d0b5cc"> ${issue.description}</td>
            <td style="color: #d0b5cc">${issue.status}</td>
            <td style="color: #d0b5cc">${issue.reporterId.name}</td>
            <td style="color: #d0b5cc">${issue.createdDate}</td>
            <td style="color: #d0b5cc">${issue.endDate}</td>
            <td style="color: #93d8bd"><a href="/user/issueDetail?id=${issue.id}" style="color:#93d8bd ;">Edit</a></td>
        </tr>
    </c:forEach>
</table>
</div>


<%--<section class="thumbnails">--%>
    <%--<c:forEach items="${issues}" var="issue">--%>
        <%--<div>--%>
            <%--<a href="/user/printIssues?issueId=" class="issueName"></a>--%>
            <%--Issue's type: ${issue.type}<br>--%>
            <%--Name: ${issue.name}<br>--%>
            <%--Issue's description: ${issue.description}<br>--%>
            <%--Issue's status: ${issue.status}<br>--%>
            <%--Reporter's name: ${issue.reporterId.name}<br>--%>
            <%--Start date: ${issue.createdDate}<br>--%>
            <%--End date: ${issue.endDate}<br>--%>

            <%--<ul>--%>
                <%--<a href="/user/issueDetail?id=${issue.id}">more details</a>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</c:forEach>--%>
<%--</section>--%>


<!-- Footer -->
<footer id="footer">
    <p>&copy; Task Management Tool: By Gayane Valya Susanna .</p>
</footer>

</div>

<!-- Scripts -->
<script src="/js/jquery.min.user.js"></script>
<script src="/js/jquery.poptrox.min.js"></script>
<script src="/js/skel.min.user.js"></script>
<script src="/js/mainUser.js"></script>

</body>
</html>