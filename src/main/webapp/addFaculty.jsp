<%--
  Created by IntelliJ IDEA.
  User: Legion
  Date: 22.05.2021
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
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

<%@ include file="view/header.jsp" %>

<br/>
<div  style="width: 100%" class="row justify-content-md-center mt-10"">
    <div class="col col-auto">
        <h1 class="text-center mb-4">Новий факультет</h1>
        <form class="needs-validation m-2" novalidate
              method="post" action="admin">
            <br/>
                <div>
                    <label class="form-text text-muted"
                           for="new_name">Назва</label>
                    <input class="form-control" type="text" name="Name"
                           id="new_name" required>
                    <div class="invalid-feedback">
                        Please enter Faculty Name.
                    </div>
                </div>
                <div>
                    <label class="form-text text-muted"
                           for="new_description">Опис</label>
                    <input class="form-control" type="text" name="Description"
                           id="new_description" required>
                    <div class="invalid-feedback">
                        Please enter Description.
                    </div>
                </div>
                <div>
                    <label class="form-text text-muted"
                           for="new_Count_of_places">Count_of_places</label>
                    <input class="form-control" type="number" name="Count_of_places"
                           id="new_Count_of_places" required>
                    <div class="invalid-feedback">
                        Please enter Count_of_places.
                    </div>
                </div>
                <div>
                    <label class="form-text text-muted"
                           for="new_Count_of_public_places">Count_of_public_places</label>
                    <input class="form-control" type="number" name="Count_of_public_places"
                           id="new_Count_of_public_places" required>
                    <div class="invalid-feedback">
                        Please enter Count_of_places.
                    </div>
                </div>
                <div>
                    <label class="form-text text-muted"
                           for="new_Count_of_paid_places">Count_of_paid_places</label>
                    <input class="form-control" type="number" name="Count_of_paid_places"
                           id="new_Count_of_paid_places" required>
                    <div class="invalid-feedback">
                        Please enter Count_of_places.
                    </div>
                </div>


                <hr>
                <div class="row">
                    <input class="mt-3 ml-3 mr-3 col btn btn-warning"
                           type="submit" value="Додати факультет">
                </div>
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
</html>
