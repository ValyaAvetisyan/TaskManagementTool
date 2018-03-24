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
    <link rel="icon" href="img/user.png" type="image/gif" sizes="16x16">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/mainUser.css" />
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <span class="avatar"><img src="img/sus.jpg" alt="" /></span>
        <h1>Dear Developer<strong>  this is </strong>, your  Tasks<br />
           Good Work</h1>
        <ul class="icons">
            <li><a href="https://twitter.com/?lang=en" ><img src="img/twitter.png" class="iconsimg" alt=""><span class="label">Twitter</span></a></li>
            <li><a href="https://www.facebook.com/" ><img src="img/fb.png" class="iconsimg" alt=""><span class="label">Facebook</span></a></li>
            <li><a href="https://www.instagram.com/?hl=en"><img src="img/insta.png" class="iconsimg" alt=""><span class="label">Instagram</span></a></li>
            <li><a href="https://www.facebook.com/" ><img src="img/500px.png" class="iconsimg" alt=""><span class="label">500px</span></a></li>
            <li><a href="https://mail.google.com/mail/u/0/#inbox"><img src="img/gmail.png" class="iconsimg" alt=""><span class="label">Email</span></a></li>
        </ul>
    </header>

    <!-- Main -->


        <!-- Thumbnails -->

        <section class="thumbnails">
            <c:forEach items="${issues}" var="issue">

            <div>

                    <a href="/user/printIssues?issueId=">${issue.id} </a>
                    ${issue.description}<br>${issue.status}
                    <ul>
                        <a href="/user/issueDetail?id=${issue.id}">more details</a>
                    </ul>
            </div>

            </c:forEach>
        </section>



    <!-- Footer -->
    <footer id="footer">
        <p>&copy; Task Management Tool: By Gayane Valya Susanna .</p>
    </footer>

</div>

<!-- Scripts -->
<script src="js/jquery.min.user.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.user.js"></script>
<script src="js/mainUser.js"></script>

</body>
</html>