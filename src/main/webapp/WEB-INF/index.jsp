<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 2/28/2018
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <link rel="icon" href="/img/home.png" type="image/gif" sizes="16x16">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<menu>
    <header class="header">
        <a class="active" href="#home">Home</a>
        <a href="#about">About</a>
        <a href="#contact">Contact</a>
        <a href="/myPage">My Page</a>
        <a href="/login">Login</a>

    </header>
</menu>
<div class="contentbig">
    <div class="allUsers">
        <p>All Users</p>
        <c:forEach items="${users}" var="user"><br>
                    <a href="#">${user.name} ${user.surname}</a>


        </c:forEach></div></div><br>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <div class="slider">
        <ul>
            <li><img src="/img/1.jpg" alt=""></li>
            <li><img class="Guido" src="/img/2.jpg" alt=""/></li>
            <li><img class="Brain"src="/img/3.jpg" alt=""/></li>
            <li><img class="Dennis"src="/img/4.jpg" alt=""/></li>
            <li><img class="Niklaus"src="/img/1.jpg" alt=""/></li>
        </ul>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".slider").each(function () { // обрабатываем каждый слайдер
                var obj = $(this);
                $(obj).append("<div class='nav'></div>");
                $(obj).find("li").each(function () {
                    $(obj).find(".nav").append("<span rel='"+$(this).index()+"'></span>"); // добавляем блок навигации
                    $(this).addClass("slider"+$(this).index());
                });
                $(obj).find("span").first().addClass("on"); // делаем активным первый элемент меню
            });
        });
        function sliderJS (obj, sl) { // slider function
            var ul = $(sl).find("ul"); // находим блок
            var bl = $(sl).find("li.slider"+obj); // находим любой из элементов блока
            var step = $(bl).width(); // ширина объекта
            $(ul).animate({marginLeft: "-"+step*obj}, 500); // 500 это скорость перемотки
        }
        $(document).on("click", ".slider .nav span", function() { // slider click navigate
            var sl = $(this).closest(".slider"); // находим, в каком блоке был клик
            $(sl).find("span").removeClass("on"); // убираем активный элемент
            $(this).addClass("on"); // делаем активным текущий
            var obj = $(this).attr("rel"); // узнаем его номер
            sliderJS(obj, sl); // слайдим
            return false;
        });
    </script>

    <div class="allTasks">
        <p>All Issues</p>
        <c:forEach items="${issues}" var="issue"><br>
        <a href="#">${issue.name}</a>


</c:forEach><br>

</div>

</body>
</html>

