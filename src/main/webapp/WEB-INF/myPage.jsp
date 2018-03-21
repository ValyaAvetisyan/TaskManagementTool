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
    <link href="/css/style.css" rel="stylesheet">
    <title>My Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<center>
    <header class="header">
        <a class="active" href="#home">Home</a>
        <a href="#" class="scroll-down" address="true">>About</a>
        <a href="#contact">Contact</a>
        <a href="/myPage">My Page</a>
        <a href="/login">Login</a>

    </header>
</center>
<div class="centerMyPage">
    <div class="myTasksDiv">
        <%--<div class="UserStatusDiv"><p>show status </p>--%>
            <%--<c:forEach items="${issues}" var="issue">--%>
                <%--<a href="/user/printIssues?issueId=${issue.id}"> </a>--%>

                <%--${issue.name}--%>
                <%--${issue.status}--%>
                <%--<a href="/user/editStatus?id=${issue.id}">edit</a>--%>
                <%--<br>--%>
            <%--</c:forEach>--%>

        </div>
    </div>
    <div class="comment">
        <%--<div class="taskDiv">--%>
            <p>selected task from all tasks</p>

            <c:forEach items="${issues}" var="issue">
                <a href="/user/printIssues?issueId=${issue.id}}"> </a>
                ${issue.name}${issue.status}
                <ul>
                    <a href="/user/issueDetail?id=${issue.id}">more details</a>
                    <%--<li><a href="/user/issueDetails?id=${issue.id}"> more details </a> </li>--%>
                </ul>
            </c:forEach>
        </div>
        <div class="commentDiv">
<textarea rows="4" cols="50" name="comment" form="userform" class="textAreaDiv">
Enter text here...</textarea></div>

            <c:forEach items="${comments}" var="comment"><br>
                <a href="/user/addComment=${comment.text}}"></a>
            </c:forEach>


            </textarea>
            <button type="submit" class="btn btn-default">Send</button>
    </div>
    </div>
    <div class="allUsersDiv"><p>print all users</p>
        <c:forEach items="${users}" var="user"><br>
            <a href="#">${user.name} ${user.surname}</a>


        </c:forEach></div>
    <div></div>

</div>

</body>
</html>
