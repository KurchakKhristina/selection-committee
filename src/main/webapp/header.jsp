<%--
  Created by IntelliJ IDEA.
  User: Legion
  Date: 17.05.2021
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<div>
    <!--Nav bar-->
    <nav style="margin: 0" class="navbar navbar-expand navbar-darkblue bg-light"> <!--'fixed-top'-->
        <div style="width: 105%" class="row justify-content-between">

            <!--Left elements-->
            <div class="col">
                <div class="d-flex justify-content-start">
                    <div class="site-header-main">
                        <div class="w-auto my-auto d-none d-sm-flex">
                            <ul class="navbar-nav mr-auto">
                                <li style="margin-left: 5px" class="nav-item active">
                                    <div class="wrap clearfix"><a class="site-logo" href="index.jsp"></a></div>
                                </li>
                                <c:if test="${role == 'User'}">
                                <li style="margin-left: 5px" class="nav-item active">
                                    <input class="invisible" value="${userId}">
                                    <a class="btn btn-warning" type="button" href="myCabinetServlet">Мій кабінет</a>
                                </li>
                                </c:if>
                                <c:if test="${role == 'Admin'}">
                                <li style="margin-left: 5px" class="nav-item active">
                                    <a class="btn btn-warning" type="button" href="userList">Список користувачів</a>
                                </li>
                                </c:if>

                        </div>
                    </div>
                </div>
            </div>


            <%--                    <div class="d-flex justify-content-start">--%>
            <%--                        <form class="m-3" action="myCabinetServlet">--%>
            <%--                            <div class="form-group">--%>
            <%--                                <input class="invisible" value="${u_temp.id}">--%>
            <%--                                <input class="btn btn-warning" type="submit" value="Мій кабінет">--%>
            <%--                            </div>--%>
            <%--                        </form>--%>
            <%--                    </div>--%>
            <!-- Center elements -->
            <div class="col">
                <div class="d-flex justify-content-center">
                    <h1 class="site-title"><span>Приймальна
                        Комісія</span></h1>
                </div>
            </div>

            <div class="col">
                <div class="d-flex justify-content-end">
                    <c:choose>
                    <c:when test="${username != null}">

                    <div class="col-2">
                        <div class="d-flex">
                            <form class="m-0" action="logout">
                                <div class="form-group">
                                    <input class="btn btn-warning" type="submit" value="Logout">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-1">
                        <div class="d-flex">

                        </div>
                    </div>

                </div>

                </c:when>
                <c:otherwise>
                    <div class="w-auto my-auto d-none d-sm-flex">
                        <ul class="navbar-nav mr-auto">

                            <li style="margin-left: 5px" class="nav-item active">

                                <!-- Sign in trigger modal -->
                                <button style="font-size: 1rem; border: none" type="button"
                                        class="nav-link mr-4 btn btn-sm" data-toggle="modal"
                                        data-target="#SignInModal">
                                    Sign in
                                </button>

                                <!-- Sign in Modal -->
                                <div class="modal fade" id="SignInModal" tabindex="-1" role="dialog"
                                     aria-labelledby="SignInModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">

                                                <%--Header--%>
                                            <div class="modal-header">
                                                <h5 class="text-center" id="SignInModalLabel">Login</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                                <%--Header end--%>

                                                <%--Body--%>
                                            <div class="modal-body">
                                                <form action="login" method="post">
                                                    <label class="form-text text-muted"
                                                           for="login">Login</label>
                                                    <input class="form-control" type="text" name="login"
                                                           id="login">

                                                    <label class="mt-3 form-text text-muted"
                                                           for="password">Password</label>
                                                    <input class="form-control" type="password" name="password"
                                                           id="password">

                                                    <hr>
                                                    <div class="row">
                                                        <input class="mt-3 ml-3 mr-3 col btn btn-success"
                                                               type="submit" value="Login">
                                                    </div>

                                                </form>
                                            </div>
                                                <%--Body end--%>

                                        </div>
                                    </div>
                                </div>
                                <!-- Sign in Modal end-->
                            </li>

                            <li style="margin-left: 5px" class="nav-item active">

                                <!-- Sign up trigger modal -->
                                <button style="background-color: #33cabb; color: aliceblue; font-weight: bold; font-size: 1rem; border: none"
                                        type="button" class="nav-link button btn-sm"
                                    <%--                                                data-toggle="modal"--%>
                                    <%--                                                data-target="#SignUpModal"--%>
                                >
                                    <a style="color: aliceblue" href="registration.jsp">Sign up</a>
                                </button>

                                <!-- Sign up Modal -->
                                <div class="modal fade" id="SignUpModal" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">

                                                <%--Header--%>
                                            <div class="modal-header">
                                                <h5 class="text-center" id="exampleModalLabel">Create
                                                    Account</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                                <%--Header end--%>

                                                <%--Body--%>
                                            <div class="modal-body">
                                                <form class="needs-validation m-2" novalidate action="register"
                                                      method="post">

                                                    <div>
                                                        <label class="form-text text-muted"
                                                               for="new_login">Login</label>
                                                        <input class="form-control" type="text" name="login"
                                                               id="new_login" required>
                                                        <div class="invalid-feedback">
                                                            Please choose a login.
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <label class="form-text text-muted"
                                                               for="new_password">Password</label>
                                                        <input class="form-control" type="password"
                                                               name="password"
                                                               id="new_password" required>
                                                        <div class="invalid-feedback">
                                                            Please provide a valid password
                                                        </div>
                                                    </div>

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

                                                    <p class="mt-3">Continue as:</p>

                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input"
                                                               id="customer" name="role" value="Customer"
                                                               required>
                                                        <label class="custom-control-label"
                                                               for="customer">Customer</label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-3">
                                                        <input type="radio" class="custom-control-input"
                                                               id="worker" name="role" value="Worker" required>
                                                        <label class="custom-control-label"
                                                               for="worker">Worker</label>
                                                        <div class="invalid-feedback">
                                                            Please choose your role
                                                        </div>
                                                    </div>

                                                    <hr>
                                                    <div class="row">
                                                        <input class="mt-3 ml-3 mr-3 col btn btn-success"
                                                               type="submit" value="Register">
                                                    </div>
                                                </form>

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


                                            </div>
                                                <%--Body end--%>

                                        </div>
                                    </div>
                                </div>
                                <!-- Sign up Modal end-->
                            </li>

                        </ul>
                    </div>

                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</div>
</html>
