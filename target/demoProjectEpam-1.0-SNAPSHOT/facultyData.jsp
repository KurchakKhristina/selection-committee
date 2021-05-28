<%--
  Created by IntelliJ IDEA.
  User: Legion
  Date: 19.05.2021
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>Faculty Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link media="all" rel="stylesheet" href="view/style1.css">

</head>
<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("id") != session.getId()) {
        response.sendRedirect("index.jsp");
    }
%>
<%@ include file="header.jsp" %>
<c:set value="Admin" var="admin"/>
<c:set value="User" var="user"/>
<div class="col-sm-9 col-md-6 " style="margin-top: 40px">
    <div class="col d-flex align-items-center" style="text-align: center">
        <h2 style="text-align: center">${temp_faculty.name}</h2>
    </div>
</div>
<div class="row row-cols-2" style="margin-right: auto; margin-left: auto">
    <div class="col">
        <div class="page-content" style="margin-top: 40px">
            <div class="wrap">
                <div class="tabs-container">
                    <div class="tab info active" id="info" style="display: block">
                        <h4>Про факультет</h4>
                        <p>${temp_faculty.description}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="page-content" style="margin-top: 40px">
            <div class="wrap">
                <div class="tabs-container">
                    <div class="tab info active" id="logo" style="display: block">
                        <div style="background-image: url("
                        ${temp_faculty.logo}")">
                        <img src="${temp_faculty.logo}" alt="">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col">
    <div class="page-content" style="margin-top: 40px">
        <div class="wrap">
            <div class="tabs-container">
                <div class="tab info active" id="count" style="display: block">
                    <h4>Загальна кількість місць</h4>
                    <p>${temp_faculty.count_of_places}</p>
                    <h4>Кількість платних місць</h4>
                    <p>${temp_faculty.count_of_paid_places}</p>
                    <h4>Кількість державних місць</h4>
                    <p>${temp_faculty.count_of_public_places}</p>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
</div>

<div class="col">
    <div class="page-content" style="margin-top: 40px">
        <div class="wrap">
            <div class="tabs-container">
                <div class="tab sub" id="sub" style="display: block">
                    <h4> Предмет для вступу</h4>
                    <div class="col d-flex align-items-left">
                        <table class="table table-hover">
                            <c:forEach items="${subject_list}" var="subject_list">
                                <tbody>
                                <td><c:out value="${subject_list.name}"/></td>
                                </tbody>
                            </c:forEach>
                        </table>
                        <br/>
                        <br/>
                    </div>
                </div>

            </div>
        </div>
    </div>
<%--    <input class="invisible" value="userID">--%>
<%--    <input class="invisible" value="facultyID">--%>
    <c:choose>

    <c:when test="${!applicationExist }">
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <c:if test="${role == user}">
                <div class="bottom-button">
                    <button class="button btn-lg mt-3" style="margin-left: auto" data-toggle="modal"
                            data-target="#new_application">Подати заявку
                    </button>
                </div>
            </c:if>
        </div>
        <br />
        <br />
        <br />
    </div>

    <div class="modal fade" id="new_application" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">

            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Заявка</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <form action="application" method="post" class="needs-validation" novalidate>
                        <div class="form-group">
                            <label class="form-text text-muted">Назва факультету</label>
                            <h2 style="text-align: center">${temp_faculty.name}</h2>

                            <label class="mt-2 form-text text-muted">Предмети для вступу</label>
                            <table class="table table-hover">
                                <c:forEach items="${subject_list}" var="subject">
                                    <tbody>
                                    <td>
                                        <c:out value="${subject.name}"/>
                                        <div class="form-row">
                                            <div class="col">
                                                <input type="number" class="form-control" id="examMark"
                                                       placeholder="Оцінка за екзамен" name="examMark_${subject.id}">
                                            </div>
                                            <div class="col">
                                                <input type="number" class="form-control" id="certificateMark"
                                                       placeholder="Оцінка з атетстату" name="certificateMark_${subject.id}">
                                            </div>
<%--                                            <input class="invisible" name="subjectId" value="${subject.id}">--%>
                                        </div>
                                    </td>
                                    </tbody>
                                </c:forEach>
                            </table>
                        </div>

                        <div class="modal-footer pb-0">
                            <form action="facultyInfo" method="post">
                                <input class="invisible" name="faculty_id" value="${temp_faculty.id}">
                                <input class="btn btn-success" type="submit" value="Save">
                            </form>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    </c:when>
    <c:otherwise>
    <br/>
    <h3>Ви вже подали зявку на цей факультет</h3>
    <br />
    <br />
    <br />
    </c:otherwise>
    </c:choose>
    <c:if test="${role == admin}">
   <br />
   <br />
   <br />
    <div class="row">
        <div class="m-2">
            <button style="margin-right: auto" class="btn btn-warning" data-toggle="modal" data-target="#edit">
                Редагувати факультет
            </button>
        </div>
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Редагувати факультет</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pb-0">
                        <form action="facultyList" method="post">

                            <input type="hidden" name="facultyID" value="<c:out value='${temp_faculty .id}' />"/>

                            <fieldset class="form-group">
                                <label>Назва</label> <input type="text"
                                                            value="<c:out value='${temp_faculty.name}' />"
                                                            class="form-control"
                                                            name="name" required="required">
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Загальна кількість місць</label> <input type="number"
                                                                               value="<c:out value='${temp_faculty.count_of_places}' />"
                                                                               class="form-control"
                                                                               name="count_of_places">
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Кількість державних місць</label> <input type="number"
                                                                                value="<c:out value='${temp_faculty.count_of_public_places}' />"
                                                                                class="form-control"
                                                                                name="count_of_public_places">
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Кількість платних місць</label> <input type="number"
                                                                              value="<c:out value='${temp_faculty.count_of_paid_places}' />"
                                                                              class="form-control"
                                                                              name="count_of_paid_places">
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Опис</label> <input type="text"
                                                           value="<c:out value='${temp_faculty.description}' />"
                                                           class="form-control"
                                                           name="description">
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Посилання на Лого</label> <input type="text"
                                                                        value="<c:out value='${temp_faculty.logo}' />"
                                                                        class="form-control"
                                                                        name="logo">
                            </fieldset>
                            <div class="modal-footer pb-0">
                                <input class="invisible" name="action" value="update">
                                <input class="btn btn-success" type="submit" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="m-2">
            <button class="btn btn-danger" data-toggle="modal" data-target="#delete" style="margin-left: auto">Видалити
                факультет
            </button>
        </div>
        <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Видалити факультет</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body pb-0">
                        <p>Ви дійсно хочете видалити ${faculty_temp.name}?</p>

                    </div>
                    <div class="modal-footer pb-0">
                        <form action="facultyList" method="post">
                            <input type="hidden" name="facultyID" value="<c:out value='${temp_faculty.id}' />"/>
                            <input class="invisible" name="action" value="delete">
                            <input class="btn btn-success" type="submit" value="Видалити">
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
    </div>
    </c:if>

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
