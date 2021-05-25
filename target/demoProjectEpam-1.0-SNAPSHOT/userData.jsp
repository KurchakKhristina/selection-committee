<%--
  Created by IntelliJ IDEA.
  User: Legion
  Date: 22.05.2021
  Time: 13:23
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
    if (session.getAttribute("id") != session.getId()  ) {
        response.sendRedirect("index.jsp");
    }
%>
<%@ include file="header.jsp" %>
<div class="col-sm-9 col-md-6 " style="margin-top: 40px">
    <div class="col d-flex align-items-center" style="text-align: center">
        <h2 style="text-align: center">Абітурієнт №${temp_user.id}</h2>
    </div>
</div>
<div class="row">
    <div class="col-sm-6" style="margin-left: 60px">
        <div class="page-content" style="margin-top: 40px">
            <div class="wrap">
                <div class="tabs-container">
                    <div class="tab info active" id="info" style="display: block">
                        <h4>ПIБ</h4>
                        <p>${temp_user.lastName}  ${temp_user.firstName} ${temp_user.surName}</p>
                        <h4>Місто, область</h4>
                        <p>${temp_user.city}, ${temp_user.region}</p>
                        <h4>Кількість платних місць</h4>
                        <p>${temp_user.studyPlace}</p>
                        <h4>Заблокований(так/ні)</h4>
                        <c:if test="${temp_user.blocked == 0}">
                            <p>Ні</p>
                        </c:if>
                        <c:if test="${temp_user.blocked == 1}">
                            <p>Так</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="bottom-button">
        <c:if test="${temp_user.blocked == 0}">
        <button class="btn btn-info mt-3" data-toggle="modal" data-target="#block">Заблокувати</button>
            <div class="modal fade" id="block" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">

                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title">Заблокувати користува</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body pb-0">
                            <p>Ви дійсно хочете заблокувати користува ?</p>

                        </div>
                        <div class="modal-footer pb-0">
                            <form action="UserInfo">
                                <input type="hidden" name="userID" value="<c:out value='${temp_user.id}' />"/>
                                <input class="invisible" name="isBlocked" value="block">
                                <input class="btn btn-success" type="submit" value="Заблокувати">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${temp_user.blocked == 1}">
        <button class="btn btn-info mt-3" data-toggle="modal" data-target="#feedback">Розблокувати</button>
        </c:if>

    </div>
</div>
</body>
