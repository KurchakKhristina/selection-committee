<%@ page contentType="text/html;charset=utf-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: legion
  Date: 15/05/2021
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>Registration</title>
    <link rel="stylesheet" href="view/style1.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<%@ include file="header.jsp" %>

<br/>
<div style="width: 100%" class="row justify-content-md-center mt-10">
    <div class="col col-auto">
        <h1 class="text-center mb-4">Registration</h1>
        <form class="needs-validation m-2" novalidate
              method="post" action="register">
            <br/>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">Person</span>
                </div>
                <input class="form-control" type="text" placeholder="Last Name" name="lastName"
                       id="new_lastName" required>
                <div class="invalid-feedback">
                    Please enter Last Name.
                </div>
                <input type="text" class="form-control" placeholder="First Name" name="firstName"
                       id="new_firstName" required>
                <div class="invalid-feedback">
                    Please enter First Name.
                </div>
                <input class="form-control" type="text" placeholder="Surname" name="surName"
                       id="new_surName" required>
                <div class="invalid-feedback">
                    Please enter Surname.
                </div>
            </div>
            <br/>
            <div class="input-group mb-3">
                <%--                <label class="form-text text-muted"--%>
                <%--                       for="new_login">Email</label>--%>
                <%--                <hr>--%>
                <input class="form-control" type="text" placeholder="Email" name="email"
                       id="new_login" aria-describedby="basic-addon2" required>
                <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">@example.com</span>
                </div>
                <div class="invalid-feedback">
                    Please enter Email.
                </div>
            </div>
            <div>
                <p style="color: #ff0000"><c:out value="${emailError}"/></p>
            </div>
            <div>
                <label class="form-text text-muted"
                       for="new_city">City</label>
                <input class="form-control" type="text" name="city"
                       id="new_city" required>
                <div class="invalid-feedback">
                    Please enter your City.
                </div>
            </div>
            <div>
                <label class="form-text text-muted"
                       for="new_region">Region</label>
                <input class="form-control" type="text" name="region"
                       id="new_region" required>
                <div class="invalid-feedback">
                    Please enter your Regoin.
                </div>
            </div>
            <div>
                <label class="form-text text-muted"
                       for="new_studyPlace">Study Place</label>
                <input class="form-control" type="text" name="studyPlace"
                       id="new_studyPlace" required>
                <div class="invalid-feedback">
                    Please enter Study Place.
                </div>
            </div>
            <div>
                <label class="form-text text-muted"
                       for="new_password">Password</label>
                <input class="form-control" type="password"
                       name="password"
                       id="new_password" required>
                <small class="text-muted">Please, provide a password minimum 8 characters, at least one letter and one
                    number</small>
                <div class="invalid-feedback">
                    Please provide a valid password
                </div>
            </div>
<%--            <div class="form-group">--%>
<%--                <label for="new_inputStream">Example file input</label>--%>
<%--                <input type="file" class="form-control-file" id="new_inputStream">--%>
<%--            </div>--%>
            <div>
                <label class="form-text text-muted"
                       for="new_password1">Confirm Password</label>
                <input class="form-control" type="password"
                       name="password1"
                       id="new_password1" required>
                <div class="invalid-feedback">
                    Please provide a valid password
                </div>
            </div>
            <div>
                <p style="color: red"><c:out value="${passwordEqualityError}"/></p>
                <p style="color: red"><c:out value="${passwordValidationError}"/></p>
            </div>

            <hr>
            <div class="row">
                <input class="mt-3 ml-3 mr-3 col btn btn-warning"
                       type="submit" value="Register">
            </div>

        </form>
    </div>
</div>

<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

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
<footer class="bg-dark text-center text-white "> <!--'fixed-bottom'-->
    <!-- Grid container -->
    <div class="container p-2">
        <!-- Section: Social media -->
        <section class="mb-2">
            <!-- Facebook -->

            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button">
                <i  class="fab fa-facebook-f"></i>
            </a>

            <!-- Twitter -->
            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button"
            ><i class="fab fa-twitter"></i
            ></a>

            <!-- Google -->
            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button"
            ><i class="fab fa-google"></i
            ></a>

            <!-- Instagram -->
            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button"
            ><i class="fab fa-instagram"></i
            ></a>

            <!-- Linkedin -->
            <a class="btn btn-outline-light btn-circle m-1" href="#" role="button"
            ><i class="fab fa-linkedin-in"></i
            ></a>

        </section>

    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2021 Copyright:
        <a class="text-white" href="/">SmartOwl.com</a>
    </div>
    <!-- Copyright -->
</footer>
</html>
