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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
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
    if (session.getAttribute("id") != session.getId() || !session.getAttribute("role").equals("User")) {
        response.sendRedirect("index.jsp");
    }
%>
<%@ include file="header.jsp" %>
<div class="col-sm-9 col-md-6 " style="margin-top: 40px">
    <div class="col d-flex align-items-center" style="text-align: center">
        <h2 style="text-align: center">Абітурієнт №${temp_user.id}</h2>
    </div>
</div>
<div class="row row-cols-2">
    <div class="col-sm-4" style="margin-left: 60px">
        <div class="page-content" style="margin-top: 40px">
            <div class="wrap">
                <div class="tabs-container">
                    <div class="tab info active" id="info" style="display: block">
                        <h4>ПIБ</h4>
                        <p>${temp_u.lastName} ${temp_u.firstName} ${temp_u.surName}</p>
                        <h4>Місто, область</h4>
                        <p>${temp_u.city}, ${temp_u.region}</p>
                        <h4>Місце навчання</h4>
                        <p>${temp_u.studyPlace}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-8" style="margin-left: 60px">
        <div class="page-content" style="margin-top: 40px">
            <div class="wrap">
                <div class="tabs-container">
                    <div class="tab info active" style="display: block">
                        <h4>Я подала заявки на факультети:</h4>
                        <div class="m-2">
<%--                            <c:forEach items="${f_temp}" var="f_list">--%>

                            <table class="table table-hover">
                                    <tbody>
                                    <td>Факультет управління фінансами та бізнесу</td>
                                        <td><c:out value="${f_list}"/></td>
                                    </tbody>
<%--                                </c:forEach>--%>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
