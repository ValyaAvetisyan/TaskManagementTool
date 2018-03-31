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
    <title>Issue Detail</title>
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

            <spring:form action="/user/updateIssue" modelAttribute="issue" method="post">
                reporter: <spring:select path="reporterId" items="${users}" itemLabel="name" class="wrap-input100 validate-input bg1"/> <br>
            </div>
            <div class="wrap-input100 validate-input bg1 rs1-wrap-input100">
                assign to: <spring:select path="assignToId" items="${users}" itemLabel="name" value="${issue.assignToId}" class="input100"/> <br>
            </div>

            <div class="wrap-input100 bg1 rs1-wrap-input100">
                project: <spring:select path="projectId" items="${projects}" itemLabel="name" class="input100" /> <br>
            </div>
                <div class="wrap-input100 bg1 rs1-wrap-input100">
                name: <spring:input path="name" class="input100" /><br>
                </div>
                <div class="wrap-input100 bg1 rs1-wrap-input100">
                description: <spring:input path="description" type="text" class="input100" /><br>
                </div>
                <div class="wrap-input100 bg1 rs1-wrap-input100">
                status: ${issue.status} <br>
                <form:radiobutton path="status" value="TODO" label="TODO"
                                  checked="${issue.status == 'TODO' ? 'checked' : '' }"/><br>
                <form:radiobutton path="status" value="INPROGRESS" label="INPROGRESS"
                                  checked="${issue.status == 'INPROGRESS' ? 'checked' : '' }"/><br>
                <form:radiobutton path="status" value="DONE" label="DONE"
                                  checked="${issue.status == 'DONE' ? 'checked' : '' }"/><br>
                <spring:hidden path="${issue.id}" name="id"/>
                    </div><br>
    <div class="wrap-input100 bg1 rs1-wrap-input100">
        endDate: <form:input type="date" path="endDate"/>
    </div>
                <input type="submit" value="Save"/><br>
            </spring:form><br>


</div>


            <div class="wrap-input100 validate-input bg0 rs1-alert-validate" data-validate = "Please Type Your Message">
                <span class="label-input100">Comment</span>
                <spring:form action="/user/issue/addComment" modelAttribute="comment" method="post">
                    <spring:textarea path="text" class="input100"/>
                    <spring:hidden path="issueId"/>
                    <input type="submit" value="Save"/><br>
                </spring:form>
            </div>

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