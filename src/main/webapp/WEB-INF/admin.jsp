<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="icon" href="img/admin.png" type="image/gif" sizes="16x16">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css\main.css" />
</head>
<body>

<!-- Header -->
<header id="header" class="alt">
    <div class="logo"><a href="index.html">Admin</a></div>
</header>


<!-- Banner -->
<section class="banner full">
    <article>
        <img src="img/photo_bg.jpg" alt="" />
        <div class="inner">
            <header>
                <p>the appearance of our website</p>
                <h2>hello</h2>
            </header>
        </div>
    </article>
    <article>
        <img src="img/photo_bg.jpg" alt="" />
        <div class="inner">
            <header>
                <p>Lorem ipsum dolor sit amet nullam feugiat</p>
                <h2>Magna etiam</h2>
            </header>
        </div>
    </article>
    <article>
        <img src="img/photo_bg.jpg"  alt="" />
        <div class="inner">
            <header>
                <p>Sed cursus aliuam veroeros lorem ipsum nullam</p>
                <h2>Tempus dolor</h2>
            </header>
        </div>
    </article>
    <article>
        <img src="img/photo_bg.jpg"  alt="" />
        <div class="inner">
            <header>
                <p>Adipiscing lorem ipsum feugiat sed phasellus consequat</p>
                <h2>Etiam feugiat</h2>
            </header>
        </div>
    </article>
    <article>
        <img src="img/photo_bg.jpg"  alt="" />
        <div class="inner">
            <header>
                <p>Ipsum dolor sed magna veroeros lorem ipsum</p>
                <h2>Lorem adipiscing</h2>
            </header>
        </div>
    </article>
</section>
<!-- Three -->
<section id="three" class="wrapper style2">
    <div class="inner">
        <div class="gallery">
            <div class="partUser">

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
            </div>
            </div>


        <div class="projectName">
        <div class="image fit ">
        Add project:
        <spring:form action="/admin/addProject" modelAttribute="project" method="post">
        name: <spring:input path="name"/>
        endDate: <form:input type="date" path="endDate"/>
        <input type="submit" value="Save"/><br>
        </spring:form>
        </div>
        </div>

            </div>
    <div class="divTable">
    <table class="tableSize">

        <tr>
            <th>Developer's Name</th>
            <th>Developer's surname</th>
            <th>Developer's email</th>
            <th>Developer's phone</th>
            <th>Developer's role</th>
            <th>Developer's gender</th>
            <th>Edit</th>
            <th>Delete</th>


        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td><a href="/admin">${user.name} </a> </td>
                <td> ${user.surname}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.role}</td>
                <td>${user.gender}</td>
                <td><img src="img/edit.png" alt="edit" class="editIcon"></td>
                <td><img src="img/delete.png" alt="delete" class="deleteIcon"></td>

            </tr>
        </c:forEach>
    </table>
    </div>

</section>


<!-- Footer -->
<footer id="footer">
    <div class="container">
        <ul class="icons">
            <li><a href="https://twitter.com/?lang=en" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="https://www.facebook.com/" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="https://www.instagram.com/?hl=en" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
            <li><a href="https://mail.google.com/mail/u/0/#inbox" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
        </ul>
    </div>
    <div class="copyright">
        &copy; Untitled. All rights reserved.
    </div>
</footer>

<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.scrollex.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>

</body>
</html>
