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
<c:set value="page" var="page_param"/>
<c:set value="sort" var="sort_param"/>
<c:set value="order" var="order_param"/>
<c:if test="${role != null}">
    <c:url value="facultyList" var="link">
        <c:param name="${page_param}" value="${param.get(page_param)}"/>
        <c:param name="${sort_param}" value="${param.get(sort_param)}"/>
        <c:param name="${order_param}" value="${param.get(order_param)}"/>
    </c:url>
</c:if>


<c:choose>
    <c:when test="${user_list.blocked == 0}">
<%--        <div class="section" id="home">--%>
<%--            <div class="row">--%>
<%--                <div class="center">--%>
<%--                    <c:if test="${role=='User'}">--%>
<%--                        <a href="#faculty" class="button button2 btn-lg scroll-btn" data-target="#faculty">Обрати--%>
<%--                            факультет</a>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${role=='Admin'}">--%>
<%--                        <a href="#faculty" class="button button2 btn-lg scroll-btn" data-target="#faculty">Список--%>
<%--                            факультетів</a>--%>
<%--                    </c:if>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="section" id="faculty">--%>
            <div class="m-2">

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <c:if test="${role != null}">
                            <th>
                                Назва
                                <jsp:include page="fragments/sorting.jsp">
                                    <jsp:param name="sort" value="name"/>
                                </jsp:include>
                            </th>
                        </c:if>
                        <th>
                            Кількість місць
                            <c:if test="${role != null}">
                                <jsp:include page="fragments/sorting.jsp">
                                    <jsp:param name="sort" value="count_of_place"/>
                                </jsp:include>
                            </c:if>
                        </th>
                        <th>
                            Кількість державних місць
                            <c:if test="${role != null}">
                                <jsp:include page="fragments/sorting.jsp">
                                    <jsp:param name="sort" value="count_of_public_place"/>
                                </jsp:include>
                            </c:if>
                        </th>
                    </tr>
                    </thead>
                        <tbody>
                    <c:forEach items="${faculty_list}" var="faculty_list">
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
                            <td><c:out value="${faculty_list.count_of_public_places}"/></td>
                        </tr>
                    </c:forEach>
                        </tbody>
                </table>
            </div>
<%--        </div>--%>
    </c:when>
    <c:otherwise>
        <div class="row">
            <div class="center ">
                <div class="col d-flex align-items-center bg-danger text-white" style="text-align: center">
                    <h2 class="text-center" style="margin-left:50px;text-align: center">Ви не можете переглянти дані.
                        Ваш акаунт заблоковано адміністратором!</h2>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<nav aria-label="Page navigation example">
    <ul class="mt-2 pagination justify-content-center">
        <%--@elvariable id="pages" type="java.lang.Integer"--%>

        <%--Control current page--%>
        <c:set value="${param.get('page')}" var="current_page"/>

        <%--First page--%>
        <jsp:include page="fragments/pagination.jsp">
            <jsp:param name="servlet" value="${servlet}"/>
            <jsp:param name="page" value="1"/>
            <jsp:param name="name" value="First"/>
        </jsp:include>

        <%--Disable 'Previous' page--%>
        <c:if test="${current_page == 1}">
            <c:set value="disabled" var="disabled_previous"/>
        </c:if>

        <%--Previous page--%>
        <jsp:include page="fragments/pagination.jsp">
            <jsp:param name="disable_pr" value="${disabled_previous}"/>
            <jsp:param name="servlet" value="${servlet}"/>
            <jsp:param name="page" value="${current_page - 1}"/>
            <jsp:param name="name" value="Previous"/>
        </jsp:include>

        <%--All pages--%>
        <c:forEach begin="1" end="${pages}" varStatus="loop">
            <jsp:include page="fragments/pagination.jsp">
                <jsp:param name="servlet" value="${servlet}"/>
                <jsp:param name="page" value="${loop.index}"/>
                <jsp:param name="name" value="${loop.index}"/>
            </jsp:include>
        </c:forEach>

        <%--Disable 'Next' page--%>
        <c:if test="${current_page == pages}">
            <c:set value="disabled" var="disabled_next"/>
        </c:if>

        <%--Next page--%>
        <jsp:include page="fragments/pagination.jsp">
            <jsp:param name="disable_next" value="${disabled_next}"/>
            <jsp:param name="servlet" value="${servlet}"/>
            <jsp:param name="page" value="${current_page + 1}"/>
            <jsp:param name="name" value="Next"/>
        </jsp:include>

        <%--Last page--%>
        <jsp:include page="fragments/pagination.jsp">
            <jsp:param name="servlet" value="${servlet}"/>
            <jsp:param name="page" value="${pages}"/>
            <jsp:param name="name" value="Last"/>
        </jsp:include>
    </ul>
</nav>
</body>
</html>

