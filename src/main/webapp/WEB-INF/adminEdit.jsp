<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Edit</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/vendor/noui/nouislider.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="/css/mainIssue.css" />
    <link rel="stylesheet" href="/css/util.css" />
    <!--===============================================================================================-->
</head>
<body>

<div class="container-contact100">
    <div class="wrap-contact100">
        <%--contact100-form validate-form--%>
            <%--<spring:form action="/admin/addUser" modelAttribute="user" method="post" enctype="multipart/form-data">--%>
                <%--name: <spring:input path="name"/><br>--%>
                <%--surname: <spring:input path="surname"/><br>--%>
                <%--gender: <br> <form:radiobutton path="gender" value="male" label="male"/><br>--%>
                <%--<form:radiobutton path="gender" value="female" label="female"/><br>--%>
                <%--phone: <spring:input path="phone"/><br>--%>
                <%--email: <form:input path="email" type="email"/><br>--%>
                <%--password:<form:input path="password" type="password"/><br>--%>
                <%--type:<br> <form:radiobutton path="role" value="USER" label="USER"/><br>--%>
                <%--<form:radiobutton path="role" value="TEAM_LEAD" label="TEAM_LEAD"/><br>--%>
                <%--<label for="image">Image:</label>--%>
                <%--<input type="file" id="image" name="image"/><br>--%>
                <%--<input type="submit" value="Save"/><br>--%>
            <%--</spring:form><br>--%>

        <spring:form action="/admin/updateUser" modelAttribute="user" method="post">
            <div class="wrap-input100 bg1 rs1-wrap-input100">
                name: <spring:input path="name" class="input100" /><br>
            </div>
            <div class="wrap-input100 bg1 rs1-wrap-input100">
                surname: <spring:input path="surname" class="input100" /><br>
            </div>
            <div class="wrap-input100 bg1 rs1-wrap-input100">
                phone: <spring:input path="phone" class="input100" /><br>
            </div>
            <div class="wrap-input100 bg1 rs1-wrap-input100">
                type: ${user.role} <br>
                <form:radiobutton path="role" value="USER" label="USER"
                                  checked="${user.role == 'USER' ? 'checked' : '' }"/><br>
                <form:radiobutton path="role" value="TEAM_LEAD" label="TEAM_LEAD"
                                  checked="${user.role == 'TEAM_LEAD' ? 'checked' : '' }"/><br>

                <input type="hidden" value="${user.id}" name="id">
            </div><br>

    </div>


    <input type="submit" value="Save"/><br>
    </spring:form><br>
</div>

<br>




<%--<div class="container-contact100-form-btn">--%>
<%--<button class="contact100-form-btn">--%>
<%--<span>--%>
<%--Submit--%>
<%--<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>--%>
<%--</span>--%>
<%--</button>--%>
<%--</div>--%>

<!--===============================================================================================-->
<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/vendor/bootstrap/js/popper.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/vendor/select2/select2.min.js"></script>
<script>
    $(".js-select2").each(function(){
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });


        $(".js-select2").each(function(){
            $(this).on('select2:close', function (e){
                if($(this).val() == "Please chooses") {
                    $('.js-show-service').slideUp();
                }
                else {
                    $('.js-show-service').slideUp();
                    $('.js-show-service').slideDown();
                }
            });
        });
    })
</script>
<!--===============================================================================================-->
<script src="/vendor/daterangepicker/moment.min.js"></script>
<script src="/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="/vendor/noui/nouislider.min.js"></script>
<script>
    var filterBar = document.getElementById('filter-bar');

    noUiSlider.create(filterBar, {
        start: [ 1500, 3900 ],
        connect: true,
        range: {
            'min': 1500,
            'max': 7500
        }
    });

    var skipValues = [
        document.getElementById('value-lower'),
        document.getElementById('value-upper')
    ];

    filterBar.noUiSlider.on('update', function( values, handle ) {
        skipValues[handle].innerHTML = Math.round(values[handle]);
        $('.contact100-form-range-value input[name="from-value"]').val($('#value-lower').html());
        $('.contact100-form-range-value input[name="to-value"]').val($('#value-upper').html());
    });
</script>
<!--===============================================================================================-->
<script src="/js/mainIssue.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
</script>
</body>

</html>