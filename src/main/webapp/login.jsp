<%--
  Created by IntelliJ IDEA.
  User: Legion
  Date: 17.05.2021
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8"  %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

<%@ include file="header.jsp" %>

<div style="width: 100%" class="row justify-content-md-center mt-5">
    <div class="col col-lg-3">
        <h1 class="text-center mb-4">Sign in</h1>
        <form action="login" method="post">

            <h5 style="color: red"><c:out value="${invalidUserError}"/></h5>

            <label class="form-text text-muted" for="login">Email</label>
            <input placeholder = "Enter Login" class="form-control" type="text" name="login" Id="login">
            <div class="input-group-append">
                <span class="input-group-text">@example.com</span>
            </div>
            <label class="mt-3 form-text text-muted" for="password">Password</label>
            <input class="form-control" type="password" name="password"
                   id="password" placeholder="Enter Password">
            <hr>
            <div class="row">
                <input class="mt-3 ml-3 mr-3 col btn btn-success"
                       type="submit" value="Login">
            </div>

        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>
</html>