<%--
  Created by IntelliJ IDEA.
  User: Legion
  Date: 17.05.2021
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link media="all" rel="stylesheet" href="view/style1.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

</head>
<body>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if (session.getAttribute("id") != session.getId()) {
        response.sendRedirect("index.jsp");
    }
%>
<%@ include file="header.jsp" %>
<div class="section" id="home">
    <c:if test="${temp_user.blocked == 0}">
        <div class="row">
            <div class="center">
                <a href="#faculty" class="button button2 btn-lg scroll-btn" data-target="#faculty">Обрати факультет</a>
            </div>
        </div>
        <div class="section" id="faculty">
            <div class="m-2">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <td>Назва</td>
                        <td>Кількість місць</td>
                    </tr>
                    </thead>
                    <c:forEach items="${faculty_list}" var="faculty_list">
                        <tbody>
                        <tr>
                            <c:url var="facultyLink" value="facultyInfo">
                                <c:param name="facultyID" value="${faculty_list.id}"/>
                            </c:url>

                            <td>
                                <a style="text-decoration: blue" href="${facultyLink}">
                                    <button class="btn btn-light but">
                                            ${faculty_list.name}
                                    </button>
                                </a>
                            </td>
                            <td><c:out value="${faculty_list.count_of_places}"/></td>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>

            </div>
        </div>

    </c:if>
</div>
<c:if test="${temp_user.blocked != 0}">
        <div class="row">
            <div class="center " >
                    <div class="col d-flex align-items-center bg-danger text-white" style="text-align: center">
                        <h2 class="text-center" style="margin-left:50px;text-align: center">Ви не можете переглянти дані.
                            Ваш акаунт заблоковано адміністратором!</h2>
                    </div>
                </div>
            </div>
</c:if>
</body>
</html>

